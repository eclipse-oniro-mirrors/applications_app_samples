/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import hilog from '@ohos.hilog';
import { describe, it, expect } from '@ohos/hypium';
import model from '../Shared/AdaptiveModel';

const DOMAIN = 0xF811;
const TAG = '[Sample_jsAdaptiveCapabilities]';
const YIELD_MS = 10;

function yieldThread() {
  return new Promise(function (resolve) {
    setTimeout(function () {
      resolve();
    }, YIELD_MS);
  });
}

function ColorBlendingPart001() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1681
     * @tc.name    JsColor001
     * @tc.desc    Blend 53 over 37 at 25 percent gives 41 seed 1
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor001', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(-21)).assertEqual(0);
      expect(model.blendChannel(37, 53, 25)).assertEqual(41);
      expect(model.blendChannel(37, 53, 0)).assertEqual(37);
      expect(model.blendChannel(37, 53, 100)).assertEqual(53);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor001 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1682
     * @tc.name    JsColor002
     * @tc.desc    Blend 106 over 74 at 50 percent gives 90 seed 2
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor002', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(8)).assertEqual(8);
      expect(model.blendChannel(74, 106, 50)).assertEqual(90);
      expect(model.blendChannel(74, 106, 0)).assertEqual(74);
      expect(model.blendChannel(74, 106, 100)).assertEqual(106);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor002 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1683
     * @tc.name    JsColor003
     * @tc.desc    Blend 159 over 111 at 75 percent gives 147 seed 3
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor003', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(37)).assertEqual(37);
      expect(model.blendChannel(111, 159, 75)).assertEqual(147);
      expect(model.blendChannel(111, 159, 0)).assertEqual(111);
      expect(model.blendChannel(111, 159, 100)).assertEqual(159);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor003 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1684
     * @tc.name    JsColor004
     * @tc.desc    Blend 212 over 148 at 100 percent gives 212 seed 4
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor004', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(66)).assertEqual(66);
      expect(model.blendChannel(148, 212, 100)).assertEqual(212);
      expect(model.blendChannel(148, 212, 0)).assertEqual(148);
      expect(model.blendChannel(148, 212, 100)).assertEqual(212);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor004 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1685
     * @tc.name    JsColor005
     * @tc.desc    Blend 9 over 185 at 0 percent gives 185 seed 5
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor005', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(95)).assertEqual(95);
      expect(model.blendChannel(185, 9, 0)).assertEqual(185);
      expect(model.blendChannel(185, 9, 0)).assertEqual(185);
      expect(model.blendChannel(185, 9, 100)).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor005 done');
    });
}

function ColorBlendingPart002() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1686
     * @tc.name    JsColor006
     * @tc.desc    Blend 62 over 222 at 25 percent gives 182 seed 6
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor006', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(124)).assertEqual(124);
      expect(model.blendChannel(222, 62, 25)).assertEqual(182);
      expect(model.blendChannel(222, 62, 0)).assertEqual(222);
      expect(model.blendChannel(222, 62, 100)).assertEqual(62);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor006 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1687
     * @tc.name    JsColor007
     * @tc.desc    Blend 115 over 3 at 50 percent gives 59 seed 7
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor007', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(153)).assertEqual(153);
      expect(model.blendChannel(3, 115, 50)).assertEqual(59);
      expect(model.blendChannel(3, 115, 0)).assertEqual(3);
      expect(model.blendChannel(3, 115, 100)).assertEqual(115);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor007 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1688
     * @tc.name    JsColor008
     * @tc.desc    Blend 168 over 40 at 75 percent gives 136 seed 8
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor008', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(182)).assertEqual(182);
      expect(model.blendChannel(40, 168, 75)).assertEqual(136);
      expect(model.blendChannel(40, 168, 0)).assertEqual(40);
      expect(model.blendChannel(40, 168, 100)).assertEqual(168);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor008 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1689
     * @tc.name    JsColor009
     * @tc.desc    Blend 221 over 77 at 100 percent gives 221 seed 9
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor009', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(211)).assertEqual(211);
      expect(model.blendChannel(77, 221, 100)).assertEqual(221);
      expect(model.blendChannel(77, 221, 0)).assertEqual(77);
      expect(model.blendChannel(77, 221, 100)).assertEqual(221);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor009 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1690
     * @tc.name    JsColor010
     * @tc.desc    Blend 18 over 114 at 0 percent gives 114 seed 10
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor010', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(240)).assertEqual(240);
      expect(model.blendChannel(114, 18, 0)).assertEqual(114);
      expect(model.blendChannel(114, 18, 0)).assertEqual(114);
      expect(model.blendChannel(114, 18, 100)).assertEqual(18);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor010 done');
    });
}

