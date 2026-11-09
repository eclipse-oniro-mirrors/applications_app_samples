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
const SUITE_TAG: string = '[Sample_GeofenceCheckIn_BASICEXH]';

interface CapitalizeCase {
  input: string;
  expected: string;
}

const CAPITALIZE_CASES: CapitalizeCase[] = [
  { input: 'value0', expected: 'Value0' },
  { input: 'value1', expected: 'Value1' },
  { input: 'value2', expected: 'Value2' },
  { input: 'value3', expected: 'Value3' },
  { input: 'value4', expected: 'Value4' },
  { input: 'value5', expected: 'Value5' },
  { input: 'value6', expected: 'Value6' },
  { input: 'value7', expected: 'Value7' },
  { input: 'value8', expected: 'Value8' },
  { input: 'value9', expected: 'Value9' },
  { input: 'value10', expected: 'Value10' },
  { input: 'value11', expected: 'Value11' },
  { input: 'value12', expected: 'Value12' },
  { input: 'value13', expected: 'Value13' },
  { input: 'value14', expected: 'Value14' },
  { input: 'value15', expected: 'Value15' },
  { input: 'value16', expected: 'Value16' },
  { input: 'value17', expected: 'Value17' },
  { input: 'value18', expected: 'Value18' },
  { input: 'value19', expected: 'Value19' },
  { input: 'value20', expected: 'Value20' },
  { input: 'value21', expected: 'Value21' },
  { input: 'value22', expected: 'Value22' },
  { input: 'value23', expected: 'Value23' },
  { input: 'value24', expected: 'Value24' },
  { input: 'value25', expected: 'Value25' },
  { input: 'value26', expected: 'Value26' },
  { input: 'value27', expected: 'Value27' },
  { input: 'value28', expected: 'Value28' },
  { input: 'value29', expected: 'Value29' },
  { input: 'value30', expected: 'Value30' },
  { input: 'value31', expected: 'Value31' },
  { input: 'value32', expected: 'Value32' },
  { input: 'value33', expected: 'Value33' },
  { input: 'value34', expected: 'Value34' },
  { input: 'value35', expected: 'Value35' },
  { input: 'value36', expected: 'Value36' },
  { input: 'value37', expected: 'Value37' },
  { input: 'value38', expected: 'Value38' },
  { input: 'value39', expected: 'Value39' },
  { input: 'value40', expected: 'Value40' },
  { input: 'value41', expected: 'Value41' },
  { input: 'value42', expected: 'Value42' },
  { input: 'value43', expected: 'Value43' },
  { input: 'value44', expected: 'Value44' },
  { input: 'value45', expected: 'Value45' },
  { input: 'value46', expected: 'Value46' },
  { input: 'value47', expected: 'Value47' },
  { input: 'value48', expected: 'Value48' },
  { input: 'value49', expected: 'Value49' },
  { input: 'value50', expected: 'Value50' },
  { input: 'value51', expected: 'Value51' },
  { input: 'value52', expected: 'Value52' },
  { input: 'value53', expected: 'Value53' },
  { input: 'value54', expected: 'Value54' },
  { input: 'value55', expected: 'Value55' },
  { input: 'value56', expected: 'Value56' },
  { input: 'value57', expected: 'Value57' },
  { input: 'value58', expected: 'Value58' },
  { input: 'value59', expected: 'Value59' },
  { input: 'value60', expected: 'Value60' },
  { input: 'value61', expected: 'Value61' },
  { input: 'value62', expected: 'Value62' },
  { input: 'value63', expected: 'Value63' },
  { input: 'value64', expected: 'Value64' },
  { input: 'value65', expected: 'Value65' },
  { input: 'value66', expected: 'Value66' },
  { input: 'value67', expected: 'Value67' },
  { input: 'value68', expected: 'Value68' },
  { input: 'value69', expected: 'Value69' },
  { input: 'value70', expected: 'Value70' },
  { input: 'value71', expected: 'Value71' },
  { input: 'value72', expected: 'Value72' },
  { input: 'value73', expected: 'Value73' },
  { input: 'value74', expected: 'Value74' },
  { input: 'value75', expected: 'Value75' },
  { input: 'value76', expected: 'Value76' },
  { input: 'value77', expected: 'Value77' },
  { input: 'value78', expected: 'Value78' },
  { input: 'value79', expected: 'Value79' },
  { input: 'value80', expected: 'Value80' },
  { input: 'value81', expected: 'Value81' },
  { input: 'value82', expected: 'Value82' },
  { input: 'value83', expected: 'Value83' },
  { input: 'value84', expected: 'Value84' },
  { input: 'value85', expected: 'Value85' },
  { input: 'value86', expected: 'Value86' },
  { input: 'value87', expected: 'Value87' },
  { input: 'value88', expected: 'Value88' },
  { input: 'value89', expected: 'Value89' },
  { input: 'value90', expected: 'Value90' },
  { input: 'value91', expected: 'Value91' },
  { input: 'value92', expected: 'Value92' },
  { input: 'value93', expected: 'Value93' },
  { input: 'value94', expected: 'Value94' },
  { input: 'value95', expected: 'Value95' },
  { input: 'value96', expected: 'Value96' },
  { input: 'value97', expected: 'Value97' },
  { input: 'value98', expected: 'Value98' },
  { input: 'value99', expected: 'Value99' },
];

