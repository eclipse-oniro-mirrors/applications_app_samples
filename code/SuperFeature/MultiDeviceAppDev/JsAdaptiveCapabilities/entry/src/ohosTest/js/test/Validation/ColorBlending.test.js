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

function ColorBlendingPart019() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1771
     * @tc.name    JsColor091
     * @tc.desc    Blend 215 over 39 at 25 percent gives 83 seed 91
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor091', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(189)).assertEqual(189);
      expect(model.blendChannel(39, 215, 25)).assertEqual(83);
      expect(model.blendChannel(39, 215, 0)).assertEqual(39);
      expect(model.blendChannel(39, 215, 100)).assertEqual(215);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor091 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1772
     * @tc.name    JsColor092
     * @tc.desc    Blend 12 over 76 at 50 percent gives 44 seed 92
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor092', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(218)).assertEqual(218);
      expect(model.blendChannel(76, 12, 50)).assertEqual(44);
      expect(model.blendChannel(76, 12, 0)).assertEqual(76);
      expect(model.blendChannel(76, 12, 100)).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor092 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1773
     * @tc.name    JsColor093
     * @tc.desc    Blend 65 over 113 at 75 percent gives 77 seed 93
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor093', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(247)).assertEqual(247);
      expect(model.blendChannel(113, 65, 75)).assertEqual(77);
      expect(model.blendChannel(113, 65, 0)).assertEqual(113);
      expect(model.blendChannel(113, 65, 100)).assertEqual(65);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor093 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1774
     * @tc.name    JsColor094
     * @tc.desc    Blend 118 over 150 at 100 percent gives 118 seed 94
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor094', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(276)).assertEqual(255);
      expect(model.blendChannel(150, 118, 100)).assertEqual(118);
      expect(model.blendChannel(150, 118, 0)).assertEqual(150);
      expect(model.blendChannel(150, 118, 100)).assertEqual(118);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor094 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1775
     * @tc.name    JsColor095
     * @tc.desc    Blend 171 over 187 at 0 percent gives 187 seed 95
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor095', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(305)).assertEqual(255);
      expect(model.blendChannel(187, 171, 0)).assertEqual(187);
      expect(model.blendChannel(187, 171, 0)).assertEqual(187);
      expect(model.blendChannel(187, 171, 100)).assertEqual(171);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor095 done');
    });
}

function ColorBlendingPart020() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1776
     * @tc.name    JsColor096
     * @tc.desc    Blend 224 over 224 at 25 percent gives 224 seed 96
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor096', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(334)).assertEqual(255);
      expect(model.blendChannel(224, 224, 25)).assertEqual(224);
      expect(model.blendChannel(224, 224, 0)).assertEqual(224);
      expect(model.blendChannel(224, 224, 100)).assertEqual(224);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor096 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1777
     * @tc.name    JsColor097
     * @tc.desc    Blend 21 over 5 at 50 percent gives 13 seed 97
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor097', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(-37)).assertEqual(0);
      expect(model.blendChannel(5, 21, 50)).assertEqual(13);
      expect(model.blendChannel(5, 21, 0)).assertEqual(5);
      expect(model.blendChannel(5, 21, 100)).assertEqual(21);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor097 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1778
     * @tc.name    JsColor098
     * @tc.desc    Blend 74 over 42 at 75 percent gives 66 seed 98
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor098', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(-8)).assertEqual(0);
      expect(model.blendChannel(42, 74, 75)).assertEqual(66);
      expect(model.blendChannel(42, 74, 0)).assertEqual(42);
      expect(model.blendChannel(42, 74, 100)).assertEqual(74);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor098 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1779
     * @tc.name    JsColor099
     * @tc.desc    Blend 127 over 79 at 100 percent gives 127 seed 99
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor099', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(21)).assertEqual(21);
      expect(model.blendChannel(79, 127, 100)).assertEqual(127);
      expect(model.blendChannel(79, 127, 0)).assertEqual(79);
      expect(model.blendChannel(79, 127, 100)).assertEqual(127);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor099 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1780
     * @tc.name    JsColor100
     * @tc.desc    Blend 180 over 116 at 0 percent gives 116 seed 100
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor100', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(50)).assertEqual(50);
      expect(model.blendChannel(116, 180, 0)).assertEqual(116);
      expect(model.blendChannel(116, 180, 0)).assertEqual(116);
      expect(model.blendChannel(116, 180, 100)).assertEqual(180);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor100 done');
    });
}