function ColorBlendingPart003() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1691
     * @tc.name    JsColor011
     * @tc.desc    Blend 71 over 151 at 25 percent gives 131 seed 11
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor011', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(269)).assertEqual(255);
      expect(model.blendChannel(151, 71, 25)).assertEqual(131);
      expect(model.blendChannel(151, 71, 0)).assertEqual(151);
      expect(model.blendChannel(151, 71, 100)).assertEqual(71);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor011 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1692
     * @tc.name    JsColor012
     * @tc.desc    Blend 124 over 188 at 50 percent gives 156 seed 12
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor012', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(298)).assertEqual(255);
      expect(model.blendChannel(188, 124, 50)).assertEqual(156);
      expect(model.blendChannel(188, 124, 0)).assertEqual(188);
      expect(model.blendChannel(188, 124, 100)).assertEqual(124);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor012 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1693
     * @tc.name    JsColor013
     * @tc.desc    Blend 177 over 225 at 75 percent gives 189 seed 13
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor013', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(327)).assertEqual(255);
      expect(model.blendChannel(225, 177, 75)).assertEqual(189);
      expect(model.blendChannel(225, 177, 0)).assertEqual(225);
      expect(model.blendChannel(225, 177, 100)).assertEqual(177);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor013 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1694
     * @tc.name    JsColor014
     * @tc.desc    Blend 230 over 6 at 100 percent gives 230 seed 14
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor014', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(-44)).assertEqual(0);
      expect(model.blendChannel(6, 230, 100)).assertEqual(230);
      expect(model.blendChannel(6, 230, 0)).assertEqual(6);
      expect(model.blendChannel(6, 230, 100)).assertEqual(230);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor014 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1695
     * @tc.name    JsColor015
     * @tc.desc    Blend 27 over 43 at 0 percent gives 43 seed 15
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor015', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(-15)).assertEqual(0);
      expect(model.blendChannel(43, 27, 0)).assertEqual(43);
      expect(model.blendChannel(43, 27, 0)).assertEqual(43);
      expect(model.blendChannel(43, 27, 100)).assertEqual(27);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor015 done');
    });
}

function ColorBlendingPart004() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1696
     * @tc.name    JsColor016
     * @tc.desc    Blend 80 over 80 at 25 percent gives 80 seed 16
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor016', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(14)).assertEqual(14);
      expect(model.blendChannel(80, 80, 25)).assertEqual(80);
      expect(model.blendChannel(80, 80, 0)).assertEqual(80);
      expect(model.blendChannel(80, 80, 100)).assertEqual(80);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor016 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1697
     * @tc.name    JsColor017
     * @tc.desc    Blend 133 over 117 at 50 percent gives 125 seed 17
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor017', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(43)).assertEqual(43);
      expect(model.blendChannel(117, 133, 50)).assertEqual(125);
      expect(model.blendChannel(117, 133, 0)).assertEqual(117);
      expect(model.blendChannel(117, 133, 100)).assertEqual(133);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor017 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1698
     * @tc.name    JsColor018
     * @tc.desc    Blend 186 over 154 at 75 percent gives 178 seed 18
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor018', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(72)).assertEqual(72);
      expect(model.blendChannel(154, 186, 75)).assertEqual(178);
      expect(model.blendChannel(154, 186, 0)).assertEqual(154);
      expect(model.blendChannel(154, 186, 100)).assertEqual(186);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor018 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1699
     * @tc.name    JsColor019
     * @tc.desc    Blend 239 over 191 at 100 percent gives 239 seed 19
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor019', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(101)).assertEqual(101);
      expect(model.blendChannel(191, 239, 100)).assertEqual(239);
      expect(model.blendChannel(191, 239, 0)).assertEqual(191);
      expect(model.blendChannel(191, 239, 100)).assertEqual(239);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor019 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1700
     * @tc.name    JsColor020
     * @tc.desc    Blend 36 over 228 at 0 percent gives 228 seed 20
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor020', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(130)).assertEqual(130);
      expect(model.blendChannel(228, 36, 0)).assertEqual(228);
      expect(model.blendChannel(228, 36, 0)).assertEqual(228);
      expect(model.blendChannel(228, 36, 100)).assertEqual(36);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor020 done');
    });
}

