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


import { describe, it, expect, beforeAll, afterAll, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BasicUtil } from 'library';

const DOMAIN: number = 0xF811;
const SUITE_TAG: string = '[Sample_GeofenceCheckIn_NUMBEXH]';

interface ClampCase {
  value: number;
  low: number;
  high: number;
  expected: number;
}

const CLAMP_CASES: ClampCase[] = [
  { value: -10, low: -5, high: 1, expected: -5 },
  { value: -10, low: -5, high: 10, expected: -5 },
  { value: -10, low: -5, high: 100, expected: -5 },
  { value: -10, low: 0, high: 1, expected: 0 },
  { value: -10, low: 0, high: 10, expected: 0 },
  { value: -10, low: 0, high: 100, expected: 0 },
  { value: -10, low: 1, high: 1, expected: 1 },
  { value: -10, low: 1, high: 10, expected: 1 },
  { value: -10, low: 1, high: 100, expected: 1 },
  { value: -1, low: -5, high: 1, expected: -1 },
  { value: -1, low: -5, high: 10, expected: -1 },
  { value: -1, low: -5, high: 100, expected: -1 },
  { value: -1, low: 0, high: 1, expected: 0 },
  { value: -1, low: 0, high: 10, expected: 0 },
  { value: -1, low: 0, high: 100, expected: 0 },
  { value: -1, low: 1, high: 1, expected: 1 },
  { value: -1, low: 1, high: 10, expected: 1 },
  { value: -1, low: 1, high: 100, expected: 1 },
  { value: 0, low: -5, high: 1, expected: 0 },
  { value: 0, low: -5, high: 10, expected: 0 },
  { value: 0, low: -5, high: 100, expected: 0 },
  { value: 0, low: 0, high: 1, expected: 0 },
  { value: 0, low: 0, high: 10, expected: 0 },
  { value: 0, low: 0, high: 100, expected: 0 },
  { value: 0, low: 1, high: 1, expected: 1 },
  { value: 0, low: 1, high: 10, expected: 1 },
  { value: 0, low: 1, high: 100, expected: 1 },
  { value: 1, low: -5, high: 1, expected: 1 },
  { value: 1, low: -5, high: 10, expected: 1 },
  { value: 1, low: -5, high: 100, expected: 1 },
  { value: 1, low: 0, high: 1, expected: 1 },
  { value: 1, low: 0, high: 10, expected: 1 },
  { value: 1, low: 0, high: 100, expected: 1 },
  { value: 1, low: 1, high: 1, expected: 1 },
  { value: 1, low: 1, high: 10, expected: 1 },
  { value: 1, low: 1, high: 100, expected: 1 },
  { value: 5, low: -5, high: 1, expected: 1 },
  { value: 5, low: -5, high: 10, expected: 5 },
  { value: 5, low: -5, high: 100, expected: 5 },
  { value: 5, low: 0, high: 1, expected: 1 },
  { value: 5, low: 0, high: 10, expected: 5 },
  { value: 5, low: 0, high: 100, expected: 5 },
  { value: 5, low: 1, high: 1, expected: 1 },
  { value: 5, low: 1, high: 10, expected: 5 },
  { value: 5, low: 1, high: 100, expected: 5 },
  { value: 10, low: -5, high: 1, expected: 1 },
  { value: 10, low: -5, high: 10, expected: 10 },
  { value: 10, low: -5, high: 100, expected: 10 },
  { value: 10, low: 0, high: 1, expected: 1 },
  { value: 10, low: 0, high: 10, expected: 10 },
  { value: 10, low: 0, high: 100, expected: 10 },
  { value: 10, low: 1, high: 1, expected: 1 },
  { value: 10, low: 1, high: 10, expected: 10 },
  { value: 10, low: 1, high: 100, expected: 10 },
  { value: 50, low: -5, high: 1, expected: 1 },
  { value: 50, low: -5, high: 10, expected: 10 },
  { value: 50, low: -5, high: 100, expected: 50 },
  { value: 50, low: 0, high: 1, expected: 1 },
  { value: 50, low: 0, high: 10, expected: 10 },
  { value: 50, low: 0, high: 100, expected: 50 },
  { value: 50, low: 1, high: 1, expected: 1 },
  { value: 50, low: 1, high: 10, expected: 10 },
  { value: 50, low: 1, high: 100, expected: 50 },
  { value: 100, low: -5, high: 1, expected: 1 },
  { value: 100, low: -5, high: 10, expected: 10 },
  { value: 100, low: -5, high: 100, expected: 100 },
  { value: 100, low: 0, high: 1, expected: 1 },
  { value: 100, low: 0, high: 10, expected: 10 },
  { value: 100, low: 0, high: 100, expected: 100 },
  { value: 100, low: 1, high: 1, expected: 1 },
  { value: 100, low: 1, high: 10, expected: 10 },
  { value: 100, low: 1, high: 100, expected: 100 },
  { value: 1000, low: -5, high: 1, expected: 1 },
  { value: 1000, low: -5, high: 10, expected: 10 },
  { value: 1000, low: -5, high: 100, expected: 100 },
  { value: 1000, low: 0, high: 1, expected: 1 },
  { value: 1000, low: 0, high: 10, expected: 10 },
  { value: 1000, low: 0, high: 100, expected: 100 },
  { value: 1000, low: 1, high: 1, expected: 1 },
  { value: 1000, low: 1, high: 10, expected: 10 },
  { value: 1000, low: 1, high: 100, expected: 100 },
];

