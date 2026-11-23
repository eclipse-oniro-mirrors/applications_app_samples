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
import { registerLayoutMetricsExtra2 } from './LayoutMetrics.testCases2';

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

function LayoutMetricsPart023() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0207
     * @tc.name    JsLayout067
     * @tc.desc    Width 511 item 233 aspect 511 ratio 5:5 seed 67
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout067', 0, async function () {
      await yieldThread();
      const width = 511;
      const columns = 2;
      const gutter = 12;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(479);
      expect(itemWidth).assertEqual(233);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 5, 5)).assertEqual(511);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout067 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0208
     * @tc.name    JsLayout068
     * @tc.desc    Width 564 item 260 aspect 188 ratio 6:2 seed 68
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout068', 0, async function () {
      await yieldThread();
      const width = 564;
      const columns = 2;
      const gutter = 12;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(532);
      expect(itemWidth).assertEqual(260);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 6, 2)).assertEqual(188);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout068 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0209
     * @tc.name    JsLayout069
     * @tc.desc    Width 617 item 168 aspect 264 ratio 7:3 seed 69
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout069', 0, async function () {
      await yieldThread();
      const width = 617;
      const columns = 3;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(553);
      expect(itemWidth).assertEqual(168);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 7, 3)).assertEqual(264);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout069 done');
    });
}

function LayoutMetricsPart024() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0210
     * @tc.name    JsLayout070
     * @tc.desc    Width 670 item 186 aspect 893 ratio 3:4 seed 70
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout070', 0, async function () {
      await yieldThread();
      const width = 670;
      const columns = 3;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(606);
      expect(itemWidth).assertEqual(186);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 3, 4)).assertEqual(893);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout070 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0211
     * @tc.name    JsLayout071
     * @tc.desc    Width 723 item 203 aspect 904 ratio 4:5 seed 71
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout071', 0, async function () {
      await yieldThread();
      const width = 723;
      const columns = 3;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(659);
      expect(itemWidth).assertEqual(203);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 4, 5)).assertEqual(904);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout071 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0212
     * @tc.name    JsLayout072
     * @tc.desc    Width 776 item 221 aspect 310 ratio 5:2 seed 72
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout072', 0, async function () {
      await yieldThread();
      const width = 776;
      const columns = 3;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(712);
      expect(itemWidth).assertEqual(221);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 5, 2)).assertEqual(310);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout072 done');
    });
}

function LayoutMetricsPart025() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0213
     * @tc.name    JsLayout073
     * @tc.desc    Width 829 item 239 aspect 415 ratio 6:3 seed 73
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout073', 0, async function () {
      await yieldThread();
      const width = 829;
      const columns = 3;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(765);
      expect(itemWidth).assertEqual(239);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 6, 3)).assertEqual(415);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout073 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0214
     * @tc.name    JsLayout074
     * @tc.desc    Width 882 item 186 aspect 504 ratio 7:4 seed 74
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout074', 0, async function () {
      await yieldThread();
      const width = 882;
      const columns = 4;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(818);
      expect(itemWidth).assertEqual(186);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 7, 4)).assertEqual(504);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout074 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0215
     * @tc.name    JsLayout075
     * @tc.desc    Width 935 item 199 aspect 1558 ratio 3:5 seed 75
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout075', 0, async function () {
      await yieldThread();
      const width = 935;
      const columns = 4;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(871);
      expect(itemWidth).assertEqual(199);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 3, 5)).assertEqual(1558);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout075 done');
    });
}

function LayoutMetricsPart026() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0216
     * @tc.name    JsLayout076
     * @tc.desc    Width 988 item 213 aspect 494 ratio 4:2 seed 76
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout076', 0, async function () {
      await yieldThread();
      const width = 988;
      const columns = 4;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(924);
      expect(itemWidth).assertEqual(213);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 4, 2)).assertEqual(494);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout076 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0217
     * @tc.name    JsLayout077
     * @tc.desc    Width 1041 item 226 aspect 625 ratio 5:3 seed 77
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout077', 0, async function () {
      await yieldThread();
      const width = 1041;
      const columns = 4;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(977);
      expect(itemWidth).assertEqual(226);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 5, 3)).assertEqual(625);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout077 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0218
     * @tc.name    JsLayout078
     * @tc.desc    Width 1094 item 239 aspect 729 ratio 6:4 seed 78
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout078', 0, async function () {
      await yieldThread();
      const width = 1094;
      const columns = 4;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(1030);
      expect(itemWidth).assertEqual(239);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 6, 4)).assertEqual(729);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout078 done');
    });
}

