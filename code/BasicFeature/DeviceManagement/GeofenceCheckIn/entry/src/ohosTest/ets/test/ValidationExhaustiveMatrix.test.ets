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
const SUITE_TAG: string = '[Sample_GeofenceCheckIn_VALEXH]';

interface EmailCase {
  input: string;
  expected: boolean;
}

const EMAIL_CASES: EmailCase[] = [
  { input: 'user0@example.com', expected: true },
  { input: 'user1@example.com', expected: true },
  { input: 'user2@example.com', expected: true },
  { input: 'user3@example.com', expected: true },
  { input: 'user4@example.com', expected: true },
  { input: 'user5@example.com', expected: true },
  { input: 'user6@example.com', expected: true },
  { input: 'user7@example.com', expected: true },
  { input: 'user8@example.com', expected: true },
  { input: 'user9@example.com', expected: true },
  { input: 'user10@example.com', expected: true },
  { input: 'user11@example.com', expected: true },
  { input: 'user12@example.com', expected: true },
  { input: 'user13@example.com', expected: true },
  { input: 'user14@example.com', expected: true },
  { input: 'user15@example.com', expected: true },
  { input: 'user16@example.com', expected: true },
  { input: 'user17@example.com', expected: true },
  { input: 'user18@example.com', expected: true },
  { input: 'user19@example.com', expected: true },
  { input: 'user20@example.com', expected: true },
  { input: 'user21@example.com', expected: true },
  { input: 'user22@example.com', expected: true },
  { input: 'user23@example.com', expected: true },
  { input: 'user24@example.com', expected: true },
  { input: 'user25@example.com', expected: true },
  { input: 'user26@example.com', expected: true },
  { input: 'user27@example.com', expected: true },
  { input: 'user28@example.com', expected: true },
  { input: 'user29@example.com', expected: true },
  { input: 'user30@example.com', expected: true },
  { input: 'user31@example.com', expected: true },
  { input: 'user32@example.com', expected: true },
  { input: 'user33@example.com', expected: true },
  { input: 'user34@example.com', expected: true },
  { input: 'user35@example.com', expected: true },
  { input: 'user36@example.com', expected: true },
  { input: 'user37@example.com', expected: true },
  { input: 'user38@example.com', expected: true },
  { input: 'user39@example.com', expected: true },
  { input: 'user40@example.com', expected: true },
  { input: 'user41@example.com', expected: true },
  { input: 'user42@example.com', expected: true },
  { input: 'user43@example.com', expected: true },
  { input: 'user44@example.com', expected: true },
  { input: 'user45@example.com', expected: true },
  { input: 'user46@example.com', expected: true },
  { input: 'user47@example.com', expected: true },
  { input: 'user48@example.com', expected: true },
  { input: 'user49@example.com', expected: true },
  { input: 'user50@example.com', expected: true },
  { input: 'user51@example.com', expected: true },
  { input: 'user52@example.com', expected: true },
  { input: 'user53@example.com', expected: true },
  { input: 'user54@example.com', expected: true },
  { input: 'user55@example.com', expected: true },
  { input: 'user56@example.com', expected: true },
  { input: 'user57@example.com', expected: true },
  { input: 'user58@example.com', expected: true },
  { input: 'user59@example.com', expected: true },
  { input: 'user60@example.com', expected: true },
  { input: 'user61@example.com', expected: true },
  { input: 'user62@example.com', expected: true },
  { input: 'user63@example.com', expected: true },
  { input: 'user64@example.com', expected: true },
  { input: 'user65@example.com', expected: true },
  { input: 'user66@example.com', expected: true },
  { input: 'user67@example.com', expected: true },
  { input: 'user68@example.com', expected: true },
  { input: 'user69@example.com', expected: true },
  { input: 'user70@example.com', expected: true },
  { input: 'user71@example.com', expected: true },
  { input: 'user72@example.com', expected: true },
  { input: 'user73@example.com', expected: true },
  { input: 'user74@example.com', expected: true },
  { input: 'user75@example.com', expected: true },
  { input: 'user76@example.com', expected: true },
  { input: 'user77@example.com', expected: true },
  { input: 'user78@example.com', expected: true },
  { input: 'user79@example.com', expected: true },
  { input: 'user80@example.com', expected: true },
  { input: 'user81@example.com', expected: true },
  { input: 'user82@example.com', expected: true },
  { input: 'user83@example.com', expected: true },
  { input: 'user84@example.com', expected: true },
  { input: 'user85@example.com', expected: true },
  { input: 'user86@example.com', expected: true },
  { input: 'user87@example.com', expected: true },
  { input: 'user88@example.com', expected: true },
  { input: 'user89@example.com', expected: true },
  { input: 'user90@example.com', expected: true },
  { input: 'user91@example.com', expected: true },
  { input: 'user92@example.com', expected: true },
  { input: 'user93@example.com', expected: true },
  { input: 'user94@example.com', expected: true },
  { input: 'user95@example.com', expected: true },
  { input: 'user96@example.com', expected: true },
  { input: 'user97@example.com', expected: true },
  { input: 'user98@example.com', expected: true },
  { input: 'user99@example.com', expected: true },
  { input: 'user0@sub.example.org', expected: true },
  { input: 'user1@sub.example.org', expected: true },
  { input: 'user2@sub.example.org', expected: true },
  { input: 'user3@sub.example.org', expected: true },
  { input: 'user4@sub.example.org', expected: true },
  { input: 'user5@sub.example.org', expected: true },
  { input: 'user6@sub.example.org', expected: true },
  { input: 'user7@sub.example.org', expected: true },
  { input: 'user8@sub.example.org', expected: true },
  { input: 'user9@sub.example.org', expected: true },
  { input: 'user10@sub.example.org', expected: true },
  { input: 'user11@sub.example.org', expected: true },
  { input: 'user12@sub.example.org', expected: true },
  { input: 'user13@sub.example.org', expected: true },
  { input: 'user14@sub.example.org', expected: true },
  { input: 'user15@sub.example.org', expected: true },
  { input: 'user16@sub.example.org', expected: true },
  { input: 'user17@sub.example.org', expected: true },
  { input: 'user18@sub.example.org', expected: true },
  { input: 'user19@sub.example.org', expected: true },
  { input: 'user20@sub.example.org', expected: true },
  { input: 'user21@sub.example.org', expected: true },
  { input: 'user22@sub.example.org', expected: true },
  { input: 'user23@sub.example.org', expected: true },
  { input: 'user24@sub.example.org', expected: true },
  { input: 'user25@sub.example.org', expected: true },
  { input: 'user26@sub.example.org', expected: true },
  { input: 'user27@sub.example.org', expected: true },
  { input: 'user28@sub.example.org', expected: true },
  { input: 'user29@sub.example.org', expected: true },
  { input: 'user30@sub.example.org', expected: true },
  { input: 'user31@sub.example.org', expected: true },
  { input: 'user32@sub.example.org', expected: true },
  { input: 'user33@sub.example.org', expected: true },
  { input: 'user34@sub.example.org', expected: true },
  { input: 'user35@sub.example.org', expected: true },
  { input: 'user36@sub.example.org', expected: true },
  { input: 'user37@sub.example.org', expected: true },
  { input: 'user38@sub.example.org', expected: true },
  { input: 'user39@sub.example.org', expected: true },
  { input: 'user40@sub.example.org', expected: true },
  { input: 'user41@sub.example.org', expected: true },
  { input: 'user42@sub.example.org', expected: true },
  { input: 'user43@sub.example.org', expected: true },
  { input: 'user44@sub.example.org', expected: true },
  { input: 'user45@sub.example.org', expected: true },
  { input: 'user46@sub.example.org', expected: true },
  { input: 'user47@sub.example.org', expected: true },
  { input: 'user48@sub.example.org', expected: true },
  { input: 'user49@sub.example.org', expected: true },
  { input: 'bad0', expected: false },
  { input: 'bad1', expected: false },
  { input: 'bad2', expected: false },
  { input: 'bad3', expected: false },
  { input: 'bad4', expected: false },
  { input: 'bad5', expected: false },
  { input: 'bad6', expected: false },
  { input: 'bad7', expected: false },
  { input: 'bad8', expected: false },
  { input: 'bad9', expected: false },
  { input: 'bad10', expected: false },
  { input: 'bad11', expected: false },
  { input: 'bad12', expected: false },
  { input: 'bad13', expected: false },
  { input: 'bad14', expected: false },
  { input: 'bad15', expected: false },
  { input: 'bad16', expected: false },
  { input: 'bad17', expected: false },
  { input: 'bad18', expected: false },
  { input: 'bad19', expected: false },
  { input: 'bad20', expected: false },
  { input: 'bad21', expected: false },
  { input: 'bad22', expected: false },
  { input: 'bad23', expected: false },
  { input: 'bad24', expected: false },
  { input: 'bad25', expected: false },
  { input: 'bad26', expected: false },
  { input: 'bad27', expected: false },
  { input: 'bad28', expected: false },
  { input: 'bad29', expected: false },
  { input: 'bad30', expected: false },
  { input: 'bad31', expected: false },
  { input: 'bad32', expected: false },
  { input: 'bad33', expected: false },
  { input: 'bad34', expected: false },
  { input: 'bad35', expected: false },
  { input: 'bad36', expected: false },
  { input: 'bad37', expected: false },
  { input: 'bad38', expected: false },
  { input: 'bad39', expected: false },
  { input: 'bad40', expected: false },
  { input: 'bad41', expected: false },
  { input: 'bad42', expected: false },
  { input: 'bad43', expected: false },
  { input: 'bad44', expected: false },
  { input: 'bad45', expected: false },
  { input: 'bad46', expected: false },
  { input: 'bad47', expected: false },
  { input: 'bad48', expected: false },
  { input: 'bad49', expected: false },
  { input: 'user0@', expected: false },
  { input: 'user1@', expected: false },
  { input: 'user2@', expected: false },
  { input: 'user3@', expected: false },
  { input: 'user4@', expected: false },
  { input: 'user5@', expected: false },
  { input: 'user6@', expected: false },
  { input: 'user7@', expected: false },
  { input: 'user8@', expected: false },
  { input: 'user9@', expected: false },
  { input: 'user10@', expected: false },
  { input: 'user11@', expected: false },
  { input: 'user12@', expected: false },
  { input: 'user13@', expected: false },
  { input: 'user14@', expected: false },
  { input: 'user15@', expected: false },
  { input: 'user16@', expected: false },
  { input: 'user17@', expected: false },
  { input: 'user18@', expected: false },
  { input: 'user19@', expected: false },
  { input: 'user20@', expected: false },
  { input: 'user21@', expected: false },
  { input: 'user22@', expected: false },
  { input: 'user23@', expected: false },
  { input: 'user24@', expected: false },
  { input: 'user25@', expected: false },
  { input: 'user26@', expected: false },
  { input: 'user27@', expected: false },
  { input: 'user28@', expected: false },
  { input: 'user29@', expected: false },
  { input: 'user30@', expected: false },
  { input: 'user31@', expected: false },
  { input: 'user32@', expected: false },
  { input: 'user33@', expected: false },
  { input: 'user34@', expected: false },
  { input: 'user35@', expected: false },
  { input: 'user36@', expected: false },
  { input: 'user37@', expected: false },
  { input: 'user38@', expected: false },
  { input: 'user39@', expected: false },
  { input: 'user40@', expected: false },
  { input: 'user41@', expected: false },
  { input: 'user42@', expected: false },
  { input: 'user43@', expected: false },
  { input: 'user44@', expected: false },
  { input: 'user45@', expected: false },
  { input: 'user46@', expected: false },
  { input: 'user47@', expected: false },
  { input: 'user48@', expected: false },
  { input: 'user49@', expected: false },
  { input: '@example0.com', expected: false },
  { input: '@example1.com', expected: false },
  { input: '@example2.com', expected: false },
  { input: '@example3.com', expected: false },
  { input: '@example4.com', expected: false },
  { input: '@example5.com', expected: false },
  { input: '@example6.com', expected: false },
  { input: '@example7.com', expected: false },
  { input: '@example8.com', expected: false },
  { input: '@example9.com', expected: false },
  { input: '@example10.com', expected: false },
  { input: '@example11.com', expected: false },
  { input: '@example12.com', expected: false },
  { input: '@example13.com', expected: false },
  { input: '@example14.com', expected: false },
  { input: '@example15.com', expected: false },
  { input: '@example16.com', expected: false },
  { input: '@example17.com', expected: false },
  { input: '@example18.com', expected: false },
  { input: '@example19.com', expected: false },
  { input: '@example20.com', expected: false },
  { input: '@example21.com', expected: false },
  { input: '@example22.com', expected: false },
  { input: '@example23.com', expected: false },
  { input: '@example24.com', expected: false },
  { input: '@example25.com', expected: false },
  { input: '@example26.com', expected: false },
  { input: '@example27.com', expected: false },
  { input: '@example28.com', expected: false },
  { input: '@example29.com', expected: false },
  { input: '@example30.com', expected: false },
  { input: '@example31.com', expected: false },
  { input: '@example32.com', expected: false },
  { input: '@example33.com', expected: false },
  { input: '@example34.com', expected: false },
  { input: '@example35.com', expected: false },
  { input: '@example36.com', expected: false },
  { input: '@example37.com', expected: false },
  { input: '@example38.com', expected: false },
  { input: '@example39.com', expected: false },
  { input: '@example40.com', expected: false },
  { input: '@example41.com', expected: false },
  { input: '@example42.com', expected: false },
  { input: '@example43.com', expected: false },
  { input: '@example44.com', expected: false },
  { input: '@example45.com', expected: false },
  { input: '@example46.com', expected: false },
  { input: '@example47.com', expected: false },
  { input: '@example48.com', expected: false },
  { input: '@example49.com', expected: false },
];

