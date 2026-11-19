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
import { NumericStringUtil } from './support/NumericStringUtil';

const DOMAIN: number = 0xF811;
const SUITE_TAG: string = '[Sample_GeofenceCheckIn_NUMSTREXH]';

interface ParseIntCase {
  input: string;
  expected: number;
}

const PARSE_INT_CASES: ParseIntCase[] = [
  { input: '-150', expected: -150 },
  { input: '-149', expected: -149 },
  { input: '-148', expected: -148 },
  { input: '-147', expected: -147 },
  { input: '-146', expected: -146 },
  { input: '-145', expected: -145 },
  { input: '-144', expected: -144 },
  { input: '-143', expected: -143 },
  { input: '-142', expected: -142 },
  { input: '-141', expected: -141 },
  { input: '-140', expected: -140 },
  { input: '-139', expected: -139 },
  { input: '-138', expected: -138 },
  { input: '-137', expected: -137 },
  { input: '-136', expected: -136 },
  { input: '-135', expected: -135 },
  { input: '-134', expected: -134 },
  { input: '-133', expected: -133 },
  { input: '-132', expected: -132 },
  { input: '-131', expected: -131 },
  { input: '-130', expected: -130 },
  { input: '-129', expected: -129 },
  { input: '-128', expected: -128 },
  { input: '-127', expected: -127 },
  { input: '-126', expected: -126 },
  { input: '-125', expected: -125 },
  { input: '-124', expected: -124 },
  { input: '-123', expected: -123 },
  { input: '-122', expected: -122 },
  { input: '-121', expected: -121 },
  { input: '-120', expected: -120 },
  { input: '-119', expected: -119 },
  { input: '-118', expected: -118 },
  { input: '-117', expected: -117 },
  { input: '-116', expected: -116 },
  { input: '-115', expected: -115 },
  { input: '-114', expected: -114 },
  { input: '-113', expected: -113 },
  { input: '-112', expected: -112 },
  { input: '-111', expected: -111 },
  { input: '-110', expected: -110 },
  { input: '-109', expected: -109 },
  { input: '-108', expected: -108 },
  { input: '-107', expected: -107 },
  { input: '-106', expected: -106 },
  { input: '-105', expected: -105 },
  { input: '-104', expected: -104 },
  { input: '-103', expected: -103 },
  { input: '-102', expected: -102 },
  { input: '-101', expected: -101 },
  { input: '-100', expected: -100 },
  { input: '-99', expected: -99 },
  { input: '-98', expected: -98 },
  { input: '-97', expected: -97 },
  { input: '-96', expected: -96 },
  { input: '-95', expected: -95 },
  { input: '-94', expected: -94 },
  { input: '-93', expected: -93 },
  { input: '-92', expected: -92 },
  { input: '-91', expected: -91 },
  { input: '-90', expected: -90 },
  { input: '-89', expected: -89 },
  { input: '-88', expected: -88 },
  { input: '-87', expected: -87 },
  { input: '-86', expected: -86 },
  { input: '-85', expected: -85 },
  { input: '-84', expected: -84 },
  { input: '-83', expected: -83 },
  { input: '-82', expected: -82 },
  { input: '-81', expected: -81 },
  { input: '-80', expected: -80 },
  { input: '-79', expected: -79 },
  { input: '-78', expected: -78 },
  { input: '-77', expected: -77 },
  { input: '-76', expected: -76 },
  { input: '-75', expected: -75 },
  { input: '-74', expected: -74 },
  { input: '-73', expected: -73 },
  { input: '-72', expected: -72 },
  { input: '-71', expected: -71 },
  { input: '-70', expected: -70 },
  { input: '-69', expected: -69 },
  { input: '-68', expected: -68 },
  { input: '-67', expected: -67 },
  { input: '-66', expected: -66 },
  { input: '-65', expected: -65 },
  { input: '-64', expected: -64 },
  { input: '-63', expected: -63 },
  { input: '-62', expected: -62 },
  { input: '-61', expected: -61 },
  { input: '-60', expected: -60 },
  { input: '-59', expected: -59 },
  { input: '-58', expected: -58 },
  { input: '-57', expected: -57 },
  { input: '-56', expected: -56 },
  { input: '-55', expected: -55 },
  { input: '-54', expected: -54 },
  { input: '-53', expected: -53 },
  { input: '-52', expected: -52 },
  { input: '-51', expected: -51 },
  { input: '-50', expected: -50 },
  { input: '-49', expected: -49 },
  { input: '-48', expected: -48 },
  { input: '-47', expected: -47 },
  { input: '-46', expected: -46 },
  { input: '-45', expected: -45 },
  { input: '-44', expected: -44 },
  { input: '-43', expected: -43 },
  { input: '-42', expected: -42 },
  { input: '-41', expected: -41 },
  { input: '-40', expected: -40 },
  { input: '-39', expected: -39 },
  { input: '-38', expected: -38 },
  { input: '-37', expected: -37 },
  { input: '-36', expected: -36 },
  { input: '-35', expected: -35 },
  { input: '-34', expected: -34 },
  { input: '-33', expected: -33 },
  { input: '-32', expected: -32 },
  { input: '-31', expected: -31 },
  { input: '-30', expected: -30 },
  { input: '-29', expected: -29 },
  { input: '-28', expected: -28 },
  { input: '-27', expected: -27 },
  { input: '-26', expected: -26 },
  { input: '-25', expected: -25 },
  { input: '-24', expected: -24 },
  { input: '-23', expected: -23 },
  { input: '-22', expected: -22 },
  { input: '-21', expected: -21 },
  { input: '-20', expected: -20 },
  { input: '-19', expected: -19 },
  { input: '-18', expected: -18 },
  { input: '-17', expected: -17 },
  { input: '-16', expected: -16 },
  { input: '-15', expected: -15 },
  { input: '-14', expected: -14 },
  { input: '-13', expected: -13 },
  { input: '-12', expected: -12 },
  { input: '-11', expected: -11 },
  { input: '-10', expected: -10 },
  { input: '-9', expected: -9 },
  { input: '-8', expected: -8 },
  { input: '-7', expected: -7 },
  { input: '-6', expected: -6 },
  { input: '-5', expected: -5 },
  { input: '-4', expected: -4 },
  { input: '-3', expected: -3 },
  { input: '-2', expected: -2 },
  { input: '-1', expected: -1 },
  { input: '0', expected: 0 },
  { input: '1', expected: 1 },
  { input: '2', expected: 2 },
  { input: '3', expected: 3 },
  { input: '4', expected: 4 },
  { input: '5', expected: 5 },
  { input: '6', expected: 6 },
  { input: '7', expected: 7 },
  { input: '8', expected: 8 },
  { input: '9', expected: 9 },
  { input: '10', expected: 10 },
  { input: '11', expected: 11 },
  { input: '12', expected: 12 },
  { input: '13', expected: 13 },
  { input: '14', expected: 14 },
  { input: '15', expected: 15 },
  { input: '16', expected: 16 },
  { input: '17', expected: 17 },
  { input: '18', expected: 18 },
  { input: '19', expected: 19 },
  { input: '20', expected: 20 },
  { input: '21', expected: 21 },
  { input: '22', expected: 22 },
  { input: '23', expected: 23 },
  { input: '24', expected: 24 },
  { input: '25', expected: 25 },
  { input: '26', expected: 26 },
  { input: '27', expected: 27 },
  { input: '28', expected: 28 },
  { input: '29', expected: 29 },
  { input: '30', expected: 30 },
  { input: '31', expected: 31 },
  { input: '32', expected: 32 },
  { input: '33', expected: 33 },
  { input: '34', expected: 34 },
  { input: '35', expected: 35 },
  { input: '36', expected: 36 },
  { input: '37', expected: 37 },
  { input: '38', expected: 38 },
  { input: '39', expected: 39 },
  { input: '40', expected: 40 },
  { input: '41', expected: 41 },
  { input: '42', expected: 42 },
  { input: '43', expected: 43 },
  { input: '44', expected: 44 },
  { input: '45', expected: 45 },
  { input: '46', expected: 46 },
  { input: '47', expected: 47 },
  { input: '48', expected: 48 },
  { input: '49', expected: 49 },
  { input: '50', expected: 50 },
  { input: '51', expected: 51 },
  { input: '52', expected: 52 },
  { input: '53', expected: 53 },
  { input: '54', expected: 54 },
  { input: '55', expected: 55 },
  { input: '56', expected: 56 },
  { input: '57', expected: 57 },
  { input: '58', expected: 58 },
  { input: '59', expected: 59 },
  { input: '60', expected: 60 },
  { input: '61', expected: 61 },
  { input: '62', expected: 62 },
  { input: '63', expected: 63 },
  { input: '64', expected: 64 },
  { input: '65', expected: 65 },
  { input: '66', expected: 66 },
  { input: '67', expected: 67 },
  { input: '68', expected: 68 },
  { input: '69', expected: 69 },
  { input: '70', expected: 70 },
  { input: '71', expected: 71 },
  { input: '72', expected: 72 },
  { input: '73', expected: 73 },
  { input: '74', expected: 74 },
  { input: '75', expected: 75 },
  { input: '76', expected: 76 },
  { input: '77', expected: 77 },
  { input: '78', expected: 78 },
  { input: '79', expected: 79 },
  { input: '80', expected: 80 },
  { input: '81', expected: 81 },
  { input: '82', expected: 82 },
  { input: '83', expected: 83 },
  { input: '84', expected: 84 },
  { input: '85', expected: 85 },
  { input: '86', expected: 86 },
  { input: '87', expected: 87 },
  { input: '88', expected: 88 },
  { input: '89', expected: 89 },
  { input: '90', expected: 90 },
  { input: '91', expected: 91 },
  { input: '92', expected: 92 },
  { input: '93', expected: 93 },
  { input: '94', expected: 94 },
  { input: '95', expected: 95 },
  { input: '96', expected: 96 },
  { input: '97', expected: 97 },
  { input: '98', expected: 98 },
  { input: '99', expected: 99 },
  { input: '100', expected: 100 },
  { input: '101', expected: 101 },
  { input: '102', expected: 102 },
  { input: '103', expected: 103 },
  { input: '104', expected: 104 },
  { input: '105', expected: 105 },
  { input: '106', expected: 106 },
  { input: '107', expected: 107 },
  { input: '108', expected: 108 },
  { input: '109', expected: 109 },
  { input: '110', expected: 110 },
  { input: '111', expected: 111 },
  { input: '112', expected: 112 },
  { input: '113', expected: 113 },
  { input: '114', expected: 114 },
  { input: '115', expected: 115 },
  { input: '116', expected: 116 },
  { input: '117', expected: 117 },
  { input: '118', expected: 118 },
  { input: '119', expected: 119 },
  { input: '120', expected: 120 },
  { input: '121', expected: 121 },
  { input: '122', expected: 122 },
  { input: '123', expected: 123 },
  { input: '124', expected: 124 },
  { input: '125', expected: 125 },
  { input: '126', expected: 126 },
  { input: '127', expected: 127 },
  { input: '128', expected: 128 },
  { input: '129', expected: 129 },
  { input: '130', expected: 130 },
  { input: '131', expected: 131 },
  { input: '132', expected: 132 },
  { input: '133', expected: 133 },
  { input: '134', expected: 134 },
  { input: '135', expected: 135 },
  { input: '136', expected: 136 },
  { input: '137', expected: 137 },
  { input: '138', expected: 138 },
  { input: '139', expected: 139 },
  { input: '140', expected: 140 },
  { input: '141', expected: 141 },
  { input: '142', expected: 142 },
  { input: '143', expected: 143 },
  { input: '144', expected: 144 },
  { input: '145', expected: 145 },
  { input: '146', expected: 146 },
  { input: '147', expected: 147 },
  { input: '148', expected: 148 },
  { input: '149', expected: 149 },
  { input: '150', expected: 150 },
];

