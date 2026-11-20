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

function LayoutMetricsPart001() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0141
     * @tc.name    JsLayout001
     * @tc.desc    Width 373 item 164 aspect 280 ratio 4:3 seed 1
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout001', 0, async function () {
      await yieldThread();
      const width = 373;
      const columns = 2;
      const gutter = 12;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(341);
      expect(itemWidth).assertEqual(164);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 4, 3)).assertEqual(280);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout001 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0142
     * @tc.name    JsLayout002
     * @tc.desc    Width 426 item 191 aspect 341 ratio 5:4 seed 2
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout002', 0, async function () {
      await yieldThread();
      const width = 426;
      const columns = 2;
      const gutter = 12;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(394);
      expect(itemWidth).assertEqual(191);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 5, 4)).assertEqual(341);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout002 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0143
     * @tc.name    JsLayout003
     * @tc.desc    Width 479 item 217 aspect 399 ratio 6:5 seed 3
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout003', 0, async function () {
      await yieldThread();
      const width = 479;
      const columns = 2;
      const gutter = 12;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(447);
      expect(itemWidth).assertEqual(217);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 6, 5)).assertEqual(399);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout003 done');
    });
}

function LayoutMetricsPart002() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0144
     * @tc.name    JsLayout004
     * @tc.desc    Width 532 item 244 aspect 152 ratio 7:2 seed 4
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout004', 0, async function () {
      await yieldThread();
      const width = 532;
      const columns = 2;
      const gutter = 12;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(500);
      expect(itemWidth).assertEqual(244);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 7, 2)).assertEqual(152);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout004 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0145
     * @tc.name    JsLayout005
     * @tc.desc    Width 585 item 270 aspect 585 ratio 3:3 seed 5
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout005', 0, async function () {
      await yieldThread();
      const width = 585;
      const columns = 2;
      const gutter = 12;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(553);
      expect(itemWidth).assertEqual(270);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 3, 3)).assertEqual(585);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout005 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0146
     * @tc.name    JsLayout006
     * @tc.desc    Width 638 item 175 aspect 638 ratio 4:4 seed 6
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout006', 0, async function () {
      await yieldThread();
      const width = 638;
      const columns = 3;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(574);
      expect(itemWidth).assertEqual(175);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 4, 4)).assertEqual(638);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout006 done');
    });
}

function LayoutMetricsPart003() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0147
     * @tc.name    JsLayout007
     * @tc.desc    Width 691 item 193 aspect 691 ratio 5:5 seed 7
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout007', 0, async function () {
      await yieldThread();
      const width = 691;
      const columns = 3;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(627);
      expect(itemWidth).assertEqual(193);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 5, 5)).assertEqual(691);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout007 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0148
     * @tc.name    JsLayout008
     * @tc.desc    Width 744 item 210 aspect 248 ratio 6:2 seed 8
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout008', 0, async function () {
      await yieldThread();
      const width = 744;
      const columns = 3;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(680);
      expect(itemWidth).assertEqual(210);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 6, 2)).assertEqual(248);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout008 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0149
     * @tc.name    JsLayout009
     * @tc.desc    Width 797 item 228 aspect 342 ratio 7:3 seed 9
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout009', 0, async function () {
      await yieldThread();
      const width = 797;
      const columns = 3;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(733);
      expect(itemWidth).assertEqual(228);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 7, 3)).assertEqual(342);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout009 done');
    });
}

function LayoutMetricsPart004() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0150
     * @tc.name    JsLayout010
     * @tc.desc    Width 850 item 178 aspect 1133 ratio 3:4 seed 10
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout010', 0, async function () {
      await yieldThread();
      const width = 850;
      const columns = 4;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(786);
      expect(itemWidth).assertEqual(178);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 3, 4)).assertEqual(1133);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout010 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0151
     * @tc.name    JsLayout011
     * @tc.desc    Width 903 item 191 aspect 1129 ratio 4:5 seed 11
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout011', 0, async function () {
      await yieldThread();
      const width = 903;
      const columns = 4;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(839);
      expect(itemWidth).assertEqual(191);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 4, 5)).assertEqual(1129);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout011 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0152
     * @tc.name    JsLayout012
     * @tc.desc    Width 956 item 205 aspect 382 ratio 5:2 seed 12
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout012', 0, async function () {
      await yieldThread();
      const width = 956;
      const columns = 4;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(892);
      expect(itemWidth).assertEqual(205);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 5, 2)).assertEqual(382);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout012 done');
    });
}

