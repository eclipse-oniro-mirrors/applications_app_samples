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
import { it, expect } from '@ohos/hypium';
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

function LayoutMetricsPart042() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0264
     * @tc.name    JsLayout124
     * @tc.desc    Width 1292 item 289 aspect 369 ratio 7:2 seed 124
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout124', 0, async function () {
      await yieldThread();
      const width = 1292;
      const columns = 4;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(1228);
      expect(itemWidth).assertEqual(289);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 7, 2)).assertEqual(369);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout124 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0265
     * @tc.name    JsLayout125
     * @tc.desc    Width 1345 item 302 aspect 1345 ratio 3:3 seed 125
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout125', 0, async function () {
      await yieldThread();
      const width = 1345;
      const columns = 4;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(1281);
      expect(itemWidth).assertEqual(302);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 3, 3)).assertEqual(1345);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout125 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0266
     * @tc.name    JsLayout126
     * @tc.desc    Width 1398 item 315 aspect 1398 ratio 4:4 seed 126
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout126', 0, async function () {
      await yieldThread();
      const width = 1398;
      const columns = 4;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(1334);
      expect(itemWidth).assertEqual(315);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 4, 4)).assertEqual(1398);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout126 done');
    });
}

function LayoutMetricsPart043() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0267
     * @tc.name    JsLayout127
     * @tc.desc    Width 331 item 143 aspect 331 ratio 5:5 seed 127
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout127', 0, async function () {
      await yieldThread();
      const width = 331;
      const columns = 2;
      const gutter = 12;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(299);
      expect(itemWidth).assertEqual(143);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 5, 5)).assertEqual(331);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout127 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0268
     * @tc.name    JsLayout128
     * @tc.desc    Width 384 item 170 aspect 128 ratio 6:2 seed 128
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout128', 0, async function () {
      await yieldThread();
      const width = 384;
      const columns = 2;
      const gutter = 12;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(352);
      expect(itemWidth).assertEqual(170);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 6, 2)).assertEqual(128);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout128 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0269
     * @tc.name    JsLayout129
     * @tc.desc    Width 437 item 196 aspect 187 ratio 7:3 seed 129
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout129', 0, async function () {
      await yieldThread();
      const width = 437;
      const columns = 2;
      const gutter = 12;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(405);
      expect(itemWidth).assertEqual(196);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 7, 3)).assertEqual(187);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout129 done');
    });
}

function LayoutMetricsPart044() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0270
     * @tc.name    JsLayout130
     * @tc.desc    Width 490 item 223 aspect 653 ratio 3:4 seed 130
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout130', 0, async function () {
      await yieldThread();
      const width = 490;
      const columns = 2;
      const gutter = 12;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(458);
      expect(itemWidth).assertEqual(223);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 3, 4)).assertEqual(653);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout130 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0271
     * @tc.name    JsLayout131
     * @tc.desc    Width 543 item 249 aspect 679 ratio 4:5 seed 131
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout131', 0, async function () {
      await yieldThread();
      const width = 543;
      const columns = 2;
      const gutter = 12;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(511);
      expect(itemWidth).assertEqual(249);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 4, 5)).assertEqual(679);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout131 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0272
     * @tc.name    JsLayout132
     * @tc.desc    Width 596 item 276 aspect 238 ratio 5:2 seed 132
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout132', 0, async function () {
      await yieldThread();
      const width = 596;
      const columns = 2;
      const gutter = 12;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(564);
      expect(itemWidth).assertEqual(276);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 5, 2)).assertEqual(238);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout132 done');
    });
}

function LayoutMetricsPart045() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0273
     * @tc.name    JsLayout133
     * @tc.desc    Width 649 item 179 aspect 325 ratio 6:3 seed 133
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout133', 0, async function () {
      await yieldThread();
      const width = 649;
      const columns = 3;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(585);
      expect(itemWidth).assertEqual(179);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 6, 3)).assertEqual(325);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout133 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0274
     * @tc.name    JsLayout134
     * @tc.desc    Width 702 item 196 aspect 401 ratio 7:4 seed 134
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout134', 0, async function () {
      await yieldThread();
      const width = 702;
      const columns = 3;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(638);
      expect(itemWidth).assertEqual(196);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 7, 4)).assertEqual(401);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout134 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0275
     * @tc.name    JsLayout135
     * @tc.desc    Width 755 item 214 aspect 1258 ratio 3:5 seed 135
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout135', 0, async function () {
      await yieldThread();
      const width = 755;
      const columns = 3;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(691);
      expect(itemWidth).assertEqual(214);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 3, 5)).assertEqual(1258);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout135 done');
    });
}

function LayoutMetricsPart046() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0276
     * @tc.name    JsLayout136
     * @tc.desc    Width 808 item 232 aspect 404 ratio 4:2 seed 136
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout136', 0, async function () {
      await yieldThread();
      const width = 808;
      const columns = 3;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(744);
      expect(itemWidth).assertEqual(232);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 4, 2)).assertEqual(404);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout136 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0277
     * @tc.name    JsLayout137
     * @tc.desc    Width 861 item 181 aspect 517 ratio 5:3 seed 137
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout137', 0, async function () {
      await yieldThread();
      const width = 861;
      const columns = 4;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(797);
      expect(itemWidth).assertEqual(181);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 5, 3)).assertEqual(517);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout137 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0278
     * @tc.name    JsLayout138
     * @tc.desc    Width 914 item 194 aspect 609 ratio 6:4 seed 138
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout138', 0, async function () {
      await yieldThread();
      const width = 914;
      const columns = 4;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(850);
      expect(itemWidth).assertEqual(194);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 6, 4)).assertEqual(609);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout138 done');
    });
}

function LayoutMetricsPart047() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0279
     * @tc.name    JsLayout139
     * @tc.desc    Width 967 item 207 aspect 691 ratio 7:5 seed 139
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout139', 0, async function () {
      await yieldThread();
      const width = 967;
      const columns = 4;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(903);
      expect(itemWidth).assertEqual(207);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 7, 5)).assertEqual(691);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout139 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0280
     * @tc.name    JsLayout140
     * @tc.desc    Width 1020 item 221 aspect 680 ratio 3:2 seed 140
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsLayout140', 0, async function () {
      await yieldThread();
      const width = 1020;
      const columns = 4;
      const gutter = 24;
      const content = model.contentWidthOf(width);
      const itemWidth = model.itemWidthOf(width);
      expect(content).assertEqual(956);
      expect(itemWidth).assertEqual(221);
      expect(itemWidth * columns + (columns - 1) * gutter <= content).assertEqual(true);
      expect(model.aspectHeightOf(width, 3, 2)).assertEqual(680);
      expect(model.columnsForWidth(width)).assertEqual(columns);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsLayout140 done');
    });
}

function LayoutMetricsGroup003() {
  LayoutMetricsPart042();
  LayoutMetricsPart043();
  LayoutMetricsPart044();
  LayoutMetricsPart045();
  LayoutMetricsPart046();
  LayoutMetricsPart047();
}

export function registerLayoutMetricsExtra2() {
  LayoutMetricsGroup003();
}