interface NormalizeTextCase {
  input: string;
  expected: string;
}

const NORMALIZE_TEXT_CASES: NormalizeTextCase[] = [
  { input: '0000', expected: '0' },
  { input: '0001', expected: '1' },
  { input: '0002', expected: '2' },
  { input: '0003', expected: '3' },
  { input: '0004', expected: '4' },
  { input: '0005', expected: '5' },
  { input: '0006', expected: '6' },
  { input: '0007', expected: '7' },
  { input: '0008', expected: '8' },
  { input: '0009', expected: '9' },
  { input: '00010', expected: '10' },
  { input: '00011', expected: '11' },
  { input: '00012', expected: '12' },
  { input: '00013', expected: '13' },
  { input: '00014', expected: '14' },
  { input: '00015', expected: '15' },
  { input: '00016', expected: '16' },
  { input: '00017', expected: '17' },
  { input: '00018', expected: '18' },
  { input: '00019', expected: '19' },
  { input: '00020', expected: '20' },
  { input: '00021', expected: '21' },
  { input: '00022', expected: '22' },
  { input: '00023', expected: '23' },
  { input: '00024', expected: '24' },
  { input: '00025', expected: '25' },
  { input: '00026', expected: '26' },
  { input: '00027', expected: '27' },
  { input: '00028', expected: '28' },
  { input: '00029', expected: '29' },
  { input: '00030', expected: '30' },
  { input: '00031', expected: '31' },
  { input: '00032', expected: '32' },
  { input: '00033', expected: '33' },
  { input: '00034', expected: '34' },
  { input: '00035', expected: '35' },
  { input: '00036', expected: '36' },
  { input: '00037', expected: '37' },
  { input: '00038', expected: '38' },
  { input: '00039', expected: '39' },
  { input: '00040', expected: '40' },
  { input: '00041', expected: '41' },
  { input: '00042', expected: '42' },
  { input: '00043', expected: '43' },
  { input: '00044', expected: '44' },
  { input: '00045', expected: '45' },
  { input: '00046', expected: '46' },
  { input: '00047', expected: '47' },
  { input: '00048', expected: '48' },
  { input: '00049', expected: '49' },
  { input: '00050', expected: '50' },
  { input: '00051', expected: '51' },
  { input: '00052', expected: '52' },
  { input: '00053', expected: '53' },
  { input: '00054', expected: '54' },
  { input: '00055', expected: '55' },
  { input: '00056', expected: '56' },
  { input: '00057', expected: '57' },
  { input: '00058', expected: '58' },
  { input: '00059', expected: '59' },
  { input: '00060', expected: '60' },
  { input: '00061', expected: '61' },
  { input: '00062', expected: '62' },
  { input: '00063', expected: '63' },
  { input: '00064', expected: '64' },
  { input: '00065', expected: '65' },
  { input: '00066', expected: '66' },
  { input: '00067', expected: '67' },
  { input: '00068', expected: '68' },
  { input: '00069', expected: '69' },
  { input: '00070', expected: '70' },
  { input: '00071', expected: '71' },
  { input: '00072', expected: '72' },
  { input: '00073', expected: '73' },
  { input: '00074', expected: '74' },
  { input: '00075', expected: '75' },
  { input: '00076', expected: '76' },
  { input: '00077', expected: '77' },
  { input: '00078', expected: '78' },
  { input: '00079', expected: '79' },
  { input: '00080', expected: '80' },
  { input: '00081', expected: '81' },
  { input: '00082', expected: '82' },
  { input: '00083', expected: '83' },
  { input: '00084', expected: '84' },
  { input: '00085', expected: '85' },
  { input: '00086', expected: '86' },
  { input: '00087', expected: '87' },
  { input: '00088', expected: '88' },
  { input: '00089', expected: '89' },
  { input: '00090', expected: '90' },
  { input: '00091', expected: '91' },
  { input: '00092', expected: '92' },
  { input: '00093', expected: '93' },
  { input: '00094', expected: '94' },
  { input: '00095', expected: '95' },
  { input: '00096', expected: '96' },
  { input: '00097', expected: '97' },
  { input: '00098', expected: '98' },
  { input: '00099', expected: '99' },
  { input: '000100', expected: '100' },
];