interface PhoneCase {
  input: string;
  expected: boolean;
}

const PHONE_CASES: PhoneCase[] = [
  { input: '13000000000', expected: true },
  { input: '13100000001', expected: true },
  { input: '13200000002', expected: true },
  { input: '13300000003', expected: true },
  { input: '13500000004', expected: true },
  { input: '13600000005', expected: true },
  { input: '13700000006', expected: true },
  { input: '13800000007', expected: true },
  { input: '13900000008', expected: true },
  { input: '15000000009', expected: true },
  { input: '15100000010', expected: true },
  { input: '15200000011', expected: true },
  { input: '15300000012', expected: true },
  { input: '15500000013', expected: true },
  { input: '15600000014', expected: true },
  { input: '15700000015', expected: true },
  { input: '15800000016', expected: true },
  { input: '15900000017', expected: true },
  { input: '16600000018', expected: true },
  { input: '17000000019', expected: true },
  { input: '17100000020', expected: true },
  { input: '17200000021', expected: true },
  { input: '17300000022', expected: true },
  { input: '17500000023', expected: true },
  { input: '17600000024', expected: true },
  { input: '17700000025', expected: true },
  { input: '17800000026', expected: true },
  { input: '18000000027', expected: true },
  { input: '18100000028', expected: true },
  { input: '18200000029', expected: true },
  { input: '18300000030', expected: true },
  { input: '18500000031', expected: true },
  { input: '18600000032', expected: true },
  { input: '18700000033', expected: true },
  { input: '18800000034', expected: true },
  { input: '18900000035', expected: true },
  { input: '19100000036', expected: true },
  { input: '19300000037', expected: true },
  { input: '19500000038', expected: true },
  { input: '19600000039', expected: true },
  { input: '19700000040', expected: true },
  { input: '19800000041', expected: true },
  { input: '19900000042', expected: true },
  { input: '12800000000', expected: false },
  { input: '12800000001', expected: false },
  { input: '12800000002', expected: false },
  { input: '12800000003', expected: false },
  { input: '12800000004', expected: false },
  { input: '12800000005', expected: false },
  { input: '12800000006', expected: false },
  { input: '12800000007', expected: false },
  { input: '12800000008', expected: false },
  { input: '12800000009', expected: false },
  { input: '12800000010', expected: false },
  { input: '12800000011', expected: false },
  { input: '12800000012', expected: false },
  { input: '12800000013', expected: false },
  { input: '12800000014', expected: false },
  { input: '12800000015', expected: false },
  { input: '12800000016', expected: false },
  { input: '12800000017', expected: false },
  { input: '12800000018', expected: false },
  { input: '12800000019', expected: false },
  { input: '12800000020', expected: false },
  { input: '12800000021', expected: false },
  { input: '12800000022', expected: false },
  { input: '12800000023', expected: false },
  { input: '12800000024', expected: false },
  { input: '12800000025', expected: false },
  { input: '12800000026', expected: false },
  { input: '12800000027', expected: false },
  { input: '12800000028', expected: false },
  { input: '12800000029', expected: false },
  { input: '12800000030', expected: false },
  { input: '12800000031', expected: false },
  { input: '12800000032', expected: false },
  { input: '12800000033', expected: false },
  { input: '12800000034', expected: false },
  { input: '12800000035', expected: false },
  { input: '12800000036', expected: false },
  { input: '12800000037', expected: false },
  { input: '12800000038', expected: false },
  { input: '12800000039', expected: false },
  { input: '12800000040', expected: false },
  { input: '12800000041', expected: false },
  { input: '12800000042', expected: false },
  { input: '12800000043', expected: false },
  { input: '12800000044', expected: false },
  { input: '12800000045', expected: false },
  { input: '12800000046', expected: false },
  { input: '12800000047', expected: false },
  { input: '12800000048', expected: false },
  { input: '12800000049', expected: false },
  { input: '12800000050', expected: false },
  { input: '12800000051', expected: false },
  { input: '12800000052', expected: false },
  { input: '12800000053', expected: false },
  { input: '12800000054', expected: false },
  { input: '12800000055', expected: false },
  { input: '12800000056', expected: false },
  { input: '12800000057', expected: false },
  { input: '12800000058', expected: false },
  { input: '12800000059', expected: false },
  { input: '138000000', expected: false },
  { input: '138000001', expected: false },
  { input: '138000002', expected: false },
  { input: '138000003', expected: false },
  { input: '138000004', expected: false },
  { input: '138000005', expected: false },
  { input: '138000006', expected: false },
  { input: '138000007', expected: false },
  { input: '138000008', expected: false },
  { input: '138000009', expected: false },
  { input: '138000010', expected: false },
  { input: '138000011', expected: false },
  { input: '138000012', expected: false },
  { input: '138000013', expected: false },
  { input: '138000014', expected: false },
  { input: '138000015', expected: false },
  { input: '138000016', expected: false },
  { input: '138000017', expected: false },
  { input: '138000018', expected: false },
  { input: '138000019', expected: false },
  { input: '138000020', expected: false },
  { input: '138000021', expected: false },
  { input: '138000022', expected: false },
  { input: '138000023', expected: false },
  { input: '138000024', expected: false },
  { input: '138000025', expected: false },
  { input: '138000026', expected: false },
  { input: '138000027', expected: false },
  { input: '138000028', expected: false },
  { input: '138000029', expected: false },
  { input: '138000030', expected: false },
  { input: '138000031', expected: false },
  { input: '138000032', expected: false },
  { input: '138000033', expected: false },
  { input: '138000034', expected: false },
  { input: '138000035', expected: false },
  { input: '138000036', expected: false },
  { input: '138000037', expected: false },
  { input: '138000038', expected: false },
  { input: '138000039', expected: false },
];

