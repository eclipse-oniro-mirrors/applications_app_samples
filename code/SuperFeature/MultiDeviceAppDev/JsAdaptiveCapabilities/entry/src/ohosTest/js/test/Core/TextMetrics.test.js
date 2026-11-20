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

function TextMetricsPart001() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1541
     * @tc.name    JsTextMetrics001
     * @tc.desc    Font 14 line 21 spacing 28 seed 1
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics001', 0, async function () {
      await yieldThread();
      const fontSize = 14;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(21);
      expect(model.letterSpacingOf(fontSize)).assertEqual(28);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(24);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(32);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics001 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1542
     * @tc.name    JsTextMetrics002
     * @tc.desc    Font 16 line 24 spacing 32 seed 2
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics002', 0, async function () {
      await yieldThread();
      const fontSize = 16;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(24);
      expect(model.letterSpacingOf(fontSize)).assertEqual(32);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(27);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(36);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics002 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1543
     * @tc.name    JsTextMetrics003
     * @tc.desc    Font 18 line 27 spacing 36 seed 3
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics003', 0, async function () {
      await yieldThread();
      const fontSize = 18;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(27);
      expect(model.letterSpacingOf(fontSize)).assertEqual(36);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(30);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(40);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics003 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1544
     * @tc.name    JsTextMetrics004
     * @tc.desc    Font 20 line 30 spacing 40 seed 4
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics004', 0, async function () {
      await yieldThread();
      const fontSize = 20;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(30);
      expect(model.letterSpacingOf(fontSize)).assertEqual(40);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(33);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(44);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics004 done');
    });
}

function TextMetricsPart002() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1545
     * @tc.name    JsTextMetrics005
     * @tc.desc    Font 22 line 33 spacing 44 seed 5
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics005', 0, async function () {
      await yieldThread();
      const fontSize = 22;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(33);
      expect(model.letterSpacingOf(fontSize)).assertEqual(44);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(36);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(48);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics005 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1546
     * @tc.name    JsTextMetrics006
     * @tc.desc    Font 24 line 36 spacing 48 seed 6
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics006', 0, async function () {
      await yieldThread();
      const fontSize = 24;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(36);
      expect(model.letterSpacingOf(fontSize)).assertEqual(48);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(39);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(52);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics006 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1547
     * @tc.name    JsTextMetrics007
     * @tc.desc    Font 26 line 39 spacing 52 seed 7
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics007', 0, async function () {
      await yieldThread();
      const fontSize = 26;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(39);
      expect(model.letterSpacingOf(fontSize)).assertEqual(52);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(42);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(56);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics007 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1548
     * @tc.name    JsTextMetrics008
     * @tc.desc    Font 28 line 42 spacing 56 seed 8
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics008', 0, async function () {
      await yieldThread();
      const fontSize = 28;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(42);
      expect(model.letterSpacingOf(fontSize)).assertEqual(56);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(45);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(60);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics008 done');
    });
}

function TextMetricsPart003() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1549
     * @tc.name    JsTextMetrics009
     * @tc.desc    Font 30 line 45 spacing 60 seed 9
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics009', 0, async function () {
      await yieldThread();
      const fontSize = 30;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(45);
      expect(model.letterSpacingOf(fontSize)).assertEqual(60);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(48);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(64);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics009 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1550
     * @tc.name    JsTextMetrics010
     * @tc.desc    Font 32 line 48 spacing 64 seed 10
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics010', 0, async function () {
      await yieldThread();
      const fontSize = 32;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(48);
      expect(model.letterSpacingOf(fontSize)).assertEqual(64);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(51);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(68);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics010 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1551
     * @tc.name    JsTextMetrics011
     * @tc.desc    Font 34 line 51 spacing 68 seed 11
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics011', 0, async function () {
      await yieldThread();
      const fontSize = 34;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(51);
      expect(model.letterSpacingOf(fontSize)).assertEqual(68);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(54);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(72);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics011 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1552
     * @tc.name    JsTextMetrics012
     * @tc.desc    Font 36 line 54 spacing 72 seed 12
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics012', 0, async function () {
      await yieldThread();
      const fontSize = 36;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(54);
      expect(model.letterSpacingOf(fontSize)).assertEqual(72);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(57);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(76);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics012 done');
    });
}