interface ReverseCase {
  input: string;
  expected: string;
}

const REVERSE_CASES: ReverseCase[] = [
  { input: 'abc0', expected: '0cba' },
  { input: 'abc1', expected: '1cba' },
  { input: 'abc2', expected: '2cba' },
  { input: 'abc3', expected: '3cba' },
  { input: 'abc4', expected: '4cba' },
  { input: 'abc5', expected: '5cba' },
  { input: 'abc6', expected: '6cba' },
  { input: 'abc7', expected: '7cba' },
  { input: 'abc8', expected: '8cba' },
  { input: 'abc9', expected: '9cba' },
  { input: 'abc10', expected: '01cba' },
  { input: 'abc11', expected: '11cba' },
  { input: 'abc12', expected: '21cba' },
  { input: 'abc13', expected: '31cba' },
  { input: 'abc14', expected: '41cba' },
  { input: 'abc15', expected: '51cba' },
  { input: 'abc16', expected: '61cba' },
  { input: 'abc17', expected: '71cba' },
  { input: 'abc18', expected: '81cba' },
  { input: 'abc19', expected: '91cba' },
  { input: 'abc20', expected: '02cba' },
  { input: 'abc21', expected: '12cba' },
  { input: 'abc22', expected: '22cba' },
  { input: 'abc23', expected: '32cba' },
  { input: 'abc24', expected: '42cba' },
  { input: 'abc25', expected: '52cba' },
  { input: 'abc26', expected: '62cba' },
  { input: 'abc27', expected: '72cba' },
  { input: 'abc28', expected: '82cba' },
  { input: 'abc29', expected: '92cba' },
  { input: 'abc30', expected: '03cba' },
  { input: 'abc31', expected: '13cba' },
  { input: 'abc32', expected: '23cba' },
  { input: 'abc33', expected: '33cba' },
  { input: 'abc34', expected: '43cba' },
  { input: 'abc35', expected: '53cba' },
  { input: 'abc36', expected: '63cba' },
  { input: 'abc37', expected: '73cba' },
  { input: 'abc38', expected: '83cba' },
  { input: 'abc39', expected: '93cba' },
  { input: 'abc40', expected: '04cba' },
  { input: 'abc41', expected: '14cba' },
  { input: 'abc42', expected: '24cba' },
  { input: 'abc43', expected: '34cba' },
  { input: 'abc44', expected: '44cba' },
  { input: 'abc45', expected: '54cba' },
  { input: 'abc46', expected: '64cba' },
  { input: 'abc47', expected: '74cba' },
  { input: 'abc48', expected: '84cba' },
  { input: 'abc49', expected: '94cba' },
  { input: 'abc50', expected: '05cba' },
  { input: 'abc51', expected: '15cba' },
  { input: 'abc52', expected: '25cba' },
  { input: 'abc53', expected: '35cba' },
  { input: 'abc54', expected: '45cba' },
  { input: 'abc55', expected: '55cba' },
  { input: 'abc56', expected: '65cba' },
  { input: 'abc57', expected: '75cba' },
  { input: 'abc58', expected: '85cba' },
  { input: 'abc59', expected: '95cba' },
  { input: 'abc60', expected: '06cba' },
  { input: 'abc61', expected: '16cba' },
  { input: 'abc62', expected: '26cba' },
  { input: 'abc63', expected: '36cba' },
  { input: 'abc64', expected: '46cba' },
  { input: 'abc65', expected: '56cba' },
  { input: 'abc66', expected: '66cba' },
  { input: 'abc67', expected: '76cba' },
  { input: 'abc68', expected: '86cba' },
  { input: 'abc69', expected: '96cba' },
  { input: 'abc70', expected: '07cba' },
  { input: 'abc71', expected: '17cba' },
  { input: 'abc72', expected: '27cba' },
  { input: 'abc73', expected: '37cba' },
  { input: 'abc74', expected: '47cba' },
  { input: 'abc75', expected: '57cba' },
  { input: 'abc76', expected: '67cba' },
  { input: 'abc77', expected: '77cba' },
  { input: 'abc78', expected: '87cba' },
  { input: 'abc79', expected: '97cba' },
  { input: 'abc80', expected: '08cba' },
  { input: 'abc81', expected: '18cba' },
  { input: 'abc82', expected: '28cba' },
  { input: 'abc83', expected: '38cba' },
  { input: 'abc84', expected: '48cba' },
  { input: 'abc85', expected: '58cba' },
  { input: 'abc86', expected: '68cba' },
  { input: 'abc87', expected: '78cba' },
  { input: 'abc88', expected: '88cba' },
  { input: 'abc89', expected: '98cba' },
  { input: 'abc90', expected: '09cba' },
  { input: 'abc91', expected: '19cba' },
  { input: 'abc92', expected: '29cba' },
  { input: 'abc93', expected: '39cba' },
  { input: 'abc94', expected: '49cba' },
  { input: 'abc95', expected: '59cba' },
  { input: 'abc96', expected: '69cba' },
  { input: 'abc97', expected: '79cba' },
  { input: 'abc98', expected: '89cba' },
  { input: 'abc99', expected: '99cba' },
];