function LayoutMetricsPart005() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0153
     * @tc.name    JsLayout013
     * @tc.desc    Width 1009 item 218 aspect 505 ratio 6:3 seed 13
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout013', 0, async function () {
      await yieldThread();
      const width = 1009;
      const columns = 4;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(945);
      expect(itemWidth).assertEqual(218);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 6, 3)).assertEqual(505);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout013 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0154
     * @tc.name    JsLayout014
     * @tc.desc    Width 1062 item 231 aspect 607 ratio 7:4 seed 14
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout014', 0, async function () {
      await yieldThread();
      const width = 1062;
      const columns = 4;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(998);
      expect(itemWidth).assertEqual(231);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 7, 4)).assertEqual(607);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout014 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0155
     * @tc.name    JsLayout015
     * @tc.desc    Width 1115 item 244 aspect 1858 ratio 3:5 seed 15
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout015', 0, async function () {
      await yieldThread();
      const width = 1115;
      const columns = 4;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(1051);
      expect(itemWidth).assertEqual(244);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 3, 5)).assertEqual(1858);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout015 done');
    });
}

function LayoutMetricsPart006() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0156
     * @tc.name    JsLayout016
     * @tc.desc    Width 1168 item 258 aspect 584 ratio 4:2 seed 16
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout016', 0, async function () {
      await yieldThread();
      const width = 1168;
      const columns = 4;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(1104);
      expect(itemWidth).assertEqual(258);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 4, 2)).assertEqual(584);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout016 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0157
     * @tc.name    JsLayout017
     * @tc.desc    Width 1221 item 271 aspect 733 ratio 5:3 seed 17
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout017', 0, async function () {
      await yieldThread();
      const width = 1221;
      const columns = 4;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(1157);
      expect(itemWidth).assertEqual(271);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 5, 3)).assertEqual(733);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout017 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0158
     * @tc.name    JsLayout018
     * @tc.desc    Width 1274 item 284 aspect 849 ratio 6:4 seed 18
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout018', 0, async function () {
      await yieldThread();
      const width = 1274;
      const columns = 4;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(1210);
      expect(itemWidth).assertEqual(284);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 6, 4)).assertEqual(849);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout018 done');
    });
}

function LayoutMetricsPart007() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0159
     * @tc.name    JsLayout019
     * @tc.desc    Width 1327 item 297 aspect 948 ratio 7:5 seed 19
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout019', 0, async function () {
      await yieldThread();
      const width = 1327;
      const columns = 4;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(1263);
      expect(itemWidth).assertEqual(297);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 7, 5)).assertEqual(948);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout019 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0160
     * @tc.name    JsLayout020
     * @tc.desc    Width 1380 item 311 aspect 920 ratio 3:2 seed 20
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout020', 0, async function () {
      await yieldThread();
      const width = 1380;
      const columns = 4;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(1316);
      expect(itemWidth).assertEqual(311);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 3, 2)).assertEqual(920);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout020 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0161
     * @tc.name    JsLayout021
     * @tc.desc    Width 1433 item 324 aspect 1075 ratio 4:3 seed 21
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout021', 0, async function () {
      await yieldThread();
      const width = 1433;
      const columns = 4;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(1369);
      expect(itemWidth).assertEqual(324);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 4, 3)).assertEqual(1075);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout021 done');
    });
}

function LayoutMetricsPart008() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0162
     * @tc.name    JsLayout022
     * @tc.desc    Width 366 item 161 aspect 293 ratio 5:4 seed 22
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout022', 0, async function () {
      await yieldThread();
      const width = 366;
      const columns = 2;
      const gutter = 12;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(334);
      expect(itemWidth).assertEqual(161);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 5, 4)).assertEqual(293);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout022 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0163
     * @tc.name    JsLayout023
     * @tc.desc    Width 419 item 187 aspect 349 ratio 6:5 seed 23
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout023', 0, async function () {
      await yieldThread();
      const width = 419;
      const columns = 2;
      const gutter = 12;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(387);
      expect(itemWidth).assertEqual(187);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 6, 5)).assertEqual(349);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout023 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0164
     * @tc.name    JsLayout024
     * @tc.desc    Width 472 item 214 aspect 135 ratio 7:2 seed 24
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout024', 0, async function () {
      await yieldThread();
      const width = 472;
      const columns = 2;
      const gutter = 12;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(440);
      expect(itemWidth).assertEqual(214);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 7, 2)).assertEqual(135);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout024 done');
    });
}