function TextMetricsPart004() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1553
     * @tc.name    JsTextMetrics013
     * @tc.desc    Font 38 line 57 spacing 76 seed 13
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics013', 0, async function () {
      await yieldThread();
      const fontSize = 38;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(57);
      expect(model.letterSpacingOf(fontSize)).assertEqual(76);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(60);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(80);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics013 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1554
     * @tc.name    JsTextMetrics014
     * @tc.desc    Font 40 line 60 spacing 80 seed 14
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics014', 0, async function () {
      await yieldThread();
      const fontSize = 40;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(60);
      expect(model.letterSpacingOf(fontSize)).assertEqual(80);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(63);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(84);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics014 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1555
     * @tc.name    JsTextMetrics015
     * @tc.desc    Font 42 line 63 spacing 84 seed 15
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics015', 0, async function () {
      await yieldThread();
      const fontSize = 42;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(63);
      expect(model.letterSpacingOf(fontSize)).assertEqual(84);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(66);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(88);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics015 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1556
     * @tc.name    JsTextMetrics016
     * @tc.desc    Font 44 line 66 spacing 88 seed 16
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics016', 0, async function () {
      await yieldThread();
      const fontSize = 44;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(66);
      expect(model.letterSpacingOf(fontSize)).assertEqual(88);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(69);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(92);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics016 done');
    });
}

function TextMetricsPart005() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1557
     * @tc.name    JsTextMetrics017
     * @tc.desc    Font 46 line 69 spacing 92 seed 17
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics017', 0, async function () {
      await yieldThread();
      const fontSize = 46;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(69);
      expect(model.letterSpacingOf(fontSize)).assertEqual(92);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(72);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(96);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics017 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1558
     * @tc.name    JsTextMetrics018
     * @tc.desc    Font 48 line 72 spacing 96 seed 18
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics018', 0, async function () {
      await yieldThread();
      const fontSize = 48;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(72);
      expect(model.letterSpacingOf(fontSize)).assertEqual(96);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(75);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics018 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1559
     * @tc.name    JsTextMetrics019
     * @tc.desc    Font 50 line 75 spacing 100 seed 19
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics019', 0, async function () {
      await yieldThread();
      const fontSize = 50;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(75);
      expect(model.letterSpacingOf(fontSize)).assertEqual(100);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(78);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(104);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics019 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1560
     * @tc.name    JsTextMetrics020
     * @tc.desc    Font 52 line 78 spacing 104 seed 20
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics020', 0, async function () {
      await yieldThread();
      const fontSize = 52;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(78);
      expect(model.letterSpacingOf(fontSize)).assertEqual(104);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(81);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(108);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics020 done');
    });
}

function TextMetricsPart006() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1561
     * @tc.name    JsTextMetrics021
     * @tc.desc    Font 54 line 81 spacing 108 seed 21
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics021', 0, async function () {
      await yieldThread();
      const fontSize = 54;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(81);
      expect(model.letterSpacingOf(fontSize)).assertEqual(108);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(84);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(112);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics021 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1562
     * @tc.name    JsTextMetrics022
     * @tc.desc    Font 56 line 84 spacing 112 seed 22
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics022', 0, async function () {
      await yieldThread();
      const fontSize = 56;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(84);
      expect(model.letterSpacingOf(fontSize)).assertEqual(112);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(87);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(116);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics022 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1563
     * @tc.name    JsTextMetrics023
     * @tc.desc    Font 58 line 87 spacing 116 seed 23
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics023', 0, async function () {
      await yieldThread();
      const fontSize = 58;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(87);
      expect(model.letterSpacingOf(fontSize)).assertEqual(116);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(90);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(120);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics023 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1564
     * @tc.name    JsTextMetrics024
     * @tc.desc    Font 60 line 90 spacing 120 seed 24
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics024', 0, async function () {
      await yieldThread();
      const fontSize = 60;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(90);
      expect(model.letterSpacingOf(fontSize)).assertEqual(120);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(93);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(124);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics024 done');
    });
}