function ColorBlendingPart021() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1781
     * @tc.name    JsColor101
     * @tc.desc    Blend 233 over 153 at 25 percent gives 173 seed 101
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor101', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(79)).assertEqual(79);
      expect(model.blendChannel(153, 233, 25)).assertEqual(173);
      expect(model.blendChannel(153, 233, 0)).assertEqual(153);
      expect(model.blendChannel(153, 233, 100)).assertEqual(233);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor101 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1782
     * @tc.name    JsColor102
     * @tc.desc    Blend 30 over 190 at 50 percent gives 110 seed 102
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor102', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(108)).assertEqual(108);
      expect(model.blendChannel(190, 30, 50)).assertEqual(110);
      expect(model.blendChannel(190, 30, 0)).assertEqual(190);
      expect(model.blendChannel(190, 30, 100)).assertEqual(30);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor102 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1783
     * @tc.name    JsColor103
     * @tc.desc    Blend 83 over 227 at 75 percent gives 119 seed 103
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor103', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(137)).assertEqual(137);
      expect(model.blendChannel(227, 83, 75)).assertEqual(119);
      expect(model.blendChannel(227, 83, 0)).assertEqual(227);
      expect(model.blendChannel(227, 83, 100)).assertEqual(83);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor103 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1784
     * @tc.name    JsColor104
     * @tc.desc    Blend 136 over 8 at 100 percent gives 136 seed 104
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor104', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(166)).assertEqual(166);
      expect(model.blendChannel(8, 136, 100)).assertEqual(136);
      expect(model.blendChannel(8, 136, 0)).assertEqual(8);
      expect(model.blendChannel(8, 136, 100)).assertEqual(136);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor104 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1785
     * @tc.name    JsColor105
     * @tc.desc    Blend 189 over 45 at 0 percent gives 45 seed 105
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor105', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(195)).assertEqual(195);
      expect(model.blendChannel(45, 189, 0)).assertEqual(45);
      expect(model.blendChannel(45, 189, 0)).assertEqual(45);
      expect(model.blendChannel(45, 189, 100)).assertEqual(189);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor105 done');
    });
}

function ColorBlendingPart022() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1786
     * @tc.name    JsColor106
     * @tc.desc    Blend 242 over 82 at 25 percent gives 122 seed 106
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor106', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(224)).assertEqual(224);
      expect(model.blendChannel(82, 242, 25)).assertEqual(122);
      expect(model.blendChannel(82, 242, 0)).assertEqual(82);
      expect(model.blendChannel(82, 242, 100)).assertEqual(242);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor106 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1787
     * @tc.name    JsColor107
     * @tc.desc    Blend 39 over 119 at 50 percent gives 79 seed 107
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor107', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(253)).assertEqual(253);
      expect(model.blendChannel(119, 39, 50)).assertEqual(79);
      expect(model.blendChannel(119, 39, 0)).assertEqual(119);
      expect(model.blendChannel(119, 39, 100)).assertEqual(39);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor107 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1788
     * @tc.name    JsColor108
     * @tc.desc    Blend 92 over 156 at 75 percent gives 108 seed 108
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor108', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(282)).assertEqual(255);
      expect(model.blendChannel(156, 92, 75)).assertEqual(108);
      expect(model.blendChannel(156, 92, 0)).assertEqual(156);
      expect(model.blendChannel(156, 92, 100)).assertEqual(92);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor108 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1789
     * @tc.name    JsColor109
     * @tc.desc    Blend 145 over 193 at 100 percent gives 145 seed 109
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor109', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(311)).assertEqual(255);
      expect(model.blendChannel(193, 145, 100)).assertEqual(145);
      expect(model.blendChannel(193, 145, 0)).assertEqual(193);
      expect(model.blendChannel(193, 145, 100)).assertEqual(145);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor109 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1790
     * @tc.name    JsColor110
     * @tc.desc    Blend 198 over 230 at 0 percent gives 230 seed 110
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor110', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(340)).assertEqual(255);
      expect(model.blendChannel(230, 198, 0)).assertEqual(230);
      expect(model.blendChannel(230, 198, 0)).assertEqual(230);
      expect(model.blendChannel(230, 198, 100)).assertEqual(198);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor110 done');
    });
}