function ColorBlendingPart005() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1701
     * @tc.name    JsColor021
     * @tc.desc    Blend 89 over 9 at 25 percent gives 29 seed 21
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor021', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(159)).assertEqual(159);
      expect(model.blendChannel(9, 89, 25)).assertEqual(29);
      expect(model.blendChannel(9, 89, 0)).assertEqual(9);
      expect(model.blendChannel(9, 89, 100)).assertEqual(89);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor021 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1702
     * @tc.name    JsColor022
     * @tc.desc    Blend 142 over 46 at 50 percent gives 94 seed 22
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor022', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(188)).assertEqual(188);
      expect(model.blendChannel(46, 142, 50)).assertEqual(94);
      expect(model.blendChannel(46, 142, 0)).assertEqual(46);
      expect(model.blendChannel(46, 142, 100)).assertEqual(142);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor022 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1703
     * @tc.name    JsColor023
     * @tc.desc    Blend 195 over 83 at 75 percent gives 167 seed 23
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor023', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(217)).assertEqual(217);
      expect(model.blendChannel(83, 195, 75)).assertEqual(167);
      expect(model.blendChannel(83, 195, 0)).assertEqual(83);
      expect(model.blendChannel(83, 195, 100)).assertEqual(195);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor023 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1704
     * @tc.name    JsColor024
     * @tc.desc    Blend 248 over 120 at 100 percent gives 248 seed 24
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor024', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(246)).assertEqual(246);
      expect(model.blendChannel(120, 248, 100)).assertEqual(248);
      expect(model.blendChannel(120, 248, 0)).assertEqual(120);
      expect(model.blendChannel(120, 248, 100)).assertEqual(248);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor024 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1705
     * @tc.name    JsColor025
     * @tc.desc    Blend 45 over 157 at 0 percent gives 157 seed 25
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor025', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(275)).assertEqual(255);
      expect(model.blendChannel(157, 45, 0)).assertEqual(157);
      expect(model.blendChannel(157, 45, 0)).assertEqual(157);
      expect(model.blendChannel(157, 45, 100)).assertEqual(45);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor025 done');
    });
}

function ColorBlendingPart006() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1706
     * @tc.name    JsColor026
     * @tc.desc    Blend 98 over 194 at 25 percent gives 170 seed 26
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor026', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(304)).assertEqual(255);
      expect(model.blendChannel(194, 98, 25)).assertEqual(170);
      expect(model.blendChannel(194, 98, 0)).assertEqual(194);
      expect(model.blendChannel(194, 98, 100)).assertEqual(98);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor026 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1707
     * @tc.name    JsColor027
     * @tc.desc    Blend 151 over 231 at 50 percent gives 191 seed 27
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor027', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(333)).assertEqual(255);
      expect(model.blendChannel(231, 151, 50)).assertEqual(191);
      expect(model.blendChannel(231, 151, 0)).assertEqual(231);
      expect(model.blendChannel(231, 151, 100)).assertEqual(151);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor027 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1708
     * @tc.name    JsColor028
     * @tc.desc    Blend 204 over 12 at 75 percent gives 156 seed 28
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor028', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(-38)).assertEqual(0);
      expect(model.blendChannel(12, 204, 75)).assertEqual(156);
      expect(model.blendChannel(12, 204, 0)).assertEqual(12);
      expect(model.blendChannel(12, 204, 100)).assertEqual(204);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor028 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1709
     * @tc.name    JsColor029
     * @tc.desc    Blend 1 over 49 at 100 percent gives 1 seed 29
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor029', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(-9)).assertEqual(0);
      expect(model.blendChannel(49, 1, 100)).assertEqual(1);
      expect(model.blendChannel(49, 1, 0)).assertEqual(49);
      expect(model.blendChannel(49, 1, 100)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor029 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1710
     * @tc.name    JsColor030
     * @tc.desc    Blend 54 over 86 at 0 percent gives 86 seed 30
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor030', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(20)).assertEqual(20);
      expect(model.blendChannel(86, 54, 0)).assertEqual(86);
      expect(model.blendChannel(86, 54, 0)).assertEqual(86);
      expect(model.blendChannel(86, 54, 100)).assertEqual(54);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor030 done');
    });
}

function ColorBlendingPart007() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1711
     * @tc.name    JsColor031
     * @tc.desc    Blend 107 over 123 at 25 percent gives 119 seed 31
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor031', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(49)).assertEqual(49);
      expect(model.blendChannel(123, 107, 25)).assertEqual(119);
      expect(model.blendChannel(123, 107, 0)).assertEqual(123);
      expect(model.blendChannel(123, 107, 100)).assertEqual(107);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor031 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1712
     * @tc.name    JsColor032
     * @tc.desc    Blend 160 over 160 at 50 percent gives 160 seed 32
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor032', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(78)).assertEqual(78);
      expect(model.blendChannel(160, 160, 50)).assertEqual(160);
      expect(model.blendChannel(160, 160, 0)).assertEqual(160);
      expect(model.blendChannel(160, 160, 100)).assertEqual(160);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor032 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1713
     * @tc.name    JsColor033
     * @tc.desc    Blend 213 over 197 at 75 percent gives 209 seed 33
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor033', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(107)).assertEqual(107);
      expect(model.blendChannel(197, 213, 75)).assertEqual(209);
      expect(model.blendChannel(197, 213, 0)).assertEqual(197);
      expect(model.blendChannel(197, 213, 100)).assertEqual(213);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor033 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1714
     * @tc.name    JsColor034
     * @tc.desc    Blend 10 over 234 at 100 percent gives 10 seed 34
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor034', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(136)).assertEqual(136);
      expect(model.blendChannel(234, 10, 100)).assertEqual(10);
      expect(model.blendChannel(234, 10, 0)).assertEqual(234);
      expect(model.blendChannel(234, 10, 100)).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor034 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1715
     * @tc.name    JsColor035
     * @tc.desc    Blend 63 over 15 at 0 percent gives 15 seed 35
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor035', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(165)).assertEqual(165);
      expect(model.blendChannel(15, 63, 0)).assertEqual(15);
      expect(model.blendChannel(15, 63, 0)).assertEqual(15);
      expect(model.blendChannel(15, 63, 100)).assertEqual(63);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor035 done');
    });
}