function LayoutMetricsPart027() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0219
     * @tc.name    JsLayout079
     * @tc.desc    Width 1147 item 252 aspect 819 ratio 7:5 seed 79
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout079', 0, async function () {
      await yieldThread();
      const width = 1147;
      const columns = 4;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(1083);
      expect(itemWidth).assertEqual(252);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 7, 5)).assertEqual(819);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout079 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0220
     * @tc.name    JsLayout080
     * @tc.desc    Width 1200 item 266 aspect 800 ratio 3:2 seed 80
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout080', 0, async function () {
      await yieldThread();
      const width = 1200;
      const columns = 4;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(1136);
      expect(itemWidth).assertEqual(266);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 3, 2)).assertEqual(800);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout080 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0221
     * @tc.name    JsLayout081
     * @tc.desc    Width 1253 item 279 aspect 940 ratio 4:3 seed 81
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout081', 0, async function () {
      await yieldThread();
      const width = 1253;
      const columns = 4;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(1189);
      expect(itemWidth).assertEqual(279);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 4, 3)).assertEqual(940);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout081 done');
    });
}

function LayoutMetricsPart028() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0222
     * @tc.name    JsLayout082
     * @tc.desc    Width 1306 item 292 aspect 1045 ratio 5:4 seed 82
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout082', 0, async function () {
      await yieldThread();
      const width = 1306;
      const columns = 4;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(1242);
      expect(itemWidth).assertEqual(292);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 5, 4)).assertEqual(1045);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout082 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0223
     * @tc.name    JsLayout083
     * @tc.desc    Width 1359 item 305 aspect 1133 ratio 6:5 seed 83
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout083', 0, async function () {
      await yieldThread();
      const width = 1359;
      const columns = 4;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(1295);
      expect(itemWidth).assertEqual(305);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 6, 5)).assertEqual(1133);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout083 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0224
     * @tc.name    JsLayout084
     * @tc.desc    Width 1412 item 319 aspect 403 ratio 7:2 seed 84
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout084', 0, async function () {
      await yieldThread();
      const width = 1412;
      const columns = 4;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(1348);
      expect(itemWidth).assertEqual(319);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 7, 2)).assertEqual(403);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout084 done');
    });
}

function LayoutMetricsPart029() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0225
     * @tc.name    JsLayout085
     * @tc.desc    Width 345 item 150 aspect 345 ratio 3:3 seed 85
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout085', 0, async function () {
      await yieldThread();
      const width = 345;
      const columns = 2;
      const gutter = 12;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(313);
      expect(itemWidth).assertEqual(150);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 3, 3)).assertEqual(345);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout085 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0226
     * @tc.name    JsLayout086
     * @tc.desc    Width 398 item 177 aspect 398 ratio 4:4 seed 86
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout086', 0, async function () {
      await yieldThread();
      const width = 398;
      const columns = 2;
      const gutter = 12;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(366);
      expect(itemWidth).assertEqual(177);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 4, 4)).assertEqual(398);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout086 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0227
     * @tc.name    JsLayout087
     * @tc.desc    Width 451 item 203 aspect 451 ratio 5:5 seed 87
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout087', 0, async function () {
      await yieldThread();
      const width = 451;
      const columns = 2;
      const gutter = 12;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(419);
      expect(itemWidth).assertEqual(203);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 5, 5)).assertEqual(451);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout087 done');
    });
}

function LayoutMetricsPart030() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0228
     * @tc.name    JsLayout088
     * @tc.desc    Width 504 item 230 aspect 168 ratio 6:2 seed 88
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout088', 0, async function () {
      await yieldThread();
      const width = 504;
      const columns = 2;
      const gutter = 12;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(472);
      expect(itemWidth).assertEqual(230);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 6, 2)).assertEqual(168);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout088 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0229
     * @tc.name    JsLayout089
     * @tc.desc    Width 557 item 256 aspect 239 ratio 7:3 seed 89
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout089', 0, async function () {
      await yieldThread();
      const width = 557;
      const columns = 2;
      const gutter = 12;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(525);
      expect(itemWidth).assertEqual(256);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 7, 3)).assertEqual(239);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout089 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0230
     * @tc.name    JsLayout090
     * @tc.desc    Width 610 item 166 aspect 813 ratio 3:4 seed 90
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout090', 0, async function () {
      await yieldThread();
      const width = 610;
      const columns = 3;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(546);
      expect(itemWidth).assertEqual(166);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 3, 4)).assertEqual(813);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout090 done');
    });
}

