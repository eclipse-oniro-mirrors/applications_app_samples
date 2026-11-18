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
  {
    name: 'testModuleJsonMinWSweep0621', number: '0621',
    limits: { minWidth: 1200 }, forcible: false
  },
  {
    name: 'testModuleJsonMinWSweep0622', number: '0622',
    limits: { minWidth: 2000 }, forcible: false
  },
  {
    name: 'testModuleJsonMinWSweep0623', number: '0623',
    limits: { minWidth: 2559 }, forcible: false
  },
  {
    name: 'testModuleJsonMinWSweep0624', number: '0624',
    limits: { minWidth: 2560 }, forcible: false
  },
  {
    name: 'testModuleJsonMinWSweep0625', number: '0625',
    limits: { minWidth: Number.MAX_SAFE_INTEGER }, forcible: false
  },
  {
    name: 'testModuleJsonMaxWSweep0626', number: '0626',
    limits: { maxWidth: 400 }, forcible: false
  },
  {
    name: 'testModuleJsonMaxWSweep0627', number: '0627',
    limits: { maxWidth: 500 }, forcible: false
  },
  {
    name: 'testModuleJsonMaxWSweep0628', number: '0628',
    limits: { maxWidth: 1000 }, forcible: false
  },
  {
    name: 'testModuleJsonMaxWSweep0629', number: '0629',
    limits: { maxWidth: 1499 }, forcible: false
  },
  {
    name: 'testModuleJsonMaxWSweep0630', number: '0630',
    limits: { maxWidth: 1500 }, forcible: false
  },
  {
    name: 'testModuleJsonMaxWSweep0631', number: '0631',
    limits: { maxWidth: 2000 }, forcible: false
  },
  {
    name: 'testModuleJsonMaxWSweep0632', number: '0632',
    limits: { maxWidth: 2559 }, forcible: false
  },
  {
    name: 'testModuleJsonMaxWSweep0633', number: '0633',
    limits: { maxWidth: 2560 }, forcible: false
  },
  {
    name: 'testModuleJsonMaxWSweep0634', number: '0634',
    limits: { maxWidth: 2561 }, forcible: false
  },
  {
    name: 'testModuleJsonMaxWSweep0635', number: '0635',
    limits: { maxWidth: 100000 }, forcible: false
  },
  {
    name: 'testModuleJsonMinHSweep0636', number: '0636',
    limits: { minHeight: 200 }, forcible: false
  },
  {
    name: 'testModuleJsonMinHSweep0637', number: '0637',
    limits: { minHeight: 201 }, forcible: false
  },
  {
    name: 'testModuleJsonMinHSweep0638', number: '0638',
    limits: { minHeight: 399 }, forcible: false
  },
  {
    name: 'testModuleJsonMinHSweep0639', number: '0639',
    limits: { minHeight: 400 }, forcible: false
  },
  {
    name: 'testModuleJsonMinHSweep0640', number: '0640',
    limits: { minHeight: 600 }, forcible: false
  },
  {
    name: 'testModuleJsonMinHSweep0641', number: '0641',
    limits: { minHeight: 900 }, forcible: false
  },
  {
    name: 'testModuleJsonMinHSweep0642', number: '0642',
    limits: { minHeight: 1200 }, forcible: false
  },
  {
    name: 'testModuleJsonMinHSweep0643', number: '0643',
    limits: { minHeight: 1299 }, forcible: false
  },
  {
    name: 'testModuleJsonMinHSweep0644', number: '0644',
    limits: { minHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonMinHSweep0645', number: '0645',
    limits: { minHeight: 2000 }, forcible: false
  },
  {
    name: 'testModuleJsonMaxHSweep0646', number: '0646',
    limits: { maxHeight: 200 }, forcible: false
  },
  {
    name: 'testModuleJsonMaxHSweep0647', number: '0647',
    limits: { maxHeight: 300 }, forcible: false
  },
  {
    name: 'testModuleJsonMaxHSweep0648', number: '0648',
    limits: { maxHeight: 500 }, forcible: false
  },
  {
    name: 'testModuleJsonMaxHSweep0649', number: '0649',
    limits: { maxHeight: 999 }, forcible: false
  },
  {
    name: 'testModuleJsonMaxHSweep0650', number: '0650',
    limits: { maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testModuleJsonMaxHSweep0651', number: '0651',
    limits: { maxHeight: 1200 }, forcible: false
  },
  {
    name: 'testModuleJsonMaxHSweep0652', number: '0652',
    limits: { maxHeight: 1299 }, forcible: false
  },
  {
    name: 'testModuleJsonMaxHSweep0653', number: '0653',
    limits: { maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonMaxHSweep0654', number: '0654',
    limits: { maxHeight: 1301 }, forcible: false
  },
  {
    name: 'testModuleJsonMaxHSweep0655', number: '0655',
    limits: { maxHeight: 10000 }, forcible: false
  },
  {
    name: 'testModuleJsonCornerGrid0656', number: '0656',
    limits: { minWidth: 400, minHeight: 200, maxWidth: 400, maxHeight: 200 }, forcible: false
  },
  {
    name: 'testModuleJsonCornerGrid0657', number: '0657',
    limits: { minWidth: 2560, minHeight: 1300, maxWidth: 2560, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonCornerGrid0658', number: '0658',
    limits: { minWidth: 400, minHeight: 1300, maxWidth: 400, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonCornerGrid0659', number: '0659',
    limits: { minWidth: 2560, minHeight: 200, maxWidth: 2560, maxHeight: 200 }, forcible: false
  },
  {
    name: 'testModuleJsonCornerGrid0660', number: '0660',
    limits: { minWidth: 400, minHeight: 200, maxWidth: 2560, maxHeight: 200 }, forcible: false
  },
  {
    name: 'testModuleJsonCornerGrid0661', number: '0661',
    limits: { minWidth: 400, minHeight: 200, maxWidth: 400, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonCornerGrid0662', number: '0662',
    limits: { minWidth: 2560, minHeight: 200, maxWidth: 2560, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonCornerGrid0663', number: '0663',
    limits: { minWidth: 400, minHeight: 1300, maxWidth: 2560, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonCornerGrid0664', number: '0664',
    limits: { minWidth: 401, minHeight: 201, maxWidth: 401, maxHeight: 201 }, forcible: false
  },
  {
    name: 'testModuleJsonCornerGrid0665', number: '0665',
    limits: { minWidth: 2559, minHeight: 1299, maxWidth: 2559, maxHeight: 1299 }, forcible: false
  },
  {
    name: 'testModuleJsonCornerGrid0666', number: '0666',
    limits: { minWidth: 399, minHeight: 199, maxWidth: 2561, maxHeight: 1301 }, forcible: false
  },
  {
    name: 'testModuleJsonCornerGrid0667', number: '0667',
    limits: { minWidth: 2561, minHeight: 1301, maxWidth: 399, maxHeight: 199 }, forcible: false
  },
  {
    name: 'testModuleJsonCornerGrid0668', number: '0668',
    limits: { minWidth: 400, minHeight: 750, maxWidth: 2560, maxHeight: 750 }, forcible: false
  },
  {
    name: 'testModuleJsonCornerGrid0669', number: '0669',
    limits: { minWidth: 1480, minHeight: 200, maxWidth: 1480, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonCornerGrid0670', number: '0670',
    limits: { minWidth: 700, minHeight: 200, maxWidth: 1700, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonCornerGrid0671', number: '0671',
    limits: { minWidth: 400, minHeight: 300, maxWidth: 2560, maxHeight: 900 }, forcible: false
  },
  {
    name: 'testModuleJsonCornerGrid0672', number: '0672',
    limits: { minWidth: 1200, minHeight: 400, maxWidth: 1200, maxHeight: 900 }, forcible: false
  },
  {
    name: 'testModuleJsonCornerGrid0673', number: '0673',
    limits: { minWidth: 1500, minHeight: 500, maxWidth: 2500, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testModuleJsonCornerGrid0674', number: '0674',
    limits: { minWidth: 500, minHeight: 900, maxWidth: 2500, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonCornerGrid0675', number: '0675',
    limits: { minWidth: 400, minHeight: 200, maxWidth: 600, maxHeight: 300 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0680', number: '0680',
    limits: { minWidth: 400, minHeight: 200, maxWidth: 700, maxHeight: 400 }, forcible: true
  },
  {
    name: 'testModuleJsonBulk0681', number: '0681',
    limits: { minWidth: 600, minHeight: 200, maxWidth: 1100, maxHeight: 500 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0682', number: '0682',
    limits: { minWidth: 800, minHeight: 200, maxWidth: 1500, maxHeight: 600 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0683', number: '0683',
    limits: { minWidth: 1000, minHeight: 200, maxWidth: 1900, maxHeight: 700 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0684', number: '0684',
    limits: { minWidth: 1200, minHeight: 200, maxWidth: 2300, maxHeight: 800 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0685', number: '0685',
    limits: { minWidth: 1400, minHeight: 200, maxWidth: 1700, maxHeight: 900 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0686', number: '0686',
    limits: { minWidth: 1600, minHeight: 200, maxWidth: 2100, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0687', number: '0687',
    limits: { minWidth: 1800, minHeight: 200, maxWidth: 2500, maxHeight: 400 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0688', number: '0688',
    limits: { minWidth: 2000, minHeight: 200, maxWidth: 2900, maxHeight: 500 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0689', number: '0689',
    limits: { minWidth: 2200, minHeight: 200, maxWidth: 3300, maxHeight: 600 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0690', number: '0690',
    limits: { minWidth: 400, minHeight: 300, maxWidth: 700, maxHeight: 800 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0691', number: '0691',
    limits: { minWidth: 600, minHeight: 300, maxWidth: 1100, maxHeight: 900 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0692', number: '0692',
    limits: { minWidth: 800, minHeight: 300, maxWidth: 1500, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0693', number: '0693',
    limits: { minWidth: 1000, minHeight: 300, maxWidth: 1900, maxHeight: 1100 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0694', number: '0694',
    limits: { minWidth: 1200, minHeight: 300, maxWidth: 2300, maxHeight: 500 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0695', number: '0695',
    limits: { minWidth: 1400, minHeight: 300, maxWidth: 1700, maxHeight: 600 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0696', number: '0696',
    limits: { minWidth: 1600, minHeight: 300, maxWidth: 2100, maxHeight: 700 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0697', number: '0697',
    limits: { minWidth: 1800, minHeight: 300, maxWidth: 2500, maxHeight: 800 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0698', number: '0698',
    limits: { minWidth: 2000, minHeight: 300, maxWidth: 2900, maxHeight: 900 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0699', number: '0699',
    limits: { minWidth: 2200, minHeight: 300, maxWidth: 3300, maxHeight: 1000 }, forcible: true
  },
  {
    name: 'testModuleJsonBulk0700', number: '0700',
    limits: { minWidth: 400, minHeight: 400, maxWidth: 700, maxHeight: 1200 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0701', number: '0701',
    limits: { minWidth: 600, minHeight: 400, maxWidth: 1100, maxHeight: 600 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0702', number: '0702',
    limits: { minWidth: 800, minHeight: 400, maxWidth: 1500, maxHeight: 700 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0703', number: '0703',
    limits: { minWidth: 1000, minHeight: 400, maxWidth: 1900, maxHeight: 800 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0704', number: '0704',
    limits: { minWidth: 1200, minHeight: 400, maxWidth: 2300, maxHeight: 900 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0705', number: '0705',
    limits: { minWidth: 1400, minHeight: 400, maxWidth: 1700, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0706', number: '0706',
    limits: { minWidth: 1600, minHeight: 400, maxWidth: 2100, maxHeight: 1100 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0707', number: '0707',
    limits: { minWidth: 1800, minHeight: 400, maxWidth: 2500, maxHeight: 1200 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0708', number: '0708',
    limits: { minWidth: 2000, minHeight: 400, maxWidth: 2900, maxHeight: 600 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0709', number: '0709',
    limits: { minWidth: 2200, minHeight: 400, maxWidth: 3300, maxHeight: 700 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0710', number: '0710',
    limits: { minWidth: 400, minHeight: 500, maxWidth: 700, maxHeight: 900 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0711', number: '0711',
    limits: { minWidth: 600, minHeight: 500, maxWidth: 1100, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0712', number: '0712',
    limits: { minWidth: 800, minHeight: 500, maxWidth: 1500, maxHeight: 1100 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0713', number: '0713',
    limits: { minWidth: 1000, minHeight: 500, maxWidth: 1900, maxHeight: 1200 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0714', number: '0714',
    limits: { minWidth: 1200, minHeight: 500, maxWidth: 2300, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0715', number: '0715',
    limits: { minWidth: 1400, minHeight: 500, maxWidth: 1700, maxHeight: 700 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0716', number: '0716',
    limits: { minWidth: 1600, minHeight: 500, maxWidth: 2100, maxHeight: 800 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0717', number: '0717',
    limits: { minWidth: 1800, minHeight: 500, maxWidth: 2500, maxHeight: 900 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0718', number: '0718',
    limits: { minWidth: 2000, minHeight: 500, maxWidth: 2900, maxHeight: 1000 }, forcible: true
  },
  {
    name: 'testModuleJsonBulk0719', number: '0719',
    limits: { minWidth: 2200, minHeight: 500, maxWidth: 3300, maxHeight: 1100 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0720', number: '0720',
    limits: { minWidth: 400, minHeight: 600, maxWidth: 700, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0721', number: '0721',
    limits: { minWidth: 600, minHeight: 600, maxWidth: 1100, maxHeight: 1400 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0722', number: '0722',
    limits: { minWidth: 800, minHeight: 600, maxWidth: 1500, maxHeight: 800 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0723', number: '0723',
    limits: { minWidth: 1000, minHeight: 600, maxWidth: 1900, maxHeight: 900 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0724', number: '0724',
    limits: { minWidth: 1200, minHeight: 600, maxWidth: 2300, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0725', number: '0725',
    limits: { minWidth: 1400, minHeight: 600, maxWidth: 1700, maxHeight: 1100 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0726', number: '0726',
    limits: { minWidth: 1600, minHeight: 600, maxWidth: 2100, maxHeight: 1200 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0727', number: '0727',
    limits: { minWidth: 1800, minHeight: 600, maxWidth: 2500, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0728', number: '0728',
    limits: { minWidth: 2000, minHeight: 600, maxWidth: 2900, maxHeight: 1400 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0729', number: '0729',
    limits: { minWidth: 2200, minHeight: 600, maxWidth: 3300, maxHeight: 800 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0730', number: '0730',
    limits: { minWidth: 400, minHeight: 700, maxWidth: 700, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0731', number: '0731',
    limits: { minWidth: 600, minHeight: 700, maxWidth: 1100, maxHeight: 1100 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0732', number: '0732',
    limits: { minWidth: 800, minHeight: 700, maxWidth: 1500, maxHeight: 1200 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0733', number: '0733',
    limits: { minWidth: 1000, minHeight: 700, maxWidth: 1900, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0734', number: '0734',
    limits: { minWidth: 1200, minHeight: 700, maxWidth: 2300, maxHeight: 1400 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0735', number: '0735',
    limits: { minWidth: 1400, minHeight: 700, maxWidth: 1700, maxHeight: 1500 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0736', number: '0736',
    limits: { minWidth: 1600, minHeight: 700, maxWidth: 2100, maxHeight: 900 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0737', number: '0737',
    limits: { minWidth: 1800, minHeight: 700, maxWidth: 2500, maxHeight: 1000 }, forcible: true
  },
  {
    name: 'testModuleJsonBulk0738', number: '0738',
    limits: { minWidth: 2000, minHeight: 700, maxWidth: 2900, maxHeight: 1100 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0739', number: '0739',
    limits: { minWidth: 2200, minHeight: 700, maxWidth: 3300, maxHeight: 1200 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0740', number: '0740',
    limits: { minWidth: 400, minHeight: 800, maxWidth: 700, maxHeight: 1400 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0741', number: '0741',
    limits: { minWidth: 600, minHeight: 800, maxWidth: 1100, maxHeight: 1500 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0742', number: '0742',
    limits: { minWidth: 800, minHeight: 800, maxWidth: 1500, maxHeight: 1600 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0743', number: '0743',
    limits: { minWidth: 1000, minHeight: 800, maxWidth: 1900, maxHeight: 1000 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0744', number: '0744',
    limits: { minWidth: 1200, minHeight: 800, maxWidth: 2300, maxHeight: 1100 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0745', number: '0745',
    limits: { minWidth: 1400, minHeight: 800, maxWidth: 1700, maxHeight: 1200 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0746', number: '0746',
    limits: { minWidth: 1600, minHeight: 800, maxWidth: 2100, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0747', number: '0747',
    limits: { minWidth: 1800, minHeight: 800, maxWidth: 2500, maxHeight: 1400 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0748', number: '0748',
    limits: { minWidth: 2000, minHeight: 800, maxWidth: 2900, maxHeight: 1500 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0749', number: '0749',
    limits: { minWidth: 2200, minHeight: 800, maxWidth: 3300, maxHeight: 1600 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0750', number: '0750',
    limits: { minWidth: 400, minHeight: 900, maxWidth: 700, maxHeight: 1100 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0751', number: '0751',
    limits: { minWidth: 600, minHeight: 900, maxWidth: 1100, maxHeight: 1200 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0752', number: '0752',
    limits: { minWidth: 800, minHeight: 900, maxWidth: 1500, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0753', number: '0753',
    limits: { minWidth: 1000, minHeight: 900, maxWidth: 1900, maxHeight: 1400 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0754', number: '0754',
    limits: { minWidth: 1200, minHeight: 900, maxWidth: 2300, maxHeight: 1500 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0755', number: '0755',
    limits: { minWidth: 1400, minHeight: 900, maxWidth: 1700, maxHeight: 1600 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0756', number: '0756',
    limits: { minWidth: 1600, minHeight: 900, maxWidth: 2100, maxHeight: 1700 }, forcible: true
  },
  {
    name: 'testModuleJsonBulk0757', number: '0757',
    limits: { minWidth: 1800, minHeight: 900, maxWidth: 2500, maxHeight: 1100 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0758', number: '0758',
    limits: { minWidth: 2000, minHeight: 900, maxWidth: 2900, maxHeight: 1200 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0759', number: '0759',
    limits: { minWidth: 2200, minHeight: 900, maxWidth: 3300, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0760', number: '0760',
    limits: { minWidth: 400, minHeight: 1000, maxWidth: 700, maxHeight: 1500 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0761', number: '0761',
    limits: { minWidth: 600, minHeight: 1000, maxWidth: 1100, maxHeight: 1600 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0762', number: '0762',
    limits: { minWidth: 800, minHeight: 1000, maxWidth: 1500, maxHeight: 1700 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0763', number: '0763',
    limits: { minWidth: 1000, minHeight: 1000, maxWidth: 1900, maxHeight: 1800 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0764', number: '0764',
    limits: { minWidth: 1200, minHeight: 1000, maxWidth: 2300, maxHeight: 1200 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0765', number: '0765',
    limits: { minWidth: 1400, minHeight: 1000, maxWidth: 1700, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0766', number: '0766',
    limits: { minWidth: 1600, minHeight: 1000, maxWidth: 2100, maxHeight: 1400 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0767', number: '0767',
    limits: { minWidth: 1800, minHeight: 1000, maxWidth: 2500, maxHeight: 1500 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0768', number: '0768',
    limits: { minWidth: 2000, minHeight: 1000, maxWidth: 2900, maxHeight: 1600 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0769', number: '0769',
    limits: { minWidth: 2200, minHeight: 1000, maxWidth: 3300, maxHeight: 1700 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0770', number: '0770',
    limits: { minWidth: 400, minHeight: 1100, maxWidth: 700, maxHeight: 1900 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0771', number: '0771',
    limits: { minWidth: 600, minHeight: 1100, maxWidth: 1100, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0772', number: '0772',
    limits: { minWidth: 800, minHeight: 1100, maxWidth: 1500, maxHeight: 1400 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0773', number: '0773',
    limits: { minWidth: 1000, minHeight: 1100, maxWidth: 1900, maxHeight: 1500 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0774', number: '0774',
    limits: { minWidth: 1200, minHeight: 1100, maxWidth: 2300, maxHeight: 1600 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0775', number: '0775',
    limits: { minWidth: 1400, minHeight: 1100, maxWidth: 1700, maxHeight: 1700 }, forcible: true
  },
  {
    name: 'testModuleJsonBulk0776', number: '0776',
    limits: { minWidth: 1600, minHeight: 1100, maxWidth: 2100, maxHeight: 1800 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0777', number: '0777',
    limits: { minWidth: 1800, minHeight: 1100, maxWidth: 2500, maxHeight: 1900 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0778', number: '0778',
    limits: { minWidth: 2000, minHeight: 1100, maxWidth: 2900, maxHeight: 1300 }, forcible: false
  },
  {
    name: 'testModuleJsonBulk0779', number: '0779',
    limits: { minWidth: 2200, minHeight: 1100, maxWidth: 3300, maxHeight: 1400 }, forcible: false
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

export default function windowLimitsModuleJsonApiTest(): void {
  describe('SetWindowLimitsModuleJsonApiTest', () => {
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
    });    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_0001
     * @tc.name      testModuleJsonGetLimits0001
     * @tc.desc      Get the current window limits; accept the unsupported result on non-freeform devices.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleJsonGetLimits0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonGetLimits0001 begin');
        expect(testWindow !== undefined).assertTrue();
        if (limitsSupported) {
          hilog.info(LOG_DOMAIN, LOG_TAG, 'limits=%{public}s', JSON.stringify(originalLimits));
          expect(isUsableLimits(originalLimits)).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonGetLimits0001 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_0002
     * @tc.name      testModuleJsonSetModuleBounds0002
     * @tc.desc      Set limits equal to the module.json5 abilities bounds and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testModuleJsonSetModuleBounds0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonSetModuleBounds0002 begin');
        const limits: window.WindowLimits = {
          minWidth: MODULE_MIN_WIDTH, minHeight: MODULE_MIN_HEIGHT,
          maxWidth: MODULE_MAX_WIDTH, maxHeight: MODULE_MAX_HEIGHT
        };
        const result: SetLimitsResult = await applyLimits(limits);
        expect(isAccepted(result)).assertTrue();
        if (result.ok && limitsSupported) {
          const current: window.WindowLimits = testWindow!.getWindowLimits();
          hilog.info(LOG_DOMAIN, LOG_TAG, 'current=%{public}s', JSON.stringify(current));
          expect(isUsableLimits(current)).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonSetModuleBounds0002 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_0003
     * @tc.name      testModuleJsonSetNarrowLimits0003
     * @tc.desc      Set limits narrower than module.json5 bounds and verify the result can be read back.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonSetNarrowLimits0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonSetNarrowLimits0003 begin');
        const limits: window.WindowLimits = { minWidth: 800, minHeight: 400, maxWidth: 2000, maxHeight: 1000 };
        const result: SetLimitsResult = await applyLimits(limits);
        expect(isAccepted(result)).assertTrue();
        if (result.ok && limitsSupported) {
          const current: window.WindowLimits = testWindow!.getWindowLimits();
          hilog.info(LOG_DOMAIN, LOG_TAG, 'current=%{public}s', JSON.stringify(current));
          expect(isUsableLimits(current)).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonSetNarrowLimits0003 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_0004
     * @tc.name      testModuleJsonSetMaxOnly0004
     * @tc.desc      Set only the maximum limits within module.json5 bounds and handle the result.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonSetMaxOnly0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonSetMaxOnly0004 begin');
        const result: SetLimitsResult = await applyLimits({ maxWidth: MODULE_MAX_WIDTH, maxHeight: MODULE_MAX_HEIGHT });
        expect(isAccepted(result)).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonSetMaxOnly0004 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_0005
     * @tc.name      testModuleJsonGrowth0005
     * @tc.desc      Increase the limits step by step within module.json5 bounds and verify each step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonGrowth0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonGrowth0005 begin');
        const steps: window.WindowLimits[] = [
          { minWidth: 400, minHeight: 200, maxWidth: 1400, maxHeight: 800 },
          { minWidth: 500, minHeight: 300, maxWidth: 2000, maxHeight: 1000 },
          { minWidth: 600, minHeight: 400, maxWidth: 2560, maxHeight: 1300 }
        ];
        for (let index: number = 0; index < steps.length; index++) {
          const result: SetLimitsResult = await applyLimits(steps[index]);
          expect(isAccepted(result)).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonGrowth0005 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_0006
     * @tc.name      testModuleJsonShrink0006
     * @tc.desc      Decrease the limits step by step and verify each step is accepted.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonShrink0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonShrink0006 begin');
        const steps: window.WindowLimits[] = [
          { minWidth: 700, minHeight: 500, maxWidth: 2560, maxHeight: 1300 },
          { minWidth: 600, minHeight: 400, maxWidth: 2000, maxHeight: 1100 },
          { minWidth: 500, minHeight: 300, maxWidth: 1600, maxHeight: 900 }
        ];
        for (let index: number = 0; index < steps.length; index++) {
          const result: SetLimitsResult = await applyLimits(steps[index]);
          expect(isAccepted(result)).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonShrink0006 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_0007
     * @tc.name      testModuleJsonAlternating0007
     * @tc.desc      Alternate valid and invalid limits and verify each request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonAlternating0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonAlternating0007 begin');
        const valid: window.WindowLimits = { minWidth: 600, minHeight: 400, maxWidth: 2000, maxHeight: 1000 };
        const invalid: window.WindowLimits = { minWidth: -1, maxWidth: -2 };
        const first: SetLimitsResult = await applyLimits(valid);
        const second: SetLimitsResult = await applyLimits(invalid);
        const third: SetLimitsResult = await applyLimits(valid);
        expect(isAccepted(first)).assertTrue();
        expect(isAccepted(second)).assertTrue();
        expect(isAccepted(third)).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonAlternating0007 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_0008
     * @tc.name      testModuleJsonMaxOnlyAndGet0008
     * @tc.desc      Set only max limits and verify getWindowLimits when supported.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonMaxOnlyAndGet0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonMaxOnlyAndGet0008 begin');
        const result: SetLimitsResult = await applyLimits({ maxWidth: 2000, maxHeight: 1000 });
        expect(isAccepted(result)).assertTrue();
        if (result.ok && limitsSupported) {
          const current: window.WindowLimits = testWindow!.getWindowLimits();
          expect(isUsableLimits(current)).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonMaxOnlyAndGet0008 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_0009
     * @tc.name      testModuleJsonEmptyObject0009
     * @tc.desc      Set an empty limits object and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testModuleJsonEmptyObject0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonEmptyObject0009 begin');
        const result: SetLimitsResult = await applyLimits({});
        expect(isAccepted(result)).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonEmptyObject0009 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_0080
     * @tc.name      testModuleJsonPromise0080
     * @tc.desc      Set valid limits through the Promise overload and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonPromise0080',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonPromise0080 begin');
        const result: SetLimitsResult = await applyLimits(
          { minWidth: 600, minHeight: 500, maxWidth: 1500, maxHeight: 1000 }, false);
        expect(isAccepted(result)).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonPromise0080 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_0081
     * @tc.name      testModuleJsonForciblePromise0081
     * @tc.desc      Set valid limits through the forcible Promise overload and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonForciblePromise0081',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonForciblePromise0081 begin');
        const result: SetLimitsResult = await applyLimits(
          { minWidth: 600, minHeight: 500, maxWidth: 1500, maxHeight: 1000 }, true);
        expect(isAccepted(result)).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonForciblePromise0081 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_0082
     * @tc.name      testModuleJsonConcurrent0082
     * @tc.desc      Issue two setWindowLimits requests concurrently and verify both are handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testModuleJsonConcurrent0082',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonConcurrent0082 begin');
        const results: SetLimitsResult[] = await Promise.all([
          applyLimits({ minWidth: 400, minHeight: 200, maxWidth: 1600, maxHeight: 900 }),
          applyLimits({ minWidth: 500, minHeight: 300, maxWidth: 2000, maxHeight: 1100 })
        ]);
        expect(results.length).assertEqual(2);
        for (let index: number = 0; index < results.length; index++) {
          expect(isAccepted(results[index])).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonConcurrent0082 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_0083
     * @tc.name      testModuleJsonInterleavedGet0083
     * @tc.desc      Set limits and read them back synchronously step by step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonInterleavedGet0083',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonInterleavedGet0083 begin');
        const steps: window.WindowLimits[] = [
          { minWidth: 450, minHeight: 250, maxWidth: 1250, maxHeight: 850 },
          { minWidth: 500, minHeight: 300, maxWidth: 1300, maxHeight: 900 },
          { minWidth: 550, minHeight: 350, maxWidth: 1400, maxHeight: 950 }
        ];
        for (let index: number = 0; index < steps.length; index++) {
          const result: SetLimitsResult = await applyLimits(steps[index]);
          expect(isAccepted(result)).assertTrue();
          if (result.ok && limitsSupported) {
            const current: window.WindowLimits = testWindow!.getWindowLimits();
            expect(isUsableLimits(current)).assertTrue();
          }
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonInterleavedGet0083 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_0084
     * @tc.name      testModuleJsonRapidRepeat0084
     * @tc.desc      Set the same limits rapidly five times and verify the results stay consistent.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonRapidRepeat0084',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonRapidRepeat0084 begin');
        const limits: window.WindowLimits = { minWidth: 500, minHeight: 300, maxWidth: 1800, maxHeight: 1000 };
        let previous: SetLimitsResult | undefined = undefined;
        for (let index: number = 0; index < 5; index++) {
          const result: SetLimitsResult = await applyLimits(limits);
          expect(isAccepted(result)).assertTrue();
          if (result.ok && previous !== undefined && previous.ok) {
            expect(JSON.stringify(result.limits)).assertEqual(JSON.stringify(previous.limits));
          }
          previous = result;
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonRapidRepeat0084 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_0085
     * @tc.name      testModuleJsonGetLimitsTwice0085
     * @tc.desc      Call getWindowLimits twice in a row and verify the results are consistent.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonGetLimitsTwice0085',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonGetLimitsTwice0085 begin');
        expect(testWindow !== undefined).assertTrue();
        if (limitsSupported) {
          const first: window.WindowLimits = testWindow!.getWindowLimits();
          const second: window.WindowLimits = testWindow!.getWindowLimits();
          expect(isUsableLimits(first)).assertTrue();
          expect(JSON.stringify(second)).assertEqual(JSON.stringify(first));
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonGetLimitsTwice0085 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_0086
     * @tc.name      testModuleJsonNonMonotonic0086
     * @tc.desc      Set a non-monotonic limit sequence and verify each step is accepted.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonNonMonotonic0086',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonNonMonotonic0086 begin');
        const steps: window.WindowLimits[] = [
          { minWidth: 400, minHeight: 200, maxWidth: 2000, maxHeight: 1000 },
          { minWidth: 700, minHeight: 500, maxWidth: 1200, maxHeight: 800 },
          { minWidth: 450, minHeight: 250, maxWidth: 2560, maxHeight: 1300 }
        ];
        for (let index: number = 0; index < steps.length; index++) {
          const result: SetLimitsResult = await applyLimits(steps[index]);
          expect(isAccepted(result)).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonNonMonotonic0086 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_0090
     * @tc.name      testModuleJsonRestore0090
     * @tc.desc      Restore the limits captured before the test.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonRestore0090',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonRestore0090 begin');
        expect(testWindow !== undefined).assertTrue();
        if (originalLimits !== undefined) {
          const result: SetLimitsResult = await applyLimits(originalLimits as window.WindowLimits);
          expect(isAccepted(result)).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonRestore0090 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_0441
     * @tc.name      testModuleJsonConcurrentThree0441
     * @tc.desc      Issue three setWindowLimits requests concurrently and verify all are handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testModuleJsonConcurrentThree0441',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonConcurrentThree0441 begin');
        const results: SetLimitsResult[] = await Promise.all([
          applyLimits({ minWidth: 400, minHeight: 200, maxWidth: 1200, maxHeight: 800 }),
          applyLimits({ minWidth: 450, minHeight: 250, maxWidth: 1400, maxHeight: 900 }),
          applyLimits({ minWidth: 500, minHeight: 300, maxWidth: 1600, maxHeight: 1000 })
        ]);
        expect(results.length).assertEqual(3);
        for (let index: number = 0; index < results.length; index++) {
          expect(isAccepted(results[index])).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonConcurrentThree0441 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_0442
     * @tc.name      testModuleJsonConcurrentFive0442
     * @tc.desc      Issue five setWindowLimits requests concurrently and verify all are handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testModuleJsonConcurrentFive0442',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonConcurrentFive0442 begin');
        const results: SetLimitsResult[] = await Promise.all([
          applyLimits({ maxWidth: 1600 }),
          applyLimits({ maxWidth: 1800 }),
          applyLimits({ maxWidth: 2000 }),
          applyLimits({ maxWidth: 2200 }),
          applyLimits({ maxWidth: 2400 })
        ]);
        expect(results.length).assertEqual(5);
        for (let index: number = 0; index < results.length; index++) {
          expect(isAccepted(results[index])).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonConcurrentFive0442 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_0443
     * @tc.name      testModuleJsonInterleavedFive0443
     * @tc.desc      Interleave set and get five times and verify each step when supported.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonInterleavedFive0443',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonInterleavedFive0443 begin');
        const widths: number[] = [400, 500, 600, 700, 800];
        for (let index: number = 0; index < widths.length; index++) {
          const limits: window.WindowLimits = { minWidth: widths[index], maxWidth: 2000 };
          const result: SetLimitsResult = await applyLimits(limits);
          expect(isAccepted(result)).assertTrue();
          if (result.ok && limitsSupported) {
            const current: window.WindowLimits = testWindow!.getWindowLimits();
            expect(isUsableLimits(current)).assertTrue();
          }
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonInterleavedFive0443 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_0444
     * @tc.name      testModuleJsonForcibleAfterInvalid0444
     * @tc.desc      Apply an invalid limit then a forcible valid limit; verify both are handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonForcibleAfterInvalid0444',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonForcibleAfterInvalid0444 begin');
        const invalid: SetLimitsResult = await applyLimits({ minWidth: 2000, maxWidth: 1000 });
        const valid: SetLimitsResult = await applyLimits(
          { minWidth: 600, minHeight: 400, maxWidth: 2000, maxHeight: 1000 }, true);
        expect(isAccepted(invalid)).assertTrue();
        expect(isAccepted(valid)).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonForcibleAfterInvalid0444 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_0450
     * @tc.name      testModuleJsonRatioWide0450
     * @tc.desc      Set limits allowing a wide aspect ratio and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonRatioWide0450',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonRatioWide0450 begin');
        const result: SetLimitsResult = await applyLimits(
          { minWidth: 2000, minHeight: 200, maxWidth: 2560, maxHeight: 400 });
        expect(isAccepted(result)).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonRatioWide0450 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_0451
     * @tc.name      testModuleJsonRatioTall0451
     * @tc.desc      Set limits allowing a tall aspect ratio and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonRatioTall0451',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonRatioTall0451 begin');
        const result: SetLimitsResult = await applyLimits(
          { minWidth: 400, minHeight: 1000, maxWidth: 500, maxHeight: 1300 });
        expect(isAccepted(result)).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonRatioTall0451 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_0452
     * @tc.name      testModuleJsonRatioMaxBoundary0452
     * @tc.desc      Set limits matching the module.json5 maximum ratio boundary and handle the result.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testModuleJsonRatioMaxBoundary0452',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonRatioMaxBoundary0452 begin');
        const result: SetLimitsResult = await applyLimits(
          { minWidth: 400, minHeight: 200, maxWidth: 1400, maxHeight: 400 });
        expect(isAccepted(result)).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonRatioMaxBoundary0452 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_0453
     * @tc.name      testModuleJsonRatioMinBoundary0453
     * @tc.desc      Set limits matching the module.json5 minimum ratio boundary and handle the result.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testModuleJsonRatioMinBoundary0453',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonRatioMinBoundary0453 begin');
        const result: SetLimitsResult = await applyLimits(
          { minWidth: 500, minHeight: 1000, maxWidth: 600, maxHeight: 1200 });
        expect(isAccepted(result)).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonRatioMinBoundary0453 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_0460
     * @tc.name      testModuleJsonPresenceSubsets0460
     * @tc.desc      Set all fifteen non-empty combinations of module.json5 limit fields and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonPresenceSubsets0460',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonPresenceSubsets0460 begin');
        const subsets: window.WindowLimits[] = [
          { minWidth: 400 }, { minHeight: 200 }, { maxWidth: 2560 }, { maxHeight: 1300 },
          { minWidth: 400, minHeight: 200 }, { minWidth: 400, maxWidth: 2560 },
          { minWidth: 400, maxHeight: 1300 }, { minHeight: 200, maxWidth: 2560 },
          { minHeight: 200, maxHeight: 1300 }, { maxWidth: 2560, maxHeight: 1300 },
          { minWidth: 400, minHeight: 200, maxWidth: 2560 },
          { minWidth: 400, minHeight: 200, maxHeight: 1300 },
          { minWidth: 400, maxWidth: 2560, maxHeight: 1300 },
          { minHeight: 200, maxWidth: 2560, maxHeight: 1300 },
          { minWidth: 400, minHeight: 200, maxWidth: 2560, maxHeight: 1300 }
        ];
        for (let index: number = 0; index < subsets.length; index++) {
          const result: SetLimitsResult = await applyLimits(subsets[index]);
          expect(isAccepted(result)).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonPresenceSubsets0460 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_0461
     * @tc.name      testModuleJsonFullRamp0461
     * @tc.desc      Grow to the module.json5 maximum and shrink back within the same test.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonFullRamp0461',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonFullRamp0461 begin');
        const steps: window.WindowLimits[] = [
          { minWidth: 400, minHeight: 200, maxWidth: 1200, maxHeight: 700 },
          { minWidth: 500, minHeight: 300, maxWidth: 1800, maxHeight: 1000 },
          { minWidth: 600, minHeight: 400, maxWidth: 2560, maxHeight: 1300 },
          { minWidth: 500, minHeight: 300, maxWidth: 1800, maxHeight: 1000 },
          { minWidth: 400, minHeight: 200, maxWidth: 1200, maxHeight: 700 }
        ];
        for (let index: number = 0; index < steps.length; index++) {
          const result: SetLimitsResult = await applyLimits(steps[index]);
          expect(isAccepted(result)).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonFullRamp0461 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_0462
     * @tc.name      testModuleJsonRapidTen0462
     * @tc.desc      Set ten different limits rapidly and verify the last readback is usable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testModuleJsonRapidTen0462',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonRapidTen0462 begin');
        for (let index: number = 0; index < 10; index++) {
          const limit: number = 400 + index * 100;
          const result: SetLimitsResult = await applyLimits({ minWidth: limit, maxWidth: 2560 });
          expect(isAccepted(result)).assertTrue();
        }
        if (limitsSupported) {
          expect(isUsableLimits(testWindow!.getWindowLimits())).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonRapidTen0462 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_0463
     * @tc.name      testModuleJsonConcurrentTen0463
     * @tc.desc      Issue ten setWindowLimits requests concurrently and verify all are handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testModuleJsonConcurrentTen0463',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonConcurrentTen0463 begin');
        const tasks: Promise<SetLimitsResult>[] = [];
        for (let index: number = 0; index < 10; index++) {
          tasks.push(applyLimits({ maxWidth: 1200 + index * 100, maxHeight: 800 + index * 40 }));
        }
        const results: SetLimitsResult[] = await Promise.all(tasks);
        expect(results.length).assertEqual(10);
        for (let index: number = 0; index < results.length; index++) {
          expect(isAccepted(results[index])).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonConcurrentTen0463 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_0464
     * @tc.name      testModuleJsonInterleavedTen0464
     * @tc.desc      Interleave set and get ten times and verify every readback is usable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testModuleJsonInterleavedTen0464',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonInterleavedTen0464 begin');
        for (let index: number = 0; index < 10; index++) {
          const minHeight: number = 200 + index * 50;
          const result: SetLimitsResult = await applyLimits({ minHeight: minHeight, maxHeight: 1300 });
          expect(isAccepted(result)).assertTrue();
          if (result.ok && limitsSupported) {
            expect(isUsableLimits(testWindow!.getWindowLimits())).assertTrue();
          }
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonInterleavedTen0464 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_0465
     * @tc.name      testModuleJsonInvalidThenValid0465
     * @tc.desc      Repeat invalid then valid limit cycles five times and verify every request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testModuleJsonInvalidThenValid0465',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonInvalidThenValid0465 begin');
        for (let index: number = 0; index < 5; index++) {
          const invalid: SetLimitsResult = await applyLimits({ minWidth: 2500, maxWidth: 500 });
          const valid: SetLimitsResult = await applyLimits({ minWidth: 400, maxWidth: 2560 });
          expect(isAccepted(invalid)).assertTrue();
          expect(isAccepted(valid)).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonInvalidThenValid0465 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_0466
     * @tc.name      testModuleJsonForcibleRepeat0466
     * @tc.desc      Apply the same forcible limits three times and verify the results stay consistent.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testModuleJsonForcibleRepeat0466',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonForcibleRepeat0466 begin');
        const limits: window.WindowLimits = { minWidth: 400, minHeight: 200, maxWidth: 2560, maxHeight: 1300 };
        let previous: SetLimitsResult | undefined = undefined;
        for (let index: number = 0; index < 3; index++) {
          const result: SetLimitsResult = await applyLimits(limits, true);
          expect(isAccepted(result)).assertTrue();
          if (result.ok && previous !== undefined && previous.ok) {
            expect(JSON.stringify(result.limits)).assertEqual(JSON.stringify(previous.limits));
          }
          previous = result;
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonForcibleRepeat0466 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_0467
     * @tc.name      testModuleJsonRestoreModuleBounds0467
     * @tc.desc      Restore the limits to the module.json5 declared bounds and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonRestoreModuleBounds0467',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonRestoreModuleBounds0467 begin');
        const result: SetLimitsResult = await applyLimits({
          minWidth: MODULE_MIN_WIDTH, minHeight: MODULE_MIN_HEIGHT,
          maxWidth: MODULE_MAX_WIDTH, maxHeight: MODULE_MAX_HEIGHT
        }, true);
        expect(isAccepted(result)).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonRestoreModuleBounds0467 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_0468
     * @tc.name      testModuleJsonGetAfterEachSet0468
     * @tc.desc      Set ten different limits and verify a usable readback after every accepted request.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testModuleJsonGetAfterEachSet0468',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonGetAfterEachSet0468 begin');
        for (let index: number = 0; index < 10; index++) {
          const minWidth: number = 400 + index * 120;
          const result: SetLimitsResult = await applyLimits({ minWidth: minWidth, maxWidth: 2560 });
          expect(isAccepted(result)).assertTrue();
          if (result.ok && limitsSupported) {
            const current: window.WindowLimits = testWindow!.getWindowLimits();
            hilog.info(LOG_DOMAIN, LOG_TAG, 'step=%{public}d current=%{public}s', index, JSON.stringify(current));
            expect(isUsableLimits(current)).assertTrue();
          }
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonGetAfterEachSet0468 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_0469
     * @tc.name      testModuleJsonRestoreOriginalForcible0469
     * @tc.desc      Restore the original limits with the forcible overload and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonRestoreOriginalForcible0469',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonRestoreOriginalForcible0469 begin');
        expect(testWindow !== undefined).assertTrue();
        if (originalLimits !== undefined) {
          const result: SetLimitsResult = await applyLimits(originalLimits as window.WindowLimits, true);
          expect(isAccepted(result)).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonRestoreOriginalForcible0469 end');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_0480
     * @tc.name      testModuleJsonPresenceLoop0480
     * @tc.desc      Set every non-empty field combination once more and verify each request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonPresenceLoop0480',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const subsets: window.WindowLimits[] = [
          { minWidth: 400 }, { minHeight: 200 }, { maxWidth: 2560 }, { maxHeight: 1300 },
          { minWidth: 400, minHeight: 200 }, { minWidth: 400, maxWidth: 2560 },
          { minWidth: 400, maxHeight: 1300 }, { minHeight: 200, maxWidth: 2560 },
          { minHeight: 200, maxHeight: 1300 }, { maxWidth: 2560, maxHeight: 1300 },
          { minWidth: 400, minHeight: 200, maxWidth: 2560 },
          { minWidth: 400, minHeight: 200, maxHeight: 1300 },
          { minWidth: 400, maxWidth: 2560, maxHeight: 1300 },
          { minHeight: 200, maxWidth: 2560, maxHeight: 1300 },
          { minWidth: 400, minHeight: 200, maxWidth: 2560, maxHeight: 1300 }
        ];
        for (let index: number = 0; index < subsets.length; index++) {
          const result: SetLimitsResult = await applyLimits(subsets[index]);
          expect(isAccepted(result)).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonPresenceLoop0480 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_0481
     * @tc.name      testModuleJsonRampSeven0481
     * @tc.desc      Grow and shrink through seven steps within the module.json5 bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonRampSeven0481',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const steps: window.WindowLimits[] = [
          { minWidth: 400, minHeight: 200, maxWidth: 800, maxHeight: 500 },
          { minWidth: 500, minHeight: 300, maxWidth: 1200, maxHeight: 700 },
          { minWidth: 600, minHeight: 400, maxWidth: 1800, maxHeight: 1000 },
          { minWidth: 700, minHeight: 500, maxWidth: 2560, maxHeight: 1300 },
          { minWidth: 600, minHeight: 400, maxWidth: 1800, maxHeight: 1000 },
          { minWidth: 500, minHeight: 300, maxWidth: 1200, maxHeight: 700 },
          { minWidth: 400, minHeight: 200, maxWidth: 800, maxHeight: 500 }
        ];
        for (let index: number = 0; index < steps.length; index++) {
          const result: SetLimitsResult = await applyLimits(steps[index]);
          expect(isAccepted(result)).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonRampSeven0481 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_0482
     * @tc.name      testModuleJsonConcurrentTwenty0482
     * @tc.desc      Issue twenty setWindowLimits requests concurrently and verify all are handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testModuleJsonConcurrentTwenty0482',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        const tasks: Promise<SetLimitsResult>[] = [];
        for (let index: number = 0; index < 20; index++) {
          tasks.push(applyLimits({ maxWidth: 1200 + index * 60, maxHeight: 800 + index * 20 }));
        }
        const results: SetLimitsResult[] = await Promise.all(tasks);
        expect(results.length).assertEqual(20);
        for (let index: number = 0; index < results.length; index++) {
          expect(isAccepted(results[index])).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonConcurrentTwenty0482 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_0483
     * @tc.name      testModuleJsonInterleavedTwenty0483
     * @tc.desc      Interleave set and get twenty times and verify every readback is usable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testModuleJsonInterleavedTwenty0483',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        for (let index: number = 0; index < 20; index++) {
          const minWidth: number = 400 + index * 20;
          const result: SetLimitsResult = await applyLimits({ minWidth: minWidth, maxWidth: 2560 });
          expect(isAccepted(result)).assertTrue();
          if (result.ok && limitsSupported) {
            expect(isUsableLimits(testWindow!.getWindowLimits())).assertTrue();
          }
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonInterleavedTwenty0483 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_0484
     * @tc.name      testModuleJsonForcibleMixed0484
     * @tc.desc      Apply forcible limits alternating valid and invalid and verify each is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testModuleJsonForcibleMixed0484',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        const valid: window.WindowLimits = { minWidth: 400, minHeight: 200, maxWidth: 2560, maxHeight: 1300 };
        const invalid: window.WindowLimits = { minWidth: 2500, maxWidth: 500 };
        for (let index: number = 0; index < 3; index++) {
          const first: SetLimitsResult = await applyLimits(valid, true);
          const second: SetLimitsResult = await applyLimits(invalid, true);
          expect(isAccepted(first)).assertTrue();
          expect(isAccepted(second)).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonForcibleMixed0484 end');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_0485
     * @tc.name      testModuleJsonReadbackTwenty0485
     * @tc.desc      Set twenty limits and verify a usable readback after each accepted request.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testModuleJsonReadbackTwenty0485',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        for (let index: number = 0; index < 20; index++) {
          const result: SetLimitsResult = await applyLimits({ maxWidth: 1400 + index * 50, maxHeight: 700 + index * 25 });
          expect(isAccepted(result)).assertTrue();
          if (result.ok && limitsSupported) {
            expect(isUsableLimits(testWindow!.getWindowLimits())).assertTrue();
          }
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonReadbackTwenty0485 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_0486
     * @tc.name      testModuleJsonExtremeLoop0486
     * @tc.desc      Set five extreme limit combinations and verify each request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testModuleJsonExtremeLoop0486',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        const extremes: window.WindowLimits[] = [
          { minWidth: 400, minHeight: 200, maxWidth: 2560, maxHeight: 1300 },
          { minWidth: 1, minHeight: 1, maxWidth: 1, maxHeight: 1 },
          { minWidth: 2560, minHeight: 1300, maxWidth: 2560, maxHeight: 1300 },
          { minWidth: 0, minHeight: 0, maxWidth: 0, maxHeight: 0 },
          { minWidth: 400, minHeight: 200, maxWidth: Number.MAX_SAFE_INTEGER, maxHeight: Number.MAX_SAFE_INTEGER }
        ];
        for (let index: number = 0; index < extremes.length; index++) {
          const result: SetLimitsResult = await applyLimits(extremes[index]);
          expect(isAccepted(result)).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonExtremeLoop0486 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_0487
     * @tc.name      testModuleJsonForcibleAlternate0487
     * @tc.desc      Alternate forcible and non-forcible valid limits and verify each request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testModuleJsonForcibleAlternate0487',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        const limits: window.WindowLimits = { minWidth: 600, minHeight: 400, maxWidth: 2000, maxHeight: 1000 };
        for (let index: number = 0; index < 4; index++) {
          const result: SetLimitsResult = await applyLimits(limits, index % 2 === 0);
          expect(isAccepted(result)).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonForcibleAlternate0487 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_0488
     * @tc.name      testModuleJsonEmptyLoop0488
     * @tc.desc      Set the empty object five times and verify each request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testModuleJsonEmptyLoop0488',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        for (let index: number = 0; index < 5; index++) {
          const result: SetLimitsResult = await applyLimits({});
          expect(isAccepted(result)).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonEmptyLoop0488 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_0489
     * @tc.name      testModuleJsonRestoreModuleThrice0489
     * @tc.desc      Restore the module.json5 limits three times and verify each request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonRestoreModuleThrice0489',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const limits: window.WindowLimits = {
          minWidth: MODULE_MIN_WIDTH, minHeight: MODULE_MIN_HEIGHT,
          maxWidth: MODULE_MAX_WIDTH, maxHeight: MODULE_MAX_HEIGHT
        };
        for (let index: number = 0; index < 3; index++) {
          const result: SetLimitsResult = await applyLimits(limits);
          expect(isAccepted(result)).assertTrue();
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModuleJsonRestoreModuleThrice0489 end');
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_0490
     * @tc.name      testModuleJsonReadbackLoop0490
     * @tc.desc      Set ten limits and verify a usable readback for each accepted request.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testModuleJsonReadbackLoop0490',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        for (let index: number = 0; index < 10; index++) {
          const result: SetLimitsResult = await applyLimits({ minWidth: 400 + index * 50, maxWidth: 2560 });
          expect(isAccepted(result)).assertTrue();
          if (result.ok && limitsSupported) {
            expect(isUsableLimits(testWindow!.getWindowLimits())).assertTrue();
          }
        }
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_0491
     * @tc.name      testModuleJsonEqualBounds0491
     * @tc.desc      Set equal minimum and maximum bounds and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonEqualBounds0491',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const result: SetLimitsResult = await applyLimits(
          { minWidth: 1200, minHeight: 800, maxWidth: 1200, maxHeight: 800 });
        expect(isAccepted(result)).assertTrue();
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_0492
     * @tc.name      testModuleJsonSequentialFive0492
     * @tc.desc      Start five sequential size changes and verify each request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testModuleJsonSequentialFive0492',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        for (let index: number = 0; index < 5; index++) {
          const result: SetLimitsResult = await applyLimits({ minWidth: 400 + index * 100, maxWidth: 2560 });
          expect(isAccepted(result)).assertTrue();
        }
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_0493
     * @tc.name      testModuleJsonHeightOnly0493
     * @tc.desc      Set only the height fields and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonHeightOnly0493',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const result: SetLimitsResult = await applyLimits({ minHeight: 200, maxHeight: 1300 });
        expect(isAccepted(result)).assertTrue();
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_0494
     * @tc.name      testModuleJsonRestoreAfterSweeps0494
     * @tc.desc      Restore the original limits after sweeps and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonRestoreAfterSweeps0494',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        expect(testWindow !== undefined).assertTrue();
        if (originalLimits !== undefined) {
          const result: SetLimitsResult = await applyLimits(originalLimits as window.WindowLimits);
          expect(isAccepted(result)).assertTrue();
        }
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_0495
     * @tc.name      testModuleJsonCornerLoop0495
     * @tc.desc      Apply the four corners of the module bounds and verify each request.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonCornerLoop0495',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const corners: window.WindowLimits[] = [
          { minWidth: 400, minHeight: 200, maxWidth: 2560, maxHeight: 1300 },
          { minWidth: 400, minHeight: 1300, maxWidth: 400, maxHeight: 1300 },
          { minWidth: 2560, minHeight: 200, maxWidth: 2560, maxHeight: 200 },
          { minWidth: 1200, minHeight: 750, maxWidth: 1200, maxHeight: 750 }
        ];
        for (let index: number = 0; index < corners.length; index++) {
          const result: SetLimitsResult = await applyLimits(corners[index]);
          expect(isAccepted(result)).assertTrue();
        }
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_0496
     * @tc.name      testModuleJsonCenterRange0496
     * @tc.desc      Apply a centered range and verify the result is usable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonCenterRange0496',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const result: SetLimitsResult = await applyLimits(
          { minWidth: 800, minHeight: 500, maxWidth: 2000, maxHeight: 1000 });
        expect(isAccepted(result)).assertTrue();
        if (result.ok) {
          expect(isUsableLimits(result.limits)).assertTrue();
        }
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_0497
     * @tc.name      testModuleJsonEqualBounds0497
     * @tc.desc      Apply equal bounds for both dimensions and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonEqualBounds0497',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const result: SetLimitsResult = await applyLimits(
          { minWidth: 1500, minHeight: 900, maxWidth: 1500, maxHeight: 900 });
        expect(isAccepted(result)).assertTrue();
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_0498
     * @tc.name      testModuleJsonWidthSweepFour0498
     * @tc.desc      Sweep the width four times and verify each request.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testModuleJsonWidthSweepFour0498',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        for (let index: number = 0; index < 4; index++) {
          const result: SetLimitsResult = await applyLimits({ minWidth: 400 + index * 200, maxWidth: 2560 });
          expect(isAccepted(result)).assertTrue();
        }
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_0499
     * @tc.name      testModuleJsonHeightSweepFour0499
     * @tc.desc      Sweep the height four times and verify each request.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testModuleJsonHeightSweepFour0499',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        for (let index: number = 0; index < 4; index++) {
          const result: SetLimitsResult = await applyLimits({ minHeight: 200 + index * 100, maxHeight: 1300 });
          expect(isAccepted(result)).assertTrue();
        }
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_500
     * @tc.name      testModuleJsonBulkCase500
     * @tc.desc      Set bulk limits and verify a usable readback.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const result: SetLimitsResult = await applyLimits({ minWidth: 400, maxWidth: 1800 });
        expect(isAccepted(result)).assertTrue();
        if (result.ok && limitsSupported) {
          expect(isUsableLimits(testWindow!.getWindowLimits())).assertTrue();
        }
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_501
     * @tc.name      testModuleJsonBulkCase501
     * @tc.desc      Apply a three step sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase501',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 3; index++) {
          const result: SetLimitsResult = await applyLimits({ minHeight: 550, maxHeight: 1300 });
          expect(isAccepted(result)).assertTrue();
        }
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_502
     * @tc.name      testModuleJsonBulkCase502
     * @tc.desc      Apply forcible and non forcible limits alternately.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase502',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: SetLimitsResult = await applyLimits({ minWidth: 700, maxWidth: 2000 }, true);
        const second: SetLimitsResult = await applyLimits({ minWidth: 700, maxWidth: 2000 });
        expect(isAccepted(first)).assertTrue();
        expect(isAccepted(second)).assertTrue();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_503
     * @tc.name      testModuleJsonBulkCase503
     * @tc.desc      Issue three concurrent requests and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase503',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const results: SetLimitsResult[] = await Promise.all([
          applyLimits({ maxWidth: 2100 }),
          applyLimits({ maxWidth: 2200 }),
          applyLimits({ maxWidth: 2300 })
        ]);
        expect(results.length).assertEqual(3);
        expect(isAccepted(results[0])).assertTrue();
        expect(isAccepted(results[1])).assertTrue();
        expect(isAccepted(results[2])).assertTrue();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_504
     * @tc.name      testModuleJsonBulkCase504
     * @tc.desc      Set bulk limits and verify a usable readback.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase504',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const result: SetLimitsResult = await applyLimits({ minWidth: 1000, maxWidth: 1800 });
        expect(isAccepted(result)).assertTrue();
        if (result.ok && limitsSupported) {
          expect(isUsableLimits(testWindow!.getWindowLimits())).assertTrue();
        }
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_505
     * @tc.name      testModuleJsonBulkCase505
     * @tc.desc      Apply a three step sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase505',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 3; index++) {
          const result: SetLimitsResult = await applyLimits({ minHeight: 1150, maxHeight: 1300 });
          expect(isAccepted(result)).assertTrue();
        }
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_506
     * @tc.name      testModuleJsonBulkCase506
     * @tc.desc      Apply forcible and non forcible limits alternately.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase506',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: SetLimitsResult = await applyLimits({ minWidth: 1300, maxWidth: 2000 }, true);
        const second: SetLimitsResult = await applyLimits({ minWidth: 1300, maxWidth: 2000 });
        expect(isAccepted(first)).assertTrue();
        expect(isAccepted(second)).assertTrue();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_507
     * @tc.name      testModuleJsonBulkCase507
     * @tc.desc      Issue three concurrent requests and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase507',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const results: SetLimitsResult[] = await Promise.all([
          applyLimits({ maxWidth: 2100 }),
          applyLimits({ maxWidth: 2200 }),
          applyLimits({ maxWidth: 2300 })
        ]);
        expect(results.length).assertEqual(3);
        expect(isAccepted(results[0])).assertTrue();
        expect(isAccepted(results[1])).assertTrue();
        expect(isAccepted(results[2])).assertTrue();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_508
     * @tc.name      testModuleJsonBulkCase508
     * @tc.desc      Set bulk limits and verify a usable readback.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase508',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const result: SetLimitsResult = await applyLimits({ minWidth: 400, maxWidth: 1800 });
        expect(isAccepted(result)).assertTrue();
        if (result.ok && limitsSupported) {
          expect(isUsableLimits(testWindow!.getWindowLimits())).assertTrue();
        }
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_509
     * @tc.name      testModuleJsonBulkCase509
     * @tc.desc      Apply a three step sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase509',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 3; index++) {
          const result: SetLimitsResult = await applyLimits({ minHeight: 550, maxHeight: 1300 });
          expect(isAccepted(result)).assertTrue();
        }
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_510
     * @tc.name      testModuleJsonBulkCase510
     * @tc.desc      Apply forcible and non forcible limits alternately.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase510',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: SetLimitsResult = await applyLimits({ minWidth: 700, maxWidth: 2000 }, true);
        const second: SetLimitsResult = await applyLimits({ minWidth: 700, maxWidth: 2000 });
        expect(isAccepted(first)).assertTrue();
        expect(isAccepted(second)).assertTrue();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_511
     * @tc.name      testModuleJsonBulkCase511
     * @tc.desc      Issue three concurrent requests and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase511',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const results: SetLimitsResult[] = await Promise.all([
          applyLimits({ maxWidth: 2100 }),
          applyLimits({ maxWidth: 2200 }),
          applyLimits({ maxWidth: 2300 })
        ]);
        expect(results.length).assertEqual(3);
        expect(isAccepted(results[0])).assertTrue();
        expect(isAccepted(results[1])).assertTrue();
        expect(isAccepted(results[2])).assertTrue();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_512
     * @tc.name      testModuleJsonBulkCase512
     * @tc.desc      Set bulk limits and verify a usable readback.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase512',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const result: SetLimitsResult = await applyLimits({ minWidth: 1000, maxWidth: 1800 });
        expect(isAccepted(result)).assertTrue();
        if (result.ok && limitsSupported) {
          expect(isUsableLimits(testWindow!.getWindowLimits())).assertTrue();
        }
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_513
     * @tc.name      testModuleJsonBulkCase513
     * @tc.desc      Apply a three step sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase513',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 3; index++) {
          const result: SetLimitsResult = await applyLimits({ minHeight: 1150, maxHeight: 1300 });
          expect(isAccepted(result)).assertTrue();
        }
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_514
     * @tc.name      testModuleJsonBulkCase514
     * @tc.desc      Apply forcible and non forcible limits alternately.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase514',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: SetLimitsResult = await applyLimits({ minWidth: 1300, maxWidth: 2000 }, true);
        const second: SetLimitsResult = await applyLimits({ minWidth: 1300, maxWidth: 2000 });
        expect(isAccepted(first)).assertTrue();
        expect(isAccepted(second)).assertTrue();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_515
     * @tc.name      testModuleJsonBulkCase515
     * @tc.desc      Issue three concurrent requests and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase515',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const results: SetLimitsResult[] = await Promise.all([
          applyLimits({ maxWidth: 2100 }),
          applyLimits({ maxWidth: 2200 }),
          applyLimits({ maxWidth: 2300 })
        ]);
        expect(results.length).assertEqual(3);
        expect(isAccepted(results[0])).assertTrue();
        expect(isAccepted(results[1])).assertTrue();
        expect(isAccepted(results[2])).assertTrue();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_516
     * @tc.name      testModuleJsonBulkCase516
     * @tc.desc      Set bulk limits and verify a usable readback.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase516',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const result: SetLimitsResult = await applyLimits({ minWidth: 400, maxWidth: 1800 });
        expect(isAccepted(result)).assertTrue();
        if (result.ok && limitsSupported) {
          expect(isUsableLimits(testWindow!.getWindowLimits())).assertTrue();
        }
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_517
     * @tc.name      testModuleJsonBulkCase517
     * @tc.desc      Apply a three step sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase517',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 3; index++) {
          const result: SetLimitsResult = await applyLimits({ minHeight: 550, maxHeight: 1300 });
          expect(isAccepted(result)).assertTrue();
        }
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_518
     * @tc.name      testModuleJsonBulkCase518
     * @tc.desc      Apply forcible and non forcible limits alternately.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase518',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: SetLimitsResult = await applyLimits({ minWidth: 700, maxWidth: 2000 }, true);
        const second: SetLimitsResult = await applyLimits({ minWidth: 700, maxWidth: 2000 });
        expect(isAccepted(first)).assertTrue();
        expect(isAccepted(second)).assertTrue();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_519
     * @tc.name      testModuleJsonBulkCase519
     * @tc.desc      Issue three concurrent requests and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase519',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const results: SetLimitsResult[] = await Promise.all([
          applyLimits({ maxWidth: 2100 }),
          applyLimits({ maxWidth: 2200 }),
          applyLimits({ maxWidth: 2300 })
        ]);
        expect(results.length).assertEqual(3);
        expect(isAccepted(results[0])).assertTrue();
        expect(isAccepted(results[1])).assertTrue();
        expect(isAccepted(results[2])).assertTrue();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_520
     * @tc.name      testModuleJsonBulkCase520
     * @tc.desc      Set bulk limits and verify a usable readback.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase520',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const result: SetLimitsResult = await applyLimits({ minWidth: 1000, maxWidth: 1800 });
        expect(isAccepted(result)).assertTrue();
        if (result.ok && limitsSupported) {
          expect(isUsableLimits(testWindow!.getWindowLimits())).assertTrue();
        }
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_521
     * @tc.name      testModuleJsonBulkCase521
     * @tc.desc      Apply a three step sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase521',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 3; index++) {
          const result: SetLimitsResult = await applyLimits({ minHeight: 1150, maxHeight: 1300 });
          expect(isAccepted(result)).assertTrue();
        }
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_522
     * @tc.name      testModuleJsonBulkCase522
     * @tc.desc      Apply forcible and non forcible limits alternately.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase522',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: SetLimitsResult = await applyLimits({ minWidth: 1300, maxWidth: 2000 }, true);
        const second: SetLimitsResult = await applyLimits({ minWidth: 1300, maxWidth: 2000 });
        expect(isAccepted(first)).assertTrue();
        expect(isAccepted(second)).assertTrue();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_523
     * @tc.name      testModuleJsonBulkCase523
     * @tc.desc      Issue three concurrent requests and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase523',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const results: SetLimitsResult[] = await Promise.all([
          applyLimits({ maxWidth: 2100 }),
          applyLimits({ maxWidth: 2200 }),
          applyLimits({ maxWidth: 2300 })
        ]);
        expect(results.length).assertEqual(3);
        expect(isAccepted(results[0])).assertTrue();
        expect(isAccepted(results[1])).assertTrue();
        expect(isAccepted(results[2])).assertTrue();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_524
     * @tc.name      testModuleJsonBulkCase524
     * @tc.desc      Set bulk limits and verify a usable readback.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase524',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const result: SetLimitsResult = await applyLimits({ minWidth: 400, maxWidth: 1800 });
        expect(isAccepted(result)).assertTrue();
        if (result.ok && limitsSupported) {
          expect(isUsableLimits(testWindow!.getWindowLimits())).assertTrue();
        }
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_525
     * @tc.name      testModuleJsonBulkCase525
     * @tc.desc      Apply a three step sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase525',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 3; index++) {
          const result: SetLimitsResult = await applyLimits({ minHeight: 550, maxHeight: 1300 });
          expect(isAccepted(result)).assertTrue();
        }
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_526
     * @tc.name      testModuleJsonBulkCase526
     * @tc.desc      Apply forcible and non forcible limits alternately.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase526',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: SetLimitsResult = await applyLimits({ minWidth: 700, maxWidth: 2000 }, true);
        const second: SetLimitsResult = await applyLimits({ minWidth: 700, maxWidth: 2000 });
        expect(isAccepted(first)).assertTrue();
        expect(isAccepted(second)).assertTrue();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_527
     * @tc.name      testModuleJsonBulkCase527
     * @tc.desc      Issue three concurrent requests and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase527',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const results: SetLimitsResult[] = await Promise.all([
          applyLimits({ maxWidth: 2100 }),
          applyLimits({ maxWidth: 2200 }),
          applyLimits({ maxWidth: 2300 })
        ]);
        expect(results.length).assertEqual(3);
        expect(isAccepted(results[0])).assertTrue();
        expect(isAccepted(results[1])).assertTrue();
        expect(isAccepted(results[2])).assertTrue();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_528
     * @tc.name      testModuleJsonBulkCase528
     * @tc.desc      Set bulk limits and verify a usable readback.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase528',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const result: SetLimitsResult = await applyLimits({ minWidth: 1000, maxWidth: 1800 });
        expect(isAccepted(result)).assertTrue();
        if (result.ok && limitsSupported) {
          expect(isUsableLimits(testWindow!.getWindowLimits())).assertTrue();
        }
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_529
     * @tc.name      testModuleJsonBulkCase529
     * @tc.desc      Apply a three step sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase529',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 3; index++) {
          const result: SetLimitsResult = await applyLimits({ minHeight: 1150, maxHeight: 1300 });
          expect(isAccepted(result)).assertTrue();
        }
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_530
     * @tc.name      testModuleJsonBulkCase530
     * @tc.desc      Apply forcible and non forcible limits alternately.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase530',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: SetLimitsResult = await applyLimits({ minWidth: 1300, maxWidth: 2000 }, true);
        const second: SetLimitsResult = await applyLimits({ minWidth: 1300, maxWidth: 2000 });
        expect(isAccepted(first)).assertTrue();
        expect(isAccepted(second)).assertTrue();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_531
     * @tc.name      testModuleJsonBulkCase531
     * @tc.desc      Issue three concurrent requests and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase531',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const results: SetLimitsResult[] = await Promise.all([
          applyLimits({ maxWidth: 2100 }),
          applyLimits({ maxWidth: 2200 }),
          applyLimits({ maxWidth: 2300 })
        ]);
        expect(results.length).assertEqual(3);
        expect(isAccepted(results[0])).assertTrue();
        expect(isAccepted(results[1])).assertTrue();
        expect(isAccepted(results[2])).assertTrue();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_532
     * @tc.name      testModuleJsonBulkCase532
     * @tc.desc      Set bulk limits and verify a usable readback.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase532',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const result: SetLimitsResult = await applyLimits({ minWidth: 400, maxWidth: 1800 });
        expect(isAccepted(result)).assertTrue();
        if (result.ok && limitsSupported) {
          expect(isUsableLimits(testWindow!.getWindowLimits())).assertTrue();
        }
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_533
     * @tc.name      testModuleJsonBulkCase533
     * @tc.desc      Apply a three step sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase533',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 3; index++) {
          const result: SetLimitsResult = await applyLimits({ minHeight: 550, maxHeight: 1300 });
          expect(isAccepted(result)).assertTrue();
        }
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_534
     * @tc.name      testModuleJsonBulkCase534
     * @tc.desc      Apply forcible and non forcible limits alternately.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase534',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: SetLimitsResult = await applyLimits({ minWidth: 700, maxWidth: 2000 }, true);
        const second: SetLimitsResult = await applyLimits({ minWidth: 700, maxWidth: 2000 });
        expect(isAccepted(first)).assertTrue();
        expect(isAccepted(second)).assertTrue();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_535
     * @tc.name      testModuleJsonBulkCase535
     * @tc.desc      Issue three concurrent requests and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase535',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const results: SetLimitsResult[] = await Promise.all([
          applyLimits({ maxWidth: 2100 }),
          applyLimits({ maxWidth: 2200 }),
          applyLimits({ maxWidth: 2300 })
        ]);
        expect(results.length).assertEqual(3);
        expect(isAccepted(results[0])).assertTrue();
        expect(isAccepted(results[1])).assertTrue();
        expect(isAccepted(results[2])).assertTrue();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_536
     * @tc.name      testModuleJsonBulkCase536
     * @tc.desc      Set bulk limits and verify a usable readback.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase536',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const result: SetLimitsResult = await applyLimits({ minWidth: 1000, maxWidth: 1800 });
        expect(isAccepted(result)).assertTrue();
        if (result.ok && limitsSupported) {
          expect(isUsableLimits(testWindow!.getWindowLimits())).assertTrue();
        }
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_537
     * @tc.name      testModuleJsonBulkCase537
     * @tc.desc      Apply a three step sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase537',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 3; index++) {
          const result: SetLimitsResult = await applyLimits({ minHeight: 1150, maxHeight: 1300 });
          expect(isAccepted(result)).assertTrue();
        }
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_538
     * @tc.name      testModuleJsonBulkCase538
     * @tc.desc      Apply forcible and non forcible limits alternately.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase538',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: SetLimitsResult = await applyLimits({ minWidth: 1300, maxWidth: 2000 }, true);
        const second: SetLimitsResult = await applyLimits({ minWidth: 1300, maxWidth: 2000 });
        expect(isAccepted(first)).assertTrue();
        expect(isAccepted(second)).assertTrue();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_539
     * @tc.name      testModuleJsonBulkCase539
     * @tc.desc      Issue three concurrent requests and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase539',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const results: SetLimitsResult[] = await Promise.all([
          applyLimits({ maxWidth: 2100 }),
          applyLimits({ maxWidth: 2200 }),
          applyLimits({ maxWidth: 2300 })
        ]);
        expect(results.length).assertEqual(3);
        expect(isAccepted(results[0])).assertTrue();
        expect(isAccepted(results[1])).assertTrue();
        expect(isAccepted(results[2])).assertTrue();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_540
     * @tc.name      testModuleJsonBulkCase540
     * @tc.desc      Set bulk limits and verify a usable readback.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase540',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const result: SetLimitsResult = await applyLimits({ minWidth: 400, maxWidth: 1800 });
        expect(isAccepted(result)).assertTrue();
        if (result.ok && limitsSupported) {
          expect(isUsableLimits(testWindow!.getWindowLimits())).assertTrue();
        }
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_541
     * @tc.name      testModuleJsonBulkCase541
     * @tc.desc      Apply a three step sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase541',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 3; index++) {
          const result: SetLimitsResult = await applyLimits({ minHeight: 550, maxHeight: 1300 });
          expect(isAccepted(result)).assertTrue();
        }
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_542
     * @tc.name      testModuleJsonBulkCase542
     * @tc.desc      Apply forcible and non forcible limits alternately.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase542',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: SetLimitsResult = await applyLimits({ minWidth: 700, maxWidth: 2000 }, true);
        const second: SetLimitsResult = await applyLimits({ minWidth: 700, maxWidth: 2000 });
        expect(isAccepted(first)).assertTrue();
        expect(isAccepted(second)).assertTrue();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_543
     * @tc.name      testModuleJsonBulkCase543
     * @tc.desc      Issue three concurrent requests and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase543',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const results: SetLimitsResult[] = await Promise.all([
          applyLimits({ maxWidth: 2100 }),
          applyLimits({ maxWidth: 2200 }),
          applyLimits({ maxWidth: 2300 })
        ]);
        expect(results.length).assertEqual(3);
        expect(isAccepted(results[0])).assertTrue();
        expect(isAccepted(results[1])).assertTrue();
        expect(isAccepted(results[2])).assertTrue();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_544
     * @tc.name      testModuleJsonBulkCase544
     * @tc.desc      Set bulk limits and verify a usable readback.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase544',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const result: SetLimitsResult = await applyLimits({ minWidth: 1000, maxWidth: 1800 });
        expect(isAccepted(result)).assertTrue();
        if (result.ok && limitsSupported) {
          expect(isUsableLimits(testWindow!.getWindowLimits())).assertTrue();
        }
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_545
     * @tc.name      testModuleJsonBulkCase545
     * @tc.desc      Apply a three step sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase545',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 3; index++) {
          const result: SetLimitsResult = await applyLimits({ minHeight: 1150, maxHeight: 1300 });
          expect(isAccepted(result)).assertTrue();
        }
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_546
     * @tc.name      testModuleJsonBulkCase546
     * @tc.desc      Apply forcible and non forcible limits alternately.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase546',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: SetLimitsResult = await applyLimits({ minWidth: 1300, maxWidth: 2000 }, true);
        const second: SetLimitsResult = await applyLimits({ minWidth: 1300, maxWidth: 2000 });
        expect(isAccepted(first)).assertTrue();
        expect(isAccepted(second)).assertTrue();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_547
     * @tc.name      testModuleJsonBulkCase547
     * @tc.desc      Issue three concurrent requests and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase547',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const results: SetLimitsResult[] = await Promise.all([
          applyLimits({ maxWidth: 2100 }),
          applyLimits({ maxWidth: 2200 }),
          applyLimits({ maxWidth: 2300 })
        ]);
        expect(results.length).assertEqual(3);
        expect(isAccepted(results[0])).assertTrue();
        expect(isAccepted(results[1])).assertTrue();
        expect(isAccepted(results[2])).assertTrue();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_548
     * @tc.name      testModuleJsonBulkCase548
     * @tc.desc      Set bulk limits and verify a usable readback.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase548',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const result: SetLimitsResult = await applyLimits({ minWidth: 400, maxWidth: 1800 });
        expect(isAccepted(result)).assertTrue();
        if (result.ok && limitsSupported) {
          expect(isUsableLimits(testWindow!.getWindowLimits())).assertTrue();
        }
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_549
     * @tc.name      testModuleJsonBulkCase549
     * @tc.desc      Apply a three step sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase549',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 3; index++) {
          const result: SetLimitsResult = await applyLimits({ minHeight: 550, maxHeight: 1300 });
          expect(isAccepted(result)).assertTrue();
        }
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_550
     * @tc.name      testModuleJsonBulkCase550
     * @tc.desc      Apply forcible and non forcible limits alternately.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase550',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: SetLimitsResult = await applyLimits({ minWidth: 700, maxWidth: 2000 }, true);
        const second: SetLimitsResult = await applyLimits({ minWidth: 700, maxWidth: 2000 });
        expect(isAccepted(first)).assertTrue();
        expect(isAccepted(second)).assertTrue();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_551
     * @tc.name      testModuleJsonBulkCase551
     * @tc.desc      Issue three concurrent requests and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase551',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const results: SetLimitsResult[] = await Promise.all([
          applyLimits({ maxWidth: 2100 }),
          applyLimits({ maxWidth: 2200 }),
          applyLimits({ maxWidth: 2300 })
        ]);
        expect(results.length).assertEqual(3);
        expect(isAccepted(results[0])).assertTrue();
        expect(isAccepted(results[1])).assertTrue();
        expect(isAccepted(results[2])).assertTrue();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_552
     * @tc.name      testModuleJsonBulkCase552
     * @tc.desc      Set bulk limits and verify a usable readback.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase552',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const result: SetLimitsResult = await applyLimits({ minWidth: 1000, maxWidth: 1800 });
        expect(isAccepted(result)).assertTrue();
        if (result.ok && limitsSupported) {
          expect(isUsableLimits(testWindow!.getWindowLimits())).assertTrue();
        }
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_553
     * @tc.name      testModuleJsonBulkCase553
     * @tc.desc      Apply a three step sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase553',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 3; index++) {
          const result: SetLimitsResult = await applyLimits({ minHeight: 1150, maxHeight: 1300 });
          expect(isAccepted(result)).assertTrue();
        }
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_554
     * @tc.name      testModuleJsonBulkCase554
     * @tc.desc      Apply forcible and non forcible limits alternately.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase554',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: SetLimitsResult = await applyLimits({ minWidth: 1300, maxWidth: 2000 }, true);
        const second: SetLimitsResult = await applyLimits({ minWidth: 1300, maxWidth: 2000 });
        expect(isAccepted(first)).assertTrue();
        expect(isAccepted(second)).assertTrue();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_555
     * @tc.name      testModuleJsonBulkCase555
     * @tc.desc      Issue three concurrent requests and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase555',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const results: SetLimitsResult[] = await Promise.all([
          applyLimits({ maxWidth: 2100 }),
          applyLimits({ maxWidth: 2200 }),
          applyLimits({ maxWidth: 2300 })
        ]);
        expect(results.length).assertEqual(3);
        expect(isAccepted(results[0])).assertTrue();
        expect(isAccepted(results[1])).assertTrue();
        expect(isAccepted(results[2])).assertTrue();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_556
     * @tc.name      testModuleJsonBulkCase556
     * @tc.desc      Set bulk limits and verify a usable readback.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase556',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const result: SetLimitsResult = await applyLimits({ minWidth: 400, maxWidth: 1800 });
        expect(isAccepted(result)).assertTrue();
        if (result.ok && limitsSupported) {
          expect(isUsableLimits(testWindow!.getWindowLimits())).assertTrue();
        }
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_557
     * @tc.name      testModuleJsonBulkCase557
     * @tc.desc      Apply a three step sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase557',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 3; index++) {
          const result: SetLimitsResult = await applyLimits({ minHeight: 550, maxHeight: 1300 });
          expect(isAccepted(result)).assertTrue();
        }
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_558
     * @tc.name      testModuleJsonBulkCase558
     * @tc.desc      Apply forcible and non forcible limits alternately.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase558',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: SetLimitsResult = await applyLimits({ minWidth: 700, maxWidth: 2000 }, true);
        const second: SetLimitsResult = await applyLimits({ minWidth: 700, maxWidth: 2000 });
        expect(isAccepted(first)).assertTrue();
        expect(isAccepted(second)).assertTrue();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_559
     * @tc.name      testModuleJsonBulkCase559
     * @tc.desc      Issue three concurrent requests and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase559',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const results: SetLimitsResult[] = await Promise.all([
          applyLimits({ maxWidth: 2100 }),
          applyLimits({ maxWidth: 2200 }),
          applyLimits({ maxWidth: 2300 })
        ]);
        expect(results.length).assertEqual(3);
        expect(isAccepted(results[0])).assertTrue();
        expect(isAccepted(results[1])).assertTrue();
        expect(isAccepted(results[2])).assertTrue();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_560
     * @tc.name      testModuleJsonBulkCase560
     * @tc.desc      Set bulk limits and verify a usable readback.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase560',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const result: SetLimitsResult = await applyLimits({ minWidth: 1000, maxWidth: 1800 });
        expect(isAccepted(result)).assertTrue();
        if (result.ok && limitsSupported) {
          expect(isUsableLimits(testWindow!.getWindowLimits())).assertTrue();
        }
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_561
     * @tc.name      testModuleJsonBulkCase561
     * @tc.desc      Apply a three step sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase561',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 3; index++) {
          const result: SetLimitsResult = await applyLimits({ minHeight: 1150, maxHeight: 1300 });
          expect(isAccepted(result)).assertTrue();
        }
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_562
     * @tc.name      testModuleJsonBulkCase562
     * @tc.desc      Apply forcible and non forcible limits alternately.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase562',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: SetLimitsResult = await applyLimits({ minWidth: 1300, maxWidth: 2000 }, true);
        const second: SetLimitsResult = await applyLimits({ minWidth: 1300, maxWidth: 2000 });
        expect(isAccepted(first)).assertTrue();
        expect(isAccepted(second)).assertTrue();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_563
     * @tc.name      testModuleJsonBulkCase563
     * @tc.desc      Issue three concurrent requests and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase563',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const results: SetLimitsResult[] = await Promise.all([
          applyLimits({ maxWidth: 2100 }),
          applyLimits({ maxWidth: 2200 }),
          applyLimits({ maxWidth: 2300 })
        ]);
        expect(results.length).assertEqual(3);
        expect(isAccepted(results[0])).assertTrue();
        expect(isAccepted(results[1])).assertTrue();
        expect(isAccepted(results[2])).assertTrue();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_564
     * @tc.name      testModuleJsonBulkCase564
     * @tc.desc      Set bulk limits and verify a usable readback.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase564',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const result: SetLimitsResult = await applyLimits({ minWidth: 400, maxWidth: 1800 });
        expect(isAccepted(result)).assertTrue();
        if (result.ok && limitsSupported) {
          expect(isUsableLimits(testWindow!.getWindowLimits())).assertTrue();
        }
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_565
     * @tc.name      testModuleJsonBulkCase565
     * @tc.desc      Apply a three step sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase565',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 3; index++) {
          const result: SetLimitsResult = await applyLimits({ minHeight: 550, maxHeight: 1300 });
          expect(isAccepted(result)).assertTrue();
        }
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_566
     * @tc.name      testModuleJsonBulkCase566
     * @tc.desc      Apply forcible and non forcible limits alternately.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase566',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: SetLimitsResult = await applyLimits({ minWidth: 700, maxWidth: 2000 }, true);
        const second: SetLimitsResult = await applyLimits({ minWidth: 700, maxWidth: 2000 });
        expect(isAccepted(first)).assertTrue();
        expect(isAccepted(second)).assertTrue();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_567
     * @tc.name      testModuleJsonBulkCase567
     * @tc.desc      Issue three concurrent requests and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase567',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const results: SetLimitsResult[] = await Promise.all([
          applyLimits({ maxWidth: 2100 }),
          applyLimits({ maxWidth: 2200 }),
          applyLimits({ maxWidth: 2300 })
        ]);
        expect(results.length).assertEqual(3);
        expect(isAccepted(results[0])).assertTrue();
        expect(isAccepted(results[1])).assertTrue();
        expect(isAccepted(results[2])).assertTrue();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_568
     * @tc.name      testModuleJsonBulkCase568
     * @tc.desc      Set bulk limits and verify a usable readback.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase568',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const result: SetLimitsResult = await applyLimits({ minWidth: 1000, maxWidth: 1800 });
        expect(isAccepted(result)).assertTrue();
        if (result.ok && limitsSupported) {
          expect(isUsableLimits(testWindow!.getWindowLimits())).assertTrue();
        }
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_569
     * @tc.name      testModuleJsonBulkCase569
     * @tc.desc      Apply a three step sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase569',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 3; index++) {
          const result: SetLimitsResult = await applyLimits({ minHeight: 1150, maxHeight: 1300 });
          expect(isAccepted(result)).assertTrue();
        }
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_570
     * @tc.name      testModuleJsonBulkCase570
     * @tc.desc      Apply forcible and non forcible limits alternately.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase570',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: SetLimitsResult = await applyLimits({ minWidth: 1300, maxWidth: 2000 }, true);
        const second: SetLimitsResult = await applyLimits({ minWidth: 1300, maxWidth: 2000 });
        expect(isAccepted(first)).assertTrue();
        expect(isAccepted(second)).assertTrue();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_571
     * @tc.name      testModuleJsonBulkCase571
     * @tc.desc      Issue three concurrent requests and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase571',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const results: SetLimitsResult[] = await Promise.all([
          applyLimits({ maxWidth: 2100 }),
          applyLimits({ maxWidth: 2200 }),
          applyLimits({ maxWidth: 2300 })
        ]);
        expect(results.length).assertEqual(3);
        expect(isAccepted(results[0])).assertTrue();
        expect(isAccepted(results[1])).assertTrue();
        expect(isAccepted(results[2])).assertTrue();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_572
     * @tc.name      testModuleJsonBulkCase572
     * @tc.desc      Set bulk limits and verify a usable readback.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase572',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const result: SetLimitsResult = await applyLimits({ minWidth: 400, maxWidth: 1800 });
        expect(isAccepted(result)).assertTrue();
        if (result.ok && limitsSupported) {
          expect(isUsableLimits(testWindow!.getWindowLimits())).assertTrue();
        }
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_573
     * @tc.name      testModuleJsonBulkCase573
     * @tc.desc      Apply a three step sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase573',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 3; index++) {
          const result: SetLimitsResult = await applyLimits({ minHeight: 550, maxHeight: 1300 });
          expect(isAccepted(result)).assertTrue();
        }
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_574
     * @tc.name      testModuleJsonBulkCase574
     * @tc.desc      Apply forcible and non forcible limits alternately.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase574',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: SetLimitsResult = await applyLimits({ minWidth: 700, maxWidth: 2000 }, true);
        const second: SetLimitsResult = await applyLimits({ minWidth: 700, maxWidth: 2000 });
        expect(isAccepted(first)).assertTrue();
        expect(isAccepted(second)).assertTrue();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_575
     * @tc.name      testModuleJsonBulkCase575
     * @tc.desc      Issue three concurrent requests and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase575',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const results: SetLimitsResult[] = await Promise.all([
          applyLimits({ maxWidth: 2100 }),
          applyLimits({ maxWidth: 2200 }),
          applyLimits({ maxWidth: 2300 })
        ]);
        expect(results.length).assertEqual(3);
        expect(isAccepted(results[0])).assertTrue();
        expect(isAccepted(results[1])).assertTrue();
        expect(isAccepted(results[2])).assertTrue();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_576
     * @tc.name      testModuleJsonBulkCase576
     * @tc.desc      Set bulk limits and verify a usable readback.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase576',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const result: SetLimitsResult = await applyLimits({ minWidth: 1000, maxWidth: 1800 });
        expect(isAccepted(result)).assertTrue();
        if (result.ok && limitsSupported) {
          expect(isUsableLimits(testWindow!.getWindowLimits())).assertTrue();
        }
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_577
     * @tc.name      testModuleJsonBulkCase577
     * @tc.desc      Apply a three step sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase577',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 3; index++) {
          const result: SetLimitsResult = await applyLimits({ minHeight: 1150, maxHeight: 1300 });
          expect(isAccepted(result)).assertTrue();
        }
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_578
     * @tc.name      testModuleJsonBulkCase578
     * @tc.desc      Apply forcible and non forcible limits alternately.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase578',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: SetLimitsResult = await applyLimits({ minWidth: 1300, maxWidth: 2000 }, true);
        const second: SetLimitsResult = await applyLimits({ minWidth: 1300, maxWidth: 2000 });
        expect(isAccepted(first)).assertTrue();
        expect(isAccepted(second)).assertTrue();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_579
     * @tc.name      testModuleJsonBulkCase579
     * @tc.desc      Issue three concurrent requests and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase579',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const results: SetLimitsResult[] = await Promise.all([
          applyLimits({ maxWidth: 2100 }),
          applyLimits({ maxWidth: 2200 }),
          applyLimits({ maxWidth: 2300 })
        ]);
        expect(results.length).assertEqual(3);
        expect(isAccepted(results[0])).assertTrue();
        expect(isAccepted(results[1])).assertTrue();
        expect(isAccepted(results[2])).assertTrue();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_580
     * @tc.name      testModuleJsonBulkCase580
     * @tc.desc      Set bulk limits and verify a usable readback.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase580',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const result: SetLimitsResult = await applyLimits({ minWidth: 400, maxWidth: 1800 });
        expect(isAccepted(result)).assertTrue();
        if (result.ok && limitsSupported) {
          expect(isUsableLimits(testWindow!.getWindowLimits())).assertTrue();
        }
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_581
     * @tc.name      testModuleJsonBulkCase581
     * @tc.desc      Apply a three step sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase581',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 3; index++) {
          const result: SetLimitsResult = await applyLimits({ minHeight: 550, maxHeight: 1300 });
          expect(isAccepted(result)).assertTrue();
        }
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_582
     * @tc.name      testModuleJsonBulkCase582
     * @tc.desc      Apply forcible and non forcible limits alternately.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase582',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: SetLimitsResult = await applyLimits({ minWidth: 700, maxWidth: 2000 }, true);
        const second: SetLimitsResult = await applyLimits({ minWidth: 700, maxWidth: 2000 });
        expect(isAccepted(first)).assertTrue();
        expect(isAccepted(second)).assertTrue();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_583
     * @tc.name      testModuleJsonBulkCase583
     * @tc.desc      Issue three concurrent requests and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase583',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const results: SetLimitsResult[] = await Promise.all([
          applyLimits({ maxWidth: 2100 }),
          applyLimits({ maxWidth: 2200 }),
          applyLimits({ maxWidth: 2300 })
        ]);
        expect(results.length).assertEqual(3);
        expect(isAccepted(results[0])).assertTrue();
        expect(isAccepted(results[1])).assertTrue();
        expect(isAccepted(results[2])).assertTrue();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_584
     * @tc.name      testModuleJsonBulkCase584
     * @tc.desc      Set bulk limits and verify a usable readback.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase584',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const result: SetLimitsResult = await applyLimits({ minWidth: 1000, maxWidth: 1800 });
        expect(isAccepted(result)).assertTrue();
        if (result.ok && limitsSupported) {
          expect(isUsableLimits(testWindow!.getWindowLimits())).assertTrue();
        }
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_585
     * @tc.name      testModuleJsonBulkCase585
     * @tc.desc      Apply a three step sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase585',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 3; index++) {
          const result: SetLimitsResult = await applyLimits({ minHeight: 1150, maxHeight: 1300 });
          expect(isAccepted(result)).assertTrue();
        }
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_586
     * @tc.name      testModuleJsonBulkCase586
     * @tc.desc      Apply forcible and non forcible limits alternately.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase586',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: SetLimitsResult = await applyLimits({ minWidth: 1300, maxWidth: 2000 }, true);
        const second: SetLimitsResult = await applyLimits({ minWidth: 1300, maxWidth: 2000 });
        expect(isAccepted(first)).assertTrue();
        expect(isAccepted(second)).assertTrue();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_587
     * @tc.name      testModuleJsonBulkCase587
     * @tc.desc      Issue three concurrent requests and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase587',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const results: SetLimitsResult[] = await Promise.all([
          applyLimits({ maxWidth: 2100 }),
          applyLimits({ maxWidth: 2200 }),
          applyLimits({ maxWidth: 2300 })
        ]);
        expect(results.length).assertEqual(3);
        expect(isAccepted(results[0])).assertTrue();
        expect(isAccepted(results[1])).assertTrue();
        expect(isAccepted(results[2])).assertTrue();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_588
     * @tc.name      testModuleJsonBulkCase588
     * @tc.desc      Set bulk limits and verify a usable readback.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase588',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const result: SetLimitsResult = await applyLimits({ minWidth: 400, maxWidth: 1800 });
        expect(isAccepted(result)).assertTrue();
        if (result.ok && limitsSupported) {
          expect(isUsableLimits(testWindow!.getWindowLimits())).assertTrue();
        }
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_589
     * @tc.name      testModuleJsonBulkCase589
     * @tc.desc      Apply a three step sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase589',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 3; index++) {
          const result: SetLimitsResult = await applyLimits({ minHeight: 550, maxHeight: 1300 });
          expect(isAccepted(result)).assertTrue();
        }
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_590
     * @tc.name      testModuleJsonBulkCase590
     * @tc.desc      Apply forcible and non forcible limits alternately.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase590',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: SetLimitsResult = await applyLimits({ minWidth: 700, maxWidth: 2000 }, true);
        const second: SetLimitsResult = await applyLimits({ minWidth: 700, maxWidth: 2000 });
        expect(isAccepted(first)).assertTrue();
        expect(isAccepted(second)).assertTrue();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_591
     * @tc.name      testModuleJsonBulkCase591
     * @tc.desc      Issue three concurrent requests and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase591',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const results: SetLimitsResult[] = await Promise.all([
          applyLimits({ maxWidth: 2100 }),
          applyLimits({ maxWidth: 2200 }),
          applyLimits({ maxWidth: 2300 })
        ]);
        expect(results.length).assertEqual(3);
        expect(isAccepted(results[0])).assertTrue();
        expect(isAccepted(results[1])).assertTrue();
        expect(isAccepted(results[2])).assertTrue();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_592
     * @tc.name      testModuleJsonBulkCase592
     * @tc.desc      Set bulk limits and verify a usable readback.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase592',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const result: SetLimitsResult = await applyLimits({ minWidth: 1000, maxWidth: 1800 });
        expect(isAccepted(result)).assertTrue();
        if (result.ok && limitsSupported) {
          expect(isUsableLimits(testWindow!.getWindowLimits())).assertTrue();
        }
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_593
     * @tc.name      testModuleJsonBulkCase593
     * @tc.desc      Apply a three step sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase593',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 3; index++) {
          const result: SetLimitsResult = await applyLimits({ minHeight: 1150, maxHeight: 1300 });
          expect(isAccepted(result)).assertTrue();
        }
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_594
     * @tc.name      testModuleJsonBulkCase594
     * @tc.desc      Apply forcible and non forcible limits alternately.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase594',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: SetLimitsResult = await applyLimits({ minWidth: 1300, maxWidth: 2000 }, true);
        const second: SetLimitsResult = await applyLimits({ minWidth: 1300, maxWidth: 2000 });
        expect(isAccepted(first)).assertTrue();
        expect(isAccepted(second)).assertTrue();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_595
     * @tc.name      testModuleJsonBulkCase595
     * @tc.desc      Issue three concurrent requests and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase595',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const results: SetLimitsResult[] = await Promise.all([
          applyLimits({ maxWidth: 2100 }),
          applyLimits({ maxWidth: 2200 }),
          applyLimits({ maxWidth: 2300 })
        ]);
        expect(results.length).assertEqual(3);
        expect(isAccepted(results[0])).assertTrue();
        expect(isAccepted(results[1])).assertTrue();
        expect(isAccepted(results[2])).assertTrue();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_596
     * @tc.name      testModuleJsonBulkCase596
     * @tc.desc      Set bulk limits and verify a usable readback.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase596',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const result: SetLimitsResult = await applyLimits({ minWidth: 400, maxWidth: 1800 });
        expect(isAccepted(result)).assertTrue();
        if (result.ok && limitsSupported) {
          expect(isUsableLimits(testWindow!.getWindowLimits())).assertTrue();
        }
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_597
     * @tc.name      testModuleJsonBulkCase597
     * @tc.desc      Apply a three step sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase597',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 3; index++) {
          const result: SetLimitsResult = await applyLimits({ minHeight: 550, maxHeight: 1300 });
          expect(isAccepted(result)).assertTrue();
        }
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_598
     * @tc.name      testModuleJsonBulkCase598
     * @tc.desc      Apply forcible and non forcible limits alternately.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase598',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: SetLimitsResult = await applyLimits({ minWidth: 700, maxWidth: 2000 }, true);
        const second: SetLimitsResult = await applyLimits({ minWidth: 700, maxWidth: 2000 });
        expect(isAccepted(first)).assertTrue();
        expect(isAccepted(second)).assertTrue();
      });
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_599
     * @tc.name      testModuleJsonBulkCase599
     * @tc.desc      Issue three concurrent requests and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testModuleJsonBulkCase599',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const results: SetLimitsResult[] = await Promise.all([
          applyLimits({ maxWidth: 2100 }),
          applyLimits({ maxWidth: 2200 }),
          applyLimits({ maxWidth: 2300 })
        ]);
        expect(results.length).assertEqual(3);
        expect(isAccepted(results[0])).assertTrue();
        expect(isAccepted(results[1])).assertTrue();
        expect(isAccepted(results[2])).assertTrue();
      });
    LIMIT_CASES.forEach((limitCase: LimitCase) => {
      /**
       * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_API_0100-0199_0200-0299_0300-0317_0320-0329_0330-0335_0340-0417_0470-0655
       * @tc.name      module.json5 limit matrix case
       * @tc.desc      Verify setWindowLimits with module.json5 bounds, boundary or invalid limit combinations.
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
  });
}