function ColorBlendingPart008() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1716
     * @tc.name    JsColor036
     * @tc.desc    Blend 116 over 52 at 25 percent gives 68 seed 36
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor036', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(194)).assertEqual(194);
      expect(model.blendChannel(52, 116, 25)).assertEqual(68);
      expect(model.blendChannel(52, 116, 0)).assertEqual(52);
      expect(model.blendChannel(52, 116, 100)).assertEqual(116);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor036 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1717
     * @tc.name    JsColor037
     * @tc.desc    Blend 169 over 89 at 50 percent gives 129 seed 37
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor037', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(223)).assertEqual(223);
      expect(model.blendChannel(89, 169, 50)).assertEqual(129);
      expect(model.blendChannel(89, 169, 0)).assertEqual(89);
      expect(model.blendChannel(89, 169, 100)).assertEqual(169);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor037 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1718
     * @tc.name    JsColor038
     * @tc.desc    Blend 222 over 126 at 75 percent gives 198 seed 38
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor038', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(252)).assertEqual(252);
      expect(model.blendChannel(126, 222, 75)).assertEqual(198);
      expect(model.blendChannel(126, 222, 0)).assertEqual(126);
      expect(model.blendChannel(126, 222, 100)).assertEqual(222);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor038 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1719
     * @tc.name    JsColor039
     * @tc.desc    Blend 19 over 163 at 100 percent gives 19 seed 39
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor039', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(281)).assertEqual(255);
      expect(model.blendChannel(163, 19, 100)).assertEqual(19);
      expect(model.blendChannel(163, 19, 0)).assertEqual(163);
      expect(model.blendChannel(163, 19, 100)).assertEqual(19);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor039 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1720
     * @tc.name    JsColor040
     * @tc.desc    Blend 72 over 200 at 0 percent gives 200 seed 40
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor040', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(310)).assertEqual(255);
      expect(model.blendChannel(200, 72, 0)).assertEqual(200);
      expect(model.blendChannel(200, 72, 0)).assertEqual(200);
      expect(model.blendChannel(200, 72, 100)).assertEqual(72);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor040 done');
    });
}

function ColorBlendingPart009() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1721
     * @tc.name    JsColor041
     * @tc.desc    Blend 125 over 237 at 25 percent gives 209 seed 41
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor041', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(339)).assertEqual(255);
      expect(model.blendChannel(237, 125, 25)).assertEqual(209);
      expect(model.blendChannel(237, 125, 0)).assertEqual(237);
      expect(model.blendChannel(237, 125, 100)).assertEqual(125);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor041 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1722
     * @tc.name    JsColor042
     * @tc.desc    Blend 178 over 18 at 50 percent gives 98 seed 42
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor042', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(-32)).assertEqual(0);
      expect(model.blendChannel(18, 178, 50)).assertEqual(98);
      expect(model.blendChannel(18, 178, 0)).assertEqual(18);
      expect(model.blendChannel(18, 178, 100)).assertEqual(178);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor042 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1723
     * @tc.name    JsColor043
     * @tc.desc    Blend 231 over 55 at 75 percent gives 187 seed 43
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor043', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(-3)).assertEqual(0);
      expect(model.blendChannel(55, 231, 75)).assertEqual(187);
      expect(model.blendChannel(55, 231, 0)).assertEqual(55);
      expect(model.blendChannel(55, 231, 100)).assertEqual(231);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor043 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1724
     * @tc.name    JsColor044
     * @tc.desc    Blend 28 over 92 at 100 percent gives 28 seed 44
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor044', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(26)).assertEqual(26);
      expect(model.blendChannel(92, 28, 100)).assertEqual(28);
      expect(model.blendChannel(92, 28, 0)).assertEqual(92);
      expect(model.blendChannel(92, 28, 100)).assertEqual(28);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor044 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1725
     * @tc.name    JsColor045
     * @tc.desc    Blend 81 over 129 at 0 percent gives 129 seed 45
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor045', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(55)).assertEqual(55);
      expect(model.blendChannel(129, 81, 0)).assertEqual(129);
      expect(model.blendChannel(129, 81, 0)).assertEqual(129);
      expect(model.blendChannel(129, 81, 100)).assertEqual(81);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor045 done');
    });
}