function LayoutMetricsPart031() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0231
     * @tc.name    JsLayout091
     * @tc.desc    Width 663 item 183 aspect 829 ratio 4:5 seed 91
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout091', 0, async function () {
      await yieldThread();
      const width = 663;
      const columns = 3;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(599);
      expect(itemWidth).assertEqual(183);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 4, 5)).assertEqual(829);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout091 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0232
     * @tc.name    JsLayout092
     * @tc.desc    Width 716 item 201 aspect 286 ratio 5:2 seed 92
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout092', 0, async function () {
      await yieldThread();
      const width = 716;
      const columns = 3;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(652);
      expect(itemWidth).assertEqual(201);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 5, 2)).assertEqual(286);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout092 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0233
     * @tc.name    JsLayout093
     * @tc.desc    Width 769 item 219 aspect 385 ratio 6:3 seed 93
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout093', 0, async function () {
      await yieldThread();
      const width = 769;
      const columns = 3;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(705);
      expect(itemWidth).assertEqual(219);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 6, 3)).assertEqual(385);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout093 done');
    });
}

function LayoutMetricsPart032() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0234
     * @tc.name    JsLayout094
     * @tc.desc    Width 822 item 236 aspect 470 ratio 7:4 seed 94
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout094', 0, async function () {
      await yieldThread();
      const width = 822;
      const columns = 3;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(758);
      expect(itemWidth).assertEqual(236);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 7, 4)).assertEqual(470);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout094 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0235
     * @tc.name    JsLayout095
     * @tc.desc    Width 875 item 184 aspect 1458 ratio 3:5 seed 95
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout095', 0, async function () {
      await yieldThread();
      const width = 875;
      const columns = 4;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(811);
      expect(itemWidth).assertEqual(184);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 3, 5)).assertEqual(1458);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout095 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0236
     * @tc.name    JsLayout096
     * @tc.desc    Width 928 item 198 aspect 464 ratio 4:2 seed 96
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout096', 0, async function () {
      await yieldThread();
      const width = 928;
      const columns = 4;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(864);
      expect(itemWidth).assertEqual(198);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 4, 2)).assertEqual(464);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout096 done');
    });
}

function LayoutMetricsPart033() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0237
     * @tc.name    JsLayout097
     * @tc.desc    Width 981 item 211 aspect 589 ratio 5:3 seed 97
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout097', 0, async function () {
      await yieldThread();
      const width = 981;
      const columns = 4;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(917);
      expect(itemWidth).assertEqual(211);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 5, 3)).assertEqual(589);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout097 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0238
     * @tc.name    JsLayout098
     * @tc.desc    Width 1034 item 224 aspect 689 ratio 6:4 seed 98
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout098', 0, async function () {
      await yieldThread();
      const width = 1034;
      const columns = 4;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(970);
      expect(itemWidth).assertEqual(224);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 6, 4)).assertEqual(689);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout098 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0239
     * @tc.name    JsLayout099
     * @tc.desc    Width 1087 item 237 aspect 776 ratio 7:5 seed 99
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout099', 0, async function () {
      await yieldThread();
      const width = 1087;
      const columns = 4;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(1023);
      expect(itemWidth).assertEqual(237);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 7, 5)).assertEqual(776);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout099 done');
    });
}

function LayoutMetricsPart034() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0240
     * @tc.name    JsLayout100
     * @tc.desc    Width 1140 item 251 aspect 760 ratio 3:2 seed 100
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout100', 0, async function () {
      await yieldThread();
      const width = 1140;
      const columns = 4;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(1076);
      expect(itemWidth).assertEqual(251);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 3, 2)).assertEqual(760);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout100 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0241
     * @tc.name    JsLayout101
     * @tc.desc    Width 1193 item 264 aspect 895 ratio 4:3 seed 101
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout101', 0, async function () {
      await yieldThread();
      const width = 1193;
      const columns = 4;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(1129);
      expect(itemWidth).assertEqual(264);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 4, 3)).assertEqual(895);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout101 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0242
     * @tc.name    JsLayout102
     * @tc.desc    Width 1246 item 277 aspect 997 ratio 5:4 seed 102
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout102', 0, async function () {
      await yieldThread();
      const width = 1246;
      const columns = 4;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(1182);
      expect(itemWidth).assertEqual(277);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 5, 4)).assertEqual(997);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout102 done');
    });
}