function TextMetricsPart007() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1565
     * @tc.name    JsTextMetrics025
     * @tc.desc    Font 62 line 93 spacing 124 seed 25
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics025', 0, async function () {
      await yieldThread();
      const fontSize = 62;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(93);
      expect(model.letterSpacingOf(fontSize)).assertEqual(124);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(96);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(128);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics025 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1566
     * @tc.name    JsTextMetrics026
     * @tc.desc    Font 64 line 96 spacing 128 seed 26
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics026', 0, async function () {
      await yieldThread();
      const fontSize = 64;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(96);
      expect(model.letterSpacingOf(fontSize)).assertEqual(128);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(99);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(132);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics026 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1567
     * @tc.name    JsTextMetrics027
     * @tc.desc    Font 66 line 99 spacing 132 seed 27
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics027', 0, async function () {
      await yieldThread();
      const fontSize = 66;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(99);
      expect(model.letterSpacingOf(fontSize)).assertEqual(132);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(102);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(136);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics027 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1568
     * @tc.name    JsTextMetrics028
     * @tc.desc    Font 68 line 102 spacing 136 seed 28
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics028', 0, async function () {
      await yieldThread();
      const fontSize = 68;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(102);
      expect(model.letterSpacingOf(fontSize)).assertEqual(136);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(105);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(140);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics028 done');
    });
}

function TextMetricsPart008() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1569
     * @tc.name    JsTextMetrics029
     * @tc.desc    Font 70 line 105 spacing 140 seed 29
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics029', 0, async function () {
      await yieldThread();
      const fontSize = 70;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(105);
      expect(model.letterSpacingOf(fontSize)).assertEqual(140);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(108);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(144);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics029 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1570
     * @tc.name    JsTextMetrics030
     * @tc.desc    Font 72 line 108 spacing 144 seed 30
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics030', 0, async function () {
      await yieldThread();
      const fontSize = 72;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(108);
      expect(model.letterSpacingOf(fontSize)).assertEqual(144);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(111);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(148);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics030 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1571
     * @tc.name    JsTextMetrics031
     * @tc.desc    Font 74 line 111 spacing 148 seed 31
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics031', 0, async function () {
      await yieldThread();
      const fontSize = 74;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(111);
      expect(model.letterSpacingOf(fontSize)).assertEqual(148);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(114);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(152);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics031 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1572
     * @tc.name    JsTextMetrics032
     * @tc.desc    Font 76 line 114 spacing 152 seed 32
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics032', 0, async function () {
      await yieldThread();
      const fontSize = 76;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(114);
      expect(model.letterSpacingOf(fontSize)).assertEqual(152);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(117);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(156);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics032 done');
    });
}

function TextMetricsPart009() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1573
     * @tc.name    JsTextMetrics033
     * @tc.desc    Font 78 line 117 spacing 156 seed 33
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics033', 0, async function () {
      await yieldThread();
      const fontSize = 78;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(117);
      expect(model.letterSpacingOf(fontSize)).assertEqual(156);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(120);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(160);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics033 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1574
     * @tc.name    JsTextMetrics034
     * @tc.desc    Font 80 line 120 spacing 160 seed 34
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics034', 0, async function () {
      await yieldThread();
      const fontSize = 80;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(120);
      expect(model.letterSpacingOf(fontSize)).assertEqual(160);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(123);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(164);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics034 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1575
     * @tc.name    JsTextMetrics035
     * @tc.desc    Font 82 line 123 spacing 164 seed 35
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics035', 0, async function () {
      await yieldThread();
      const fontSize = 82;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(123);
      expect(model.letterSpacingOf(fontSize)).assertEqual(164);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(126);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(168);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics035 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1576
     * @tc.name    JsTextMetrics036
     * @tc.desc    Font 84 line 126 spacing 168 seed 36
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics036', 0, async function () {
      await yieldThread();
      const fontSize = 84;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(126);
      expect(model.letterSpacingOf(fontSize)).assertEqual(168);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(129);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(172);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics036 done');
    });
}