interface IdCardCase {
  input: string;
  expected: boolean;
}

const ID_CARD_CASES: IdCardCase[] = [
  { input: '11010519491231002X', expected: true },
  { input: '440524188001010014', expected: true },
  { input: '110101199003071233', expected: true },
  { input: '320102198506150014', expected: true },
  { input: '510104199512310021', expected: true },
  { input: '370102200001010015', expected: true },
  { input: '610113197808080019', expected: true },
  { input: '420106198811110026', expected: true },
  { input: '330106199909090011', expected: true },
  { input: '230103198001010010', expected: true },
  { input: '53010219921010002X', expected: true },
  { input: '350102199401010015', expected: true },
  { input: '430102198712120022', expected: true },
  { input: '140102199106060010', expected: true },
  { input: '210102198303030025', expected: true },
  { input: '50010319980808001X', expected: true },
  { input: '620102198505050012', expected: true },
  { input: '450103199707070029', expected: true },
  { input: '340102199602020015', expected: true },
  { input: '360102199303030022', expected: true },
  { input: '110105194912310020', expected: false },
  { input: '440524188001010010', expected: false },
  { input: '110101199003071230', expected: false },
  { input: '320102198506150010', expected: false },
  { input: '510104199512310020', expected: false },
  { input: '370102200001010010', expected: false },
  { input: '610113197808080010', expected: false },
  { input: '420106198811110020', expected: false },
  { input: '330106199909090010', expected: false },
  { input: '230103198001010011', expected: false },
  { input: '530102199210100020', expected: false },
  { input: '350102199401010010', expected: false },
  { input: '430102198712120020', expected: false },
  { input: '140102199106060011', expected: false },
  { input: '210102198303030020', expected: false },
  { input: '500103199808080010', expected: false },
  { input: '620102198505050010', expected: false },
  { input: '450103199707070020', expected: false },
  { input: '340102199602020010', expected: false },
  { input: '360102199303030020', expected: false },
  { input: '11010519491231000', expected: false },
  { input: '11010519491231001', expected: false },
  { input: '11010519491231002', expected: false },
  { input: '11010519491231003', expected: false },
  { input: '11010519491231004', expected: false },
  { input: '11010519491231005', expected: false },
  { input: '11010519491231006', expected: false },
  { input: '11010519491231007', expected: false },
  { input: '11010519491231008', expected: false },
  { input: '11010519491231009', expected: false },
  { input: '11010519491231010', expected: false },
  { input: '11010519491231011', expected: false },
  { input: '11010519491231012', expected: false },
  { input: '11010519491231013', expected: false },
  { input: '11010519491231014', expected: false },
  { input: '11010519491231015', expected: false },
  { input: '11010519491231016', expected: false },
  { input: '11010519491231017', expected: false },
  { input: '11010519491231018', expected: false },
  { input: '11010519491231019', expected: false },
  { input: '11010519491231020', expected: false },
  { input: '11010519491231021', expected: false },
  { input: '11010519491231022', expected: false },
  { input: '11010519491231023', expected: false },
  { input: '11010519491231024', expected: false },
  { input: '11010519491231025', expected: false },
  { input: '11010519491231026', expected: false },
  { input: '11010519491231027', expected: false },
  { input: '11010519491231028', expected: false },
  { input: '11010519491231029', expected: false },
];