interface CountCase {
  input: string;
  target: string;
  expected: number;
}

const COUNT_CASES: CountCase[] = [
  { input: 'a0b0c', target: '0', expected: 2 },
  { input: 'a1b1c', target: '1', expected: 2 },
  { input: 'a2b2c', target: '2', expected: 2 },
  { input: 'a3b3c', target: '3', expected: 2 },
  { input: 'a4b4c', target: '4', expected: 2 },
  { input: 'a5b5c', target: '5', expected: 2 },
  { input: 'a6b6c', target: '6', expected: 2 },
  { input: 'a7b7c', target: '7', expected: 2 },
  { input: 'a8b8c', target: '8', expected: 2 },
  { input: 'a9b9c', target: '9', expected: 2 },
  { input: 'a10b10c', target: '10', expected: 2 },
  { input: 'a11b11c', target: '11', expected: 2 },
  { input: 'a12b12c', target: '12', expected: 2 },
  { input: 'a13b13c', target: '13', expected: 2 },
  { input: 'a14b14c', target: '14', expected: 2 },
  { input: 'a15b15c', target: '15', expected: 2 },
  { input: 'a16b16c', target: '16', expected: 2 },
  { input: 'a17b17c', target: '17', expected: 2 },
  { input: 'a18b18c', target: '18', expected: 2 },
  { input: 'a19b19c', target: '19', expected: 2 },
  { input: 'a20b20c', target: '20', expected: 2 },
  { input: 'a21b21c', target: '21', expected: 2 },
  { input: 'a22b22c', target: '22', expected: 2 },
  { input: 'a23b23c', target: '23', expected: 2 },
  { input: 'a24b24c', target: '24', expected: 2 },
  { input: 'a25b25c', target: '25', expected: 2 },
  { input: 'a26b26c', target: '26', expected: 2 },
  { input: 'a27b27c', target: '27', expected: 2 },
  { input: 'a28b28c', target: '28', expected: 2 },
  { input: 'a29b29c', target: '29', expected: 2 },
  { input: 'a30b30c', target: '30', expected: 2 },
  { input: 'a31b31c', target: '31', expected: 2 },
  { input: 'a32b32c', target: '32', expected: 2 },
  { input: 'a33b33c', target: '33', expected: 2 },
  { input: 'a34b34c', target: '34', expected: 2 },
  { input: 'a35b35c', target: '35', expected: 2 },
  { input: 'a36b36c', target: '36', expected: 2 },
  { input: 'a37b37c', target: '37', expected: 2 },
  { input: 'a38b38c', target: '38', expected: 2 },
  { input: 'a39b39c', target: '39', expected: 2 },
  { input: 'a40b40c', target: '40', expected: 2 },
  { input: 'a41b41c', target: '41', expected: 2 },
  { input: 'a42b42c', target: '42', expected: 2 },
  { input: 'a43b43c', target: '43', expected: 2 },
  { input: 'a44b44c', target: '44', expected: 2 },
  { input: 'a45b45c', target: '45', expected: 2 },
  { input: 'a46b46c', target: '46', expected: 2 },
  { input: 'a47b47c', target: '47', expected: 2 },
  { input: 'a48b48c', target: '48', expected: 2 },
  { input: 'a49b49c', target: '49', expected: 2 },
  { input: 'a50b50c', target: '50', expected: 2 },
  { input: 'a51b51c', target: '51', expected: 2 },
  { input: 'a52b52c', target: '52', expected: 2 },
  { input: 'a53b53c', target: '53', expected: 2 },
  { input: 'a54b54c', target: '54', expected: 2 },
  { input: 'a55b55c', target: '55', expected: 2 },
  { input: 'a56b56c', target: '56', expected: 2 },
  { input: 'a57b57c', target: '57', expected: 2 },
  { input: 'a58b58c', target: '58', expected: 2 },
  { input: 'a59b59c', target: '59', expected: 2 },
  { input: 'a60b60c', target: '60', expected: 2 },
  { input: 'a61b61c', target: '61', expected: 2 },
  { input: 'a62b62c', target: '62', expected: 2 },
  { input: 'a63b63c', target: '63', expected: 2 },
  { input: 'a64b64c', target: '64', expected: 2 },
  { input: 'a65b65c', target: '65', expected: 2 },
  { input: 'a66b66c', target: '66', expected: 2 },
  { input: 'a67b67c', target: '67', expected: 2 },
  { input: 'a68b68c', target: '68', expected: 2 },
  { input: 'a69b69c', target: '69', expected: 2 },
  { input: 'a70b70c', target: '70', expected: 2 },
  { input: 'a71b71c', target: '71', expected: 2 },
  { input: 'a72b72c', target: '72', expected: 2 },
  { input: 'a73b73c', target: '73', expected: 2 },
  { input: 'a74b74c', target: '74', expected: 2 },
  { input: 'a75b75c', target: '75', expected: 2 },
  { input: 'a76b76c', target: '76', expected: 2 },
  { input: 'a77b77c', target: '77', expected: 2 },
  { input: 'a78b78c', target: '78', expected: 2 },
  { input: 'a79b79c', target: '79', expected: 2 },
  { input: 'a80b80c', target: '80', expected: 2 },
  { input: 'a81b81c', target: '81', expected: 2 },
  { input: 'a82b82c', target: '82', expected: 2 },
  { input: 'a83b83c', target: '83', expected: 2 },
  { input: 'a84b84c', target: '84', expected: 2 },
  { input: 'a85b85c', target: '85', expected: 2 },
  { input: 'a86b86c', target: '86', expected: 2 },
  { input: 'a87b87c', target: '87', expected: 2 },
  { input: 'a88b88c', target: '88', expected: 2 },
  { input: 'a89b89c', target: '89', expected: 2 },
  { input: 'a90b90c', target: '90', expected: 2 },
  { input: 'a91b91c', target: '91', expected: 2 },
  { input: 'a92b92c', target: '92', expected: 2 },
  { input: 'a93b93c', target: '93', expected: 2 },
  { input: 'a94b94c', target: '94', expected: 2 },
  { input: 'a95b95c', target: '95', expected: 2 },
  { input: 'a96b96c', target: '96', expected: 2 },
  { input: 'a97b97c', target: '97', expected: 2 },
  { input: 'a98b98c', target: '98', expected: 2 },
  { input: 'a99b99c', target: '99', expected: 2 },
];