function LayoutMetricsPart035() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0243
     * @tc.name    JsLayout103
     * @tc.desc    Width 1299 item 290 aspect 1083 ratio 6:5 seed 103
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout103', 0, async function () {
      await yieldThread();
      const width = 1299;
      const columns = 4;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(1235);
      expect(itemWidth).assertEqual(290);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 6, 5)).assertEqual(1083);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout103 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0244
     * @tc.name    JsLayout104
     * @tc.desc    Width 1352 item 304 aspect 386 ratio 7:2 seed 104
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout104', 0, async function () {
      await yieldThread();
      const width = 1352;
      const columns = 4;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(1288);
      expect(itemWidth).assertEqual(304);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 7, 2)).assertEqual(386);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout104 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0245
     * @tc.name    JsLayout105
     * @tc.desc    Width 1405 item 317 aspect 1405 ratio 3:3 seed 105
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout105', 0, async function () {
      await yieldThread();
      const width = 1405;
      const columns = 4;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(1341);
      expect(itemWidth).assertEqual(317);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 3, 3)).assertEqual(1405);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout105 done');
    });
}

function LayoutMetricsPart036() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0246
     * @tc.name    JsLayout106
     * @tc.desc    Width 338 item 147 aspect 338 ratio 4:4 seed 106
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout106', 0, async function () {
      await yieldThread();
      const width = 338;
      const columns = 2;
      const gutter = 12;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(306);
      expect(itemWidth).assertEqual(147);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 4, 4)).assertEqual(338);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout106 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0247
     * @tc.name    JsLayout107
     * @tc.desc    Width 391 item 173 aspect 391 ratio 5:5 seed 107
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout107', 0, async function () {
      await yieldThread();
      const width = 391;
      const columns = 2;
      const gutter = 12;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(359);
      expect(itemWidth).assertEqual(173);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 5, 5)).assertEqual(391);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout107 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0248
     * @tc.name    JsLayout108
     * @tc.desc    Width 444 item 200 aspect 148 ratio 6:2 seed 108
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout108', 0, async function () {
      await yieldThread();
      const width = 444;
      const columns = 2;
      const gutter = 12;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(412);
      expect(itemWidth).assertEqual(200);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 6, 2)).assertEqual(148);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout108 done');
    });
}

function LayoutMetricsPart037() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0249
     * @tc.name    JsLayout109
     * @tc.desc    Width 497 item 226 aspect 213 ratio 7:3 seed 109
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout109', 0, async function () {
      await yieldThread();
      const width = 497;
      const columns = 2;
      const gutter = 12;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(465);
      expect(itemWidth).assertEqual(226);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 7, 3)).assertEqual(213);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout109 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0250
     * @tc.name    JsLayout110
     * @tc.desc    Width 550 item 253 aspect 733 ratio 3:4 seed 110
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout110', 0, async function () {
      await yieldThread();
      const width = 550;
      const columns = 2;
      const gutter = 12;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(518);
      expect(itemWidth).assertEqual(253);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 3, 4)).assertEqual(733);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout110 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0251
     * @tc.name    JsLayout111
     * @tc.desc    Width 603 item 163 aspect 754 ratio 4:5 seed 111
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout111', 0, async function () {
      await yieldThread();
      const width = 603;
      const columns = 3;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(539);
      expect(itemWidth).assertEqual(163);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 4, 5)).assertEqual(754);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout111 done');
    });
}

function LayoutMetricsPart038() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0252
     * @tc.name    JsLayout112
     * @tc.desc    Width 656 item 181 aspect 262 ratio 5:2 seed 112
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout112', 0, async function () {
      await yieldThread();
      const width = 656;
      const columns = 3;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(592);
      expect(itemWidth).assertEqual(181);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 5, 2)).assertEqual(262);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout112 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0253
     * @tc.name    JsLayout113
     * @tc.desc    Width 709 item 199 aspect 355 ratio 6:3 seed 113
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout113', 0, async function () {
      await yieldThread();
      const width = 709;
      const columns = 3;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(645);
      expect(itemWidth).assertEqual(199);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 6, 3)).assertEqual(355);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout113 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0254
     * @tc.name    JsLayout114
     * @tc.desc    Width 762 item 216 aspect 435 ratio 7:4 seed 114
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout114', 0, async function () {
      await yieldThread();
      const width = 762;
      const columns = 3;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(698);
      expect(itemWidth).assertEqual(216);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 7, 4)).assertEqual(435);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout114 done');
    });
}