interface PercentCase {
  value: number;
  expected: string;
}

const PERCENT_CASES: PercentCase[] = [
  { value: 0.0, expected: '0.0%' },
  { value: 0.01, expected: '1.0%' },
  { value: 0.02, expected: '2.0%' },
  { value: 0.03, expected: '3.0%' },
  { value: 0.04, expected: '4.0%' },
  { value: 0.05, expected: '5.0%' },
  { value: 0.06, expected: '6.0%' },
  { value: 0.07, expected: '7.0%' },
  { value: 0.08, expected: '8.0%' },
  { value: 0.09, expected: '9.0%' },
  { value: 0.1, expected: '10.0%' },
  { value: 0.11, expected: '11.0%' },
  { value: 0.12, expected: '12.0%' },
  { value: 0.13, expected: '13.0%' },
  { value: 0.14, expected: '14.0%' },
  { value: 0.15, expected: '15.0%' },
  { value: 0.16, expected: '16.0%' },
  { value: 0.17, expected: '17.0%' },
  { value: 0.18, expected: '18.0%' },
  { value: 0.19, expected: '19.0%' },
  { value: 0.2, expected: '20.0%' },
  { value: 0.21, expected: '21.0%' },
  { value: 0.22, expected: '22.0%' },
  { value: 0.23, expected: '23.0%' },
  { value: 0.24, expected: '24.0%' },
  { value: 0.25, expected: '25.0%' },
  { value: 0.26, expected: '26.0%' },
  { value: 0.27, expected: '27.0%' },
  { value: 0.28, expected: '28.0%' },
  { value: 0.29, expected: '29.0%' },
  { value: 0.3, expected: '30.0%' },
  { value: 0.31, expected: '31.0%' },
  { value: 0.32, expected: '32.0%' },
  { value: 0.33, expected: '33.0%' },
  { value: 0.34, expected: '34.0%' },
  { value: 0.35, expected: '35.0%' },
  { value: 0.36, expected: '36.0%' },
  { value: 0.37, expected: '37.0%' },
  { value: 0.38, expected: '38.0%' },
  { value: 0.39, expected: '39.0%' },
  { value: 0.4, expected: '40.0%' },
  { value: 0.41, expected: '41.0%' },
  { value: 0.42, expected: '42.0%' },
  { value: 0.43, expected: '43.0%' },
  { value: 0.44, expected: '44.0%' },
  { value: 0.45, expected: '45.0%' },
  { value: 0.46, expected: '46.0%' },
  { value: 0.47, expected: '47.0%' },
  { value: 0.48, expected: '48.0%' },
  { value: 0.49, expected: '49.0%' },
  { value: 0.5, expected: '50.0%' },
  { value: 0.51, expected: '51.0%' },
  { value: 0.52, expected: '52.0%' },
  { value: 0.53, expected: '53.0%' },
  { value: 0.54, expected: '54.0%' },
  { value: 0.55, expected: '55.0%' },
  { value: 0.56, expected: '56.0%' },
  { value: 0.57, expected: '57.0%' },
  { value: 0.58, expected: '58.0%' },
  { value: 0.59, expected: '59.0%' },
  { value: 0.6, expected: '60.0%' },
  { value: 0.61, expected: '61.0%' },
  { value: 0.62, expected: '62.0%' },
  { value: 0.63, expected: '63.0%' },
  { value: 0.64, expected: '64.0%' },
  { value: 0.65, expected: '65.0%' },
  { value: 0.66, expected: '66.0%' },
  { value: 0.67, expected: '67.0%' },
  { value: 0.68, expected: '68.0%' },
  { value: 0.69, expected: '69.0%' },
  { value: 0.7, expected: '70.0%' },
  { value: 0.71, expected: '71.0%' },
  { value: 0.72, expected: '72.0%' },
  { value: 0.73, expected: '73.0%' },
  { value: 0.74, expected: '74.0%' },
  { value: 0.75, expected: '75.0%' },
  { value: 0.76, expected: '76.0%' },
  { value: 0.77, expected: '77.0%' },
  { value: 0.78, expected: '78.0%' },
  { value: 0.79, expected: '79.0%' },
  { value: 0.8, expected: '80.0%' },
  { value: 0.81, expected: '81.0%' },
  { value: 0.82, expected: '82.0%' },
  { value: 0.83, expected: '83.0%' },
  { value: 0.84, expected: '84.0%' },
  { value: 0.85, expected: '85.0%' },
  { value: 0.86, expected: '86.0%' },
  { value: 0.87, expected: '87.0%' },
  { value: 0.88, expected: '88.0%' },
  { value: 0.89, expected: '89.0%' },
  { value: 0.9, expected: '90.0%' },
  { value: 0.91, expected: '91.0%' },
  { value: 0.92, expected: '92.0%' },
  { value: 0.93, expected: '93.0%' },
  { value: 0.94, expected: '94.0%' },
  { value: 0.95, expected: '95.0%' },
  { value: 0.96, expected: '96.0%' },
  { value: 0.97, expected: '97.0%' },
  { value: 0.98, expected: '98.0%' },
  { value: 0.99, expected: '99.0%' },
  { value: 1.0, expected: '100.0%' },
  { value: 1.01, expected: '101.0%' },
  { value: 1.02, expected: '102.0%' },
  { value: 1.03, expected: '103.0%' },
  { value: 1.04, expected: '104.0%' },
  { value: 1.05, expected: '105.0%' },
  { value: 1.06, expected: '106.0%' },
  { value: 1.07, expected: '107.0%' },
  { value: 1.08, expected: '108.0%' },
  { value: 1.09, expected: '109.0%' },
  { value: 1.1, expected: '110.0%' },
  { value: 1.11, expected: '111.0%' },
  { value: 1.12, expected: '112.0%' },
  { value: 1.13, expected: '113.0%' },
  { value: 1.14, expected: '114.0%' },
  { value: 1.15, expected: '115.0%' },
  { value: 1.16, expected: '116.0%' },
  { value: 1.17, expected: '117.0%' },
  { value: 1.18, expected: '118.0%' },
  { value: 1.19, expected: '119.0%' },
  { value: 1.2, expected: '120.0%' },
  { value: 1.21, expected: '121.0%' },
  { value: 1.22, expected: '122.0%' },
  { value: 1.23, expected: '123.0%' },
  { value: 1.24, expected: '124.0%' },
  { value: 1.25, expected: '125.0%' },
  { value: 1.26, expected: '126.0%' },
  { value: 1.27, expected: '127.0%' },
  { value: 1.28, expected: '128.0%' },
  { value: 1.29, expected: '129.0%' },
  { value: 1.3, expected: '130.0%' },
  { value: 1.31, expected: '131.0%' },
  { value: 1.32, expected: '132.0%' },
  { value: 1.33, expected: '133.0%' },
  { value: 1.34, expected: '134.0%' },
  { value: 1.35, expected: '135.0%' },
  { value: 1.36, expected: '136.0%' },
  { value: 1.37, expected: '137.0%' },
  { value: 1.38, expected: '138.0%' },
  { value: 1.39, expected: '139.0%' },
  { value: 1.4, expected: '140.0%' },
  { value: 1.41, expected: '141.0%' },
  { value: 1.42, expected: '142.0%' },
  { value: 1.43, expected: '143.0%' },
  { value: 1.44, expected: '144.0%' },
  { value: 1.45, expected: '145.0%' },
  { value: 1.46, expected: '146.0%' },
  { value: 1.47, expected: '147.0%' },
  { value: 1.48, expected: '148.0%' },
  { value: 1.49, expected: '149.0%' },
  { value: 1.5, expected: '150.0%' },
  { value: 1.51, expected: '151.0%' },
  { value: 1.52, expected: '152.0%' },
  { value: 1.53, expected: '153.0%' },
  { value: 1.54, expected: '154.0%' },
  { value: 1.55, expected: '155.0%' },
  { value: 1.56, expected: '156.0%' },
  { value: 1.57, expected: '157.0%' },
  { value: 1.58, expected: '158.0%' },
  { value: 1.59, expected: '159.0%' },
  { value: 1.6, expected: '160.0%' },
  { value: 1.61, expected: '161.0%' },
  { value: 1.62, expected: '162.0%' },
  { value: 1.63, expected: '163.0%' },
  { value: 1.64, expected: '164.0%' },
  { value: 1.65, expected: '165.0%' },
  { value: 1.66, expected: '166.0%' },
  { value: 1.67, expected: '167.0%' },
  { value: 1.68, expected: '168.0%' },
  { value: 1.69, expected: '169.0%' },
  { value: 1.7, expected: '170.0%' },
  { value: 1.71, expected: '171.0%' },
  { value: 1.72, expected: '172.0%' },
  { value: 1.73, expected: '173.0%' },
  { value: 1.74, expected: '174.0%' },
  { value: 1.75, expected: '175.0%' },
  { value: 1.76, expected: '176.0%' },
  { value: 1.77, expected: '177.0%' },
  { value: 1.78, expected: '178.0%' },
  { value: 1.79, expected: '179.0%' },
  { value: 1.8, expected: '180.0%' },
  { value: 1.81, expected: '181.0%' },
  { value: 1.82, expected: '182.0%' },
  { value: 1.83, expected: '183.0%' },
  { value: 1.84, expected: '184.0%' },
  { value: 1.85, expected: '185.0%' },
  { value: 1.86, expected: '186.0%' },
  { value: 1.87, expected: '187.0%' },
  { value: 1.88, expected: '188.0%' },
  { value: 1.89, expected: '189.0%' },
  { value: 1.9, expected: '190.0%' },
  { value: 1.91, expected: '191.0%' },
  { value: 1.92, expected: '192.0%' },
  { value: 1.93, expected: '193.0%' },
  { value: 1.94, expected: '194.0%' },
  { value: 1.95, expected: '195.0%' },
  { value: 1.96, expected: '196.0%' },
  { value: 1.97, expected: '197.0%' },
  { value: 1.98, expected: '198.0%' },
  { value: 1.99, expected: '199.0%' },
];