export default function validationExhaustiveMatrixTest() {
  describe('ValidationExhaustiveMatrixTest', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'ValidationExhaustiveMatrixTest suite start');
    });

    afterAll(() => {
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'ValidationExhaustiveMatrixTest suite end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_VALEXH_0100
     * @tc.name      testEmailExhaustive0001
     * @tc.desc      Verify the email validator accepts every generated valid address and rejects malformed ones.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testEmailExhaustive0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testEmailExhaustive0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let checked: number = 0;
      let accepted: number = 0;
      for (let i = 0; i < EMAIL_CASES.length; i++) {
        const row: EmailCase = EMAIL_CASES[i];
        const actual: boolean = BasicUtil.isValidEmail(row.input);
        expect(actual).assertEqual(row.expected);
        if (actual) { accepted = accepted + 1; }
        checked = checked + 1;
      }
      expect(checked).assertEqual(EMAIL_CASES.length);
      expect(accepted).assertEqual(150);
      expect(BasicUtil.isValidEmail('')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_VALEXH_0200
     * @tc.name      testPhoneExhaustive0002
     * @tc.desc      Verify the phone validator accepts every supported prefix and rejects malformed numbers.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPhoneExhaustive0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testPhoneExhaustive0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let checked: number = 0;
      let accepted: number = 0;
      for (let i = 0; i < PHONE_CASES.length; i++) {
        const row: PhoneCase = PHONE_CASES[i];
        const actual: boolean = BasicUtil.isValidPhoneCN(row.input);
        expect(actual).assertEqual(row.expected);
        if (actual) { accepted = accepted + 1; }
        checked = checked + 1;
      }
      expect(checked).assertEqual(PHONE_CASES.length);
      expect(accepted).assertEqual(43);
      expect(BasicUtil.isValidPhoneCN('')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_VALEXH_0300
     * @tc.name      testIdCardExhaustive0003
     * @tc.desc      Verify the ID card validator checks the weighted checksum of every generated card.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIdCardExhaustive0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIdCardExhaustive0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let checked: number = 0;
      let accepted: number = 0;
      for (let i = 0; i < ID_CARD_CASES.length; i++) {
        const row: IdCardCase = ID_CARD_CASES[i];
        const actual: boolean = BasicUtil.isValidIdCardCN(row.input);
        expect(actual).assertEqual(row.expected);
        if (actual) { accepted = accepted + 1; }
        checked = checked + 1;
      }
      expect(checked).assertEqual(ID_CARD_CASES.length);
      expect(accepted).assertEqual(20);
      expect(BasicUtil.isValidIdCardCN('')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

  });
}