interface TrimCase {
  input: string;
  expected: string;
}

const TRIM_CASES: TrimCase[] = [
  { input: '  value0  ', expected: 'value0' },
  { input: '  value1  ', expected: 'value1' },
  { input: '  value2  ', expected: 'value2' },
  { input: '  value3  ', expected: 'value3' },
  { input: '  value4  ', expected: 'value4' },
  { input: '  value5  ', expected: 'value5' },
  { input: '  value6  ', expected: 'value6' },
  { input: '  value7  ', expected: 'value7' },
  { input: '  value8  ', expected: 'value8' },
  { input: '  value9  ', expected: 'value9' },
  { input: '  value10  ', expected: 'value10' },
  { input: '  value11  ', expected: 'value11' },
  { input: '  value12  ', expected: 'value12' },
  { input: '  value13  ', expected: 'value13' },
  { input: '  value14  ', expected: 'value14' },
  { input: '  value15  ', expected: 'value15' },
  { input: '  value16  ', expected: 'value16' },
  { input: '  value17  ', expected: 'value17' },
  { input: '  value18  ', expected: 'value18' },
  { input: '  value19  ', expected: 'value19' },
  { input: '  value20  ', expected: 'value20' },
  { input: '  value21  ', expected: 'value21' },
  { input: '  value22  ', expected: 'value22' },
  { input: '  value23  ', expected: 'value23' },
  { input: '  value24  ', expected: 'value24' },
  { input: '  value25  ', expected: 'value25' },
  { input: '  value26  ', expected: 'value26' },
  { input: '  value27  ', expected: 'value27' },
  { input: '  value28  ', expected: 'value28' },
  { input: '  value29  ', expected: 'value29' },
  { input: '  value30  ', expected: 'value30' },
  { input: '  value31  ', expected: 'value31' },
  { input: '  value32  ', expected: 'value32' },
  { input: '  value33  ', expected: 'value33' },
  { input: '  value34  ', expected: 'value34' },
  { input: '  value35  ', expected: 'value35' },
  { input: '  value36  ', expected: 'value36' },
  { input: '  value37  ', expected: 'value37' },
  { input: '  value38  ', expected: 'value38' },
  { input: '  value39  ', expected: 'value39' },
  { input: '  value40  ', expected: 'value40' },
  { input: '  value41  ', expected: 'value41' },
  { input: '  value42  ', expected: 'value42' },
  { input: '  value43  ', expected: 'value43' },
  { input: '  value44  ', expected: 'value44' },
  { input: '  value45  ', expected: 'value45' },
  { input: '  value46  ', expected: 'value46' },
  { input: '  value47  ', expected: 'value47' },
  { input: '  value48  ', expected: 'value48' },
  { input: '  value49  ', expected: 'value49' },
  { input: '  value50  ', expected: 'value50' },
  { input: '  value51  ', expected: 'value51' },
  { input: '  value52  ', expected: 'value52' },
  { input: '  value53  ', expected: 'value53' },
  { input: '  value54  ', expected: 'value54' },
  { input: '  value55  ', expected: 'value55' },
  { input: '  value56  ', expected: 'value56' },
  { input: '  value57  ', expected: 'value57' },
  { input: '  value58  ', expected: 'value58' },
  { input: '  value59  ', expected: 'value59' },
  { input: '  value60  ', expected: 'value60' },
  { input: '  value61  ', expected: 'value61' },
  { input: '  value62  ', expected: 'value62' },
  { input: '  value63  ', expected: 'value63' },
  { input: '  value64  ', expected: 'value64' },
  { input: '  value65  ', expected: 'value65' },
  { input: '  value66  ', expected: 'value66' },
  { input: '  value67  ', expected: 'value67' },
  { input: '  value68  ', expected: 'value68' },
  { input: '  value69  ', expected: 'value69' },
  { input: '  value70  ', expected: 'value70' },
  { input: '  value71  ', expected: 'value71' },
  { input: '  value72  ', expected: 'value72' },
  { input: '  value73  ', expected: 'value73' },
  { input: '  value74  ', expected: 'value74' },
  { input: '  value75  ', expected: 'value75' },
  { input: '  value76  ', expected: 'value76' },
  { input: '  value77  ', expected: 'value77' },
  { input: '  value78  ', expected: 'value78' },
  { input: '  value79  ', expected: 'value79' },
  { input: '  value80  ', expected: 'value80' },
  { input: '  value81  ', expected: 'value81' },
  { input: '  value82  ', expected: 'value82' },
  { input: '  value83  ', expected: 'value83' },
  { input: '  value84  ', expected: 'value84' },
  { input: '  value85  ', expected: 'value85' },
  { input: '  value86  ', expected: 'value86' },
  { input: '  value87  ', expected: 'value87' },
  { input: '  value88  ', expected: 'value88' },
  { input: '  value89  ', expected: 'value89' },
  { input: '  value90  ', expected: 'value90' },
  { input: '  value91  ', expected: 'value91' },
  { input: '  value92  ', expected: 'value92' },
  { input: '  value93  ', expected: 'value93' },
  { input: '  value94  ', expected: 'value94' },
  { input: '  value95  ', expected: 'value95' },
  { input: '  value96  ', expected: 'value96' },
  { input: '  value97  ', expected: 'value97' },
  { input: '  value98  ', expected: 'value98' },
  { input: '  value99  ', expected: 'value99' },
];