function TextMetricsPart010() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1577
     * @tc.name    JsTextMetrics037
     * @tc.desc    Font 86 line 129 spacing 172 seed 37
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics037', 0, async function () {
      await yieldThread();
      const fontSize = 86;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(129);
      expect(model.letterSpacingOf(fontSize)).assertEqual(172);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(132);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(176);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics037 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1578
     * @tc.name    JsTextMetrics038
     * @tc.desc    Font 88 line 132 spacing 176 seed 38
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics038', 0, async function () {
      await yieldThread();
      const fontSize = 88;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(132);
      expect(model.letterSpacingOf(fontSize)).assertEqual(176);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(135);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(180);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics038 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1579
     * @tc.name    JsTextMetrics039
     * @tc.desc    Font 90 line 135 spacing 180 seed 39
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics039', 0, async function () {
      await yieldThread();
      const fontSize = 90;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(135);
      expect(model.letterSpacingOf(fontSize)).assertEqual(180);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(138);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(184);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics039 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1580
     * @tc.name    JsTextMetrics040
     * @tc.desc    Font 92 line 138 spacing 184 seed 40
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics040', 0, async function () {
      await yieldThread();
      const fontSize = 92;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(138);
      expect(model.letterSpacingOf(fontSize)).assertEqual(184);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(141);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(188);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics040 done');
    });
}

function TextMetricsPart011() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1581
     * @tc.name    JsTextMetrics041
     * @tc.desc    Font 94 line 141 spacing 188 seed 41
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics041', 0, async function () {
      await yieldThread();
      const fontSize = 94;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(141);
      expect(model.letterSpacingOf(fontSize)).assertEqual(188);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(144);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(192);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics041 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1582
     * @tc.name    JsTextMetrics042
     * @tc.desc    Font 96 line 144 spacing 192 seed 42
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics042', 0, async function () {
      await yieldThread();
      const fontSize = 96;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(144);
      expect(model.letterSpacingOf(fontSize)).assertEqual(192);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(147);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(196);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics042 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1583
     * @tc.name    JsTextMetrics043
     * @tc.desc    Font 98 line 147 spacing 196 seed 43
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics043', 0, async function () {
      await yieldThread();
      const fontSize = 98;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(147);
      expect(model.letterSpacingOf(fontSize)).assertEqual(196);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(150);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(200);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics043 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1584
     * @tc.name    JsTextMetrics044
     * @tc.desc    Font 100 line 150 spacing 200 seed 44
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics044', 0, async function () {
      await yieldThread();
      const fontSize = 100;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(150);
      expect(model.letterSpacingOf(fontSize)).assertEqual(200);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(153);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(204);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics044 done');
    });
}

function TextMetricsPart012() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1585
     * @tc.name    JsTextMetrics045
     * @tc.desc    Font 102 line 153 spacing 204 seed 45
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics045', 0, async function () {
      await yieldThread();
      const fontSize = 102;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(153);
      expect(model.letterSpacingOf(fontSize)).assertEqual(204);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(156);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(208);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics045 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1586
     * @tc.name    JsTextMetrics046
     * @tc.desc    Font 104 line 156 spacing 208 seed 46
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics046', 0, async function () {
      await yieldThread();
      const fontSize = 104;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(156);
      expect(model.letterSpacingOf(fontSize)).assertEqual(208);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(159);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(212);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics046 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1587
     * @tc.name    JsTextMetrics047
     * @tc.desc    Font 106 line 159 spacing 212 seed 47
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics047', 0, async function () {
      await yieldThread();
      const fontSize = 106;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(159);
      expect(model.letterSpacingOf(fontSize)).assertEqual(212);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(162);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(216);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics047 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1588
     * @tc.name    JsTextMetrics048
     * @tc.desc    Font 108 line 162 spacing 216 seed 48
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics048', 0, async function () {
      await yieldThread();
      const fontSize = 108;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(162);
      expect(model.letterSpacingOf(fontSize)).assertEqual(216);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(165);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(220);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics048 done');
    });
}