function ColorBlendingPart023() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1791
     * @tc.name    JsColor111
     * @tc.desc    Blend 251 over 11 at 25 percent gives 71 seed 111
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor111', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(-31)).assertEqual(0);
      expect(model.blendChannel(11, 251, 25)).assertEqual(71);
      expect(model.blendChannel(11, 251, 0)).assertEqual(11);
      expect(model.blendChannel(11, 251, 100)).assertEqual(251);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor111 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1792
     * @tc.name    JsColor112
     * @tc.desc    Blend 48 over 48 at 50 percent gives 48 seed 112
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor112', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(-2)).assertEqual(0);
      expect(model.blendChannel(48, 48, 50)).assertEqual(48);
      expect(model.blendChannel(48, 48, 0)).assertEqual(48);
      expect(model.blendChannel(48, 48, 100)).assertEqual(48);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor112 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1793
     * @tc.name    JsColor113
     * @tc.desc    Blend 101 over 85 at 75 percent gives 97 seed 113
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor113', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(27)).assertEqual(27);
      expect(model.blendChannel(85, 101, 75)).assertEqual(97);
      expect(model.blendChannel(85, 101, 0)).assertEqual(85);
      expect(model.blendChannel(85, 101, 100)).assertEqual(101);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor113 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1794
     * @tc.name    JsColor114
     * @tc.desc    Blend 154 over 122 at 100 percent gives 154 seed 114
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor114', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(56)).assertEqual(56);
      expect(model.blendChannel(122, 154, 100)).assertEqual(154);
      expect(model.blendChannel(122, 154, 0)).assertEqual(122);
      expect(model.blendChannel(122, 154, 100)).assertEqual(154);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor114 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1795
     * @tc.name    JsColor115
     * @tc.desc    Blend 207 over 159 at 0 percent gives 159 seed 115
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor115', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(85)).assertEqual(85);
      expect(model.blendChannel(159, 207, 0)).assertEqual(159);
      expect(model.blendChannel(159, 207, 0)).assertEqual(159);
      expect(model.blendChannel(159, 207, 100)).assertEqual(207);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor115 done');
    });
}

function ColorBlendingPart024() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1796
     * @tc.name    JsColor116
     * @tc.desc    Blend 4 over 196 at 25 percent gives 148 seed 116
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor116', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(114)).assertEqual(114);
      expect(model.blendChannel(196, 4, 25)).assertEqual(148);
      expect(model.blendChannel(196, 4, 0)).assertEqual(196);
      expect(model.blendChannel(196, 4, 100)).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor116 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1797
     * @tc.name    JsColor117
     * @tc.desc    Blend 57 over 233 at 50 percent gives 145 seed 117
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor117', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(143)).assertEqual(143);
      expect(model.blendChannel(233, 57, 50)).assertEqual(145);
      expect(model.blendChannel(233, 57, 0)).assertEqual(233);
      expect(model.blendChannel(233, 57, 100)).assertEqual(57);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor117 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1798
     * @tc.name    JsColor118
     * @tc.desc    Blend 110 over 14 at 75 percent gives 86 seed 118
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor118', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(172)).assertEqual(172);
      expect(model.blendChannel(14, 110, 75)).assertEqual(86);
      expect(model.blendChannel(14, 110, 0)).assertEqual(14);
      expect(model.blendChannel(14, 110, 100)).assertEqual(110);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor118 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1799
     * @tc.name    JsColor119
     * @tc.desc    Blend 163 over 51 at 100 percent gives 163 seed 119
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor119', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(201)).assertEqual(201);
      expect(model.blendChannel(51, 163, 100)).assertEqual(163);
      expect(model.blendChannel(51, 163, 0)).assertEqual(51);
      expect(model.blendChannel(51, 163, 100)).assertEqual(163);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor119 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1800
     * @tc.name    JsColor120
     * @tc.desc    Blend 216 over 88 at 0 percent gives 88 seed 120
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor120', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(230)).assertEqual(230);
      expect(model.blendChannel(88, 216, 0)).assertEqual(88);
      expect(model.blendChannel(88, 216, 0)).assertEqual(88);
      expect(model.blendChannel(88, 216, 100)).assertEqual(216);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor120 done');
    });
}