interface DigitScanCase {
  input: string;
  digits: string;
  count: number;
}

const DIGIT_SCAN_CASES: DigitScanCase[] = [
  { input: 'a0b0', digits: '00', count: 2 },
  { input: 'a1b1', digits: '11', count: 2 },
  { input: 'a2b2', digits: '22', count: 2 },
  { input: 'a3b3', digits: '33', count: 2 },
  { input: 'a4b4', digits: '44', count: 2 },
  { input: 'a5b5', digits: '55', count: 2 },
  { input: 'a6b6', digits: '66', count: 2 },
  { input: 'a7b7', digits: '77', count: 2 },
  { input: 'a8b8', digits: '88', count: 2 },
  { input: 'a9b9', digits: '99', count: 2 },
  { input: 'a10b10', digits: '1010', count: 4 },
  { input: 'a11b11', digits: '1111', count: 4 },
  { input: 'a12b12', digits: '1212', count: 4 },
  { input: 'a13b13', digits: '1313', count: 4 },
  { input: 'a14b14', digits: '1414', count: 4 },
  { input: 'a15b15', digits: '1515', count: 4 },
  { input: 'a16b16', digits: '1616', count: 4 },
  { input: 'a17b17', digits: '1717', count: 4 },
  { input: 'a18b18', digits: '1818', count: 4 },
  { input: 'a19b19', digits: '1919', count: 4 },
  { input: 'a20b20', digits: '2020', count: 4 },
  { input: 'a21b21', digits: '2121', count: 4 },
  { input: 'a22b22', digits: '2222', count: 4 },
  { input: 'a23b23', digits: '2323', count: 4 },
  { input: 'a24b24', digits: '2424', count: 4 },
  { input: 'a25b25', digits: '2525', count: 4 },
  { input: 'a26b26', digits: '2626', count: 4 },
  { input: 'a27b27', digits: '2727', count: 4 },
  { input: 'a28b28', digits: '2828', count: 4 },
  { input: 'a29b29', digits: '2929', count: 4 },
  { input: 'a30b30', digits: '3030', count: 4 },
  { input: 'a31b31', digits: '3131', count: 4 },
  { input: 'a32b32', digits: '3232', count: 4 },
  { input: 'a33b33', digits: '3333', count: 4 },
  { input: 'a34b34', digits: '3434', count: 4 },
  { input: 'a35b35', digits: '3535', count: 4 },
  { input: 'a36b36', digits: '3636', count: 4 },
  { input: 'a37b37', digits: '3737', count: 4 },
  { input: 'a38b38', digits: '3838', count: 4 },
  { input: 'a39b39', digits: '3939', count: 4 },
  { input: 'a40b40', digits: '4040', count: 4 },
  { input: 'a41b41', digits: '4141', count: 4 },
  { input: 'a42b42', digits: '4242', count: 4 },
  { input: 'a43b43', digits: '4343', count: 4 },
  { input: 'a44b44', digits: '4444', count: 4 },
  { input: 'a45b45', digits: '4545', count: 4 },
  { input: 'a46b46', digits: '4646', count: 4 },
  { input: 'a47b47', digits: '4747', count: 4 },
  { input: 'a48b48', digits: '4848', count: 4 },
  { input: 'a49b49', digits: '4949', count: 4 },
  { input: 'a50b50', digits: '5050', count: 4 },
  { input: 'a51b51', digits: '5151', count: 4 },
  { input: 'a52b52', digits: '5252', count: 4 },
  { input: 'a53b53', digits: '5353', count: 4 },
  { input: 'a54b54', digits: '5454', count: 4 },
  { input: 'a55b55', digits: '5555', count: 4 },
  { input: 'a56b56', digits: '5656', count: 4 },
  { input: 'a57b57', digits: '5757', count: 4 },
  { input: 'a58b58', digits: '5858', count: 4 },
  { input: 'a59b59', digits: '5959', count: 4 },
  { input: 'a60b60', digits: '6060', count: 4 },
  { input: 'a61b61', digits: '6161', count: 4 },
  { input: 'a62b62', digits: '6262', count: 4 },
  { input: 'a63b63', digits: '6363', count: 4 },
  { input: 'a64b64', digits: '6464', count: 4 },
  { input: 'a65b65', digits: '6565', count: 4 },
  { input: 'a66b66', digits: '6666', count: 4 },
  { input: 'a67b67', digits: '6767', count: 4 },
  { input: 'a68b68', digits: '6868', count: 4 },
  { input: 'a69b69', digits: '6969', count: 4 },
  { input: 'a70b70', digits: '7070', count: 4 },
  { input: 'a71b71', digits: '7171', count: 4 },
  { input: 'a72b72', digits: '7272', count: 4 },
  { input: 'a73b73', digits: '7373', count: 4 },
  { input: 'a74b74', digits: '7474', count: 4 },
  { input: 'a75b75', digits: '7575', count: 4 },
  { input: 'a76b76', digits: '7676', count: 4 },
  { input: 'a77b77', digits: '7777', count: 4 },
  { input: 'a78b78', digits: '7878', count: 4 },
  { input: 'a79b79', digits: '7979', count: 4 },
  { input: 'a80b80', digits: '8080', count: 4 },
  { input: 'a81b81', digits: '8181', count: 4 },
  { input: 'a82b82', digits: '8282', count: 4 },
  { input: 'a83b83', digits: '8383', count: 4 },
  { input: 'a84b84', digits: '8484', count: 4 },
  { input: 'a85b85', digits: '8585', count: 4 },
  { input: 'a86b86', digits: '8686', count: 4 },
  { input: 'a87b87', digits: '8787', count: 4 },
  { input: 'a88b88', digits: '8888', count: 4 },
  { input: 'a89b89', digits: '8989', count: 4 },
  { input: 'a90b90', digits: '9090', count: 4 },
  { input: 'a91b91', digits: '9191', count: 4 },
  { input: 'a92b92', digits: '9292', count: 4 },
  { input: 'a93b93', digits: '9393', count: 4 },
  { input: 'a94b94', digits: '9494', count: 4 },
  { input: 'a95b95', digits: '9595', count: 4 },
  { input: 'a96b96', digits: '9696', count: 4 },
  { input: 'a97b97', digits: '9797', count: 4 },
  { input: 'a98b98', digits: '9898', count: 4 },
  { input: 'a99b99', digits: '9999', count: 4 },
  { input: 'a100b100', digits: '100100', count: 6 },
];