function ColorBlendingPart010() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1726
     * @tc.name    JsColor046
     * @tc.desc    Blend 134 over 166 at 25 percent gives 158 seed 46
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor046', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(84)).assertEqual(84);
      expect(model.blendChannel(166, 134, 25)).assertEqual(158);
      expect(model.blendChannel(166, 134, 0)).assertEqual(166);
      expect(model.blendChannel(166, 134, 100)).assertEqual(134);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor046 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1727
     * @tc.name    JsColor047
     * @tc.desc    Blend 187 over 203 at 50 percent gives 195 seed 47
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor047', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(113)).assertEqual(113);
      expect(model.blendChannel(203, 187, 50)).assertEqual(195);
      expect(model.blendChannel(203, 187, 0)).assertEqual(203);
      expect(model.blendChannel(203, 187, 100)).assertEqual(187);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor047 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1728
     * @tc.name    JsColor048
     * @tc.desc    Blend 240 over 240 at 75 percent gives 240 seed 48
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor048', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(142)).assertEqual(142);
      expect(model.blendChannel(240, 240, 75)).assertEqual(240);
      expect(model.blendChannel(240, 240, 0)).assertEqual(240);
      expect(model.blendChannel(240, 240, 100)).assertEqual(240);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor048 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1729
     * @tc.name    JsColor049
     * @tc.desc    Blend 37 over 21 at 100 percent gives 37 seed 49
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor049', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(171)).assertEqual(171);
      expect(model.blendChannel(21, 37, 100)).assertEqual(37);
      expect(model.blendChannel(21, 37, 0)).assertEqual(21);
      expect(model.blendChannel(21, 37, 100)).assertEqual(37);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor049 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1730
     * @tc.name    JsColor050
     * @tc.desc    Blend 90 over 58 at 0 percent gives 58 seed 50
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor050', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(200)).assertEqual(200);
      expect(model.blendChannel(58, 90, 0)).assertEqual(58);
      expect(model.blendChannel(58, 90, 0)).assertEqual(58);
      expect(model.blendChannel(58, 90, 100)).assertEqual(90);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor050 done');
    });
}

function ColorBlendingPart011() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1731
     * @tc.name    JsColor051
     * @tc.desc    Blend 143 over 95 at 25 percent gives 107 seed 51
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor051', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(229)).assertEqual(229);
      expect(model.blendChannel(95, 143, 25)).assertEqual(107);
      expect(model.blendChannel(95, 143, 0)).assertEqual(95);
      expect(model.blendChannel(95, 143, 100)).assertEqual(143);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor051 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1732
     * @tc.name    JsColor052
     * @tc.desc    Blend 196 over 132 at 50 percent gives 164 seed 52
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor052', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(258)).assertEqual(255);
      expect(model.blendChannel(132, 196, 50)).assertEqual(164);
      expect(model.blendChannel(132, 196, 0)).assertEqual(132);
      expect(model.blendChannel(132, 196, 100)).assertEqual(196);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor052 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1733
     * @tc.name    JsColor053
     * @tc.desc    Blend 249 over 169 at 75 percent gives 229 seed 53
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor053', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(287)).assertEqual(255);
      expect(model.blendChannel(169, 249, 75)).assertEqual(229);
      expect(model.blendChannel(169, 249, 0)).assertEqual(169);
      expect(model.blendChannel(169, 249, 100)).assertEqual(249);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor053 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1734
     * @tc.name    JsColor054
     * @tc.desc    Blend 46 over 206 at 100 percent gives 46 seed 54
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor054', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(316)).assertEqual(255);
      expect(model.blendChannel(206, 46, 100)).assertEqual(46);
      expect(model.blendChannel(206, 46, 0)).assertEqual(206);
      expect(model.blendChannel(206, 46, 100)).assertEqual(46);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor054 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1735
     * @tc.name    JsColor055
     * @tc.desc    Blend 99 over 243 at 0 percent gives 243 seed 55
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor055', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(345)).assertEqual(255);
      expect(model.blendChannel(243, 99, 0)).assertEqual(243);
      expect(model.blendChannel(243, 99, 0)).assertEqual(243);
      expect(model.blendChannel(243, 99, 100)).assertEqual(99);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor055 done');
    });
}