function LayoutMetricsPart009() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0165
     * @tc.name    JsLayout025
     * @tc.desc    Width 525 item 240 aspect 525 ratio 3:3 seed 25
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout025', 0, async function () {
      await yieldThread();
      const width = 525;
      const columns = 2;
      const gutter = 12;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(493);
      expect(itemWidth).assertEqual(240);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 3, 3)).assertEqual(525);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout025 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0166
     * @tc.name    JsLayout026
     * @tc.desc    Width 578 item 267 aspect 578 ratio 4:4 seed 26
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout026', 0, async function () {
      await yieldThread();
      const width = 578;
      const columns = 2;
      const gutter = 12;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(546);
      expect(itemWidth).assertEqual(267);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 4, 4)).assertEqual(578);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout026 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0167
     * @tc.name    JsLayout027
     * @tc.desc    Width 631 item 173 aspect 631 ratio 5:5 seed 27
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout027', 0, async function () {
      await yieldThread();
      const width = 631;
      const columns = 3;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(567);
      expect(itemWidth).assertEqual(173);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 5, 5)).assertEqual(631);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout027 done');
    });
}

function LayoutMetricsPart010() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0168
     * @tc.name    JsLayout028
     * @tc.desc    Width 684 item 190 aspect 228 ratio 6:2 seed 28
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout028', 0, async function () {
      await yieldThread();
      const width = 684;
      const columns = 3;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(620);
      expect(itemWidth).assertEqual(190);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 6, 2)).assertEqual(228);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout028 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0169
     * @tc.name    JsLayout029
     * @tc.desc    Width 737 item 208 aspect 316 ratio 7:3 seed 29
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout029', 0, async function () {
      await yieldThread();
      const width = 737;
      const columns = 3;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(673);
      expect(itemWidth).assertEqual(208);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 7, 3)).assertEqual(316);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout029 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0170
     * @tc.name    JsLayout030
     * @tc.desc    Width 790 item 226 aspect 1053 ratio 3:4 seed 30
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout030', 0, async function () {
      await yieldThread();
      const width = 790;
      const columns = 3;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(726);
      expect(itemWidth).assertEqual(226);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 3, 4)).assertEqual(1053);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout030 done');
    });
}

function LayoutMetricsPart011() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0171
     * @tc.name    JsLayout031
     * @tc.desc    Width 843 item 176 aspect 1054 ratio 4:5 seed 31
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout031', 0, async function () {
      await yieldThread();
      const width = 843;
      const columns = 4;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(779);
      expect(itemWidth).assertEqual(176);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 4, 5)).assertEqual(1054);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout031 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0172
     * @tc.name    JsLayout032
     * @tc.desc    Width 896 item 190 aspect 358 ratio 5:2 seed 32
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout032', 0, async function () {
      await yieldThread();
      const width = 896;
      const columns = 4;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(832);
      expect(itemWidth).assertEqual(190);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 5, 2)).assertEqual(358);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout032 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0173
     * @tc.name    JsLayout033
     * @tc.desc    Width 949 item 203 aspect 475 ratio 6:3 seed 33
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout033', 0, async function () {
      await yieldThread();
      const width = 949;
      const columns = 4;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(885);
      expect(itemWidth).assertEqual(203);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 6, 3)).assertEqual(475);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout033 done');
    });
}