function TextMetricsPart013() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1589
     * @tc.name    JsTextMetrics049
     * @tc.desc    Font 110 line 165 spacing 220 seed 49
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics049', 0, async function () {
      await yieldThread();
      const fontSize = 110;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(165);
      expect(model.letterSpacingOf(fontSize)).assertEqual(220);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(168);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(224);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics049 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1590
     * @tc.name    JsTextMetrics050
     * @tc.desc    Font 112 line 168 spacing 224 seed 50
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics050', 0, async function () {
      await yieldThread();
      const fontSize = 112;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(168);
      expect(model.letterSpacingOf(fontSize)).assertEqual(224);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(171);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(228);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics050 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1591
     * @tc.name    JsTextMetrics051
     * @tc.desc    Font 114 line 171 spacing 228 seed 51
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics051', 0, async function () {
      await yieldThread();
      const fontSize = 114;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(171);
      expect(model.letterSpacingOf(fontSize)).assertEqual(228);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(174);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(232);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics051 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1592
     * @tc.name    JsTextMetrics052
     * @tc.desc    Font 116 line 174 spacing 232 seed 52
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics052', 0, async function () {
      await yieldThread();
      const fontSize = 116;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(174);
      expect(model.letterSpacingOf(fontSize)).assertEqual(232);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(177);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(236);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics052 done');
    });
}

function TextMetricsPart014() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1593
     * @tc.name    JsTextMetrics053
     * @tc.desc    Font 118 line 177 spacing 236 seed 53
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics053', 0, async function () {
      await yieldThread();
      const fontSize = 118;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(177);
      expect(model.letterSpacingOf(fontSize)).assertEqual(236);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(180);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(240);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics053 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1594
     * @tc.name    JsTextMetrics054
     * @tc.desc    Font 120 line 180 spacing 240 seed 54
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics054', 0, async function () {
      await yieldThread();
      const fontSize = 120;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(180);
      expect(model.letterSpacingOf(fontSize)).assertEqual(240);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(183);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(244);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics054 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1595
     * @tc.name    JsTextMetrics055
     * @tc.desc    Font 122 line 183 spacing 244 seed 55
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics055', 0, async function () {
      await yieldThread();
      const fontSize = 122;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(183);
      expect(model.letterSpacingOf(fontSize)).assertEqual(244);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(186);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(248);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics055 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1596
     * @tc.name    JsTextMetrics056
     * @tc.desc    Font 124 line 186 spacing 248 seed 56
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics056', 0, async function () {
      await yieldThread();
      const fontSize = 124;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(186);
      expect(model.letterSpacingOf(fontSize)).assertEqual(248);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(189);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(252);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics056 done');
    });
}

function TextMetricsPart015() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1597
     * @tc.name    JsTextMetrics057
     * @tc.desc    Font 126 line 189 spacing 252 seed 57
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics057', 0, async function () {
      await yieldThread();
      const fontSize = 126;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(189);
      expect(model.letterSpacingOf(fontSize)).assertEqual(252);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(192);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(256);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics057 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1598
     * @tc.name    JsTextMetrics058
     * @tc.desc    Font 128 line 192 spacing 256 seed 58
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics058', 0, async function () {
      await yieldThread();
      const fontSize = 128;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(192);
      expect(model.letterSpacingOf(fontSize)).assertEqual(256);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(195);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(260);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics058 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1599
     * @tc.name    JsTextMetrics059
     * @tc.desc    Font 130 line 195 spacing 260 seed 59
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics059', 0, async function () {
      await yieldThread();
      const fontSize = 130;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(195);
      expect(model.letterSpacingOf(fontSize)).assertEqual(260);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(198);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(264);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics059 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1600
     * @tc.name    JsTextMetrics060
     * @tc.desc    Font 132 line 198 spacing 264 seed 60
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics060', 0, async function () {
      await yieldThread();
      const fontSize = 132;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(198);
      expect(model.letterSpacingOf(fontSize)).assertEqual(264);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(201);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(268);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics060 done');
    });
}