export default function numericStringExhaustiveTest() {
  describe('NumericStringExhaustiveTest', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'NumericStringExhaustiveTest suite start');
    });

    afterAll(() => {
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'NumericStringExhaustiveTest suite end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMSTREXH_0100
     * @tc.name      testParseIntegerExhaustive0001
     * @tc.desc      Verify parseInteger accepts every integer text from -150 to 150.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParseIntegerExhaustive0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testParseIntegerExhaustive0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let checked: number = 0;
      for (let i = 0; i < PARSE_INT_CASES.length; i++) {
        const row: ParseIntCase = PARSE_INT_CASES[i];
        expect(NumericStringUtil.parseInteger(row.input, -9999)).assertEqual(row.expected);
        checked = checked + 1;
      }
      expect(checked).assertEqual(301);
      expect(NumericStringUtil.parseInteger('bad', 42)).assertEqual(42);
      expect(NumericStringUtil.parseInteger('', 42)).assertEqual(42);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMSTREXH_0200
     * @tc.name      testNormalizeTextExhaustive0002
     * @tc.desc      Verify normalizeIntegerText removes leading zeros for every value from 0 to 100.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNormalizeTextExhaustive0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNormalizeTextExhaustive0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let checked: number = 0;
      for (let i = 0; i < NORMALIZE_TEXT_CASES.length; i++) {
        const row: NormalizeTextCase = NORMALIZE_TEXT_CASES[i];
        expect(NumericStringUtil.normalizeIntegerText(row.input)).assertEqual(row.expected);
        checked = checked + 1;
      }
      expect(checked).assertEqual(101);
      expect(NumericStringUtil.normalizeIntegerText('-000')).assertEqual('0');
      expect(NumericStringUtil.normalizeIntegerText('+007')).assertEqual('7');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMSTREXH_0300
     * @tc.name      testDigitScanExhaustive0003
     * @tc.desc      Verify digit extraction and counting for every mixed text from 0 to 100.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDigitScanExhaustive0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDigitScanExhaustive0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let checked: number = 0;
      for (let i = 0; i < DIGIT_SCAN_CASES.length; i++) {
        const row: DigitScanCase = DIGIT_SCAN_CASES[i];
        expect(NumericStringUtil.extractDigits(row.input)).assertEqual(row.digits);
        expect(NumericStringUtil.countDigits(row.input)).assertEqual(row.count);
        checked = checked + 1;
      }
      expect(checked).assertEqual(101);
      expect(NumericStringUtil.extractDigits('abc')).assertEqual('');
      expect(NumericStringUtil.countDigits('a1b2c3')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

  });
}