function ColorBlendingPart012() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1736
     * @tc.name    JsColor056
     * @tc.desc    Blend 152 over 24 at 25 percent gives 56 seed 56
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor056', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(-26)).assertEqual(0);
      expect(model.blendChannel(24, 152, 25)).assertEqual(56);
      expect(model.blendChannel(24, 152, 0)).assertEqual(24);
      expect(model.blendChannel(24, 152, 100)).assertEqual(152);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor056 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1737
     * @tc.name    JsColor057
     * @tc.desc    Blend 205 over 61 at 50 percent gives 133 seed 57
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor057', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(3)).assertEqual(3);
      expect(model.blendChannel(61, 205, 50)).assertEqual(133);
      expect(model.blendChannel(61, 205, 0)).assertEqual(61);
      expect(model.blendChannel(61, 205, 100)).assertEqual(205);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor057 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1738
     * @tc.name    JsColor058
     * @tc.desc    Blend 2 over 98 at 75 percent gives 26 seed 58
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor058', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(32)).assertEqual(32);
      expect(model.blendChannel(98, 2, 75)).assertEqual(26);
      expect(model.blendChannel(98, 2, 0)).assertEqual(98);
      expect(model.blendChannel(98, 2, 100)).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor058 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1739
     * @tc.name    JsColor059
     * @tc.desc    Blend 55 over 135 at 100 percent gives 55 seed 59
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor059', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(61)).assertEqual(61);
      expect(model.blendChannel(135, 55, 100)).assertEqual(55);
      expect(model.blendChannel(135, 55, 0)).assertEqual(135);
      expect(model.blendChannel(135, 55, 100)).assertEqual(55);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor059 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1740
     * @tc.name    JsColor060
     * @tc.desc    Blend 108 over 172 at 0 percent gives 172 seed 60
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor060', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(90)).assertEqual(90);
      expect(model.blendChannel(172, 108, 0)).assertEqual(172);
      expect(model.blendChannel(172, 108, 0)).assertEqual(172);
      expect(model.blendChannel(172, 108, 100)).assertEqual(108);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor060 done');
    });
}

function ColorBlendingPart013() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1741
     * @tc.name    JsColor061
     * @tc.desc    Blend 161 over 209 at 25 percent gives 197 seed 61
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor061', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(119)).assertEqual(119);
      expect(model.blendChannel(209, 161, 25)).assertEqual(197);
      expect(model.blendChannel(209, 161, 0)).assertEqual(209);
      expect(model.blendChannel(209, 161, 100)).assertEqual(161);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor061 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1742
     * @tc.name    JsColor062
     * @tc.desc    Blend 214 over 246 at 50 percent gives 230 seed 62
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor062', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(148)).assertEqual(148);
      expect(model.blendChannel(246, 214, 50)).assertEqual(230);
      expect(model.blendChannel(246, 214, 0)).assertEqual(246);
      expect(model.blendChannel(246, 214, 100)).assertEqual(214);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor062 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1743
     * @tc.name    JsColor063
     * @tc.desc    Blend 11 over 27 at 75 percent gives 15 seed 63
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor063', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(177)).assertEqual(177);
      expect(model.blendChannel(27, 11, 75)).assertEqual(15);
      expect(model.blendChannel(27, 11, 0)).assertEqual(27);
      expect(model.blendChannel(27, 11, 100)).assertEqual(11);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor063 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1744
     * @tc.name    JsColor064
     * @tc.desc    Blend 64 over 64 at 100 percent gives 64 seed 64
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor064', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(206)).assertEqual(206);
      expect(model.blendChannel(64, 64, 100)).assertEqual(64);
      expect(model.blendChannel(64, 64, 0)).assertEqual(64);
      expect(model.blendChannel(64, 64, 100)).assertEqual(64);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor064 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1745
     * @tc.name    JsColor065
     * @tc.desc    Blend 117 over 101 at 0 percent gives 101 seed 65
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor065', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(235)).assertEqual(235);
      expect(model.blendChannel(101, 117, 0)).assertEqual(101);
      expect(model.blendChannel(101, 117, 0)).assertEqual(101);
      expect(model.blendChannel(101, 117, 100)).assertEqual(117);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor065 done');
    });
}

function ColorBlendingPart014() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1746
     * @tc.name    JsColor066
     * @tc.desc    Blend 170 over 138 at 25 percent gives 146 seed 66
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor066', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(264)).assertEqual(255);
      expect(model.blendChannel(138, 170, 25)).assertEqual(146);
      expect(model.blendChannel(138, 170, 0)).assertEqual(138);
      expect(model.blendChannel(138, 170, 100)).assertEqual(170);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor066 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1747
     * @tc.name    JsColor067
     * @tc.desc    Blend 223 over 175 at 50 percent gives 199 seed 67
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor067', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(293)).assertEqual(255);
      expect(model.blendChannel(175, 223, 50)).assertEqual(199);
      expect(model.blendChannel(175, 223, 0)).assertEqual(175);
      expect(model.blendChannel(175, 223, 100)).assertEqual(223);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor067 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1748
     * @tc.name    JsColor068
     * @tc.desc    Blend 20 over 212 at 75 percent gives 68 seed 68
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor068', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(322)).assertEqual(255);
      expect(model.blendChannel(212, 20, 75)).assertEqual(68);
      expect(model.blendChannel(212, 20, 0)).assertEqual(212);
      expect(model.blendChannel(212, 20, 100)).assertEqual(20);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor068 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1749
     * @tc.name    JsColor069
     * @tc.desc    Blend 73 over 249 at 100 percent gives 73 seed 69
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor069', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(-49)).assertEqual(0);
      expect(model.blendChannel(249, 73, 100)).assertEqual(73);
      expect(model.blendChannel(249, 73, 0)).assertEqual(249);
      expect(model.blendChannel(249, 73, 100)).assertEqual(73);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor069 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1750
     * @tc.name    JsColor070
     * @tc.desc    Blend 126 over 30 at 0 percent gives 30 seed 70
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor070', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(-20)).assertEqual(0);
      expect(model.blendChannel(30, 126, 0)).assertEqual(30);
      expect(model.blendChannel(30, 126, 0)).assertEqual(30);
      expect(model.blendChannel(30, 126, 100)).assertEqual(126);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor070 done');
    });
}