function LayoutMetricsPart012() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0174
     * @tc.name    JsLayout034
     * @tc.desc    Width 1002 item 216 aspect 573 ratio 7:4 seed 34
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout034', 0, async function () {
      await yieldThread();
      const width = 1002;
      const columns = 4;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(938);
      expect(itemWidth).assertEqual(216);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 7, 4)).assertEqual(573);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout034 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0175
     * @tc.name    JsLayout035
     * @tc.desc    Width 1055 item 229 aspect 1758 ratio 3:5 seed 35
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout035', 0, async function () {
      await yieldThread();
      const width = 1055;
      const columns = 4;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(991);
      expect(itemWidth).assertEqual(229);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 3, 5)).assertEqual(1758);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout035 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0176
     * @tc.name    JsLayout036
     * @tc.desc    Width 1108 item 243 aspect 554 ratio 4:2 seed 36
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout036', 0, async function () {
      await yieldThread();
      const width = 1108;
      const columns = 4;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(1044);
      expect(itemWidth).assertEqual(243);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 4, 2)).assertEqual(554);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout036 done');
    });
}

function LayoutMetricsPart013() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0177
     * @tc.name    JsLayout037
     * @tc.desc    Width 1161 item 256 aspect 697 ratio 5:3 seed 37
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout037', 0, async function () {
      await yieldThread();
      const width = 1161;
      const columns = 4;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(1097);
      expect(itemWidth).assertEqual(256);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 5, 3)).assertEqual(697);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout037 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0178
     * @tc.name    JsLayout038
     * @tc.desc    Width 1214 item 269 aspect 809 ratio 6:4 seed 38
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout038', 0, async function () {
      await yieldThread();
      const width = 1214;
      const columns = 4;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(1150);
      expect(itemWidth).assertEqual(269);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 6, 4)).assertEqual(809);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout038 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0179
     * @tc.name    JsLayout039
     * @tc.desc    Width 1267 item 282 aspect 905 ratio 7:5 seed 39
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout039', 0, async function () {
      await yieldThread();
      const width = 1267;
      const columns = 4;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(1203);
      expect(itemWidth).assertEqual(282);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 7, 5)).assertEqual(905);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout039 done');
    });
}

function LayoutMetricsPart014() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0180
     * @tc.name    JsLayout040
     * @tc.desc    Width 1320 item 296 aspect 880 ratio 3:2 seed 40
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout040', 0, async function () {
      await yieldThread();
      const width = 1320;
      const columns = 4;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(1256);
      expect(itemWidth).assertEqual(296);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 3, 2)).assertEqual(880);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout040 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0181
     * @tc.name    JsLayout041
     * @tc.desc    Width 1373 item 309 aspect 1030 ratio 4:3 seed 41
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout041', 0, async function () {
      await yieldThread();
      const width = 1373;
      const columns = 4;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(1309);
      expect(itemWidth).assertEqual(309);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 4, 3)).assertEqual(1030);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout041 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0182
     * @tc.name    JsLayout042
     * @tc.desc    Width 1426 item 322 aspect 1141 ratio 5:4 seed 42
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout042', 0, async function () {
      await yieldThread();
      const width = 1426;
      const columns = 4;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(1362);
      expect(itemWidth).assertEqual(322);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 5, 4)).assertEqual(1141);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout042 done');
    });
}

function LayoutMetricsPart015() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0183
     * @tc.name    JsLayout043
     * @tc.desc    Width 359 item 157 aspect 299 ratio 6:5 seed 43
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout043', 0, async function () {
      await yieldThread();
      const width = 359;
      const columns = 2;
      const gutter = 12;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(327);
      expect(itemWidth).assertEqual(157);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 6, 5)).assertEqual(299);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout043 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0184
     * @tc.name    JsLayout044
     * @tc.desc    Width 412 item 184 aspect 118 ratio 7:2 seed 44
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout044', 0, async function () {
      await yieldThread();
      const width = 412;
      const columns = 2;
      const gutter = 12;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(380);
      expect(itemWidth).assertEqual(184);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 7, 2)).assertEqual(118);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout044 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0185
     * @tc.name    JsLayout045
     * @tc.desc    Width 465 item 210 aspect 465 ratio 3:3 seed 45
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout045', 0, async function () {
      await yieldThread();
      const width = 465;
      const columns = 2;
      const gutter = 12;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(433);
      expect(itemWidth).assertEqual(210);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 3, 3)).assertEqual(465);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout045 done');
    });
}