function ColorBlendingPart025() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1801
     * @tc.name    JsColor121
     * @tc.desc    Blend 13 over 125 at 25 percent gives 97 seed 121
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor121', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(259)).assertEqual(255);
      expect(model.blendChannel(125, 13, 25)).assertEqual(97);
      expect(model.blendChannel(125, 13, 0)).assertEqual(125);
      expect(model.blendChannel(125, 13, 100)).assertEqual(13);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor121 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1802
     * @tc.name    JsColor122
     * @tc.desc    Blend 66 over 162 at 50 percent gives 114 seed 122
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor122', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(288)).assertEqual(255);
      expect(model.blendChannel(162, 66, 50)).assertEqual(114);
      expect(model.blendChannel(162, 66, 0)).assertEqual(162);
      expect(model.blendChannel(162, 66, 100)).assertEqual(66);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor122 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1803
     * @tc.name    JsColor123
     * @tc.desc    Blend 119 over 199 at 75 percent gives 139 seed 123
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor123', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(317)).assertEqual(255);
      expect(model.blendChannel(199, 119, 75)).assertEqual(139);
      expect(model.blendChannel(199, 119, 0)).assertEqual(199);
      expect(model.blendChannel(199, 119, 100)).assertEqual(119);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor123 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1804
     * @tc.name    JsColor124
     * @tc.desc    Blend 172 over 236 at 100 percent gives 172 seed 124
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor124', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(346)).assertEqual(255);
      expect(model.blendChannel(236, 172, 100)).assertEqual(172);
      expect(model.blendChannel(236, 172, 0)).assertEqual(236);
      expect(model.blendChannel(236, 172, 100)).assertEqual(172);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor124 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1805
     * @tc.name    JsColor125
     * @tc.desc    Blend 225 over 17 at 0 percent gives 17 seed 125
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor125', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(-25)).assertEqual(0);
      expect(model.blendChannel(17, 225, 0)).assertEqual(17);
      expect(model.blendChannel(17, 225, 0)).assertEqual(17);
      expect(model.blendChannel(17, 225, 100)).assertEqual(225);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor125 done');
    });
}

function ColorBlendingPart026() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1806
     * @tc.name    JsColor126
     * @tc.desc    Blend 22 over 54 at 25 percent gives 46 seed 126
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor126', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(4)).assertEqual(4);
      expect(model.blendChannel(54, 22, 25)).assertEqual(46);
      expect(model.blendChannel(54, 22, 0)).assertEqual(54);
      expect(model.blendChannel(54, 22, 100)).assertEqual(22);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor126 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1807
     * @tc.name    JsColor127
     * @tc.desc    Blend 75 over 91 at 50 percent gives 83 seed 127
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor127', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(33)).assertEqual(33);
      expect(model.blendChannel(91, 75, 50)).assertEqual(83);
      expect(model.blendChannel(91, 75, 0)).assertEqual(91);
      expect(model.blendChannel(91, 75, 100)).assertEqual(75);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor127 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1808
     * @tc.name    JsColor128
     * @tc.desc    Blend 128 over 128 at 75 percent gives 128 seed 128
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor128', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(62)).assertEqual(62);
      expect(model.blendChannel(128, 128, 75)).assertEqual(128);
      expect(model.blendChannel(128, 128, 0)).assertEqual(128);
      expect(model.blendChannel(128, 128, 100)).assertEqual(128);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor128 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1809
     * @tc.name    JsColor129
     * @tc.desc    Blend 181 over 165 at 100 percent gives 181 seed 129
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor129', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(91)).assertEqual(91);
      expect(model.blendChannel(165, 181, 100)).assertEqual(181);
      expect(model.blendChannel(165, 181, 0)).assertEqual(165);
      expect(model.blendChannel(165, 181, 100)).assertEqual(181);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor129 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1810
     * @tc.name    JsColor130
     * @tc.desc    Blend 234 over 202 at 0 percent gives 202 seed 130
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor130', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(120)).assertEqual(120);
      expect(model.blendChannel(202, 234, 0)).assertEqual(202);
      expect(model.blendChannel(202, 234, 0)).assertEqual(202);
      expect(model.blendChannel(202, 234, 100)).assertEqual(234);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor130 done');
    });
}

