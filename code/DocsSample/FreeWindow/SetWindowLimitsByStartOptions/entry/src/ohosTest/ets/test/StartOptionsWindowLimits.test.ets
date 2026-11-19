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
import { common, StartOptions, Want, UIAbility } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { getTestAbilityContext } from '../testability/AbilityContextStore';

const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';
const TARGET_ABILITY: string = 'WindowTestAbility';
const ACCEPTABLE_START_CODES: number[] = [201, 202, 401, 801, 16000001, 16000009, 16000011, 16000019, 16000050, 16000053];
const START_MIN_WIDTH: number = 600;
const START_MAX_WIDTH: number = 1500;
const START_MIN_HEIGHT: number = 500;
const START_MAX_HEIGHT: number = 1000;

interface StartCase {
  name: string;
  number: string;
  options: StartOptions;
}
const START_CASES: StartCase[] = [
  {
    name: 'testStartOptionsWidth0600', number: '0600',
    options: { minWindowWidth: 599, maxWindowWidth: 600 }
  },
  {
    name: 'testStartOptionsWidth0601', number: '0601',
    options: { minWindowWidth: 599, maxWindowWidth: 1000 }
  },
  {
    name: 'testStartOptionsWidth0602', number: '0602',
    options: { minWindowWidth: 599, maxWindowWidth: 1500 }
  },
  {
    name: 'testStartOptionsWidth0603', number: '0603',
    options: { minWindowWidth: 600, maxWindowWidth: 600 }
  },
  {
    name: 'testStartOptionsWidth0604', number: '0604',
    options: { minWindowWidth: 600, maxWindowWidth: 1000 }
  },
  {
    name: 'testStartOptionsWidth0605', number: '0605',
    options: { minWindowWidth: 600, maxWindowWidth: 1500 }
  },
  {
    name: 'testStartOptionsWidth0606', number: '0606',
    options: { minWindowWidth: 601, maxWindowWidth: 600 }
  },
  {
    name: 'testStartOptionsWidth0607', number: '0607',
    options: { minWindowWidth: 601, maxWindowWidth: 1000 }
  },
  {
    name: 'testStartOptionsWidth0608', number: '0608',
    options: { minWindowWidth: 601, maxWindowWidth: 1500 }
  },
  {
    name: 'testStartOptionsWidth0609', number: '0609',
    options: { minWindowWidth: 1499, maxWindowWidth: 600 }
  },
  {
    name: 'testStartOptionsWidth0610', number: '0610',
    options: { minWindowWidth: 1499, maxWindowWidth: 1000 }
  },
  {
    name: 'testStartOptionsWidth0611', number: '0611',
    options: { minWindowWidth: 1499, maxWindowWidth: 1500 }
  },
  {
    name: 'testStartOptionsWidth0612', number: '0612',
    options: { minWindowWidth: 1500, maxWindowWidth: 600 }
  },
  {
    name: 'testStartOptionsWidth0613', number: '0613',
    options: { minWindowWidth: 1500, maxWindowWidth: 1000 }
  },
  {
    name: 'testStartOptionsWidth0614', number: '0614',
    options: { minWindowWidth: 1500, maxWindowWidth: 1500 }
  },
  {
    name: 'testStartOptionsHeight0615', number: '0615',
    options: { minWindowHeight: 499, maxWindowHeight: 500 }
  },
  {
    name: 'testStartOptionsHeight0616', number: '0616',
    options: { minWindowHeight: 499, maxWindowHeight: 700 }
  },
  {
    name: 'testStartOptionsHeight0617', number: '0617',
    options: { minWindowHeight: 499, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartOptionsHeight0618', number: '0618',
    options: { minWindowHeight: 499, maxWindowHeight: 1100 }
  },
  {
    name: 'testStartOptionsHeight0619', number: '0619',
    options: { minWindowHeight: 499, maxWindowHeight: 1300 }
  },
  {
    name: 'testStartOptionsHeight0620', number: '0620',
    options: { minWindowHeight: 500, maxWindowHeight: 500 }
  },
  {
    name: 'testStartOptionsHeight0621', number: '0621',
    options: { minWindowHeight: 500, maxWindowHeight: 700 }
  },
  {
    name: 'testStartOptionsHeight0622', number: '0622',
    options: { minWindowHeight: 500, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartOptionsHeight0623', number: '0623',
    options: { minWindowHeight: 500, maxWindowHeight: 1100 }
  },
  {
    name: 'testStartOptionsHeight0624', number: '0624',
    options: { minWindowHeight: 500, maxWindowHeight: 1300 }
  },
  {
    name: 'testStartOptionsHeight0625', number: '0625',
    options: { minWindowHeight: 501, maxWindowHeight: 500 }
  },
  {
    name: 'testStartOptionsHeight0626', number: '0626',
    options: { minWindowHeight: 501, maxWindowHeight: 700 }
  },
  {
    name: 'testStartOptionsHeight0627', number: '0627',
    options: { minWindowHeight: 501, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartOptionsHeight0628', number: '0628',
    options: { minWindowHeight: 501, maxWindowHeight: 1100 }
  },
  {
    name: 'testStartOptionsHeight0629', number: '0629',
    options: { minWindowHeight: 501, maxWindowHeight: 1300 }
  },
  {
    name: 'testStartOptionsHeight0630', number: '0630',
    options: { minWindowHeight: 999, maxWindowHeight: 500 }
  },
  {
    name: 'testStartOptionsHeight0631', number: '0631',
    options: { minWindowHeight: 999, maxWindowHeight: 700 }
  },
  {
    name: 'testStartOptionsHeight0632', number: '0632',
    options: { minWindowHeight: 999, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartOptionsHeight0633', number: '0633',
    options: { minWindowHeight: 999, maxWindowHeight: 1100 }
  },
  {
    name: 'testStartOptionsHeight0634', number: '0634',
    options: { minWindowHeight: 999, maxWindowHeight: 1300 }
  },
  {
    name: 'testStartOptionsHeight0635', number: '0635',
    options: { minWindowHeight: 1000, maxWindowHeight: 500 }
  },
  {
    name: 'testStartOptionsHeight0636', number: '0636',
    options: { minWindowHeight: 1000, maxWindowHeight: 700 }
  },
  {
    name: 'testStartOptionsHeight0637', number: '0637',
    options: { minWindowHeight: 1000, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartOptionsHeight0638', number: '0638',
    options: { minWindowHeight: 1000, maxWindowHeight: 1100 }
  },
  {
    name: 'testStartOptionsHeight0639', number: '0639',
    options: { minWindowHeight: 1000, maxWindowHeight: 1300 }
  },
  {
    name: 'testStartOptionsPresence0640', number: '0640',
    options: { minWindowWidth: 600 }
  },
  {
    name: 'testStartOptionsPresence0641', number: '0641',
    options: { minWindowHeight: 500 }
  },
  {
    name: 'testStartOptionsPresence0642', number: '0642',
    options: { minWindowWidth: 600, minWindowHeight: 500 }
  },
  {
    name: 'testStartOptionsPresence0643', number: '0643',
    options: { maxWindowWidth: 1500 }
  },
  {
    name: 'testStartOptionsPresence0644', number: '0644',
    options: { minWindowWidth: 600, maxWindowWidth: 1500 }
  },
  {
    name: 'testStartOptionsPresence0645', number: '0645',
    options: { minWindowHeight: 500, maxWindowWidth: 1500 }
  },
  {
    name: 'testStartOptionsPresence0646', number: '0646',
    options: { minWindowWidth: 600, minWindowHeight: 500, maxWindowWidth: 1500 }
  },
  {
    name: 'testStartOptionsPresence0647', number: '0647',
    options: { maxWindowHeight: 1000 }
  },
  {
    name: 'testStartOptionsPresence0648', number: '0648',
    options: { minWindowWidth: 600, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartOptionsPresence0649', number: '0649',
    options: { minWindowHeight: 500, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartOptionsPresence0650', number: '0650',
    options: { minWindowWidth: 600, minWindowHeight: 500, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartOptionsPresence0651', number: '0651',
    options: { maxWindowWidth: 1500, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartOptionsPresence0652', number: '0652',
    options: { minWindowWidth: 600, maxWindowWidth: 1500, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartOptionsPresence0653', number: '0653',
    options: { minWindowHeight: 500, maxWindowWidth: 1500, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartOptionsPresence0654', number: '0654',
    options: { minWindowWidth: 600, minWindowHeight: 500, maxWindowWidth: 1500, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartOptionsRatio0655', number: '0655',
    options: { minWindowWidth: 600, minWindowHeight: 500, maxWindowWidth: 1500, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartOptionsRatio0656', number: '0656',
    options: { minWindowWidth: 600, minWindowHeight: 500, maxWindowWidth: 900, maxWindowHeight: 600 }
  },
  {
    name: 'testStartOptionsRatio0657', number: '0657',
    options: { minWindowWidth: 700, minWindowHeight: 500, maxWindowWidth: 1050, maxWindowHeight: 600 }
  },
  {
    name: 'testStartOptionsRatio0658', number: '0658',
    options: { minWindowWidth: 800, minWindowHeight: 500, maxWindowWidth: 1200, maxWindowHeight: 600 }
  },
  {
    name: 'testStartOptionsRatio0659', number: '0659',
    options: { minWindowWidth: 900, minWindowHeight: 600, maxWindowWidth: 1500, maxWindowHeight: 800 }
  },
  {
    name: 'testStartOptionsRatio0660', number: '0660',
    options: { minWindowWidth: 600, minWindowHeight: 700, maxWindowWidth: 900, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartOptionsRatio0661', number: '0661',
    options: { minWindowWidth: 600, minWindowHeight: 800, maxWindowWidth: 1000, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartOptionsRatio0662', number: '0662',
    options: { minWindowWidth: 1000, minWindowHeight: 500, maxWindowWidth: 1000, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartOptionsRatio0663', number: '0663',
    options: { minWindowWidth: 600, minWindowHeight: 500, maxWindowWidth: 600, maxWindowHeight: 800 }
  },
  {
    name: 'testStartOptionsRatio0664', number: '0664',
    options: { minWindowWidth: 900, minWindowHeight: 500, maxWindowWidth: 1200, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartOptionsSpecial0665', number: '0665',
    options: { minWindowWidth: 0, minWindowHeight: 0, maxWindowWidth: 0, maxWindowHeight: 0 }
  },
  {
    name: 'testStartOptionsSpecial0666', number: '0666',
    options: { minWindowWidth: -600, minWindowHeight: -500, maxWindowWidth: -1500, maxWindowHeight: -1000 }
  },
  {
    name: 'testStartOptionsSpecial0667', number: '0667',
    options: { minWindowWidth: 600.5, minWindowHeight: 500.5, maxWindowWidth: 1500.5, maxWindowHeight: 1000.5 }
  },
  {
    name: 'testStartOptionsSpecial0668', number: '0668',
    options: { minWindowWidth: 1000, minWindowHeight: 1000, maxWindowWidth: 600, maxWindowHeight: 600 }
  },
  {
    name: 'testStartOptionsSpecial0669', number: '0669',
    options: { minWindowWidth: 1500, minWindowHeight: 1000, maxWindowWidth: 600, maxWindowHeight: 500 }
  },
  {
    name: 'testStartOptionsSpecial0670', number: '0670',
    options: { minWindowWidth: 9007199254740991, minWindowHeight: 9007199254740991, maxWindowWidth: 9007199254740991, maxWindowHeight: 9007199254740991 }
  },
  {
    name: 'testStartOptionsSpecial0671', number: '0671',
    options: { minWindowWidth: 1000000, minWindowHeight: 1000000, maxWindowWidth: 1000000, maxWindowHeight: 1000000 }
  },
  {
    name: 'testStartOptionsSpecial0672', number: '0672',
    options: { minWindowWidth: 1, minWindowHeight: 1, maxWindowWidth: 1, maxWindowHeight: 1 }
  },
  {
    name: 'testStartOptionsSpecial0673', number: '0673',
    options: { minWindowWidth: 600, minWindowHeight: 500, maxWindowWidth: 1500, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartOptionsSpecial0674', number: '0674',
    options: { minWindowWidth: -1, minWindowHeight: -1, maxWindowWidth: 1, maxWindowHeight: 1 }
  },
  {
    name: 'testStartOptionsSpecial0675', number: '0675',
    options: { minWindowWidth: 600, minWindowHeight: 500, maxWindowWidth: 600, maxWindowHeight: 500 }
  },
  {
    name: 'testStartOptionsSpecial0676', number: '0676',
    options: { minWindowWidth: 1500, minWindowHeight: 1000, maxWindowWidth: 1500, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartOptionsSpecial0677', number: '0677',
    options: { minWindowWidth: 601, minWindowHeight: 501, maxWindowWidth: 1499, maxWindowHeight: 999 }
  },
  {
    name: 'testStartOptionsSpecial0678', number: '0678',
    options: { minWindowWidth: 599, minWindowHeight: 499, maxWindowWidth: 1501, maxWindowHeight: 1001 }
  },
  {
    name: 'testStartOptionsSpecial0679', number: '0679',
    options: { minWindowWidth: 600, minWindowHeight: 500, maxWindowWidth: 1501, maxWindowHeight: 1001 }
  },
  {
    name: 'testStartOptionsSpecial0680', number: '0680',
    options: { minWindowWidth: 599, minWindowHeight: 499, maxWindowWidth: 1500, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartOptionsSpecial0681', number: '0681',
    options: { minWindowWidth: 600, minWindowHeight: 500, maxWindowWidth: 1500, maxWindowHeight: 1001 }
  },
  {
    name: 'testStartOptionsSpecial0682', number: '0682',
    options: { minWindowWidth: 600, minWindowHeight: 500, maxWindowWidth: 1501, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartOptionsSpecial0683', number: '0683',
    options: { minWindowWidth: 600, minWindowHeight: 500, maxWindowWidth: 1499, maxWindowHeight: 1001 }
  },
  {
    name: 'testStartOptionsSpecial0684', number: '0684',
    options: { minWindowWidth: 1, minWindowHeight: 500, maxWindowWidth: 1500, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartOptionsSpecial0685', number: '0685',
    options: { minWindowWidth: 600, minWindowHeight: 1, maxWindowWidth: 1500, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartOptionsSpecial0686', number: '0686',
    options: { minWindowWidth: 600, minWindowHeight: 500, maxWindowWidth: 1500, maxWindowHeight: 1 }
  },
  {
    name: 'testStartOptionsSpecial0687', number: '0687',
    options: { minWindowWidth: 600, minWindowHeight: 500, maxWindowWidth: 1, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartOptionsSpecial0688', number: '0688',
    options: { minWindowWidth: 0, minWindowHeight: 500, maxWindowWidth: 1500, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartOptionsSpecial0689', number: '0689',
    options: { minWindowWidth: 600, minWindowHeight: 0, maxWindowWidth: 1500, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartMinWidthSweep0700', number: '0700',
    options: { minWindowWidth: 1 }
  },
  {
    name: 'testStartMinWidthSweep0701', number: '0701',
    options: { minWindowWidth: 100 }
  },
  {
    name: 'testStartMinWidthSweep0702', number: '0702',
    options: { minWindowWidth: 300 }
  },
  {
    name: 'testStartMinWidthSweep0703', number: '0703',
    options: { minWindowWidth: 599 }
  },
  {
    name: 'testStartMinWidthSweep0704', number: '0704',
    options: { minWindowWidth: 600 }
  },
  {
    name: 'testStartMinWidthSweep0705', number: '0705',
    options: { minWindowWidth: 601 }
  },
  {
    name: 'testStartMinWidthSweep0706', number: '0706',
    options: { minWindowWidth: 900 }
  },
  {
    name: 'testStartMinWidthSweep0707', number: '0707',
    options: { minWindowWidth: 1500 }
  },
  {
    name: 'testStartMinWidthSweep0708', number: '0708',
    options: { minWindowWidth: 2000 }
  },
  {
    name: 'testStartMinWidthSweep0709', number: '0709',
    options: { minWindowWidth: Number.MAX_SAFE_INTEGER }
  },
  {
    name: 'testStartMaxWidthSweep0710', number: '0710',
    options: { maxWindowWidth: 1 }
  },
  {
    name: 'testStartMaxWidthSweep0711', number: '0711',
    options: { maxWindowWidth: 100 }
  },
  {
    name: 'testStartMaxWidthSweep0712', number: '0712',
    options: { maxWindowWidth: 600 }
  },
  {
    name: 'testStartMaxWidthSweep0713', number: '0713',
    options: { maxWindowWidth: 1000 }
  },
  {
    name: 'testStartMaxWidthSweep0714', number: '0714',
    options: { maxWindowWidth: 1499 }
  },
  {
    name: 'testStartMaxWidthSweep0715', number: '0715',
    options: { maxWindowWidth: 1500 }
  },
  {
    name: 'testStartMaxWidthSweep0716', number: '0716',
    options: { maxWindowWidth: 1501 }
  },
  {
    name: 'testStartMaxWidthSweep0717', number: '0717',
    options: { maxWindowWidth: 2000 }
  },
  {
    name: 'testStartMaxWidthSweep0718', number: '0718',
    options: { maxWindowWidth: 100000 }
  },
  {
    name: 'testStartMaxWidthSweep0719', number: '0719',
    options: { maxWindowWidth: Number.MAX_SAFE_INTEGER }
  },
  {
    name: 'testStartMinHeightSweep0720', number: '0720',
    options: { minWindowHeight: 1 }
  },
  {
    name: 'testStartMinHeightSweep0721', number: '0721',
    options: { minWindowHeight: 100 }
  },
  {
    name: 'testStartMinHeightSweep0722', number: '0722',
    options: { minWindowHeight: 250 }
  },
  {
    name: 'testStartMinHeightSweep0723', number: '0723',
    options: { minWindowHeight: 499 }
  },
  {
    name: 'testStartMinHeightSweep0724', number: '0724',
    options: { minWindowHeight: 500 }
  },
  {
    name: 'testStartMinHeightSweep0725', number: '0725',
    options: { minWindowHeight: 501 }
  },
  {
    name: 'testStartMinHeightSweep0726', number: '0726',
    options: { minWindowHeight: 750 }
  },
  {
    name: 'testStartMinHeightSweep0727', number: '0727',
    options: { minWindowHeight: 1000 }
  },
  {
    name: 'testStartMinHeightSweep0728', number: '0728',
    options: { minWindowHeight: 2000 }
  },
  {
    name: 'testStartMinHeightSweep0729', number: '0729',
    options: { minWindowHeight: Number.MAX_SAFE_INTEGER }
  },
  {
    name: 'testStartMaxHeightSweep0730', number: '0730',
    options: { maxWindowHeight: 1 }
  },
  {
    name: 'testStartMaxHeightSweep0731', number: '0731',
    options: { maxWindowHeight: 100 }
  },
  {
    name: 'testStartMaxHeightSweep0732', number: '0732',
    options: { maxWindowHeight: 500 }
  },
  {
    name: 'testStartMaxHeightSweep0733', number: '0733',
    options: { maxWindowHeight: 750 }
  },
  {
    name: 'testStartMaxHeightSweep0734', number: '0734',
    options: { maxWindowHeight: 999 }
  },
  {
    name: 'testStartMaxHeightSweep0735', number: '0735',
    options: { maxWindowHeight: 1000 }
  },
  {
    name: 'testStartMaxHeightSweep0736', number: '0736',
    options: { maxWindowHeight: 1001 }
  },
  {
    name: 'testStartMaxHeightSweep0737', number: '0737',
    options: { maxWindowHeight: 1300 }
  },
  {
    name: 'testStartMaxHeightSweep0738', number: '0738',
    options: { maxWindowHeight: 100000 }
  },
  {
    name: 'testStartMaxHeightSweep0739', number: '0739',
    options: { maxWindowHeight: Number.MAX_SAFE_INTEGER }
  },
  {
    name: 'testStartRatioGrid0740', number: '0740',
    options: { minWindowWidth: 600, minWindowHeight: 500, maxWindowWidth: 1500, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartRatioGrid0741', number: '0741',
    options: { minWindowWidth: 600, minWindowHeight: 500, maxWindowWidth: 1200, maxWindowHeight: 500 }
  },
  {
    name: 'testStartRatioGrid0742', number: '0742',
    options: { minWindowWidth: 600, minWindowHeight: 500, maxWindowWidth: 1500, maxWindowHeight: 600 }
  },
  {
    name: 'testStartRatioGrid0743', number: '0743',
    options: { minWindowWidth: 600, minWindowHeight: 600, maxWindowWidth: 1500, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartRatioGrid0744', number: '0744',
    options: { minWindowWidth: 600, minWindowHeight: 700, maxWindowWidth: 1500, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartRatioGrid0745', number: '0745',
    options: { minWindowWidth: 600, minWindowHeight: 800, maxWindowWidth: 1500, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartRatioGrid0746', number: '0746',
    options: { minWindowWidth: 700, minWindowHeight: 500, maxWindowWidth: 1400, maxWindowHeight: 600 }
  },
  {
    name: 'testStartRatioGrid0747', number: '0747',
    options: { minWindowWidth: 700, minWindowHeight: 500, maxWindowWidth: 1400, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartRatioGrid0748', number: '0748',
    options: { minWindowWidth: 800, minWindowHeight: 500, maxWindowWidth: 1300, maxWindowHeight: 700 }
  },
  {
    name: 'testStartRatioGrid0749', number: '0749',
    options: { minWindowWidth: 800, minWindowHeight: 500, maxWindowWidth: 1300, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartRatioGrid0750', number: '0750',
    options: { minWindowWidth: 900, minWindowHeight: 500, maxWindowWidth: 1200, maxWindowHeight: 800 }
  },
  {
    name: 'testStartRatioGrid0751', number: '0751',
    options: { minWindowWidth: 900, minWindowHeight: 600, maxWindowWidth: 1200, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartRatioGrid0752', number: '0752',
    options: { minWindowWidth: 1000, minWindowHeight: 500, maxWindowWidth: 1500, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartRatioGrid0753', number: '0753',
    options: { minWindowWidth: 1100, minWindowHeight: 500, maxWindowWidth: 1400, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartRatioGrid0754', number: '0754',
    options: { minWindowWidth: 600, minWindowHeight: 900, maxWindowWidth: 900, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartRatioGrid0755', number: '0755',
    options: { minWindowWidth: 700, minWindowHeight: 900, maxWindowWidth: 1000, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartRatioGrid0756', number: '0756',
    options: { minWindowWidth: 600, minWindowHeight: 500, maxWindowWidth: 600, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartRatioGrid0757', number: '0757',
    options: { minWindowWidth: 1500, minWindowHeight: 500, maxWindowWidth: 1500, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartRatioGrid0758', number: '0758',
    options: { minWindowWidth: 600, minWindowHeight: 500, maxWindowWidth: 900, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartRatioGrid0759', number: '0759',
    options: { minWindowWidth: 900, minWindowHeight: 500, maxWindowWidth: 1500, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartDisplayId0760', number: '0760',
    options: { displayId: 0, minWindowWidth: 600, maxWindowWidth: 1500 }
  },
  {
    name: 'testStartDisplayId0761', number: '0761',
    options: { displayId: 1, minWindowWidth: 600, maxWindowWidth: 1500 }
  },
  {
    name: 'testStartDisplayId0762', number: '0762',
    options: { displayId: 2, minWindowWidth: 600, maxWindowWidth: 1500 }
  },
  {
    name: 'testStartDisplayId0763', number: '0763',
    options: { displayId: -1, minWindowWidth: 600, maxWindowWidth: 1500 }
  },
  {
    name: 'testStartDisplayId0764', number: '0764',
    options: { displayId: 1000, minWindowWidth: 600, maxWindowWidth: 1500 }
  },
  {
    name: 'testStartTriple0765', number: '0765',
    options: { minWindowWidth: 600, minWindowHeight: 500, maxWindowWidth: 1500 }
  },
  {
    name: 'testStartTriple0766', number: '0766',
    options: { minWindowWidth: 600, minWindowHeight: 1000, maxWindowWidth: 1500 }
  },
  {
    name: 'testStartTriple0767', number: '0767',
    options: { minWindowWidth: 1500, minWindowHeight: 500, maxWindowWidth: 1000 }
  },
  {
    name: 'testStartTriple0768', number: '0768',
    options: { minWindowWidth: 900, minWindowHeight: 700, maxWindowWidth: 1200 }
  },
  {
    name: 'testStartFloat0769', number: '0769',
    options: { minWindowWidth: 600.5, minWindowHeight: 500.5, maxWindowWidth: 1500.5, maxWindowHeight: 1000.5 }
  },
  {
    name: 'testStartFloat0770', number: '0770',
    options: { minWindowWidth: 600.25, minWindowHeight: 500.75, maxWindowWidth: 1499.75, maxWindowHeight: 999.25 }
  },
  {
    name: 'testStartFloat0771', number: '0771',
    options: { minWindowWidth: 600.1, minWindowHeight: 500.1, maxWindowWidth: 1500.1, maxWindowHeight: 1000.1 }
  },
  {
    name: 'testStartFloat0772', number: '0772',
    options: { minWindowWidth: 599.9, minWindowHeight: 499.9, maxWindowWidth: 1500.9, maxWindowHeight: 1000.9 }
  },
  {
    name: 'testStartFloat0773', number: '0773',
    options: { minWindowWidth: 600.001, minWindowHeight: 500.001, maxWindowWidth: 1500.999, maxWindowHeight: 999.999 }
  },
  {
    name: 'testStartFloat0774', number: '0774',
    options: { minWindowWidth: 0.5, minWindowHeight: 0.5, maxWindowWidth: 1.5, maxWindowHeight: 1.5 }
  },
  {
    name: 'testStartFloat0775', number: '0775',
    options: { minWindowWidth: 1499.5, minWindowHeight: 999.5, maxWindowWidth: 1500.5, maxWindowHeight: 1000.5 }
  },
  {
    name: 'testStartFloat0776', number: '0776',
    options: { minWindowWidth: 600.999, minWindowHeight: 500.999, maxWindowWidth: 600.999, maxWindowHeight: 500.999 }
  },
  {
    name: 'testStartFloat0777', number: '0777',
    options: { minWindowWidth: 750.5, minWindowHeight: 650.5, maxWindowWidth: 1250.5, maxWindowHeight: 950.5 }
  },
  {
    name: 'testStartFloat0778', number: '0778',
    options: { minWindowWidth: 601.5, minWindowHeight: 501.5, maxWindowWidth: 1498.5, maxWindowHeight: 998.5 }
  },
  {
    name: 'testStartInvalid0779', number: '0779',
    options: { minWindowWidth: 1500, minWindowHeight: 1000, maxWindowWidth: 600, maxWindowHeight: 500 }
  },
  {
    name: 'testStartInvalid0780', number: '0780',
    options: { minWindowWidth: 1500, minWindowHeight: 500, maxWindowWidth: 600, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartInvalid0781', number: '0781',
    options: { minWindowWidth: 600, minWindowHeight: 1000, maxWindowWidth: 1500, maxWindowHeight: 500 }
  },
  {
    name: 'testStartInvalid0782', number: '0782',
    options: { minWindowWidth: 1501, minWindowHeight: 1001, maxWindowWidth: 600, maxWindowHeight: 500 }
  },
  {
    name: 'testStartInvalid0783', number: '0783',
    options: { minWindowWidth: 599, minWindowHeight: 499, maxWindowWidth: 1500, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartInvalid0784', number: '0784',
    options: { minWindowWidth: 600, minWindowHeight: 500, maxWindowWidth: 1501, maxWindowHeight: 1001 }
  },
  {
    name: 'testStartInvalid0785', number: '0785',
    options: { minWindowWidth: -1, minWindowHeight: -1, maxWindowWidth: 1500, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartInvalid0786', number: '0786',
    options: { minWindowWidth: 600, minWindowHeight: 500, maxWindowWidth: -1, maxWindowHeight: -1 }
  },
  {
    name: 'testStartInvalid0787', number: '0787',
    options: { minWindowWidth: 0, minWindowHeight: 0, maxWindowWidth: 1500, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartInvalid0788', number: '0788',
    options: { minWindowWidth: 600, minWindowHeight: 500, maxWindowWidth: 0, maxWindowHeight: 0 }
  },
  {
    name: 'testStartInvalid0789', number: '0789',
    options: { minWindowWidth: 9007199254740991, minWindowHeight: 9007199254740991, maxWindowWidth: 1, maxWindowHeight: 1 }
  },
  {
    name: 'testStartRatio20790', number: '0790',
    options: { minWindowWidth: 600, minWindowHeight: 500, maxWindowWidth: 1500, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartRatio20791', number: '0791',
    options: { minWindowWidth: 600, minWindowHeight: 500, maxWindowWidth: 1200, maxWindowHeight: 500 }
  },
  {
    name: 'testStartRatio20792', number: '0792',
    options: { minWindowWidth: 600, minWindowHeight: 500, maxWindowWidth: 1500, maxWindowHeight: 600 }
  },
  {
    name: 'testStartRatio20793', number: '0793',
    options: { minWindowWidth: 600, minWindowHeight: 600, maxWindowWidth: 1500, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartRatio20794', number: '0794',
    options: { minWindowWidth: 600, minWindowHeight: 700, maxWindowWidth: 1500, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartRatio20795', number: '0795',
    options: { minWindowWidth: 600, minWindowHeight: 800, maxWindowWidth: 1500, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartRatio20796', number: '0796',
    options: { minWindowWidth: 700, minWindowHeight: 500, maxWindowWidth: 1400, maxWindowHeight: 600 }
  },
  {
    name: 'testStartRatio20797', number: '0797',
    options: { minWindowWidth: 700, minWindowHeight: 500, maxWindowWidth: 1400, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartRatio20798', number: '0798',
    options: { minWindowWidth: 800, minWindowHeight: 500, maxWindowWidth: 1300, maxWindowHeight: 700 }
  },
  {
    name: 'testStartRatio20799', number: '0799',
    options: { minWindowWidth: 800, minWindowHeight: 500, maxWindowWidth: 1300, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartRatio20800', number: '0800',
    options: { minWindowWidth: 900, minWindowHeight: 500, maxWindowWidth: 1200, maxWindowHeight: 800 }
  },
  {
    name: 'testStartRatio20801', number: '0801',
    options: { minWindowWidth: 900, minWindowHeight: 600, maxWindowWidth: 1200, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartRatio20802', number: '0802',
    options: { minWindowWidth: 1000, minWindowHeight: 500, maxWindowWidth: 1500, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartRatio20803', number: '0803',
    options: { minWindowWidth: 1100, minWindowHeight: 500, maxWindowWidth: 1400, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartRatio20804', number: '0804',
    options: { minWindowWidth: 600, minWindowHeight: 900, maxWindowWidth: 900, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartRatio20805', number: '0805',
    options: { minWindowWidth: 700, minWindowHeight: 900, maxWindowWidth: 1000, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartRatio20806', number: '0806',
    options: { minWindowWidth: 600, minWindowHeight: 500, maxWindowWidth: 600, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartRatio20807', number: '0807',
    options: { minWindowWidth: 1500, minWindowHeight: 500, maxWindowWidth: 1500, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartRatio20808', number: '0808',
    options: { minWindowWidth: 600, minWindowHeight: 500, maxWindowWidth: 900, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartRatio20809', number: '0809',
    options: { minWindowWidth: 900, minWindowHeight: 500, maxWindowWidth: 1500, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartInvalid20810', number: '0810',
    options: { minWindowWidth: 1500, minWindowHeight: 1000, maxWindowWidth: 600, maxWindowHeight: 500 }
  },
  {
    name: 'testStartInvalid20811', number: '0811',
    options: { minWindowWidth: 1500, minWindowHeight: 500, maxWindowWidth: 600, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartInvalid20812', number: '0812',
    options: { minWindowWidth: 600, minWindowHeight: 1000, maxWindowWidth: 1500, maxWindowHeight: 500 }
  },
  {
    name: 'testStartInvalid20813', number: '0813',
    options: { minWindowWidth: 1501, minWindowHeight: 1001, maxWindowWidth: 600, maxWindowHeight: 500 }
  },
  {
    name: 'testStartInvalid20814', number: '0814',
    options: { minWindowWidth: 599, minWindowHeight: 499, maxWindowWidth: 1500, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartInvalid20815', number: '0815',
    options: { minWindowWidth: 600, minWindowHeight: 500, maxWindowWidth: 1501, maxWindowHeight: 1001 }
  },
  {
    name: 'testStartInvalid20816', number: '0816',
    options: { minWindowWidth: -1, minWindowHeight: -1, maxWindowWidth: 1500, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartInvalid20817', number: '0817',
    options: { minWindowWidth: 600, minWindowHeight: 500, maxWindowWidth: -1, maxWindowHeight: -1 }
  },
  {
    name: 'testStartInvalid20818', number: '0818',
    options: { minWindowWidth: 0, minWindowHeight: 0, maxWindowWidth: 1500, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartInvalid20819', number: '0819',
    options: { minWindowWidth: 600, minWindowHeight: 500, maxWindowWidth: 0, maxWindowHeight: 0 }
  },
  {
    name: 'testStartInvalid20820', number: '0820',
    options: { minWindowWidth: 1501, minWindowHeight: 500, maxWindowWidth: 1500, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartInvalid20821', number: '0821',
    options: { minWindowWidth: 600, minWindowHeight: 1001, maxWindowWidth: 1500, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartInvalid20822', number: '0822',
    options: { minWindowWidth: 1500, minWindowHeight: 1000, maxWindowWidth: 1500, maxWindowHeight: 500 }
  },
  {
    name: 'testStartInvalid20823', number: '0823',
    options: { minWindowWidth: 600, minWindowHeight: 500, maxWindowWidth: 600, maxWindowHeight: 499 }
  },
  {
    name: 'testStartInvalid20824', number: '0824',
    options: { minWindowWidth: 9007199254740991, minWindowHeight: 9007199254740991, maxWindowWidth: 1, maxWindowHeight: 1 }
  },
  {
    name: 'testStartFloat20825', number: '0825',
    options: { minWindowWidth: 600.5, minWindowHeight: 500.5, maxWindowWidth: 1500.5, maxWindowHeight: 1000.5 }
  },
  {
    name: 'testStartFloat20826', number: '0826',
    options: { minWindowWidth: 600.25, minWindowHeight: 500.75, maxWindowWidth: 1499.75, maxWindowHeight: 999.25 }
  },
  {
    name: 'testStartFloat20827', number: '0827',
    options: { minWindowWidth: 600.1, minWindowHeight: 500.1, maxWindowWidth: 1500.1, maxWindowHeight: 1000.1 }
  },
  {
    name: 'testStartFloat20828', number: '0828',
    options: { minWindowWidth: 599.9, minWindowHeight: 499.9, maxWindowWidth: 1500.9, maxWindowHeight: 1000.9 }
  },
  {
    name: 'testStartFloat20829', number: '0829',
    options: { minWindowWidth: 750.5, minWindowHeight: 650.5, maxWindowWidth: 1250.5, maxWindowHeight: 950.5 }
  },
  {
    name: 'testStartCornerGrid0830', number: '0830',
    options: { minWindowWidth: 600, minWindowHeight: 500, maxWindowWidth: 600, maxWindowHeight: 500 }
  },
  {
    name: 'testStartCornerGrid0831', number: '0831',
    options: { minWindowWidth: 1500, minWindowHeight: 1000, maxWindowWidth: 1500, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartCornerGrid0832', number: '0832',
    options: { minWindowWidth: 600, minWindowHeight: 1000, maxWindowWidth: 600, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartCornerGrid0833', number: '0833',
    options: { minWindowWidth: 1500, minWindowHeight: 500, maxWindowWidth: 1500, maxWindowHeight: 500 }
  },
  {
    name: 'testStartCornerGrid0834', number: '0834',
    options: { minWindowWidth: 600, minWindowHeight: 500, maxWindowWidth: 1500, maxWindowHeight: 500 }
  },
  {
    name: 'testStartCornerGrid0835', number: '0835',
    options: { minWindowWidth: 600, minWindowHeight: 500, maxWindowWidth: 600, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartCornerGrid0836', number: '0836',
    options: { minWindowWidth: 1500, minWindowHeight: 500, maxWindowWidth: 1500, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartCornerGrid0837', number: '0837',
    options: { minWindowWidth: 600, minWindowHeight: 1000, maxWindowWidth: 1500, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartCornerGrid0838', number: '0838',
    options: { minWindowWidth: 601, minWindowHeight: 501, maxWindowWidth: 601, maxWindowHeight: 501 }
  },
  {
    name: 'testStartCornerGrid0839', number: '0839',
    options: { minWindowWidth: 1499, minWindowHeight: 999, maxWindowWidth: 1499, maxWindowHeight: 999 }
  },
  {
    name: 'testStartCornerGrid0840', number: '0840',
    options: { minWindowWidth: 599, minWindowHeight: 499, maxWindowWidth: 1501, maxWindowHeight: 1001 }
  },
  {
    name: 'testStartCornerGrid0841', number: '0841',
    options: { minWindowWidth: 1501, minWindowHeight: 1001, maxWindowWidth: 599, maxWindowHeight: 499 }
  },
  {
    name: 'testStartCornerGrid0842', number: '0842',
    options: { minWindowWidth: 600, minWindowHeight: 750, maxWindowWidth: 1500, maxWindowHeight: 750 }
  },
  {
    name: 'testStartCornerGrid0843', number: '0843',
    options: { minWindowWidth: 1050, minWindowHeight: 500, maxWindowWidth: 1050, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartCornerGrid0844', number: '0844',
    options: { minWindowWidth: 750, minWindowHeight: 500, maxWindowWidth: 1350, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartCornerGrid0845', number: '0845',
    options: { minWindowWidth: 600, minWindowHeight: 600, maxWindowWidth: 1500, maxWindowHeight: 900 }
  },
  {
    name: 'testStartCornerGrid0846', number: '0846',
    options: { minWindowWidth: 900, minWindowHeight: 500, maxWindowWidth: 900, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartCornerGrid0847', number: '0847',
    options: { minWindowWidth: 1000, minWindowHeight: 600, maxWindowWidth: 1400, maxWindowHeight: 900 }
  },
  {
    name: 'testStartCornerGrid0848', number: '0848',
    options: { minWindowWidth: 700, minWindowHeight: 900, maxWindowWidth: 1500, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartCornerGrid0849', number: '0849',
    options: { minWindowWidth: 600, minWindowHeight: 500, maxWindowWidth: 800, maxWindowHeight: 600 }
  },
  {
    name: 'testStartBulk0850', number: '0850',
    options: { minWindowWidth: 600, minWindowHeight: 500, maxWindowWidth: 750, maxWindowHeight: 600 }
  },
  {
    name: 'testStartBulk0851', number: '0851',
    options: { minWindowWidth: 680, minWindowHeight: 500, maxWindowWidth: 930, maxWindowHeight: 640 }
  },
  {
    name: 'testStartBulk0852', number: '0852',
    options: { minWindowWidth: 760, minWindowHeight: 500, maxWindowWidth: 1110, maxWindowHeight: 680 }
  },
  {
    name: 'testStartBulk0853', number: '0853',
    options: { minWindowWidth: 840, minWindowHeight: 500, maxWindowWidth: 1290, maxWindowHeight: 720 }
  },
  {
    name: 'testStartBulk0854', number: '0854',
    options: { minWindowWidth: 920, minWindowHeight: 500, maxWindowWidth: 1470, maxWindowHeight: 760 }
  },
  {
    name: 'testStartBulk0855', number: '0855',
    options: { minWindowWidth: 1000, minWindowHeight: 500, maxWindowWidth: 1150, maxWindowHeight: 800 }
  },
  {
    name: 'testStartBulk0856', number: '0856',
    options: { minWindowWidth: 1080, minWindowHeight: 500, maxWindowWidth: 1330, maxWindowHeight: 840 }
  },
  {
    name: 'testStartBulk0857', number: '0857',
    options: { minWindowWidth: 1160, minWindowHeight: 500, maxWindowWidth: 1510, maxWindowHeight: 880 }
  },
  {
    name: 'testStartBulk0858', number: '0858',
    options: { minWindowWidth: 1240, minWindowHeight: 500, maxWindowWidth: 1690, maxWindowHeight: 600 }
  },
  {
    name: 'testStartBulk0859', number: '0859',
    options: { minWindowWidth: 1320, minWindowHeight: 500, maxWindowWidth: 1870, maxWindowHeight: 640 }
  },
  {
    name: 'testStartBulk0860', number: '0860',
    options: { minWindowWidth: 600, minWindowHeight: 540, maxWindowWidth: 750, maxWindowHeight: 720 }
  },
  {
    name: 'testStartBulk0861', number: '0861',
    options: { minWindowWidth: 680, minWindowHeight: 540, maxWindowWidth: 930, maxWindowHeight: 760 }
  },
  {
    name: 'testStartBulk0862', number: '0862',
    options: { minWindowWidth: 760, minWindowHeight: 540, maxWindowWidth: 1110, maxWindowHeight: 800 }
  },
  {
    name: 'testStartBulk0863', number: '0863',
    options: { minWindowWidth: 840, minWindowHeight: 540, maxWindowWidth: 1290, maxWindowHeight: 840 }
  },
  {
    name: 'testStartBulk0864', number: '0864',
    options: { minWindowWidth: 920, minWindowHeight: 540, maxWindowWidth: 1470, maxWindowHeight: 880 }
  },
  {
    name: 'testStartBulk0865', number: '0865',
    options: { minWindowWidth: 1000, minWindowHeight: 540, maxWindowWidth: 1150, maxWindowHeight: 920 }
  },
  {
    name: 'testStartBulk0866', number: '0866',
    options: { minWindowWidth: 1080, minWindowHeight: 540, maxWindowWidth: 1330, maxWindowHeight: 640 }
  },
  {
    name: 'testStartBulk0867', number: '0867',
    options: { minWindowWidth: 1160, minWindowHeight: 540, maxWindowWidth: 1510, maxWindowHeight: 680 }
  },
  {
    name: 'testStartBulk0868', number: '0868',
    options: { minWindowWidth: 1240, minWindowHeight: 540, maxWindowWidth: 1690, maxWindowHeight: 720 }
  },
  {
    name: 'testStartBulk0869', number: '0869',
    options: { minWindowWidth: 1320, minWindowHeight: 540, maxWindowWidth: 1870, maxWindowHeight: 760 }
  },
  {
    name: 'testStartBulk0870', number: '0870',
    options: { minWindowWidth: 600, minWindowHeight: 580, maxWindowWidth: 750, maxWindowHeight: 840 }
  },
  {
    name: 'testStartBulk0871', number: '0871',
    options: { minWindowWidth: 680, minWindowHeight: 580, maxWindowWidth: 930, maxWindowHeight: 880 }
  },
  {
    name: 'testStartBulk0872', number: '0872',
    options: { minWindowWidth: 760, minWindowHeight: 580, maxWindowWidth: 1110, maxWindowHeight: 920 }
  },
  {
    name: 'testStartBulk0873', number: '0873',
    options: { minWindowWidth: 840, minWindowHeight: 580, maxWindowWidth: 1290, maxWindowHeight: 960 }
  },
  {
    name: 'testStartBulk0874', number: '0874',
    options: { minWindowWidth: 920, minWindowHeight: 580, maxWindowWidth: 1470, maxWindowHeight: 680 }
  },
  {
    name: 'testStartBulk0875', number: '0875',
    options: { minWindowWidth: 1000, minWindowHeight: 580, maxWindowWidth: 1150, maxWindowHeight: 720 }
  },
  {
    name: 'testStartBulk0876', number: '0876',
    options: { minWindowWidth: 1080, minWindowHeight: 580, maxWindowWidth: 1330, maxWindowHeight: 760 }
  },
  {
    name: 'testStartBulk0877', number: '0877',
    options: { minWindowWidth: 1160, minWindowHeight: 580, maxWindowWidth: 1510, maxWindowHeight: 800 }
  },
  {
    name: 'testStartBulk0878', number: '0878',
    options: { minWindowWidth: 1240, minWindowHeight: 580, maxWindowWidth: 1690, maxWindowHeight: 840 }
  },
  {
    name: 'testStartBulk0879', number: '0879',
    options: { minWindowWidth: 1320, minWindowHeight: 580, maxWindowWidth: 1870, maxWindowHeight: 880 }
  },
  {
    name: 'testStartBulk0880', number: '0880',
    options: { minWindowWidth: 600, minWindowHeight: 620, maxWindowWidth: 750, maxWindowHeight: 960 }
  },
  {
    name: 'testStartBulk0881', number: '0881',
    options: { minWindowWidth: 680, minWindowHeight: 620, maxWindowWidth: 930, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartBulk0882', number: '0882',
    options: { minWindowWidth: 760, minWindowHeight: 620, maxWindowWidth: 1110, maxWindowHeight: 720 }
  },
  {
    name: 'testStartBulk0883', number: '0883',
    options: { minWindowWidth: 840, minWindowHeight: 620, maxWindowWidth: 1290, maxWindowHeight: 760 }
  },
  {
    name: 'testStartBulk0884', number: '0884',
    options: { minWindowWidth: 920, minWindowHeight: 620, maxWindowWidth: 1470, maxWindowHeight: 800 }
  },
  {
    name: 'testStartBulk0885', number: '0885',
    options: { minWindowWidth: 1000, minWindowHeight: 620, maxWindowWidth: 1150, maxWindowHeight: 840 }
  },
  {
    name: 'testStartBulk0886', number: '0886',
    options: { minWindowWidth: 1080, minWindowHeight: 620, maxWindowWidth: 1330, maxWindowHeight: 880 }
  },
  {
    name: 'testStartBulk0887', number: '0887',
    options: { minWindowWidth: 1160, minWindowHeight: 620, maxWindowWidth: 1510, maxWindowHeight: 920 }
  },
  {
    name: 'testStartBulk0888', number: '0888',
    options: { minWindowWidth: 1240, minWindowHeight: 620, maxWindowWidth: 1690, maxWindowHeight: 960 }
  },
  {
    name: 'testStartBulk0889', number: '0889',
    options: { minWindowWidth: 1320, minWindowHeight: 620, maxWindowWidth: 1870, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartBulk0890', number: '0890',
    options: { minWindowWidth: 600, minWindowHeight: 660, maxWindowWidth: 750, maxWindowHeight: 760 }
  },
  {
    name: 'testStartBulk0891', number: '0891',
    options: { minWindowWidth: 680, minWindowHeight: 660, maxWindowWidth: 930, maxWindowHeight: 800 }
  },
  {
    name: 'testStartBulk0892', number: '0892',
    options: { minWindowWidth: 760, minWindowHeight: 660, maxWindowWidth: 1110, maxWindowHeight: 840 }
  },
  {
    name: 'testStartBulk0893', number: '0893',
    options: { minWindowWidth: 840, minWindowHeight: 660, maxWindowWidth: 1290, maxWindowHeight: 880 }
  },
  {
    name: 'testStartBulk0894', number: '0894',
    options: { minWindowWidth: 920, minWindowHeight: 660, maxWindowWidth: 1470, maxWindowHeight: 920 }
  },
  {
    name: 'testStartBulk0895', number: '0895',
    options: { minWindowWidth: 1000, minWindowHeight: 660, maxWindowWidth: 1150, maxWindowHeight: 960 }
  },
  {
    name: 'testStartBulk0896', number: '0896',
    options: { minWindowWidth: 1080, minWindowHeight: 660, maxWindowWidth: 1330, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartBulk0897', number: '0897',
    options: { minWindowWidth: 1160, minWindowHeight: 660, maxWindowWidth: 1510, maxWindowHeight: 1040 }
  },
  {
    name: 'testStartBulk0898', number: '0898',
    options: { minWindowWidth: 1240, minWindowHeight: 660, maxWindowWidth: 1690, maxWindowHeight: 760 }
  },
  {
    name: 'testStartBulk0899', number: '0899',
    options: { minWindowWidth: 1320, minWindowHeight: 660, maxWindowWidth: 1870, maxWindowHeight: 800 }
  },
  {
    name: 'testStartBulk0900', number: '0900',
    options: { minWindowWidth: 600, minWindowHeight: 700, maxWindowWidth: 750, maxWindowHeight: 880 }
  },
  {
    name: 'testStartBulk0901', number: '0901',
    options: { minWindowWidth: 680, minWindowHeight: 700, maxWindowWidth: 930, maxWindowHeight: 920 }
  },
  {
    name: 'testStartBulk0902', number: '0902',
    options: { minWindowWidth: 760, minWindowHeight: 700, maxWindowWidth: 1110, maxWindowHeight: 960 }
  },
  {
    name: 'testStartBulk0903', number: '0903',
    options: { minWindowWidth: 840, minWindowHeight: 700, maxWindowWidth: 1290, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartBulk0904', number: '0904',
    options: { minWindowWidth: 920, minWindowHeight: 700, maxWindowWidth: 1470, maxWindowHeight: 1040 }
  },
  {
    name: 'testStartBulk0905', number: '0905',
    options: { minWindowWidth: 1000, minWindowHeight: 700, maxWindowWidth: 1150, maxWindowHeight: 1080 }
  },
  {
    name: 'testStartBulk0906', number: '0906',
    options: { minWindowWidth: 1080, minWindowHeight: 700, maxWindowWidth: 1330, maxWindowHeight: 800 }
  },
  {
    name: 'testStartBulk0907', number: '0907',
    options: { minWindowWidth: 1160, minWindowHeight: 700, maxWindowWidth: 1510, maxWindowHeight: 840 }
  },
  {
    name: 'testStartBulk0908', number: '0908',
    options: { minWindowWidth: 1240, minWindowHeight: 700, maxWindowWidth: 1690, maxWindowHeight: 880 }
  },
  {
    name: 'testStartBulk0909', number: '0909',
    options: { minWindowWidth: 1320, minWindowHeight: 700, maxWindowWidth: 1870, maxWindowHeight: 920 }
  },
  {
    name: 'testStartBulk0910', number: '0910',
    options: { minWindowWidth: 600, minWindowHeight: 740, maxWindowWidth: 750, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartBulk0911', number: '0911',
    options: { minWindowWidth: 680, minWindowHeight: 740, maxWindowWidth: 930, maxWindowHeight: 1040 }
  },
  {
    name: 'testStartBulk0912', number: '0912',
    options: { minWindowWidth: 760, minWindowHeight: 740, maxWindowWidth: 1110, maxWindowHeight: 1080 }
  },
  {
    name: 'testStartBulk0913', number: '0913',
    options: { minWindowWidth: 840, minWindowHeight: 740, maxWindowWidth: 1290, maxWindowHeight: 1120 }
  },
  {
    name: 'testStartBulk0914', number: '0914',
    options: { minWindowWidth: 920, minWindowHeight: 740, maxWindowWidth: 1470, maxWindowHeight: 840 }
  },
  {
    name: 'testStartBulk0915', number: '0915',
    options: { minWindowWidth: 1000, minWindowHeight: 740, maxWindowWidth: 1150, maxWindowHeight: 880 }
  },
  {
    name: 'testStartBulk0916', number: '0916',
    options: { minWindowWidth: 1080, minWindowHeight: 740, maxWindowWidth: 1330, maxWindowHeight: 920 }
  },
  {
    name: 'testStartBulk0917', number: '0917',
    options: { minWindowWidth: 1160, minWindowHeight: 740, maxWindowWidth: 1510, maxWindowHeight: 960 }
  },
  {
    name: 'testStartBulk0918', number: '0918',
    options: { minWindowWidth: 1240, minWindowHeight: 740, maxWindowWidth: 1690, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartBulk0919', number: '0919',
    options: { minWindowWidth: 1320, minWindowHeight: 740, maxWindowWidth: 1870, maxWindowHeight: 1040 }
  },
  {
    name: 'testStartBulk0920', number: '0920',
    options: { minWindowWidth: 600, minWindowHeight: 780, maxWindowWidth: 750, maxWindowHeight: 1120 }
  },
  {
    name: 'testStartBulk0921', number: '0921',
    options: { minWindowWidth: 680, minWindowHeight: 780, maxWindowWidth: 930, maxWindowHeight: 1160 }
  },
  {
    name: 'testStartBulk0922', number: '0922',
    options: { minWindowWidth: 760, minWindowHeight: 780, maxWindowWidth: 1110, maxWindowHeight: 880 }
  },
  {
    name: 'testStartBulk0923', number: '0923',
    options: { minWindowWidth: 840, minWindowHeight: 780, maxWindowWidth: 1290, maxWindowHeight: 920 }
  },
  {
    name: 'testStartBulk0924', number: '0924',
    options: { minWindowWidth: 920, minWindowHeight: 780, maxWindowWidth: 1470, maxWindowHeight: 960 }
  },
  {
    name: 'testStartBulk0925', number: '0925',
    options: { minWindowWidth: 1000, minWindowHeight: 780, maxWindowWidth: 1150, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartBulk0926', number: '0926',
    options: { minWindowWidth: 1080, minWindowHeight: 780, maxWindowWidth: 1330, maxWindowHeight: 1040 }
  },
  {
    name: 'testStartBulk0927', number: '0927',
    options: { minWindowWidth: 1160, minWindowHeight: 780, maxWindowWidth: 1510, maxWindowHeight: 1080 }
  },
  {
    name: 'testStartBulk0928', number: '0928',
    options: { minWindowWidth: 1240, minWindowHeight: 780, maxWindowWidth: 1690, maxWindowHeight: 1120 }
  },
  {
    name: 'testStartBulk0929', number: '0929',
    options: { minWindowWidth: 1320, minWindowHeight: 780, maxWindowWidth: 1870, maxWindowHeight: 1160 }
  },
  {
    name: 'testStartBulk0930', number: '0930',
    options: { minWindowWidth: 600, minWindowHeight: 820, maxWindowWidth: 750, maxWindowHeight: 920 }
  },
  {
    name: 'testStartBulk0931', number: '0931',
    options: { minWindowWidth: 680, minWindowHeight: 820, maxWindowWidth: 930, maxWindowHeight: 960 }
  },
  {
    name: 'testStartBulk0932', number: '0932',
    options: { minWindowWidth: 760, minWindowHeight: 820, maxWindowWidth: 1110, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartBulk0933', number: '0933',
    options: { minWindowWidth: 840, minWindowHeight: 820, maxWindowWidth: 1290, maxWindowHeight: 1040 }
  },
  {
    name: 'testStartBulk0934', number: '0934',
    options: { minWindowWidth: 920, minWindowHeight: 820, maxWindowWidth: 1470, maxWindowHeight: 1080 }
  },
  {
    name: 'testStartBulk0935', number: '0935',
    options: { minWindowWidth: 1000, minWindowHeight: 820, maxWindowWidth: 1150, maxWindowHeight: 1120 }
  },
  {
    name: 'testStartBulk0936', number: '0936',
    options: { minWindowWidth: 1080, minWindowHeight: 820, maxWindowWidth: 1330, maxWindowHeight: 1160 }
  },
  {
    name: 'testStartBulk0937', number: '0937',
    options: { minWindowWidth: 1160, minWindowHeight: 820, maxWindowWidth: 1510, maxWindowHeight: 1200 }
  },
  {
    name: 'testStartBulk0938', number: '0938',
    options: { minWindowWidth: 1240, minWindowHeight: 820, maxWindowWidth: 1690, maxWindowHeight: 920 }
  },
  {
    name: 'testStartBulk0939', number: '0939',
    options: { minWindowWidth: 1320, minWindowHeight: 820, maxWindowWidth: 1870, maxWindowHeight: 960 }
  },
  {
    name: 'testStartBulk0940', number: '0940',
    options: { minWindowWidth: 600, minWindowHeight: 860, maxWindowWidth: 750, maxWindowHeight: 1040 }
  },
  {
    name: 'testStartBulk0941', number: '0941',
    options: { minWindowWidth: 680, minWindowHeight: 860, maxWindowWidth: 930, maxWindowHeight: 1080 }
  },
  {
    name: 'testStartBulk0942', number: '0942',
    options: { minWindowWidth: 760, minWindowHeight: 860, maxWindowWidth: 1110, maxWindowHeight: 1120 }
  },
  {
    name: 'testStartBulk0943', number: '0943',
    options: { minWindowWidth: 840, minWindowHeight: 860, maxWindowWidth: 1290, maxWindowHeight: 1160 }
  },
  {
    name: 'testStartBulk0944', number: '0944',
    options: { minWindowWidth: 920, minWindowHeight: 860, maxWindowWidth: 1470, maxWindowHeight: 1200 }
  },
  {
    name: 'testStartBulk0945', number: '0945',
    options: { minWindowWidth: 1000, minWindowHeight: 860, maxWindowWidth: 1150, maxWindowHeight: 1240 }
  },
  {
    name: 'testStartBulk0946', number: '0946',
    options: { minWindowWidth: 1080, minWindowHeight: 860, maxWindowWidth: 1330, maxWindowHeight: 960 }
  },
  {
    name: 'testStartBulk0947', number: '0947',
    options: { minWindowWidth: 1160, minWindowHeight: 860, maxWindowWidth: 1510, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartBulk0948', number: '0948',
    options: { minWindowWidth: 1240, minWindowHeight: 860, maxWindowWidth: 1690, maxWindowHeight: 1040 }
  },
  {
    name: 'testStartBulk0949', number: '0949',
    options: { minWindowWidth: 1320, minWindowHeight: 860, maxWindowWidth: 1870, maxWindowHeight: 1080 }
  },
  {
    name: 'testStartBulk0950', number: '0950',
    options: { minWindowWidth: 600, minWindowHeight: 900, maxWindowWidth: 750, maxWindowHeight: 1160 }
  },
  {
    name: 'testStartBulk0951', number: '0951',
    options: { minWindowWidth: 680, minWindowHeight: 900, maxWindowWidth: 930, maxWindowHeight: 1200 }
  },
  {
    name: 'testStartBulk0952', number: '0952',
    options: { minWindowWidth: 760, minWindowHeight: 900, maxWindowWidth: 1110, maxWindowHeight: 1240 }
  },
  {
    name: 'testStartBulk0953', number: '0953',
    options: { minWindowWidth: 840, minWindowHeight: 900, maxWindowWidth: 1290, maxWindowHeight: 1280 }
  },
  {
    name: 'testStartBulk0954', number: '0954',
    options: { minWindowWidth: 920, minWindowHeight: 900, maxWindowWidth: 1470, maxWindowHeight: 1000 }
  },
  {
    name: 'testStartBulk0955', number: '0955',
    options: { minWindowWidth: 1000, minWindowHeight: 900, maxWindowWidth: 1150, maxWindowHeight: 1040 }
  },
  {
    name: 'testStartBulk0956', number: '0956',
    options: { minWindowWidth: 1080, minWindowHeight: 900, maxWindowWidth: 1330, maxWindowHeight: 1080 }
  },
  {
    name: 'testStartBulk0957', number: '0957',
    options: { minWindowWidth: 1160, minWindowHeight: 900, maxWindowWidth: 1510, maxWindowHeight: 1120 }
  },
  {
    name: 'testStartBulk0958', number: '0958',
    options: { minWindowWidth: 1240, minWindowHeight: 900, maxWindowWidth: 1690, maxWindowHeight: 1160 }
  },
  {
    name: 'testStartBulk0959', number: '0959',
    options: { minWindowWidth: 1320, minWindowHeight: 900, maxWindowWidth: 1870, maxWindowHeight: 1200 }
  },
  {
    name: 'testStartBulk0960', number: '0960',
    options: { minWindowWidth: 600, minWindowHeight: 940, maxWindowWidth: 750, maxWindowHeight: 1280 }
  },
  {
    name: 'testStartBulk0961', number: '0961',
    options: { minWindowWidth: 680, minWindowHeight: 940, maxWindowWidth: 930, maxWindowHeight: 1320 }
  },
  {
    name: 'testStartBulk0962', number: '0962',
    options: { minWindowWidth: 760, minWindowHeight: 940, maxWindowWidth: 1110, maxWindowHeight: 1040 }
  },
  {
    name: 'testStartBulk0963', number: '0963',
    options: { minWindowWidth: 840, minWindowHeight: 940, maxWindowWidth: 1290, maxWindowHeight: 1080 }
  },
  {
    name: 'testStartBulk0964', number: '0964',
    options: { minWindowWidth: 920, minWindowHeight: 940, maxWindowWidth: 1470, maxWindowHeight: 1120 }
  },
  {
    name: 'testStartBulk0965', number: '0965',
    options: { minWindowWidth: 1000, minWindowHeight: 940, maxWindowWidth: 1150, maxWindowHeight: 1160 }
  },
  {
    name: 'testStartBulk0966', number: '0966',
    options: { minWindowWidth: 1080, minWindowHeight: 940, maxWindowWidth: 1330, maxWindowHeight: 1200 }
  },
  {
    name: 'testStartBulk0967', number: '0967',
    options: { minWindowWidth: 1160, minWindowHeight: 940, maxWindowWidth: 1510, maxWindowHeight: 1240 }
  },
  {
    name: 'testStartBulk0968', number: '0968',
    options: { minWindowWidth: 1240, minWindowHeight: 940, maxWindowWidth: 1690, maxWindowHeight: 1280 }
  },
  {
    name: 'testStartBulk0969', number: '0969',
    options: { minWindowWidth: 1320, minWindowHeight: 940, maxWindowWidth: 1870, maxWindowHeight: 1320 }
  },
  {
    name: 'testStartBulk0970', number: '0970',
    options: { minWindowWidth: 600, minWindowHeight: 980, maxWindowWidth: 750, maxWindowHeight: 1080 }
  },
  {
    name: 'testStartBulk0971', number: '0971',
    options: { minWindowWidth: 680, minWindowHeight: 980, maxWindowWidth: 930, maxWindowHeight: 1120 }
  },
  {
    name: 'testStartBulk0972', number: '0972',
    options: { minWindowWidth: 760, minWindowHeight: 980, maxWindowWidth: 1110, maxWindowHeight: 1160 }
  },
  {
    name: 'testStartBulk0973', number: '0973',
    options: { minWindowWidth: 840, minWindowHeight: 980, maxWindowWidth: 1290, maxWindowHeight: 1200 }
  },
  {
    name: 'testStartBulk0974', number: '0974',
    options: { minWindowWidth: 920, minWindowHeight: 980, maxWindowWidth: 1470, maxWindowHeight: 1240 }
  },
  {
    name: 'testStartBulk0975', number: '0975',
    options: { minWindowWidth: 1000, minWindowHeight: 980, maxWindowWidth: 1150, maxWindowHeight: 1280 }
  },
  {
    name: 'testStartBulk0976', number: '0976',
    options: { minWindowWidth: 1080, minWindowHeight: 980, maxWindowWidth: 1330, maxWindowHeight: 1320 }
  },
  {
    name: 'testStartBulk0977', number: '0977',
    options: { minWindowWidth: 1160, minWindowHeight: 980, maxWindowWidth: 1510, maxWindowHeight: 1360 }
  },
  {
    name: 'testStartBulk0978', number: '0978',
    options: { minWindowWidth: 1240, minWindowHeight: 980, maxWindowWidth: 1690, maxWindowHeight: 1080 }
  },
  {
    name: 'testStartBulk0979', number: '0979',
    options: { minWindowWidth: 1320, minWindowHeight: 980, maxWindowWidth: 1870, maxWindowHeight: 1120 }
  }
];

let testContext: common.UIAbilityContext | undefined = undefined;

async function getTargetWant(): Promise<Want> {
  return {
    bundleName: abilityDelegatorRegistry.getArguments().bundleName,
    moduleName: 'entry',
    abilityName: TARGET_ABILITY
  };
}

async function startTarget(options: StartOptions): Promise<number> {
  if (!testContext) {
    return -1;
  }
  try {
    await testContext.startAbility(await getTargetWant(), options);
    return 0;
  } catch (error) {
    const err: BusinessError = error as BusinessError;
    hilog.info(LOG_DOMAIN, LOG_TAG, 'startAbility failed code=%{public}d message=%{public}s',
      err.code, err.message);
    return err.code;
  }
}

async function closeTarget(): Promise<void> {
  try {
    const ability: UIAbility = await abilityDelegatorRegistry.getAbilityDelegator().getCurrentTopAbility();
    if (ability.context.abilityInfo.name === TARGET_ABILITY) {
      await ability.context.terminateSelf();
    }
  } catch (error) {
    hilog.info(LOG_DOMAIN, LOG_TAG, 'closeTarget ignored: %{public}s', JSON.stringify(error));
  }
}

export default function startOptionsWindowLimitsTest(): void {
  describe('StartOptionsWindowLimitsTest', () => {
    beforeAll(async () => {
      testContext = getTestAbilityContext() as common.UIAbilityContext;
      expect(testContext !== undefined).assertTrue();
    });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_0300
     * @tc.name      testStartOptionsAll0300
     * @tc.desc      Start the target ability with all StartOptions fields and verify the top ability.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testStartOptionsAll0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
        const options: StartOptions = {
          displayId: 0, minWindowWidth: 600, minWindowHeight: 500,
          maxWindowWidth: 1500, maxWindowHeight: 1000
        };
        const code: number = await startTarget(options);
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        if (code === 0) {
          const ability: UIAbility = await abilityDelegatorRegistry.getAbilityDelegator().getCurrentTopAbility();
          expect(ability.context.abilityInfo.name).assertEqual(TARGET_ABILITY);
        }
        await closeTarget();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_0301
     * @tc.name      testStartOptionsMinOnly0301
     * @tc.desc      Start the target ability with only the minimum size fields.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartOptionsMinOnly0301',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 600, minWindowHeight: 500 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_0302
     * @tc.name      testStartOptionsMaxOnly0302
     * @tc.desc      Start the target ability with only the maximum size fields.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartOptionsMaxOnly0302',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ maxWindowWidth: 1500, maxWindowHeight: 1000 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_0303
     * @tc.name      testStartOptionsInverted0303
     * @tc.desc      Start the target ability with inverted minimum and maximum widths.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStartOptionsInverted0303',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        const code: number = await startTarget({ minWindowWidth: 1500, maxWindowWidth: 600 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_0304
     * @tc.name      testStartOptionsNegative0304
     * @tc.desc      Start the target ability with negative size values and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStartOptionsNegative0304',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        const code: number = await startTarget({
          minWindowWidth: -600, minWindowHeight: -500,
          maxWindowWidth: -1500, maxWindowHeight: -1000
        });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_0305
     * @tc.name      testStartOptionsZeros0305
     * @tc.desc      Start the target ability with all-zero size values and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStartOptionsZeros0305',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        const code: number = await startTarget({ minWindowWidth: 0, minWindowHeight: 0, maxWindowWidth: 0, maxWindowHeight: 0 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_0306
     * @tc.name      testStartOptionsNaN0306
     * @tc.desc      Start the target ability with NaN size values and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStartOptionsNaN0306',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        const code: number = await startTarget({ maxWindowWidth: Number.NaN, maxWindowHeight: Number.NaN });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_0307
     * @tc.name      testStartOptionsInfinity0307
     * @tc.desc      Start the target ability with Infinity size values and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStartOptionsInfinity0307',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        const code: number = await startTarget({
          maxWindowWidth: Number.POSITIVE_INFINITY,
          maxWindowHeight: Number.POSITIVE_INFINITY
        });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_0308
     * @tc.name      testStartOptionsSequential0308
     * @tc.desc      Start and close the target ability three times in sequence.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartOptionsSequential0308',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 3; index++) {
          const code: number = await startTarget({
            minWindowWidth: 600, minWindowHeight: 500,
            maxWindowWidth: 1500, maxWindowHeight: 1000
          });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_0309
     * @tc.name      testStartOptionsTinyMax0309
     * @tc.desc      Start the target ability with a tiny maximum size and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStartOptionsTinyMax0309',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        const code: number = await startTarget({ maxWindowWidth: 1, maxWindowHeight: 1 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_0310
     * @tc.name      testStartOptionsHugeMax0310
     * @tc.desc      Start the target ability with a huge maximum size and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStartOptionsHugeMax0310',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        const code: number = await startTarget({ maxWindowWidth: 1000000, maxWindowHeight: 1000000 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_0311
     * @tc.name      testStartOptionsMaxBound0311
     * @tc.desc      Start with the maximum StartOptions bounds and verify the target window bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartOptionsMaxBound0311',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({
          minWindowWidth: 600, minWindowHeight: 500,
          maxWindowWidth: 1500, maxWindowHeight: 1000
        });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_0312
     * @tc.name      testStartOptionsEqualBounds0312
     * @tc.desc      Start with equal minimum and maximum sizes and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartOptionsEqualBounds0312',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({
          minWindowWidth: 900, minWindowHeight: 700,
          maxWindowWidth: 900, maxWindowHeight: 700
        });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_0313
     * @tc.name      testStartOptionsRepeatFive0313
     * @tc.desc      Start and close the target ability five times and verify each start is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartOptionsRepeatFive0313',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 5; index++) {
          const code: number = await startTarget({
            minWindowWidth: 600 + index * 50, minWindowHeight: 500,
            maxWindowWidth: 1500, maxWindowHeight: 1000
          });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_0314
     * @tc.name      testStartOptionsRapidWithoutClose0314
     * @tc.desc      Start the target ability five times without closing and verify the last request.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStartOptionsRapidWithoutClose0314',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        let lastCode: number = -1;
        for (let index: number = 0; index < 5; index++) {
          lastCode = await startTarget({ maxWindowWidth: 1000 + index * 100, maxWindowHeight: 800 });
        }
        expect(lastCode === 0 || ACCEPTABLE_START_CODES.includes(lastCode)).assertTrue();
        await closeTarget();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_0315
     * @tc.name      testStartOptionsDisplayIdOnly0315
     * @tc.desc      Start with only the displayId field and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStartOptionsDisplayIdOnly0315',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        const code: number = await startTarget({ displayId: 0 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_0316
     * @tc.name      testStartOptionsModuleOnlyFields0316
     * @tc.desc      Start with only the height fields and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartOptionsModuleOnlyFields0316',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowHeight: 500, maxWindowHeight: 1000 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_0317
     * @tc.name      testStartOptionsWidthOnlyFields0317
     * @tc.desc      Start with only the width fields and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartOptionsWidthOnlyFields0317',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 600, maxWindowWidth: 1500 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_0318
     * @tc.name      testStartOptionsAlternatingBounds0318
     * @tc.desc      Alternate between wide and narrow StartOptions three times and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStartOptionsAlternatingBounds0318',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        for (let index: number = 0; index < 3; index++) {
          const wide: number = await startTarget({
            minWindowWidth: 600, minWindowHeight: 500, maxWindowWidth: 1500, maxWindowHeight: 1000
          });
          const narrow: number = await startTarget({
            minWindowWidth: 900, minWindowHeight: 700, maxWindowWidth: 1000, maxWindowHeight: 800
          });
          expect(wide).assertEqual(0);
          expect(narrow).assertEqual(0);
          await closeTarget();
        }
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_0319
     * @tc.name      testStartOptionsZeroMin0319
     * @tc.desc      Start with zero minimum sizes and positive maximum sizes.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStartOptionsZeroMin0319',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        const code: number = await startTarget({
          minWindowWidth: 0, minWindowHeight: 0, maxWindowWidth: 1500, maxWindowHeight: 1000
        });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_0320
     * @tc.name      testStartOptionsZeroMax0320
     * @tc.desc      Start with zero maximum sizes and positive minimum sizes.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStartOptionsZeroMax0320',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        const code: number = await startTarget({
          minWindowWidth: 600, minWindowHeight: 500, maxWindowWidth: 0, maxWindowHeight: 0
        });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_0321
     * @tc.name      testStartWidthSweepStart0321
     * @tc.desc      Start with a swept minimum width and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartWidthSweepStart0321',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 5; index++) {
          const code: number = await startTarget({ minWindowWidth: 600 + index * 100, maxWindowWidth: 1500 });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_0322
     * @tc.name      testStartHeightSweepStart0322
     * @tc.desc      Start with a swept minimum height and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartHeightSweepStart0322',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 5; index++) {
          const code: number = await startTarget({ minWindowHeight: 500 + index * 50, maxWindowHeight: 1000 });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_0323
     * @tc.name      testStartBothSweeps0323
     * @tc.desc      Start with both width and height sweeps and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStartBothSweeps0323',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        for (let index: number = 0; index < 5; index++) {
          const code: number = await startTarget({
            minWindowWidth: 600 + index * 50, minWindowHeight: 500 + index * 25,
            maxWindowWidth: 1500, maxWindowHeight: 1000
          });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_0324
     * @tc.name      testStartDoubleClose0324
     * @tc.desc      Start and close twice with different options and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStartDoubleClose0324',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        const first: number = await startTarget({ maxWindowWidth: 1200, maxWindowHeight: 800 });
        await closeTarget();
        const second: number = await startTarget({ maxWindowWidth: 1500, maxWindowHeight: 1000 });
        await closeTarget();
        expect(first === 0 || ACCEPTABLE_START_CODES.includes(first)).assertTrue();
        expect(second === 0 || ACCEPTABLE_START_CODES.includes(second)).assertTrue();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_0325
     * @tc.name      testStartInvertedHeights0325
     * @tc.desc      Start with inverted height fields and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStartInvertedHeights0325',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        const code: number = await startTarget({ minWindowHeight: 1000, maxWindowHeight: 500 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_0326
     * @tc.name      testStartFractionalBounds0326
     * @tc.desc      Start with fractional bounds and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStartFractionalBounds0326',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        const code: number = await startTarget({
          minWindowWidth: 600.5, minWindowHeight: 500.5,
          maxWindowWidth: 1499.5, maxWindowHeight: 999.5
        });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_0327
     * @tc.name      testStartMinHeightOnly0327
     * @tc.desc      Start with only the minimum height and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartMinHeightOnly0327',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowHeight: 500 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_0328
     * @tc.name      testStartMaxWidthOnly0328
     * @tc.desc      Start with only the maximum width and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartMaxWidthOnly0328',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ maxWindowWidth: 1500 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_0329
     * @tc.name      testStartMaxHeightOnly0329
     * @tc.desc      Start with only the maximum height and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartMaxHeightOnly0329',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ maxWindowHeight: 1000 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_0330
     * @tc.name      testStartAllZeroExceptDisplay0330
     * @tc.desc      Start with displayId and zero sizes, then verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStartAllZeroExceptDisplay0330',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        const code: number = await startTarget({ displayId: 0, maxWindowWidth: 0, maxWindowHeight: 0 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_0331
     * @tc.name      testStartCornerLoop0331
     * @tc.desc      Start with the four corners of the configured range and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartCornerLoop0331',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const corners: StartOptions[] = [
          { minWindowWidth: 600, minWindowHeight: 500, maxWindowWidth: 1500, maxWindowHeight: 1000 },
          { minWindowWidth: 600, minWindowHeight: 1000, maxWindowWidth: 600, maxWindowHeight: 1000 },
          { minWindowWidth: 1500, minWindowHeight: 500, maxWindowWidth: 1500, maxWindowHeight: 500 },
          { minWindowWidth: 900, minWindowHeight: 750, maxWindowWidth: 900, maxWindowHeight: 750 }
        ];
        for (let index: number = 0; index < corners.length; index++) {
          const code: number = await startTarget(corners[index]);
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_0332
     * @tc.name      testStartCenterRange0332
     * @tc.desc      Start with a centered range and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartCenterRange0332',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({
          minWindowWidth: 800, minWindowHeight: 600, maxWindowWidth: 1300, maxWindowHeight: 900
        });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_0333
     * @tc.name      testStartEqualBounds0333
     * @tc.desc      Start with equal bounds for both dimensions and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartEqualBounds0333',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({
          minWindowWidth: 1000, minWindowHeight: 800, maxWindowWidth: 1000, maxWindowHeight: 800
        });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_0334
     * @tc.name      testStartWidthSweepFour0334
     * @tc.desc      Sweep the width option four times and verify each request.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStartWidthSweepFour0334',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        for (let index: number = 0; index < 4; index++) {
          const code: number = await startTarget({ minWindowWidth: 600 + index * 100, maxWindowWidth: 1500 });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });

    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_0335
     * @tc.name      testStartHeightSweepFour0335
     * @tc.desc      Sweep the height option four times and verify each request.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStartHeightSweepFour0335',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        for (let index: number = 0; index < 4; index++) {
          const code: number = await startTarget({ minWindowHeight: 500 + index * 50, maxWindowHeight: 1000 });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_340
     * @tc.name      testStartBulkCase340
     * @tc.desc      Start with bulk limits and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase340',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 600, maxWindowWidth: 1300 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_341
     * @tc.name      testStartBulkCase341
     * @tc.desc      Start with a height sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase341',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 2; index++) {
          const code: number = await startTarget({ minWindowHeight: 690, maxWindowHeight: 1000 });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_342
     * @tc.name      testStartBulkCase342
     * @tc.desc      Start with displayId and limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase342',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ displayId: 0, minWindowWidth: 780, maxWindowWidth: 1460 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_343
     * @tc.name      testStartBulkCase343
     * @tc.desc      Start twice with different limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase343',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: number = await startTarget({ minWindowWidth: 870, maxWindowWidth: 1540 });
        const second: number = await startTarget({ minWindowWidth: 920, maxWindowWidth: 1590 });
        expect(first === 0 || ACCEPTABLE_START_CODES.includes(first)).assertTrue();
        expect(second === 0 || ACCEPTABLE_START_CODES.includes(second)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_344
     * @tc.name      testStartBulkCase344
     * @tc.desc      Start with bulk limits and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase344',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 960, maxWindowWidth: 1300 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_345
     * @tc.name      testStartBulkCase345
     * @tc.desc      Start with a height sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase345',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 2; index++) {
          const code: number = await startTarget({ minWindowHeight: 1050, maxWindowHeight: 1000 });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_346
     * @tc.name      testStartBulkCase346
     * @tc.desc      Start with displayId and limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase346',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ displayId: 0, minWindowWidth: 1140, maxWindowWidth: 1460 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_347
     * @tc.name      testStartBulkCase347
     * @tc.desc      Start twice with different limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase347',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: number = await startTarget({ minWindowWidth: 1230, maxWindowWidth: 1540 });
        const second: number = await startTarget({ minWindowWidth: 1280, maxWindowWidth: 1590 });
        expect(first === 0 || ACCEPTABLE_START_CODES.includes(first)).assertTrue();
        expect(second === 0 || ACCEPTABLE_START_CODES.includes(second)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_348
     * @tc.name      testStartBulkCase348
     * @tc.desc      Start with bulk limits and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase348',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 600, maxWindowWidth: 1300 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_349
     * @tc.name      testStartBulkCase349
     * @tc.desc      Start with a height sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase349',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 2; index++) {
          const code: number = await startTarget({ minWindowHeight: 690, maxWindowHeight: 1000 });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_350
     * @tc.name      testStartBulkCase350
     * @tc.desc      Start with displayId and limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase350',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ displayId: 0, minWindowWidth: 780, maxWindowWidth: 1460 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_351
     * @tc.name      testStartBulkCase351
     * @tc.desc      Start twice with different limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase351',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: number = await startTarget({ minWindowWidth: 870, maxWindowWidth: 1540 });
        const second: number = await startTarget({ minWindowWidth: 920, maxWindowWidth: 1590 });
        expect(first === 0 || ACCEPTABLE_START_CODES.includes(first)).assertTrue();
        expect(second === 0 || ACCEPTABLE_START_CODES.includes(second)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_352
     * @tc.name      testStartBulkCase352
     * @tc.desc      Start with bulk limits and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase352',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 960, maxWindowWidth: 1300 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_353
     * @tc.name      testStartBulkCase353
     * @tc.desc      Start with a height sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase353',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 2; index++) {
          const code: number = await startTarget({ minWindowHeight: 1050, maxWindowHeight: 1000 });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_354
     * @tc.name      testStartBulkCase354
     * @tc.desc      Start with displayId and limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase354',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ displayId: 0, minWindowWidth: 1140, maxWindowWidth: 1460 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_355
     * @tc.name      testStartBulkCase355
     * @tc.desc      Start twice with different limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase355',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: number = await startTarget({ minWindowWidth: 1230, maxWindowWidth: 1540 });
        const second: number = await startTarget({ minWindowWidth: 1280, maxWindowWidth: 1590 });
        expect(first === 0 || ACCEPTABLE_START_CODES.includes(first)).assertTrue();
        expect(second === 0 || ACCEPTABLE_START_CODES.includes(second)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_356
     * @tc.name      testStartBulkCase356
     * @tc.desc      Start with bulk limits and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase356',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 600, maxWindowWidth: 1300 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_357
     * @tc.name      testStartBulkCase357
     * @tc.desc      Start with a height sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase357',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 2; index++) {
          const code: number = await startTarget({ minWindowHeight: 690, maxWindowHeight: 1000 });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_358
     * @tc.name      testStartBulkCase358
     * @tc.desc      Start with displayId and limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase358',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ displayId: 0, minWindowWidth: 780, maxWindowWidth: 1460 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_359
     * @tc.name      testStartBulkCase359
     * @tc.desc      Start twice with different limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase359',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: number = await startTarget({ minWindowWidth: 870, maxWindowWidth: 1540 });
        const second: number = await startTarget({ minWindowWidth: 920, maxWindowWidth: 1590 });
        expect(first === 0 || ACCEPTABLE_START_CODES.includes(first)).assertTrue();
        expect(second === 0 || ACCEPTABLE_START_CODES.includes(second)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_360
     * @tc.name      testStartBulkCase360
     * @tc.desc      Start with bulk limits and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase360',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 960, maxWindowWidth: 1300 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_361
     * @tc.name      testStartBulkCase361
     * @tc.desc      Start with a height sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase361',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 2; index++) {
          const code: number = await startTarget({ minWindowHeight: 1050, maxWindowHeight: 1000 });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_362
     * @tc.name      testStartBulkCase362
     * @tc.desc      Start with displayId and limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase362',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ displayId: 0, minWindowWidth: 1140, maxWindowWidth: 1460 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_363
     * @tc.name      testStartBulkCase363
     * @tc.desc      Start twice with different limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase363',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: number = await startTarget({ minWindowWidth: 1230, maxWindowWidth: 1540 });
        const second: number = await startTarget({ minWindowWidth: 1280, maxWindowWidth: 1590 });
        expect(first === 0 || ACCEPTABLE_START_CODES.includes(first)).assertTrue();
        expect(second === 0 || ACCEPTABLE_START_CODES.includes(second)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_364
     * @tc.name      testStartBulkCase364
     * @tc.desc      Start with bulk limits and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase364',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 600, maxWindowWidth: 1300 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_365
     * @tc.name      testStartBulkCase365
     * @tc.desc      Start with a height sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase365',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 2; index++) {
          const code: number = await startTarget({ minWindowHeight: 690, maxWindowHeight: 1000 });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_366
     * @tc.name      testStartBulkCase366
     * @tc.desc      Start with displayId and limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase366',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ displayId: 0, minWindowWidth: 780, maxWindowWidth: 1460 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_367
     * @tc.name      testStartBulkCase367
     * @tc.desc      Start twice with different limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase367',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: number = await startTarget({ minWindowWidth: 870, maxWindowWidth: 1540 });
        const second: number = await startTarget({ minWindowWidth: 920, maxWindowWidth: 1590 });
        expect(first === 0 || ACCEPTABLE_START_CODES.includes(first)).assertTrue();
        expect(second === 0 || ACCEPTABLE_START_CODES.includes(second)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_368
     * @tc.name      testStartBulkCase368
     * @tc.desc      Start with bulk limits and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase368',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 960, maxWindowWidth: 1300 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_369
     * @tc.name      testStartBulkCase369
     * @tc.desc      Start with a height sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase369',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 2; index++) {
          const code: number = await startTarget({ minWindowHeight: 1050, maxWindowHeight: 1000 });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_370
     * @tc.name      testStartBulkCase370
     * @tc.desc      Start with displayId and limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase370',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ displayId: 0, minWindowWidth: 1140, maxWindowWidth: 1460 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_371
     * @tc.name      testStartBulkCase371
     * @tc.desc      Start twice with different limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase371',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: number = await startTarget({ minWindowWidth: 1230, maxWindowWidth: 1540 });
        const second: number = await startTarget({ minWindowWidth: 1280, maxWindowWidth: 1590 });
        expect(first === 0 || ACCEPTABLE_START_CODES.includes(first)).assertTrue();
        expect(second === 0 || ACCEPTABLE_START_CODES.includes(second)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_372
     * @tc.name      testStartBulkCase372
     * @tc.desc      Start with bulk limits and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase372',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 600, maxWindowWidth: 1300 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_373
     * @tc.name      testStartBulkCase373
     * @tc.desc      Start with a height sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase373',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 2; index++) {
          const code: number = await startTarget({ minWindowHeight: 690, maxWindowHeight: 1000 });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_374
     * @tc.name      testStartBulkCase374
     * @tc.desc      Start with displayId and limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase374',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ displayId: 0, minWindowWidth: 780, maxWindowWidth: 1460 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_375
     * @tc.name      testStartBulkCase375
     * @tc.desc      Start twice with different limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase375',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: number = await startTarget({ minWindowWidth: 870, maxWindowWidth: 1540 });
        const second: number = await startTarget({ minWindowWidth: 920, maxWindowWidth: 1590 });
        expect(first === 0 || ACCEPTABLE_START_CODES.includes(first)).assertTrue();
        expect(second === 0 || ACCEPTABLE_START_CODES.includes(second)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_376
     * @tc.name      testStartBulkCase376
     * @tc.desc      Start with bulk limits and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase376',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 960, maxWindowWidth: 1300 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_377
     * @tc.name      testStartBulkCase377
     * @tc.desc      Start with a height sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase377',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 2; index++) {
          const code: number = await startTarget({ minWindowHeight: 1050, maxWindowHeight: 1000 });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_378
     * @tc.name      testStartBulkCase378
     * @tc.desc      Start with displayId and limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase378',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ displayId: 0, minWindowWidth: 1140, maxWindowWidth: 1460 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_379
     * @tc.name      testStartBulkCase379
     * @tc.desc      Start twice with different limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase379',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: number = await startTarget({ minWindowWidth: 1230, maxWindowWidth: 1540 });
        const second: number = await startTarget({ minWindowWidth: 1280, maxWindowWidth: 1590 });
        expect(first === 0 || ACCEPTABLE_START_CODES.includes(first)).assertTrue();
        expect(second === 0 || ACCEPTABLE_START_CODES.includes(second)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_380
     * @tc.name      testStartBulkCase380
     * @tc.desc      Start with bulk limits and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase380',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 600, maxWindowWidth: 1300 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_381
     * @tc.name      testStartBulkCase381
     * @tc.desc      Start with a height sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase381',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 2; index++) {
          const code: number = await startTarget({ minWindowHeight: 690, maxWindowHeight: 1000 });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_382
     * @tc.name      testStartBulkCase382
     * @tc.desc      Start with displayId and limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase382',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ displayId: 0, minWindowWidth: 780, maxWindowWidth: 1460 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_383
     * @tc.name      testStartBulkCase383
     * @tc.desc      Start twice with different limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase383',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: number = await startTarget({ minWindowWidth: 870, maxWindowWidth: 1540 });
        const second: number = await startTarget({ minWindowWidth: 920, maxWindowWidth: 1590 });
        expect(first === 0 || ACCEPTABLE_START_CODES.includes(first)).assertTrue();
        expect(second === 0 || ACCEPTABLE_START_CODES.includes(second)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_384
     * @tc.name      testStartBulkCase384
     * @tc.desc      Start with bulk limits and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase384',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 960, maxWindowWidth: 1300 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_385
     * @tc.name      testStartBulkCase385
     * @tc.desc      Start with a height sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase385',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 2; index++) {
          const code: number = await startTarget({ minWindowHeight: 1050, maxWindowHeight: 1000 });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_386
     * @tc.name      testStartBulkCase386
     * @tc.desc      Start with displayId and limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase386',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ displayId: 0, minWindowWidth: 1140, maxWindowWidth: 1460 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_387
     * @tc.name      testStartBulkCase387
     * @tc.desc      Start twice with different limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase387',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: number = await startTarget({ minWindowWidth: 1230, maxWindowWidth: 1540 });
        const second: number = await startTarget({ minWindowWidth: 1280, maxWindowWidth: 1590 });
        expect(first === 0 || ACCEPTABLE_START_CODES.includes(first)).assertTrue();
        expect(second === 0 || ACCEPTABLE_START_CODES.includes(second)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_388
     * @tc.name      testStartBulkCase388
     * @tc.desc      Start with bulk limits and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase388',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 600, maxWindowWidth: 1300 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_389
     * @tc.name      testStartBulkCase389
     * @tc.desc      Start with a height sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase389',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 2; index++) {
          const code: number = await startTarget({ minWindowHeight: 690, maxWindowHeight: 1000 });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_390
     * @tc.name      testStartBulkCase390
     * @tc.desc      Start with displayId and limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase390',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ displayId: 0, minWindowWidth: 780, maxWindowWidth: 1460 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_391
     * @tc.name      testStartBulkCase391
     * @tc.desc      Start twice with different limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase391',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: number = await startTarget({ minWindowWidth: 870, maxWindowWidth: 1540 });
        const second: number = await startTarget({ minWindowWidth: 920, maxWindowWidth: 1590 });
        expect(first === 0 || ACCEPTABLE_START_CODES.includes(first)).assertTrue();
        expect(second === 0 || ACCEPTABLE_START_CODES.includes(second)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_392
     * @tc.name      testStartBulkCase392
     * @tc.desc      Start with bulk limits and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase392',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 960, maxWindowWidth: 1300 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_393
     * @tc.name      testStartBulkCase393
     * @tc.desc      Start with a height sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase393',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 2; index++) {
          const code: number = await startTarget({ minWindowHeight: 1050, maxWindowHeight: 1000 });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_394
     * @tc.name      testStartBulkCase394
     * @tc.desc      Start with displayId and limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase394',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ displayId: 0, minWindowWidth: 1140, maxWindowWidth: 1460 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_395
     * @tc.name      testStartBulkCase395
     * @tc.desc      Start twice with different limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase395',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: number = await startTarget({ minWindowWidth: 1230, maxWindowWidth: 1540 });
        const second: number = await startTarget({ minWindowWidth: 1280, maxWindowWidth: 1590 });
        expect(first === 0 || ACCEPTABLE_START_CODES.includes(first)).assertTrue();
        expect(second === 0 || ACCEPTABLE_START_CODES.includes(second)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_396
     * @tc.name      testStartBulkCase396
     * @tc.desc      Start with bulk limits and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase396',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 600, maxWindowWidth: 1300 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_397
     * @tc.name      testStartBulkCase397
     * @tc.desc      Start with a height sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase397',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 2; index++) {
          const code: number = await startTarget({ minWindowHeight: 690, maxWindowHeight: 1000 });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_398
     * @tc.name      testStartBulkCase398
     * @tc.desc      Start with displayId and limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase398',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ displayId: 0, minWindowWidth: 780, maxWindowWidth: 1460 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_399
     * @tc.name      testStartBulkCase399
     * @tc.desc      Start twice with different limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase399',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: number = await startTarget({ minWindowWidth: 870, maxWindowWidth: 1540 });
        const second: number = await startTarget({ minWindowWidth: 920, maxWindowWidth: 1590 });
        expect(first === 0 || ACCEPTABLE_START_CODES.includes(first)).assertTrue();
        expect(second === 0 || ACCEPTABLE_START_CODES.includes(second)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_400
     * @tc.name      testStartBulkCase400
     * @tc.desc      Start with bulk limits and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 960, maxWindowWidth: 1300 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_401
     * @tc.name      testStartBulkCase401
     * @tc.desc      Start with a height sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase401',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 2; index++) {
          const code: number = await startTarget({ minWindowHeight: 1050, maxWindowHeight: 1000 });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_402
     * @tc.name      testStartBulkCase402
     * @tc.desc      Start with displayId and limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase402',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ displayId: 0, minWindowWidth: 1140, maxWindowWidth: 1460 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_403
     * @tc.name      testStartBulkCase403
     * @tc.desc      Start twice with different limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase403',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: number = await startTarget({ minWindowWidth: 1230, maxWindowWidth: 1540 });
        const second: number = await startTarget({ minWindowWidth: 1280, maxWindowWidth: 1590 });
        expect(first === 0 || ACCEPTABLE_START_CODES.includes(first)).assertTrue();
        expect(second === 0 || ACCEPTABLE_START_CODES.includes(second)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_404
     * @tc.name      testStartBulkCase404
     * @tc.desc      Start with bulk limits and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase404',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 600, maxWindowWidth: 1300 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_405
     * @tc.name      testStartBulkCase405
     * @tc.desc      Start with a height sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase405',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 2; index++) {
          const code: number = await startTarget({ minWindowHeight: 690, maxWindowHeight: 1000 });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_406
     * @tc.name      testStartBulkCase406
     * @tc.desc      Start with displayId and limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase406',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ displayId: 0, minWindowWidth: 780, maxWindowWidth: 1460 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_407
     * @tc.name      testStartBulkCase407
     * @tc.desc      Start twice with different limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase407',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: number = await startTarget({ minWindowWidth: 870, maxWindowWidth: 1540 });
        const second: number = await startTarget({ minWindowWidth: 920, maxWindowWidth: 1590 });
        expect(first === 0 || ACCEPTABLE_START_CODES.includes(first)).assertTrue();
        expect(second === 0 || ACCEPTABLE_START_CODES.includes(second)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_408
     * @tc.name      testStartBulkCase408
     * @tc.desc      Start with bulk limits and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase408',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 960, maxWindowWidth: 1300 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_409
     * @tc.name      testStartBulkCase409
     * @tc.desc      Start with a height sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase409',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 2; index++) {
          const code: number = await startTarget({ minWindowHeight: 1050, maxWindowHeight: 1000 });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_410
     * @tc.name      testStartBulkCase410
     * @tc.desc      Start with displayId and limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase410',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ displayId: 0, minWindowWidth: 1140, maxWindowWidth: 1460 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_411
     * @tc.name      testStartBulkCase411
     * @tc.desc      Start twice with different limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase411',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: number = await startTarget({ minWindowWidth: 1230, maxWindowWidth: 1540 });
        const second: number = await startTarget({ minWindowWidth: 1280, maxWindowWidth: 1590 });
        expect(first === 0 || ACCEPTABLE_START_CODES.includes(first)).assertTrue();
        expect(second === 0 || ACCEPTABLE_START_CODES.includes(second)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_412
     * @tc.name      testStartBulkCase412
     * @tc.desc      Start with bulk limits and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase412',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 600, maxWindowWidth: 1300 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_413
     * @tc.name      testStartBulkCase413
     * @tc.desc      Start with a height sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase413',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 2; index++) {
          const code: number = await startTarget({ minWindowHeight: 690, maxWindowHeight: 1000 });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_414
     * @tc.name      testStartBulkCase414
     * @tc.desc      Start with displayId and limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase414',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ displayId: 0, minWindowWidth: 780, maxWindowWidth: 1460 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_415
     * @tc.name      testStartBulkCase415
     * @tc.desc      Start twice with different limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase415',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: number = await startTarget({ minWindowWidth: 870, maxWindowWidth: 1540 });
        const second: number = await startTarget({ minWindowWidth: 920, maxWindowWidth: 1590 });
        expect(first === 0 || ACCEPTABLE_START_CODES.includes(first)).assertTrue();
        expect(second === 0 || ACCEPTABLE_START_CODES.includes(second)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_416
     * @tc.name      testStartBulkCase416
     * @tc.desc      Start with bulk limits and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase416',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 960, maxWindowWidth: 1300 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_417
     * @tc.name      testStartBulkCase417
     * @tc.desc      Start with a height sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase417',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 2; index++) {
          const code: number = await startTarget({ minWindowHeight: 1050, maxWindowHeight: 1000 });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_418
     * @tc.name      testStartBulkCase418
     * @tc.desc      Start with displayId and limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase418',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ displayId: 0, minWindowWidth: 1140, maxWindowWidth: 1460 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_419
     * @tc.name      testStartBulkCase419
     * @tc.desc      Start twice with different limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase419',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: number = await startTarget({ minWindowWidth: 1230, maxWindowWidth: 1540 });
        const second: number = await startTarget({ minWindowWidth: 1280, maxWindowWidth: 1590 });
        expect(first === 0 || ACCEPTABLE_START_CODES.includes(first)).assertTrue();
        expect(second === 0 || ACCEPTABLE_START_CODES.includes(second)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_420
     * @tc.name      testStartBulkCase420
     * @tc.desc      Start with bulk limits and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase420',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 600, maxWindowWidth: 1300 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_421
     * @tc.name      testStartBulkCase421
     * @tc.desc      Start with a height sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase421',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 2; index++) {
          const code: number = await startTarget({ minWindowHeight: 690, maxWindowHeight: 1000 });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_422
     * @tc.name      testStartBulkCase422
     * @tc.desc      Start with displayId and limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase422',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ displayId: 0, minWindowWidth: 780, maxWindowWidth: 1460 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_423
     * @tc.name      testStartBulkCase423
     * @tc.desc      Start twice with different limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase423',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: number = await startTarget({ minWindowWidth: 870, maxWindowWidth: 1540 });
        const second: number = await startTarget({ minWindowWidth: 920, maxWindowWidth: 1590 });
        expect(first === 0 || ACCEPTABLE_START_CODES.includes(first)).assertTrue();
        expect(second === 0 || ACCEPTABLE_START_CODES.includes(second)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_424
     * @tc.name      testStartBulkCase424
     * @tc.desc      Start with bulk limits and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase424',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 960, maxWindowWidth: 1300 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_425
     * @tc.name      testStartBulkCase425
     * @tc.desc      Start with a height sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase425',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 2; index++) {
          const code: number = await startTarget({ minWindowHeight: 1050, maxWindowHeight: 1000 });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_426
     * @tc.name      testStartBulkCase426
     * @tc.desc      Start with displayId and limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase426',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ displayId: 0, minWindowWidth: 1140, maxWindowWidth: 1460 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_427
     * @tc.name      testStartBulkCase427
     * @tc.desc      Start twice with different limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase427',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: number = await startTarget({ minWindowWidth: 1230, maxWindowWidth: 1540 });
        const second: number = await startTarget({ minWindowWidth: 1280, maxWindowWidth: 1590 });
        expect(first === 0 || ACCEPTABLE_START_CODES.includes(first)).assertTrue();
        expect(second === 0 || ACCEPTABLE_START_CODES.includes(second)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_428
     * @tc.name      testStartBulkCase428
     * @tc.desc      Start with bulk limits and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase428',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 600, maxWindowWidth: 1300 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_429
     * @tc.name      testStartBulkCase429
     * @tc.desc      Start with a height sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase429',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 2; index++) {
          const code: number = await startTarget({ minWindowHeight: 690, maxWindowHeight: 1000 });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_430
     * @tc.name      testStartBulkCase430
     * @tc.desc      Start with displayId and limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase430',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ displayId: 0, minWindowWidth: 780, maxWindowWidth: 1460 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_431
     * @tc.name      testStartBulkCase431
     * @tc.desc      Start twice with different limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase431',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: number = await startTarget({ minWindowWidth: 870, maxWindowWidth: 1540 });
        const second: number = await startTarget({ minWindowWidth: 920, maxWindowWidth: 1590 });
        expect(first === 0 || ACCEPTABLE_START_CODES.includes(first)).assertTrue();
        expect(second === 0 || ACCEPTABLE_START_CODES.includes(second)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_432
     * @tc.name      testStartBulkCase432
     * @tc.desc      Start with bulk limits and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase432',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 960, maxWindowWidth: 1300 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_433
     * @tc.name      testStartBulkCase433
     * @tc.desc      Start with a height sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase433',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 2; index++) {
          const code: number = await startTarget({ minWindowHeight: 1050, maxWindowHeight: 1000 });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_434
     * @tc.name      testStartBulkCase434
     * @tc.desc      Start with displayId and limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase434',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ displayId: 0, minWindowWidth: 1140, maxWindowWidth: 1460 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_435
     * @tc.name      testStartBulkCase435
     * @tc.desc      Start twice with different limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase435',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: number = await startTarget({ minWindowWidth: 1230, maxWindowWidth: 1540 });
        const second: number = await startTarget({ minWindowWidth: 1280, maxWindowWidth: 1590 });
        expect(first === 0 || ACCEPTABLE_START_CODES.includes(first)).assertTrue();
        expect(second === 0 || ACCEPTABLE_START_CODES.includes(second)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_436
     * @tc.name      testStartBulkCase436
     * @tc.desc      Start with bulk limits and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase436',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 600, maxWindowWidth: 1300 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_437
     * @tc.name      testStartBulkCase437
     * @tc.desc      Start with a height sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase437',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 2; index++) {
          const code: number = await startTarget({ minWindowHeight: 690, maxWindowHeight: 1000 });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_438
     * @tc.name      testStartBulkCase438
     * @tc.desc      Start with displayId and limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase438',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ displayId: 0, minWindowWidth: 780, maxWindowWidth: 1460 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_439
     * @tc.name      testStartBulkCase439
     * @tc.desc      Start twice with different limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase439',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: number = await startTarget({ minWindowWidth: 870, maxWindowWidth: 1540 });
        const second: number = await startTarget({ minWindowWidth: 920, maxWindowWidth: 1590 });
        expect(first === 0 || ACCEPTABLE_START_CODES.includes(first)).assertTrue();
        expect(second === 0 || ACCEPTABLE_START_CODES.includes(second)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_440
     * @tc.name      testStartBulkCase440
     * @tc.desc      Start with bulk limits and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase440',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 960, maxWindowWidth: 1300 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_441
     * @tc.name      testStartBulkCase441
     * @tc.desc      Start with a height sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase441',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 2; index++) {
          const code: number = await startTarget({ minWindowHeight: 1050, maxWindowHeight: 1000 });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_442
     * @tc.name      testStartBulkCase442
     * @tc.desc      Start with displayId and limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase442',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ displayId: 0, minWindowWidth: 1140, maxWindowWidth: 1460 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_443
     * @tc.name      testStartBulkCase443
     * @tc.desc      Start twice with different limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase443',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: number = await startTarget({ minWindowWidth: 1230, maxWindowWidth: 1540 });
        const second: number = await startTarget({ minWindowWidth: 1280, maxWindowWidth: 1590 });
        expect(first === 0 || ACCEPTABLE_START_CODES.includes(first)).assertTrue();
        expect(second === 0 || ACCEPTABLE_START_CODES.includes(second)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_444
     * @tc.name      testStartBulkCase444
     * @tc.desc      Start with bulk limits and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase444',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 600, maxWindowWidth: 1300 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_445
     * @tc.name      testStartBulkCase445
     * @tc.desc      Start with a height sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase445',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 2; index++) {
          const code: number = await startTarget({ minWindowHeight: 690, maxWindowHeight: 1000 });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_446
     * @tc.name      testStartBulkCase446
     * @tc.desc      Start with displayId and limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase446',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ displayId: 0, minWindowWidth: 780, maxWindowWidth: 1460 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_447
     * @tc.name      testStartBulkCase447
     * @tc.desc      Start twice with different limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase447',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: number = await startTarget({ minWindowWidth: 870, maxWindowWidth: 1540 });
        const second: number = await startTarget({ minWindowWidth: 920, maxWindowWidth: 1590 });
        expect(first === 0 || ACCEPTABLE_START_CODES.includes(first)).assertTrue();
        expect(second === 0 || ACCEPTABLE_START_CODES.includes(second)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_448
     * @tc.name      testStartBulkCase448
     * @tc.desc      Start with bulk limits and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase448',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 960, maxWindowWidth: 1300 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_449
     * @tc.name      testStartBulkCase449
     * @tc.desc      Start with a height sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase449',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 2; index++) {
          const code: number = await startTarget({ minWindowHeight: 1050, maxWindowHeight: 1000 });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_450
     * @tc.name      testStartBulkCase450
     * @tc.desc      Start with displayId and limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase450',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ displayId: 0, minWindowWidth: 1140, maxWindowWidth: 1460 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_451
     * @tc.name      testStartBulkCase451
     * @tc.desc      Start twice with different limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase451',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: number = await startTarget({ minWindowWidth: 1230, maxWindowWidth: 1540 });
        const second: number = await startTarget({ minWindowWidth: 1280, maxWindowWidth: 1590 });
        expect(first === 0 || ACCEPTABLE_START_CODES.includes(first)).assertTrue();
        expect(second === 0 || ACCEPTABLE_START_CODES.includes(second)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_452
     * @tc.name      testStartBulkCase452
     * @tc.desc      Start with bulk limits and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase452',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 600, maxWindowWidth: 1300 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_453
     * @tc.name      testStartBulkCase453
     * @tc.desc      Start with a height sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase453',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 2; index++) {
          const code: number = await startTarget({ minWindowHeight: 690, maxWindowHeight: 1000 });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_454
     * @tc.name      testStartBulkCase454
     * @tc.desc      Start with displayId and limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase454',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ displayId: 0, minWindowWidth: 780, maxWindowWidth: 1460 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_455
     * @tc.name      testStartBulkCase455
     * @tc.desc      Start twice with different limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase455',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: number = await startTarget({ minWindowWidth: 870, maxWindowWidth: 1540 });
        const second: number = await startTarget({ minWindowWidth: 920, maxWindowWidth: 1590 });
        expect(first === 0 || ACCEPTABLE_START_CODES.includes(first)).assertTrue();
        expect(second === 0 || ACCEPTABLE_START_CODES.includes(second)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_456
     * @tc.name      testStartBulkCase456
     * @tc.desc      Start with bulk limits and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase456',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 960, maxWindowWidth: 1300 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_457
     * @tc.name      testStartBulkCase457
     * @tc.desc      Start with a height sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase457',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 2; index++) {
          const code: number = await startTarget({ minWindowHeight: 1050, maxWindowHeight: 1000 });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_458
     * @tc.name      testStartBulkCase458
     * @tc.desc      Start with displayId and limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase458',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ displayId: 0, minWindowWidth: 1140, maxWindowWidth: 1460 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_459
     * @tc.name      testStartBulkCase459
     * @tc.desc      Start twice with different limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase459',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: number = await startTarget({ minWindowWidth: 1230, maxWindowWidth: 1540 });
        const second: number = await startTarget({ minWindowWidth: 1280, maxWindowWidth: 1590 });
        expect(first === 0 || ACCEPTABLE_START_CODES.includes(first)).assertTrue();
        expect(second === 0 || ACCEPTABLE_START_CODES.includes(second)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_460
     * @tc.name      testStartBulkCase460
     * @tc.desc      Start with bulk limits and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase460',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 600, maxWindowWidth: 1300 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_461
     * @tc.name      testStartBulkCase461
     * @tc.desc      Start with a height sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase461',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 2; index++) {
          const code: number = await startTarget({ minWindowHeight: 690, maxWindowHeight: 1000 });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_462
     * @tc.name      testStartBulkCase462
     * @tc.desc      Start with displayId and limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase462',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ displayId: 0, minWindowWidth: 780, maxWindowWidth: 1460 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_463
     * @tc.name      testStartBulkCase463
     * @tc.desc      Start twice with different limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase463',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: number = await startTarget({ minWindowWidth: 870, maxWindowWidth: 1540 });
        const second: number = await startTarget({ minWindowWidth: 920, maxWindowWidth: 1590 });
        expect(first === 0 || ACCEPTABLE_START_CODES.includes(first)).assertTrue();
        expect(second === 0 || ACCEPTABLE_START_CODES.includes(second)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_464
     * @tc.name      testStartBulkCase464
     * @tc.desc      Start with bulk limits and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase464',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 960, maxWindowWidth: 1300 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_465
     * @tc.name      testStartBulkCase465
     * @tc.desc      Start with a height sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase465',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 2; index++) {
          const code: number = await startTarget({ minWindowHeight: 1050, maxWindowHeight: 1000 });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_466
     * @tc.name      testStartBulkCase466
     * @tc.desc      Start with displayId and limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase466',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ displayId: 0, minWindowWidth: 1140, maxWindowWidth: 1460 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_467
     * @tc.name      testStartBulkCase467
     * @tc.desc      Start twice with different limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase467',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: number = await startTarget({ minWindowWidth: 1230, maxWindowWidth: 1540 });
        const second: number = await startTarget({ minWindowWidth: 1280, maxWindowWidth: 1590 });
        expect(first === 0 || ACCEPTABLE_START_CODES.includes(first)).assertTrue();
        expect(second === 0 || ACCEPTABLE_START_CODES.includes(second)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_468
     * @tc.name      testStartBulkCase468
     * @tc.desc      Start with bulk limits and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase468',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 600, maxWindowWidth: 1300 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_469
     * @tc.name      testStartBulkCase469
     * @tc.desc      Start with a height sweep and verify every step.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStartBulkCase469',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        for (let index: number = 0; index < 2; index++) {
          const code: number = await startTarget({ minWindowHeight: 690, maxWindowHeight: 1000 });
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          await closeTarget();
        }
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_980
     * @tc.name      testStartLifeCycle980
     * @tc.desc      Start with limits and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */    it('testStartLifeCycle980',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 600, maxWindowWidth: 1200 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_981
     * @tc.name      testStartLifeCycle981
     * @tc.desc      Start with displayId and limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */    it('testStartLifeCycle981',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ displayId: 0, minWindowWidth: 650, maxWindowWidth: 1300 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_982
     * @tc.name      testStartLifeCycle982
     * @tc.desc      Start twice in sequence and verify both requests.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */    it('testStartLifeCycle982',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: number = await startTarget({ minWindowWidth: 700, maxWindowWidth: 1400 });
        const second: number = await startTarget({ minWindowHeight: 500, maxWindowHeight: 1000 });
        expect(first === 0 || ACCEPTABLE_START_CODES.includes(first)).assertTrue();
        expect(second === 0 || ACCEPTABLE_START_CODES.includes(second)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_983
     * @tc.name      testStartLifeCycle983
     * @tc.desc      Start, close and restore the layout by starting again.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */    it('testStartLifeCycle983',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 750, maxWindowWidth: 1200 });
        await closeTarget();
        const again: number = await startTarget({ minWindowWidth: 600, maxWindowWidth: 1500 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        expect(again === 0 || ACCEPTABLE_START_CODES.includes(again)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_984
     * @tc.name      testStartLifeCycle984
     * @tc.desc      Start with limits and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */    it('testStartLifeCycle984',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 600, maxWindowWidth: 1300 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_985
     * @tc.name      testStartLifeCycle985
     * @tc.desc      Start with displayId and limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */    it('testStartLifeCycle985',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ displayId: 0, minWindowWidth: 650, maxWindowWidth: 1400 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_986
     * @tc.name      testStartLifeCycle986
     * @tc.desc      Start twice in sequence and verify both requests.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */    it('testStartLifeCycle986',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: number = await startTarget({ minWindowWidth: 700, maxWindowWidth: 1200 });
        const second: number = await startTarget({ minWindowHeight: 500, maxWindowHeight: 1000 });
        expect(first === 0 || ACCEPTABLE_START_CODES.includes(first)).assertTrue();
        expect(second === 0 || ACCEPTABLE_START_CODES.includes(second)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_987
     * @tc.name      testStartLifeCycle987
     * @tc.desc      Start, close and restore the layout by starting again.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */    it('testStartLifeCycle987',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 750, maxWindowWidth: 1300 });
        await closeTarget();
        const again: number = await startTarget({ minWindowWidth: 600, maxWindowWidth: 1500 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        expect(again === 0 || ACCEPTABLE_START_CODES.includes(again)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_988
     * @tc.name      testStartLifeCycle988
     * @tc.desc      Start with limits and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */    it('testStartLifeCycle988',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 600, maxWindowWidth: 1400 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_989
     * @tc.name      testStartLifeCycle989
     * @tc.desc      Start with displayId and limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */    it('testStartLifeCycle989',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ displayId: 0, minWindowWidth: 650, maxWindowWidth: 1200 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_990
     * @tc.name      testStartLifeCycle990
     * @tc.desc      Start twice in sequence and verify both requests.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */    it('testStartLifeCycle990',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: number = await startTarget({ minWindowWidth: 700, maxWindowWidth: 1300 });
        const second: number = await startTarget({ minWindowHeight: 500, maxWindowHeight: 1000 });
        expect(first === 0 || ACCEPTABLE_START_CODES.includes(first)).assertTrue();
        expect(second === 0 || ACCEPTABLE_START_CODES.includes(second)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_991
     * @tc.name      testStartLifeCycle991
     * @tc.desc      Start, close and restore the layout by starting again.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */    it('testStartLifeCycle991',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 750, maxWindowWidth: 1400 });
        await closeTarget();
        const again: number = await startTarget({ minWindowWidth: 600, maxWindowWidth: 1500 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        expect(again === 0 || ACCEPTABLE_START_CODES.includes(again)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_992
     * @tc.name      testStartLifeCycle992
     * @tc.desc      Start with limits and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */    it('testStartLifeCycle992',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 600, maxWindowWidth: 1200 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_993
     * @tc.name      testStartLifeCycle993
     * @tc.desc      Start with displayId and limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */    it('testStartLifeCycle993',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ displayId: 0, minWindowWidth: 650, maxWindowWidth: 1300 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_994
     * @tc.name      testStartLifeCycle994
     * @tc.desc      Start twice in sequence and verify both requests.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */    it('testStartLifeCycle994',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: number = await startTarget({ minWindowWidth: 700, maxWindowWidth: 1400 });
        const second: number = await startTarget({ minWindowHeight: 500, maxWindowHeight: 1000 });
        expect(first === 0 || ACCEPTABLE_START_CODES.includes(first)).assertTrue();
        expect(second === 0 || ACCEPTABLE_START_CODES.includes(second)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_995
     * @tc.name      testStartLifeCycle995
     * @tc.desc      Start, close and restore the layout by starting again.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */    it('testStartLifeCycle995',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 750, maxWindowWidth: 1200 });
        await closeTarget();
        const again: number = await startTarget({ minWindowWidth: 600, maxWindowWidth: 1500 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        expect(again === 0 || ACCEPTABLE_START_CODES.includes(again)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_996
     * @tc.name      testStartLifeCycle996
     * @tc.desc      Start with limits and verify the request is handled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */    it('testStartLifeCycle996',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 600, maxWindowWidth: 1300 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_997
     * @tc.name      testStartLifeCycle997
     * @tc.desc      Start with displayId and limits and verify handling.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */    it('testStartLifeCycle997',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ displayId: 0, minWindowWidth: 650, maxWindowWidth: 1400 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_998
     * @tc.name      testStartLifeCycle998
     * @tc.desc      Start twice in sequence and verify both requests.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */    it('testStartLifeCycle998',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const first: number = await startTarget({ minWindowWidth: 700, maxWindowWidth: 1200 });
        const second: number = await startTarget({ minWindowHeight: 500, maxWindowHeight: 1000 });
        expect(first === 0 || ACCEPTABLE_START_CODES.includes(first)).assertTrue();
        expect(second === 0 || ACCEPTABLE_START_CODES.includes(second)).assertTrue();
        await closeTarget();
      });
    /**
     * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_999
     * @tc.name      testStartLifeCycle999
     * @tc.desc      Start, close and restore the layout by starting again.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */    it('testStartLifeCycle999',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const code: number = await startTarget({ minWindowWidth: 750, maxWindowWidth: 1300 });
        await closeTarget();
        const again: number = await startTarget({ minWindowWidth: 600, maxWindowWidth: 1500 });
        expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
        expect(again === 0 || ACCEPTABLE_START_CODES.includes(again)).assertTrue();
        await closeTarget();
      });
    START_CASES.forEach((startCase: StartCase) => {
      /**
       * @tc.number    SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_0600-0699
       * @tc.name      StartOptions matrix case
       * @tc.desc      Start the target ability with a boundary or special StartOptions combination.
       * @tc.type      FUNCTION
       * @tc.size      MEDIUMTEST
       * @tc.level     LEVEL1
       */
      it(startCase.name,
        TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
          hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s begin options=%{public}s',
            startCase.name, JSON.stringify(startCase.options));
          const code: number = await startTarget(startCase.options);
          expect(code === 0 || ACCEPTABLE_START_CODES.includes(code)).assertTrue();
          if (code === 0) {
            const ability: UIAbility = await abilityDelegatorRegistry.getAbilityDelegator().getCurrentTopAbility();
            expect(ability.context.abilityInfo.name).assertEqual(TARGET_ABILITY);
          }
          await closeTarget();
          hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s end', startCase.name);
        });
    });
  });
}