function ColorBlendingPart015() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1751
     * @tc.name    JsColor071
     * @tc.desc    Blend 179 over 67 at 25 percent gives 95 seed 71
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor071', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(9)).assertEqual(9);
      expect(model.blendChannel(67, 179, 25)).assertEqual(95);
      expect(model.blendChannel(67, 179, 0)).assertEqual(67);
      expect(model.blendChannel(67, 179, 100)).assertEqual(179);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor071 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1752
     * @tc.name    JsColor072
     * @tc.desc    Blend 232 over 104 at 50 percent gives 168 seed 72
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor072', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(38)).assertEqual(38);
      expect(model.blendChannel(104, 232, 50)).assertEqual(168);
      expect(model.blendChannel(104, 232, 0)).assertEqual(104);
      expect(model.blendChannel(104, 232, 100)).assertEqual(232);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor072 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1753
     * @tc.name    JsColor073
     * @tc.desc    Blend 29 over 141 at 75 percent gives 57 seed 73
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor073', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(67)).assertEqual(67);
      expect(model.blendChannel(141, 29, 75)).assertEqual(57);
      expect(model.blendChannel(141, 29, 0)).assertEqual(141);
      expect(model.blendChannel(141, 29, 100)).assertEqual(29);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor073 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1754
     * @tc.name    JsColor074
     * @tc.desc    Blend 82 over 178 at 100 percent gives 82 seed 74
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor074', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(96)).assertEqual(96);
      expect(model.blendChannel(178, 82, 100)).assertEqual(82);
      expect(model.blendChannel(178, 82, 0)).assertEqual(178);
      expect(model.blendChannel(178, 82, 100)).assertEqual(82);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor074 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1755
     * @tc.name    JsColor075
     * @tc.desc    Blend 135 over 215 at 0 percent gives 215 seed 75
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor075', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(125)).assertEqual(125);
      expect(model.blendChannel(215, 135, 0)).assertEqual(215);
      expect(model.blendChannel(215, 135, 0)).assertEqual(215);
      expect(model.blendChannel(215, 135, 100)).assertEqual(135);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor075 done');
    });
}

function ColorBlendingPart016() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1756
     * @tc.name    JsColor076
     * @tc.desc    Blend 188 over 252 at 25 percent gives 236 seed 76
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor076', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(154)).assertEqual(154);
      expect(model.blendChannel(252, 188, 25)).assertEqual(236);
      expect(model.blendChannel(252, 188, 0)).assertEqual(252);
      expect(model.blendChannel(252, 188, 100)).assertEqual(188);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor076 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1757
     * @tc.name    JsColor077
     * @tc.desc    Blend 241 over 33 at 50 percent gives 137 seed 77
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor077', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(183)).assertEqual(183);
      expect(model.blendChannel(33, 241, 50)).assertEqual(137);
      expect(model.blendChannel(33, 241, 0)).assertEqual(33);
      expect(model.blendChannel(33, 241, 100)).assertEqual(241);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor077 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1758
     * @tc.name    JsColor078
     * @tc.desc    Blend 38 over 70 at 75 percent gives 46 seed 78
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor078', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(212)).assertEqual(212);
      expect(model.blendChannel(70, 38, 75)).assertEqual(46);
      expect(model.blendChannel(70, 38, 0)).assertEqual(70);
      expect(model.blendChannel(70, 38, 100)).assertEqual(38);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor078 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1759
     * @tc.name    JsColor079
     * @tc.desc    Blend 91 over 107 at 100 percent gives 91 seed 79
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor079', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(241)).assertEqual(241);
      expect(model.blendChannel(107, 91, 100)).assertEqual(91);
      expect(model.blendChannel(107, 91, 0)).assertEqual(107);
      expect(model.blendChannel(107, 91, 100)).assertEqual(91);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor079 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1760
     * @tc.name    JsColor080
     * @tc.desc    Blend 144 over 144 at 0 percent gives 144 seed 80
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor080', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(270)).assertEqual(255);
      expect(model.blendChannel(144, 144, 0)).assertEqual(144);
      expect(model.blendChannel(144, 144, 0)).assertEqual(144);
      expect(model.blendChannel(144, 144, 100)).assertEqual(144);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor080 done');
    });
}