function ColorBlendingPart027() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1811
     * @tc.name    JsColor131
     * @tc.desc    Blend 31 over 239 at 25 percent gives 187 seed 131
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor131', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(149)).assertEqual(149);
      expect(model.blendChannel(239, 31, 25)).assertEqual(187);
      expect(model.blendChannel(239, 31, 0)).assertEqual(239);
      expect(model.blendChannel(239, 31, 100)).assertEqual(31);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor131 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1812
     * @tc.name    JsColor132
     * @tc.desc    Blend 84 over 20 at 50 percent gives 52 seed 132
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor132', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(178)).assertEqual(178);
      expect(model.blendChannel(20, 84, 50)).assertEqual(52);
      expect(model.blendChannel(20, 84, 0)).assertEqual(20);
      expect(model.blendChannel(20, 84, 100)).assertEqual(84);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor132 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1813
     * @tc.name    JsColor133
     * @tc.desc    Blend 137 over 57 at 75 percent gives 117 seed 133
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor133', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(207)).assertEqual(207);
      expect(model.blendChannel(57, 137, 75)).assertEqual(117);
      expect(model.blendChannel(57, 137, 0)).assertEqual(57);
      expect(model.blendChannel(57, 137, 100)).assertEqual(137);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor133 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1814
     * @tc.name    JsColor134
     * @tc.desc    Blend 190 over 94 at 100 percent gives 190 seed 134
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor134', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(236)).assertEqual(236);
      expect(model.blendChannel(94, 190, 100)).assertEqual(190);
      expect(model.blendChannel(94, 190, 0)).assertEqual(94);
      expect(model.blendChannel(94, 190, 100)).assertEqual(190);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor134 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1815
     * @tc.name    JsColor135
     * @tc.desc    Blend 243 over 131 at 0 percent gives 131 seed 135
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor135', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(265)).assertEqual(255);
      expect(model.blendChannel(131, 243, 0)).assertEqual(131);
      expect(model.blendChannel(131, 243, 0)).assertEqual(131);
      expect(model.blendChannel(131, 243, 100)).assertEqual(243);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor135 done');
    });
}

function ColorBlendingPart028() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1816
     * @tc.name    JsColor136
     * @tc.desc    Blend 40 over 168 at 25 percent gives 136 seed 136
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor136', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(294)).assertEqual(255);
      expect(model.blendChannel(168, 40, 25)).assertEqual(136);
      expect(model.blendChannel(168, 40, 0)).assertEqual(168);
      expect(model.blendChannel(168, 40, 100)).assertEqual(40);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor136 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1817
     * @tc.name    JsColor137
     * @tc.desc    Blend 93 over 205 at 50 percent gives 149 seed 137
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor137', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(323)).assertEqual(255);
      expect(model.blendChannel(205, 93, 50)).assertEqual(149);
      expect(model.blendChannel(205, 93, 0)).assertEqual(205);
      expect(model.blendChannel(205, 93, 100)).assertEqual(93);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor137 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1818
     * @tc.name    JsColor138
     * @tc.desc    Blend 146 over 242 at 75 percent gives 170 seed 138
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor138', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(-48)).assertEqual(0);
      expect(model.blendChannel(242, 146, 75)).assertEqual(170);
      expect(model.blendChannel(242, 146, 0)).assertEqual(242);
      expect(model.blendChannel(242, 146, 100)).assertEqual(146);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor138 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1819
     * @tc.name    JsColor139
     * @tc.desc    Blend 199 over 23 at 100 percent gives 199 seed 139
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor139', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(-19)).assertEqual(0);
      expect(model.blendChannel(23, 199, 100)).assertEqual(199);
      expect(model.blendChannel(23, 199, 0)).assertEqual(23);
      expect(model.blendChannel(23, 199, 100)).assertEqual(199);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor139 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1820
     * @tc.name    JsColor140
     * @tc.desc    Blend 252 over 60 at 0 percent gives 60 seed 140
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsColor140', 0, async function () {
      await yieldThread();
      expect(model.clampChannel(10)).assertEqual(10);
      expect(model.blendChannel(60, 252, 0)).assertEqual(60);
      expect(model.blendChannel(60, 252, 0)).assertEqual(60);
      expect(model.blendChannel(60, 252, 100)).assertEqual(252);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsColor140 done');
    });
}

function ColorBlendingGroup001() {
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
  ColorBlendingPart019();
  ColorBlendingPart020();
  ColorBlendingPart021();
  ColorBlendingPart022();
  ColorBlendingPart023();
  ColorBlendingPart024();
  ColorBlendingPart025();
  ColorBlendingPart026();
  ColorBlendingPart027();
  ColorBlendingPart028();
}

export default function colorBlendingSuite() {
  describe('ColorBlendingSuite', function () {
    ColorBlendingGroup001();
  });
}