interface PositiveCase {
  value: number;
  expected: boolean;
}

const POSITIVE_CASES: PositiveCase[] = [
  { value: -100, expected: false },
  { value: -99, expected: false },
  { value: -98, expected: false },
  { value: -97, expected: false },
  { value: -96, expected: false },
  { value: -95, expected: false },
  { value: -94, expected: false },
  { value: -93, expected: false },
  { value: -92, expected: false },
  { value: -91, expected: false },
  { value: -90, expected: false },
  { value: -89, expected: false },
  { value: -88, expected: false },
  { value: -87, expected: false },
  { value: -86, expected: false },
  { value: -85, expected: false },
  { value: -84, expected: false },
  { value: -83, expected: false },
  { value: -82, expected: false },
  { value: -81, expected: false },
  { value: -80, expected: false },
  { value: -79, expected: false },
  { value: -78, expected: false },
  { value: -77, expected: false },
  { value: -76, expected: false },
  { value: -75, expected: false },
  { value: -74, expected: false },
  { value: -73, expected: false },
  { value: -72, expected: false },
  { value: -71, expected: false },
  { value: -70, expected: false },
  { value: -69, expected: false },
  { value: -68, expected: false },
  { value: -67, expected: false },
  { value: -66, expected: false },
  { value: -65, expected: false },
  { value: -64, expected: false },
  { value: -63, expected: false },
  { value: -62, expected: false },
  { value: -61, expected: false },
  { value: -60, expected: false },
  { value: -59, expected: false },
  { value: -58, expected: false },
  { value: -57, expected: false },
  { value: -56, expected: false },
  { value: -55, expected: false },
  { value: -54, expected: false },
  { value: -53, expected: false },
  { value: -52, expected: false },
  { value: -51, expected: false },
  { value: -50, expected: false },
  { value: -49, expected: false },
  { value: -48, expected: false },
  { value: -47, expected: false },
  { value: -46, expected: false },
  { value: -45, expected: false },
  { value: -44, expected: false },
  { value: -43, expected: false },
  { value: -42, expected: false },
  { value: -41, expected: false },
  { value: -40, expected: false },
  { value: -39, expected: false },
  { value: -38, expected: false },
  { value: -37, expected: false },
  { value: -36, expected: false },
  { value: -35, expected: false },
  { value: -34, expected: false },
  { value: -33, expected: false },
  { value: -32, expected: false },
  { value: -31, expected: false },
  { value: -30, expected: false },
  { value: -29, expected: false },
  { value: -28, expected: false },
  { value: -27, expected: false },
  { value: -26, expected: false },
  { value: -25, expected: false },
  { value: -24, expected: false },
  { value: -23, expected: false },
  { value: -22, expected: false },
  { value: -21, expected: false },
  { value: -20, expected: false },
  { value: -19, expected: false },
  { value: -18, expected: false },
  { value: -17, expected: false },
  { value: -16, expected: false },
  { value: -15, expected: false },
  { value: -14, expected: false },
  { value: -13, expected: false },
  { value: -12, expected: false },
  { value: -11, expected: false },
  { value: -10, expected: false },
  { value: -9, expected: false },
  { value: -8, expected: false },
  { value: -7, expected: false },
  { value: -6, expected: false },
  { value: -5, expected: false },
  { value: -4, expected: false },
  { value: -3, expected: false },
  { value: -2, expected: false },
  { value: -1, expected: false },
  { value: 0, expected: false },
  { value: 1, expected: true },
  { value: 2, expected: true },
  { value: 3, expected: true },
  { value: 4, expected: true },
  { value: 5, expected: true },
  { value: 6, expected: true },
  { value: 7, expected: true },
  { value: 8, expected: true },
  { value: 9, expected: true },
  { value: 10, expected: true },
  { value: 11, expected: true },
  { value: 12, expected: true },
  { value: 13, expected: true },
  { value: 14, expected: true },
  { value: 15, expected: true },
  { value: 16, expected: true },
  { value: 17, expected: true },
  { value: 18, expected: true },
  { value: 19, expected: true },
  { value: 20, expected: true },
  { value: 21, expected: true },
  { value: 22, expected: true },
  { value: 23, expected: true },
  { value: 24, expected: true },
  { value: 25, expected: true },
  { value: 26, expected: true },
  { value: 27, expected: true },
  { value: 28, expected: true },
  { value: 29, expected: true },
  { value: 30, expected: true },
  { value: 31, expected: true },
  { value: 32, expected: true },
  { value: 33, expected: true },
  { value: 34, expected: true },
  { value: 35, expected: true },
  { value: 36, expected: true },
  { value: 37, expected: true },
  { value: 38, expected: true },
  { value: 39, expected: true },
  { value: 40, expected: true },
  { value: 41, expected: true },
  { value: 42, expected: true },
  { value: 43, expected: true },
  { value: 44, expected: true },
  { value: 45, expected: true },
  { value: 46, expected: true },
  { value: 47, expected: true },
  { value: 48, expected: true },
  { value: 49, expected: true },
  { value: 50, expected: true },
  { value: 51, expected: true },
  { value: 52, expected: true },
  { value: 53, expected: true },
  { value: 54, expected: true },
  { value: 55, expected: true },
  { value: 56, expected: true },
  { value: 57, expected: true },
  { value: 58, expected: true },
  { value: 59, expected: true },
  { value: 60, expected: true },
  { value: 61, expected: true },
  { value: 62, expected: true },
  { value: 63, expected: true },
  { value: 64, expected: true },
  { value: 65, expected: true },
  { value: 66, expected: true },
  { value: 67, expected: true },
  { value: 68, expected: true },
  { value: 69, expected: true },
  { value: 70, expected: true },
  { value: 71, expected: true },
  { value: 72, expected: true },
  { value: 73, expected: true },
  { value: 74, expected: true },
  { value: 75, expected: true },
  { value: 76, expected: true },
  { value: 77, expected: true },
  { value: 78, expected: true },
  { value: 79, expected: true },
  { value: 80, expected: true },
  { value: 81, expected: true },
  { value: 82, expected: true },
  { value: 83, expected: true },
  { value: 84, expected: true },
  { value: 85, expected: true },
  { value: 86, expected: true },
  { value: 87, expected: true },
  { value: 88, expected: true },
  { value: 89, expected: true },
  { value: 90, expected: true },
  { value: 91, expected: true },
  { value: 92, expected: true },
  { value: 93, expected: true },
  { value: 94, expected: true },
  { value: 95, expected: true },
  { value: 96, expected: true },
  { value: 97, expected: true },
  { value: 98, expected: true },
  { value: 99, expected: true },
];