function LayoutMetricsPart016() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0186
     * @tc.name    JsLayout046
     * @tc.desc    Width 518 item 237 aspect 518 ratio 4:4 seed 46
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout046', 0, async function () {
      await yieldThread();
      const width = 518;
      const columns = 2;
      const gutter = 12;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(486);
      expect(itemWidth).assertEqual(237);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 4, 4)).assertEqual(518);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout046 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0187
     * @tc.name    JsLayout047
     * @tc.desc    Width 571 item 263 aspect 571 ratio 5:5 seed 47
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout047', 0, async function () {
      await yieldThread();
      const width = 571;
      const columns = 2;
      const gutter = 12;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(539);
      expect(itemWidth).assertEqual(263);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 5, 5)).assertEqual(571);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout047 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0188
     * @tc.name    JsLayout048
     * @tc.desc    Width 624 item 170 aspect 208 ratio 6:2 seed 48
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout048', 0, async function () {
      await yieldThread();
      const width = 624;
      const columns = 3;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(560);
      expect(itemWidth).assertEqual(170);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 6, 2)).assertEqual(208);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout048 done');
    });
}

function LayoutMetricsPart017() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0189
     * @tc.name    JsLayout049
     * @tc.desc    Width 677 item 188 aspect 290 ratio 7:3 seed 49
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout049', 0, async function () {
      await yieldThread();
      const width = 677;
      const columns = 3;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(613);
      expect(itemWidth).assertEqual(188);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 7, 3)).assertEqual(290);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout049 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0190
     * @tc.name    JsLayout050
     * @tc.desc    Width 730 item 206 aspect 973 ratio 3:4 seed 50
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout050', 0, async function () {
      await yieldThread();
      const width = 730;
      const columns = 3;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(666);
      expect(itemWidth).assertEqual(206);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 3, 4)).assertEqual(973);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout050 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0191
     * @tc.name    JsLayout051
     * @tc.desc    Width 783 item 223 aspect 979 ratio 4:5 seed 51
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout051', 0, async function () {
      await yieldThread();
      const width = 783;
      const columns = 3;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(719);
      expect(itemWidth).assertEqual(223);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 4, 5)).assertEqual(979);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout051 done');
    });
}

function LayoutMetricsPart018() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0192
     * @tc.name    JsLayout052
     * @tc.desc    Width 836 item 241 aspect 334 ratio 5:2 seed 52
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout052', 0, async function () {
      await yieldThread();
      const width = 836;
      const columns = 3;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(772);
      expect(itemWidth).assertEqual(241);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 5, 2)).assertEqual(334);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout052 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0193
     * @tc.name    JsLayout053
     * @tc.desc    Width 889 item 188 aspect 445 ratio 6:3 seed 53
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout053', 0, async function () {
      await yieldThread();
      const width = 889;
      const columns = 4;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(825);
      expect(itemWidth).assertEqual(188);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 6, 3)).assertEqual(445);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout053 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0194
     * @tc.name    JsLayout054
     * @tc.desc    Width 942 item 201 aspect 538 ratio 7:4 seed 54
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout054', 0, async function () {
      await yieldThread();
      const width = 942;
      const columns = 4;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(878);
      expect(itemWidth).assertEqual(201);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 7, 4)).assertEqual(538);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout054 done');
    });
}

function LayoutMetricsPart019() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0195
     * @tc.name    JsLayout055
     * @tc.desc    Width 995 item 214 aspect 1658 ratio 3:5 seed 55
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout055', 0, async function () {
      await yieldThread();
      const width = 995;
      const columns = 4;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(931);
      expect(itemWidth).assertEqual(214);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 3, 5)).assertEqual(1658);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout055 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0196
     * @tc.name    JsLayout056
     * @tc.desc    Width 1048 item 228 aspect 524 ratio 4:2 seed 56
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout056', 0, async function () {
      await yieldThread();
      const width = 1048;
      const columns = 4;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(984);
      expect(itemWidth).assertEqual(228);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 4, 2)).assertEqual(524);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout056 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0197
     * @tc.name    JsLayout057
     * @tc.desc    Width 1101 item 241 aspect 661 ratio 5:3 seed 57
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout057', 0, async function () {
      await yieldThread();
      const width = 1101;
      const columns = 4;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(1037);
      expect(itemWidth).assertEqual(241);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 5, 3)).assertEqual(661);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout057 done');
    });
}