function TextMetricsPart016() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1601
     * @tc.name    JsTextMetrics061
     * @tc.desc    Font 134 line 201 spacing 268 seed 61
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics061', 0, async function () {
      await yieldThread();
      const fontSize = 134;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(201);
      expect(model.letterSpacingOf(fontSize)).assertEqual(268);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(204);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(272);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics061 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1602
     * @tc.name    JsTextMetrics062
     * @tc.desc    Font 136 line 204 spacing 272 seed 62
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics062', 0, async function () {
      await yieldThread();
      const fontSize = 136;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(204);
      expect(model.letterSpacingOf(fontSize)).assertEqual(272);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(207);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(276);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics062 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1603
     * @tc.name    JsTextMetrics063
     * @tc.desc    Font 138 line 207 spacing 276 seed 63
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics063', 0, async function () {
      await yieldThread();
      const fontSize = 138;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(207);
      expect(model.letterSpacingOf(fontSize)).assertEqual(276);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(210);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(280);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics063 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1604
     * @tc.name    JsTextMetrics064
     * @tc.desc    Font 140 line 210 spacing 280 seed 64
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics064', 0, async function () {
      await yieldThread();
      const fontSize = 140;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(210);
      expect(model.letterSpacingOf(fontSize)).assertEqual(280);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(213);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(284);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics064 done');
    });
}

function TextMetricsPart017() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1605
     * @tc.name    JsTextMetrics065
     * @tc.desc    Font 142 line 213 spacing 284 seed 65
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics065', 0, async function () {
      await yieldThread();
      const fontSize = 142;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(213);
      expect(model.letterSpacingOf(fontSize)).assertEqual(284);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(216);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(288);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics065 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1606
     * @tc.name    JsTextMetrics066
     * @tc.desc    Font 144 line 216 spacing 288 seed 66
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics066', 0, async function () {
      await yieldThread();
      const fontSize = 144;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(216);
      expect(model.letterSpacingOf(fontSize)).assertEqual(288);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(219);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(292);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics066 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1607
     * @tc.name    JsTextMetrics067
     * @tc.desc    Font 146 line 219 spacing 292 seed 67
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics067', 0, async function () {
      await yieldThread();
      const fontSize = 146;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(219);
      expect(model.letterSpacingOf(fontSize)).assertEqual(292);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(222);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(296);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics067 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1608
     * @tc.name    JsTextMetrics068
     * @tc.desc    Font 148 line 222 spacing 296 seed 68
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics068', 0, async function () {
      await yieldThread();
      const fontSize = 148;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(222);
      expect(model.letterSpacingOf(fontSize)).assertEqual(296);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(225);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(300);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics068 done');
    });
}

function TextMetricsPart018() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1609
     * @tc.name    JsTextMetrics069
     * @tc.desc    Font 150 line 225 spacing 300 seed 69
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics069', 0, async function () {
      await yieldThread();
      const fontSize = 150;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(225);
      expect(model.letterSpacingOf(fontSize)).assertEqual(300);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(228);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(304);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics069 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1610
     * @tc.name    JsTextMetrics070
     * @tc.desc    Font 152 line 228 spacing 304 seed 70
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics070', 0, async function () {
      await yieldThread();
      const fontSize = 152;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(228);
      expect(model.letterSpacingOf(fontSize)).assertEqual(304);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(231);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(308);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics070 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1611
     * @tc.name    JsTextMetrics071
     * @tc.desc    Font 154 line 231 spacing 308 seed 71
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics071', 0, async function () {
      await yieldThread();
      const fontSize = 154;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(231);
      expect(model.letterSpacingOf(fontSize)).assertEqual(308);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(234);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(312);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics071 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1612
     * @tc.name    JsTextMetrics072
     * @tc.desc    Font 156 line 234 spacing 312 seed 72
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics072', 0, async function () {
      await yieldThread();
      const fontSize = 156;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(234);
      expect(model.letterSpacingOf(fontSize)).assertEqual(312);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(237);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(316);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics072 done');
    });
}