function ColorBlendingPart017() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1761
     * @tc.name    JsColor081
     * @tc.desc    Blend 197 over 181 at 25 percent gives 185 seed 81
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor081', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(299)).assertEqual(255);
      expect(model.blendChannel(181, 197, 25)).assertEqual(185);
      expect(model.blendChannel(181, 197, 0)).assertEqual(181);
      expect(model.blendChannel(181, 197, 100)).assertEqual(197);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor081 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1762
     * @tc.name    JsColor082
     * @tc.desc    Blend 250 over 218 at 50 percent gives 234 seed 82
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor082', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(328)).assertEqual(255);
      expect(model.blendChannel(218, 250, 50)).assertEqual(234);
      expect(model.blendChannel(218, 250, 0)).assertEqual(218);
      expect(model.blendChannel(218, 250, 100)).assertEqual(250);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor082 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1763
     * @tc.name    JsColor083
     * @tc.desc    Blend 47 over 255 at 75 percent gives 99 seed 83
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor083', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(-43)).assertEqual(0);
      expect(model.blendChannel(255, 47, 75)).assertEqual(99);
      expect(model.blendChannel(255, 47, 0)).assertEqual(255);
      expect(model.blendChannel(255, 47, 100)).assertEqual(47);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor083 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1764
     * @tc.name    JsColor084
     * @tc.desc    Blend 100 over 36 at 100 percent gives 100 seed 84
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor084', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(-14)).assertEqual(0);
      expect(model.blendChannel(36, 100, 100)).assertEqual(100);
      expect(model.blendChannel(36, 100, 0)).assertEqual(36);
      expect(model.blendChannel(36, 100, 100)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor084 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1765
     * @tc.name    JsColor085
     * @tc.desc    Blend 153 over 73 at 0 percent gives 73 seed 85
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor085', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(15)).assertEqual(15);
      expect(model.blendChannel(73, 153, 0)).assertEqual(73);
      expect(model.blendChannel(73, 153, 0)).assertEqual(73);
      expect(model.blendChannel(73, 153, 100)).assertEqual(153);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor085 done');
    });
}

function ColorBlendingPart018() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1766
     * @tc.name    JsColor086
     * @tc.desc    Blend 206 over 110 at 25 percent gives 134 seed 86
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor086', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(44)).assertEqual(44);
      expect(model.blendChannel(110, 206, 25)).assertEqual(134);
      expect(model.blendChannel(110, 206, 0)).assertEqual(110);
      expect(model.blendChannel(110, 206, 100)).assertEqual(206);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor086 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1767
     * @tc.name    JsColor087
     * @tc.desc    Blend 3 over 147 at 50 percent gives 75 seed 87
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor087', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(73)).assertEqual(73);
      expect(model.blendChannel(147, 3, 50)).assertEqual(75);
      expect(model.blendChannel(147, 3, 0)).assertEqual(147);
      expect(model.blendChannel(147, 3, 100)).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor087 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1768
     * @tc.name    JsColor088
     * @tc.desc    Blend 56 over 184 at 75 percent gives 88 seed 88
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor088', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(102)).assertEqual(102);
      expect(model.blendChannel(184, 56, 75)).assertEqual(88);
      expect(model.blendChannel(184, 56, 0)).assertEqual(184);
      expect(model.blendChannel(184, 56, 100)).assertEqual(56);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor088 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1769
     * @tc.name    JsColor089
     * @tc.desc    Blend 109 over 221 at 100 percent gives 109 seed 89
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor089', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(131)).assertEqual(131);
      expect(model.blendChannel(221, 109, 100)).assertEqual(109);
      expect(model.blendChannel(221, 109, 0)).assertEqual(221);
      expect(model.blendChannel(221, 109, 100)).assertEqual(109);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor089 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1770
     * @tc.name    JsColor090
     * @tc.desc    Blend 162 over 2 at 0 percent gives 2 seed 90
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor090', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(160)).assertEqual(160);
      expect(model.blendChannel(2, 162, 0)).assertEqual(2);
      expect(model.blendChannel(2, 162, 0)).assertEqual(2);
      expect(model.blendChannel(2, 162, 100)).assertEqual(162);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor090 done');
    });
}

export default function colorBlendingSuite() {
  describe('ColorBlendingSuite', function () {
    ColorBlendingPart001();
    ColorBlendingPart002();
    ColorBlendingPart003();
    ColorBlendingPart004();
    ColorBlendingPart005();
    ColorBlendingPart006();
    ColorBlendingPart007();
    ColorBlendingPart008();
    ColorBlendingPart009();
    ColorBlendingPart010();
    ColorBlendingPart011();
    ColorBlendingPart012();
    ColorBlendingPart013();
    ColorBlendingPart014();
    ColorBlendingPart015();
    ColorBlendingPart016();
    ColorBlendingPart017();
    ColorBlendingPart018();
  });
}