function LayoutMetricsPart020() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0198
     * @tc.name    JsLayout058
     * @tc.desc    Width 1154 item 254 aspect 769 ratio 6:4 seed 58
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout058', 0, async function () {
      await yieldThread();
      const width = 1154;
      const columns = 4;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(1090);
      expect(itemWidth).assertEqual(254);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 6, 4)).assertEqual(769);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout058 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0199
     * @tc.name    JsLayout059
     * @tc.desc    Width 1207 item 267 aspect 862 ratio 7:5 seed 59
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout059', 0, async function () {
      await yieldThread();
      const width = 1207;
      const columns = 4;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(1143);
      expect(itemWidth).assertEqual(267);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 7, 5)).assertEqual(862);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout059 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0200
     * @tc.name    JsLayout060
     * @tc.desc    Width 1260 item 281 aspect 840 ratio 3:2 seed 60
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout060', 0, async function () {
      await yieldThread();
      const width = 1260;
      const columns = 4;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(1196);
      expect(itemWidth).assertEqual(281);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 3, 2)).assertEqual(840);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout060 done');
    });
}

function LayoutMetricsPart021() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0201
     * @tc.name    JsLayout061
     * @tc.desc    Width 1313 item 294 aspect 985 ratio 4:3 seed 61
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout061', 0, async function () {
      await yieldThread();
      const width = 1313;
      const columns = 4;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(1249);
      expect(itemWidth).assertEqual(294);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 4, 3)).assertEqual(985);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout061 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0202
     * @tc.name    JsLayout062
     * @tc.desc    Width 1366 item 307 aspect 1093 ratio 5:4 seed 62
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout062', 0, async function () {
      await yieldThread();
      const width = 1366;
      const columns = 4;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(1302);
      expect(itemWidth).assertEqual(307);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 5, 4)).assertEqual(1093);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout062 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0203
     * @tc.name    JsLayout063
     * @tc.desc    Width 1419 item 320 aspect 1183 ratio 6:5 seed 63
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout063', 0, async function () {
      await yieldThread();
      const width = 1419;
      const columns = 4;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(1355);
      expect(itemWidth).assertEqual(320);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 6, 5)).assertEqual(1183);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout063 done');
    });
}

function LayoutMetricsPart022() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0204
     * @tc.name    JsLayout064
     * @tc.desc    Width 352 item 154 aspect 101 ratio 7:2 seed 64
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout064', 0, async function () {
      await yieldThread();
      const width = 352;
      const columns = 2;
      const gutter = 12;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(320);
      expect(itemWidth).assertEqual(154);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 7, 2)).assertEqual(101);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout064 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0205
     * @tc.name    JsLayout065
     * @tc.desc    Width 405 item 180 aspect 405 ratio 3:3 seed 65
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout065', 0, async function () {
      await yieldThread();
      const width = 405;
      const columns = 2;
      const gutter = 12;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(373);
      expect(itemWidth).assertEqual(180);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 3, 3)).assertEqual(405);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout065 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0206
     * @tc.name    JsLayout066
     * @tc.desc    Width 458 item 207 aspect 458 ratio 4:4 seed 66
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout066', 0, async function () {
      await yieldThread();
      const width = 458;
      const columns = 2;
      const gutter = 12;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(426);
      expect(itemWidth).assertEqual(207);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 4, 4)).assertEqual(458);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout066 done');
    });
}

export default function layoutMetricsSuite() {
  describe('LayoutMetricsSuite', function () {
    LayoutMetricsPart001();
    LayoutMetricsPart002();
    LayoutMetricsPart003();
    LayoutMetricsPart004();
    LayoutMetricsPart005();
    LayoutMetricsPart006();
    LayoutMetricsPart007();
    LayoutMetricsPart008();
    LayoutMetricsPart009();
    LayoutMetricsPart010();
    LayoutMetricsPart011();
    LayoutMetricsPart012();
    LayoutMetricsPart013();
    LayoutMetricsPart014();
    LayoutMetricsPart015();
    LayoutMetricsPart016();
    LayoutMetricsPart017();
    LayoutMetricsPart018();
    LayoutMetricsPart019();
    LayoutMetricsPart020();
    LayoutMetricsPart021();
    LayoutMetricsPart022();
  });
}