function LayoutMetricsPart039() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0255
     * @tc.name    JsLayout115
     * @tc.desc    Width 815 item 234 aspect 1358 ratio 3:5 seed 115
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout115', 0, async function () {
      await yieldThread();
      const width = 815;
      const columns = 3;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(751);
      expect(itemWidth).assertEqual(234);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 3, 5)).assertEqual(1358);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout115 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0256
     * @tc.name    JsLayout116
     * @tc.desc    Width 868 item 183 aspect 434 ratio 4:2 seed 116
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout116', 0, async function () {
      await yieldThread();
      const width = 868;
      const columns = 4;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(804);
      expect(itemWidth).assertEqual(183);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 4, 2)).assertEqual(434);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout116 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0257
     * @tc.name    JsLayout117
     * @tc.desc    Width 921 item 196 aspect 553 ratio 5:3 seed 117
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout117', 0, async function () {
      await yieldThread();
      const width = 921;
      const columns = 4;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(857);
      expect(itemWidth).assertEqual(196);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 5, 3)).assertEqual(553);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout117 done');
    });
}

function LayoutMetricsPart040() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0258
     * @tc.name    JsLayout118
     * @tc.desc    Width 974 item 209 aspect 649 ratio 6:4 seed 118
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout118', 0, async function () {
      await yieldThread();
      const width = 974;
      const columns = 4;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(910);
      expect(itemWidth).assertEqual(209);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 6, 4)).assertEqual(649);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout118 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0259
     * @tc.name    JsLayout119
     * @tc.desc    Width 1027 item 222 aspect 734 ratio 7:5 seed 119
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout119', 0, async function () {
      await yieldThread();
      const width = 1027;
      const columns = 4;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(963);
      expect(itemWidth).assertEqual(222);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 7, 5)).assertEqual(734);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout119 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0260
     * @tc.name    JsLayout120
     * @tc.desc    Width 1080 item 236 aspect 720 ratio 3:2 seed 120
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout120', 0, async function () {
      await yieldThread();
      const width = 1080;
      const columns = 4;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(1016);
      expect(itemWidth).assertEqual(236);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 3, 2)).assertEqual(720);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout120 done');
    });
}

function LayoutMetricsPart041() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0261
     * @tc.name    JsLayout121
     * @tc.desc    Width 1133 item 249 aspect 850 ratio 4:3 seed 121
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout121', 0, async function () {
      await yieldThread();
      const width = 1133;
      const columns = 4;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(1069);
      expect(itemWidth).assertEqual(249);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 4, 3)).assertEqual(850);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout121 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0262
     * @tc.name    JsLayout122
     * @tc.desc    Width 1186 item 262 aspect 949 ratio 5:4 seed 122
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout122', 0, async function () {
      await yieldThread();
      const width = 1186;
      const columns = 4;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(1122);
      expect(itemWidth).assertEqual(262);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 5, 4)).assertEqual(949);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout122 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0263
     * @tc.name    JsLayout123
     * @tc.desc    Width 1239 item 275 aspect 1033 ratio 6:5 seed 123
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout123', 0, async function () {
      await yieldThread();
      const width = 1239;
      const columns = 4;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(1175);
      expect(itemWidth).assertEqual(275);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 6, 5)).assertEqual(1033);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout123 done');
    });
}

function LayoutMetricsGroup001() {
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
  LayoutMetricsPart023();
  LayoutMetricsPart024();
  LayoutMetricsPart025();
  LayoutMetricsPart026();
  LayoutMetricsPart027();
  LayoutMetricsPart028();
  LayoutMetricsPart029();
  LayoutMetricsPart030();
  LayoutMetricsPart031();
  LayoutMetricsPart032();
  LayoutMetricsPart033();
  LayoutMetricsPart034();
  LayoutMetricsPart035();
  LayoutMetricsPart036();
  LayoutMetricsPart037();
  LayoutMetricsPart038();
  LayoutMetricsPart039();
  LayoutMetricsPart040();
}

function LayoutMetricsGroup002() {
  LayoutMetricsPart041();
}

export default function layoutMetricsSuite() {
  describe('LayoutMetricsSuite', function () {
    LayoutMetricsGroup001();
    LayoutMetricsGroup002();
    registerLayoutMetricsExtra2();
  });
}