export default function basicUtilNumberExhaustiveTest() {
  describe('BasicUtilNumberExhaustiveTest', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'BasicUtilNumberExhaustiveTest suite start');
    });

    afterAll(() => {
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'BasicUtilNumberExhaustiveTest suite end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMBEXH_0100
     * @tc.name      testClampGrid0001
     * @tc.desc      Verify clamp for every combination of nine values, three lower bounds and three upper bounds.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testClampGrid0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testClampGrid0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let checked: number = 0;
      for (let i = 0; i < CLAMP_CASES.length; i++) {
        const row: ClampCase = CLAMP_CASES[i];
        expect(BasicUtil.clamp(row.value, row.low, row.high)).assertEqual(row.expected);
        checked = checked + 1;
      }
      expect(checked).assertEqual(81);
      expect(Number.isNaN(BasicUtil.clamp(NaN, 0, 10))).assertTrue();
      expect(BasicUtil.clamp(5, 10, 0)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMBEXH_0200
     * @tc.name      testPercentExhaustive0002
     * @tc.desc      Verify formatPercent renders every hundredth from 0 to 1.99 with one fraction digit.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPercentExhaustive0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testPercentExhaustive0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let checked: number = 0;
      for (let i = 0; i < PERCENT_CASES.length; i++) {
        const row: PercentCase = PERCENT_CASES[i];
        expect(BasicUtil.formatPercent(row.value)).assertEqual(row.expected);
        checked = checked + 1;
      }
      expect(checked).assertEqual(200);
      expect(BasicUtil.formatPercent(0.5, 2)).assertEqual('50.00%');
      expect(BasicUtil.formatPercent(1, 0)).assertEqual('100%');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMBEXH_0300
     * @tc.name      testPositiveExhaustive0003
     * @tc.desc      Verify isPositiveNumber for every integer from -100 to 99 and special values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPositiveExhaustive0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testPositiveExhaustive0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let checked: number = 0;
      for (let i = 0; i < POSITIVE_CASES.length; i++) {
        const row: PositiveCase = POSITIVE_CASES[i];
        expect(BasicUtil.isPositiveNumber(row.value)).assertEqual(row.expected);
        checked = checked + 1;
      }
      expect(checked).assertEqual(200);
      expect(BasicUtil.isPositiveNumber(NaN)).assertFalse();
      expect(BasicUtil.isPositiveNumber(Infinity)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMBEXH_0400
     * @tc.name      testRandomIntRanges0004
     * @tc.desc      Verify randomInt always stays inside the requested inclusive range.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRandomIntRanges0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRandomIntRanges0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let inside: number = 0;
      for (let i = 0; i < 100; i++) {
        const value: number = BasicUtil.randomInt(10, 20);
        expect(value >= 10).assertTrue();
        expect(value <= 20).assertTrue();
        inside = inside + 1;
      }
      expect(inside).assertEqual(100);
      expect(BasicUtil.randomInt(1, 1)).assertEqual(1);
      expect(BasicUtil.randomInt(5, 3)).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

  });
}