function TextMetricsPart019() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1613
     * @tc.name    JsTextMetrics073
     * @tc.desc    Font 158 line 237 spacing 316 seed 73
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics073', 0, async function () {
      await yieldThread();
      const fontSize = 158;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(237);
      expect(model.letterSpacingOf(fontSize)).assertEqual(316);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(240);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(320);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics073 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1614
     * @tc.name    JsTextMetrics074
     * @tc.desc    Font 160 line 240 spacing 320 seed 74
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics074', 0, async function () {
      await yieldThread();
      const fontSize = 160;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(240);
      expect(model.letterSpacingOf(fontSize)).assertEqual(320);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(243);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(324);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics074 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1615
     * @tc.name    JsTextMetrics075
     * @tc.desc    Font 162 line 243 spacing 324 seed 75
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics075', 0, async function () {
      await yieldThread();
      const fontSize = 162;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(243);
      expect(model.letterSpacingOf(fontSize)).assertEqual(324);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(246);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(328);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics075 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1616
     * @tc.name    JsTextMetrics076
     * @tc.desc    Font 164 line 246 spacing 328 seed 76
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics076', 0, async function () {
      await yieldThread();
      const fontSize = 164;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(246);
      expect(model.letterSpacingOf(fontSize)).assertEqual(328);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(249);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(332);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics076 done');
    });
}

function TextMetricsPart020() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1617
     * @tc.name    JsTextMetrics077
     * @tc.desc    Font 166 line 249 spacing 332 seed 77
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics077', 0, async function () {
      await yieldThread();
      const fontSize = 166;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(249);
      expect(model.letterSpacingOf(fontSize)).assertEqual(332);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(252);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(336);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics077 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1618
     * @tc.name    JsTextMetrics078
     * @tc.desc    Font 168 line 252 spacing 336 seed 78
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics078', 0, async function () {
      await yieldThread();
      const fontSize = 168;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(252);
      expect(model.letterSpacingOf(fontSize)).assertEqual(336);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(255);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(340);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics078 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1619
     * @tc.name    JsTextMetrics079
     * @tc.desc    Font 170 line 255 spacing 340 seed 79
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics079', 0, async function () {
      await yieldThread();
      const fontSize = 170;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(255);
      expect(model.letterSpacingOf(fontSize)).assertEqual(340);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(258);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(344);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics079 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1620
     * @tc.name    JsTextMetrics080
     * @tc.desc    Font 172 line 258 spacing 344 seed 80
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTextMetrics080', 0, async function () {
      await yieldThread();
      const fontSize = 172;
      const lineHeight = model.lineHeightOf(fontSize);
      expect(lineHeight).assertEqual(258);
      expect(model.letterSpacingOf(fontSize)).assertEqual(344);
      expect(model.lineHeightOf(fontSize + 2)).assertEqual(261);
      expect(model.letterSpacingOf(fontSize + 2)).assertEqual(348);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTextMetrics080 done');
    });
}

export default function textMetricsSuite() {
  describe('TextMetricsSuite', function () {
    TextMetricsPart001();
    TextMetricsPart002();
    TextMetricsPart003();
    TextMetricsPart004();
    TextMetricsPart005();
    TextMetricsPart006();
    TextMetricsPart007();
    TextMetricsPart008();
    TextMetricsPart009();
    TextMetricsPart010();
    TextMetricsPart011();
    TextMetricsPart012();
    TextMetricsPart013();
    TextMetricsPart014();
    TextMetricsPart015();
    TextMetricsPart016();
    TextMetricsPart017();
    TextMetricsPart018();
    TextMetricsPart019();
    TextMetricsPart020();
  });
}