export default function basicUtilStringExhaustiveTest() {
  describe('BasicUtilStringExhaustiveTest', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'BasicUtilStringExhaustiveTest suite start');
    });

    afterAll(() => {
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'BasicUtilStringExhaustiveTest suite end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_BASICEXH_0100
     * @tc.name      testCapitalizeExhaustive0001
     * @tc.desc      Verify capitalize uppercases the first character for one hundred generated texts.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCapitalizeExhaustive0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCapitalizeExhaustive0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let checked: number = 0;
      for (let i = 0; i < CAPITALIZE_CASES.length; i++) {
        const row: CapitalizeCase = CAPITALIZE_CASES[i];
        expect(BasicUtil.capitalize(row.input)).assertEqual(row.expected);
        checked = checked + 1;
      }
      expect(checked).assertEqual(100);
      expect(BasicUtil.capitalize('')).assertEqual('');
      expect(BasicUtil.capitalize('aBc')).assertEqual('ABc');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_BASICEXH_0200
     * @tc.name      testReverseExhaustive0002
     * @tc.desc      Verify reverseString for one hundred generated texts and the double reversal invariant.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testReverseExhaustive0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testReverseExhaustive0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let checked: number = 0;
      for (let i = 0; i < REVERSE_CASES.length; i++) {
        const row: ReverseCase = REVERSE_CASES[i];
        expect(BasicUtil.reverseString(row.input)).assertEqual(row.expected);
        expect(BasicUtil.reverseString(BasicUtil.reverseString(row.input))).assertEqual(row.input);
        checked = checked + 1;
      }
      expect(checked).assertEqual(100);
      expect(BasicUtil.reverseString('')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_BASICEXH_0300
     * @tc.name      testCountExhaustive0003
     * @tc.desc      Verify countOccurrences counts every generated repeated substring exactly twice.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCountExhaustive0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCountExhaustive0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let checked: number = 0;
      for (let i = 0; i < COUNT_CASES.length; i++) {
        const row: CountCase = COUNT_CASES[i];
        expect(BasicUtil.countOccurrences(row.input, row.target)).assertEqual(row.expected);
        checked = checked + 1;
      }
      expect(checked).assertEqual(100);
      expect(BasicUtil.countOccurrences('abc', '')).assertEqual(0);
      expect(BasicUtil.countOccurrences('aaa', 'aa')).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_BASICEXH_0400
     * @tc.name      testTrimExhaustive0004
     * @tc.desc      Verify trimSafe removes leading and trailing spaces for one hundred generated texts.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testTrimExhaustive0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testTrimExhaustive0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let checked: number = 0;
      for (let i = 0; i < TRIM_CASES.length; i++) {
        const row: TrimCase = TRIM_CASES[i];
        expect(BasicUtil.trimSafe(row.input)).assertEqual(row.expected);
        expect(BasicUtil.isBlank(row.input)).assertFalse();
        checked = checked + 1;
      }
      expect(checked).assertEqual(100);
      expect(BasicUtil.trimSafe(undefined)).assertEqual('');
      expect(BasicUtil.isBlank('   ')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

  });
}
