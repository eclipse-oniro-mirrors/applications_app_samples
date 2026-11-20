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

function StateHistoryWindowPart001() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2661
     * @tc.name    JsHistory001
     * @tc.desc    History limit 4 after 10 pushes keeps 4 seed 1
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory001', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v1_0', 4)).assertEqual(1);
      expect(model.historyPush(history, 'v1_1', 4)).assertEqual(2);
      expect(model.historyPush(history, 'v1_2', 4)).assertEqual(3);
      expect(model.historyPush(history, 'v1_3', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v1_4', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v1_5', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v1_6', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v1_7', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v1_8', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v1_9', 4)).assertEqual(4);
      expect(history.length).assertEqual(4);
      expect(history[0]).assertEqual('v1_6');
      expect(history[history.length - 1]).assertEqual('v1_9');
      expect(history.join('|')).assertEqual('v1_6|v1_7|v1_8|v1_9');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory001 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2662
     * @tc.name    JsHistory002
     * @tc.desc    History limit 5 after 6 pushes keeps 5 seed 2
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory002', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v2_0', 5)).assertEqual(1);
      expect(model.historyPush(history, 'v2_1', 5)).assertEqual(2);
      expect(model.historyPush(history, 'v2_2', 5)).assertEqual(3);
      expect(model.historyPush(history, 'v2_3', 5)).assertEqual(4);
      expect(model.historyPush(history, 'v2_4', 5)).assertEqual(5);
      expect(model.historyPush(history, 'v2_5', 5)).assertEqual(5);
      expect(history.length).assertEqual(5);
      expect(history[0]).assertEqual('v2_1');
      expect(history[history.length - 1]).assertEqual('v2_5');
      expect(history.join('|')).assertEqual('v2_1|v2_2|v2_3|v2_4|v2_5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory002 done');
    });
}

function StateHistoryWindowPart002() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2663
     * @tc.name    JsHistory003
     * @tc.desc    History limit 6 after 13 pushes keeps 6 seed 3
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory003', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v3_0', 6)).assertEqual(1);
      expect(model.historyPush(history, 'v3_1', 6)).assertEqual(2);
      expect(model.historyPush(history, 'v3_2', 6)).assertEqual(3);
      expect(model.historyPush(history, 'v3_3', 6)).assertEqual(4);
      expect(model.historyPush(history, 'v3_4', 6)).assertEqual(5);
      expect(model.historyPush(history, 'v3_5', 6)).assertEqual(6);
      expect(model.historyPush(history, 'v3_6', 6)).assertEqual(6);
      expect(model.historyPush(history, 'v3_7', 6)).assertEqual(6);
      expect(model.historyPush(history, 'v3_8', 6)).assertEqual(6);
      expect(model.historyPush(history, 'v3_9', 6)).assertEqual(6);
      expect(model.historyPush(history, 'v3_10', 6)).assertEqual(6);
      expect(model.historyPush(history, 'v3_11', 6)).assertEqual(6);
      expect(model.historyPush(history, 'v3_12', 6)).assertEqual(6);
      expect(history.length).assertEqual(6);
      expect(history[0]).assertEqual('v3_7');
      expect(history[history.length - 1]).assertEqual('v3_12');
      expect(history.join('|')).assertEqual('v3_7|v3_8|v3_9|v3_10|v3_11|v3_12');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory003 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2664
     * @tc.name    JsHistory004
     * @tc.desc    History limit 7 after 9 pushes keeps 7 seed 4
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory004', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v4_0', 7)).assertEqual(1);
      expect(model.historyPush(history, 'v4_1', 7)).assertEqual(2);
      expect(model.historyPush(history, 'v4_2', 7)).assertEqual(3);
      expect(model.historyPush(history, 'v4_3', 7)).assertEqual(4);
      expect(model.historyPush(history, 'v4_4', 7)).assertEqual(5);
      expect(model.historyPush(history, 'v4_5', 7)).assertEqual(6);
      expect(model.historyPush(history, 'v4_6', 7)).assertEqual(7);
      expect(model.historyPush(history, 'v4_7', 7)).assertEqual(7);
      expect(model.historyPush(history, 'v4_8', 7)).assertEqual(7);
      expect(history.length).assertEqual(7);
      expect(history[0]).assertEqual('v4_2');
      expect(history[history.length - 1]).assertEqual('v4_8');
      expect(history.join('|')).assertEqual('v4_2|v4_3|v4_4|v4_5|v4_6|v4_7|v4_8');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory004 done');
    });
}

function StateHistoryWindowPart003() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2665
     * @tc.name    JsHistory005
     * @tc.desc    History limit 3 after 5 pushes keeps 3 seed 5
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory005', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v5_0', 3)).assertEqual(1);
      expect(model.historyPush(history, 'v5_1', 3)).assertEqual(2);
      expect(model.historyPush(history, 'v5_2', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v5_3', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v5_4', 3)).assertEqual(3);
      expect(history.length).assertEqual(3);
      expect(history[0]).assertEqual('v5_2');
      expect(history[history.length - 1]).assertEqual('v5_4');
      expect(history.join('|')).assertEqual('v5_2|v5_3|v5_4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory005 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2666
     * @tc.name    JsHistory006
     * @tc.desc    History limit 4 after 12 pushes keeps 4 seed 6
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory006', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v6_0', 4)).assertEqual(1);
      expect(model.historyPush(history, 'v6_1', 4)).assertEqual(2);
      expect(model.historyPush(history, 'v6_2', 4)).assertEqual(3);
      expect(model.historyPush(history, 'v6_3', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v6_4', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v6_5', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v6_6', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v6_7', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v6_8', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v6_9', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v6_10', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v6_11', 4)).assertEqual(4);
      expect(history.length).assertEqual(4);
      expect(history[0]).assertEqual('v6_8');
      expect(history[history.length - 1]).assertEqual('v6_11');
      expect(history.join('|')).assertEqual('v6_8|v6_9|v6_10|v6_11');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory006 done');
    });
}

function StateHistoryWindowPart004() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2667
     * @tc.name    JsHistory007
     * @tc.desc    History limit 5 after 8 pushes keeps 5 seed 7
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory007', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v7_0', 5)).assertEqual(1);
      expect(model.historyPush(history, 'v7_1', 5)).assertEqual(2);
      expect(model.historyPush(history, 'v7_2', 5)).assertEqual(3);
      expect(model.historyPush(history, 'v7_3', 5)).assertEqual(4);
      expect(model.historyPush(history, 'v7_4', 5)).assertEqual(5);
      expect(model.historyPush(history, 'v7_5', 5)).assertEqual(5);
      expect(model.historyPush(history, 'v7_6', 5)).assertEqual(5);
      expect(model.historyPush(history, 'v7_7', 5)).assertEqual(5);
      expect(history.length).assertEqual(5);
      expect(history[0]).assertEqual('v7_3');
      expect(history[history.length - 1]).assertEqual('v7_7');
      expect(history.join('|')).assertEqual('v7_3|v7_4|v7_5|v7_6|v7_7');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory007 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2668
     * @tc.name    JsHistory008
     * @tc.desc    History limit 6 after 4 pushes keeps 4 seed 8
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory008', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'q8_0', 6)).assertEqual(1);
      expect(model.historyPush(history, 'q8_1', 6)).assertEqual(2);
      expect(model.historyPush(history, 'q8_2', 6)).assertEqual(3);
      expect(model.historyPush(history, 'q8_3', 6)).assertEqual(4);
      expect(history.length).assertEqual(4);
      expect(history[0]).assertEqual('q8_0');
      expect(history[history.length - 1]).assertEqual('q8_3');
      expect(history.join('|')).assertEqual('q8_0|q8_1|q8_2|q8_3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory008 done');
    });
}

function StateHistoryWindowPart005() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2669
     * @tc.name    JsHistory009
     * @tc.desc    History limit 7 after 11 pushes keeps 7 seed 9
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory009', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v9_0', 7)).assertEqual(1);
      expect(model.historyPush(history, 'v9_1', 7)).assertEqual(2);
      expect(model.historyPush(history, 'v9_2', 7)).assertEqual(3);
      expect(model.historyPush(history, 'v9_3', 7)).assertEqual(4);
      expect(model.historyPush(history, 'v9_4', 7)).assertEqual(5);
      expect(model.historyPush(history, 'v9_5', 7)).assertEqual(6);
      expect(model.historyPush(history, 'v9_6', 7)).assertEqual(7);
      expect(model.historyPush(history, 'v9_7', 7)).assertEqual(7);
      expect(model.historyPush(history, 'v9_8', 7)).assertEqual(7);
      expect(model.historyPush(history, 'v9_9', 7)).assertEqual(7);
      expect(model.historyPush(history, 'v9_10', 7)).assertEqual(7);
      expect(history.length).assertEqual(7);
      expect(history[0]).assertEqual('v9_4');
      expect(history[history.length - 1]).assertEqual('v9_10');
      expect(history.join('|')).assertEqual('v9_4|v9_5|v9_6|v9_7|v9_8|v9_9|v9_10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory009 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2670
     * @tc.name    JsHistory010
     * @tc.desc    History limit 3 after 7 pushes keeps 3 seed 10
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory010', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v10_0', 3)).assertEqual(1);
      expect(model.historyPush(history, 'v10_1', 3)).assertEqual(2);
      expect(model.historyPush(history, 'v10_2', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v10_3', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v10_4', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v10_5', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v10_6', 3)).assertEqual(3);
      expect(history.length).assertEqual(3);
      expect(history[0]).assertEqual('v10_4');
      expect(history[history.length - 1]).assertEqual('v10_6');
      expect(history.join('|')).assertEqual('v10_4|v10_5|v10_6');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory010 done');
    });
}

function StateHistoryWindowPart006() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2671
     * @tc.name    JsHistory011
     * @tc.desc    History limit 4 after 3 pushes keeps 3 seed 11
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory011', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v11_0', 4)).assertEqual(1);
      expect(model.historyPush(history, 'v11_1', 4)).assertEqual(2);
      expect(model.historyPush(history, 'v11_2', 4)).assertEqual(3);
      expect(history.length).assertEqual(3);
      expect(history[0]).assertEqual('v11_0');
      expect(history[history.length - 1]).assertEqual('v11_2');
      expect(history.join('|')).assertEqual('v11_0|v11_1|v11_2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory011 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2672
     * @tc.name    JsHistory012
     * @tc.desc    History limit 5 after 10 pushes keeps 5 seed 12
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory012', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v12_0', 5)).assertEqual(1);
      expect(model.historyPush(history, 'v12_1', 5)).assertEqual(2);
      expect(model.historyPush(history, 'v12_2', 5)).assertEqual(3);
      expect(model.historyPush(history, 'v12_3', 5)).assertEqual(4);
      expect(model.historyPush(history, 'v12_4', 5)).assertEqual(5);
      expect(model.historyPush(history, 'v12_5', 5)).assertEqual(5);
      expect(model.historyPush(history, 'v12_6', 5)).assertEqual(5);
      expect(model.historyPush(history, 'v12_7', 5)).assertEqual(5);
      expect(model.historyPush(history, 'v12_8', 5)).assertEqual(5);
      expect(model.historyPush(history, 'v12_9', 5)).assertEqual(5);
      expect(history.length).assertEqual(5);
      expect(history[0]).assertEqual('v12_5');
      expect(history[history.length - 1]).assertEqual('v12_9');
      expect(history.join('|')).assertEqual('v12_5|v12_6|v12_7|v12_8|v12_9');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory012 done');
    });
}

function StateHistoryWindowPart007() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2673
     * @tc.name    JsHistory013
     * @tc.desc    History limit 6 after 6 pushes keeps 6 seed 13
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory013', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v13_0', 6)).assertEqual(1);
      expect(model.historyPush(history, 'v13_1', 6)).assertEqual(2);
      expect(model.historyPush(history, 'v13_2', 6)).assertEqual(3);
      expect(model.historyPush(history, 'v13_3', 6)).assertEqual(4);
      expect(model.historyPush(history, 'v13_4', 6)).assertEqual(5);
      expect(model.historyPush(history, 'v13_5', 6)).assertEqual(6);
      expect(history.length).assertEqual(6);
      expect(history[0]).assertEqual('v13_0');
      expect(history[history.length - 1]).assertEqual('v13_5');
      expect(history.join('|')).assertEqual('v13_0|v13_1|v13_2|v13_3|v13_4|v13_5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory013 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2674
     * @tc.name    JsHistory014
     * @tc.desc    History limit 7 after 13 pushes keeps 7 seed 14
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory014', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v14_0', 7)).assertEqual(1);
      expect(model.historyPush(history, 'v14_1', 7)).assertEqual(2);
      expect(model.historyPush(history, 'v14_2', 7)).assertEqual(3);
      expect(model.historyPush(history, 'v14_3', 7)).assertEqual(4);
      expect(model.historyPush(history, 'v14_4', 7)).assertEqual(5);
      expect(model.historyPush(history, 'v14_5', 7)).assertEqual(6);
      expect(model.historyPush(history, 'v14_6', 7)).assertEqual(7);
      expect(model.historyPush(history, 'v14_7', 7)).assertEqual(7);
      expect(model.historyPush(history, 'v14_8', 7)).assertEqual(7);
      expect(model.historyPush(history, 'v14_9', 7)).assertEqual(7);
      expect(model.historyPush(history, 'v14_10', 7)).assertEqual(7);
      expect(model.historyPush(history, 'v14_11', 7)).assertEqual(7);
      expect(model.historyPush(history, 'v14_12', 7)).assertEqual(7);
      expect(history.length).assertEqual(7);
      expect(history[0]).assertEqual('v14_6');
      expect(history[history.length - 1]).assertEqual('v14_12');
      expect(history.join('|')).assertEqual('v14_6|v14_7|v14_8|v14_9|v14_10|v14_11|v14_12');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory014 done');
    });
}

function StateHistoryWindowPart008() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2675
     * @tc.name    JsHistory015
     * @tc.desc    History limit 3 after 9 pushes keeps 3 seed 15
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory015', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v15_0', 3)).assertEqual(1);
      expect(model.historyPush(history, 'v15_1', 3)).assertEqual(2);
      expect(model.historyPush(history, 'v15_2', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v15_3', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v15_4', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v15_5', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v15_6', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v15_7', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v15_8', 3)).assertEqual(3);
      expect(history.length).assertEqual(3);
      expect(history[0]).assertEqual('v15_6');
      expect(history[history.length - 1]).assertEqual('v15_8');
      expect(history.join('|')).assertEqual('v15_6|v15_7|v15_8');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory015 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2676
     * @tc.name    JsHistory016
     * @tc.desc    History limit 4 after 5 pushes keeps 4 seed 16
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory016', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v16_0', 4)).assertEqual(1);
      expect(model.historyPush(history, 'v16_1', 4)).assertEqual(2);
      expect(model.historyPush(history, 'v16_2', 4)).assertEqual(3);
      expect(model.historyPush(history, 'v16_3', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v16_4', 4)).assertEqual(4);
      expect(history.length).assertEqual(4);
      expect(history[0]).assertEqual('v16_1');
      expect(history[history.length - 1]).assertEqual('v16_4');
      expect(history.join('|')).assertEqual('v16_1|v16_2|v16_3|v16_4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory016 done');
    });
}

function StateHistoryWindowPart009() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2677
     * @tc.name    JsHistory017
     * @tc.desc    History limit 5 after 12 pushes keeps 5 seed 17
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory017', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v17_0', 5)).assertEqual(1);
      expect(model.historyPush(history, 'v17_1', 5)).assertEqual(2);
      expect(model.historyPush(history, 'v17_2', 5)).assertEqual(3);
      expect(model.historyPush(history, 'v17_3', 5)).assertEqual(4);
      expect(model.historyPush(history, 'v17_4', 5)).assertEqual(5);
      expect(model.historyPush(history, 'v17_5', 5)).assertEqual(5);
      expect(model.historyPush(history, 'v17_6', 5)).assertEqual(5);
      expect(model.historyPush(history, 'v17_7', 5)).assertEqual(5);
      expect(model.historyPush(history, 'v17_8', 5)).assertEqual(5);
      expect(model.historyPush(history, 'v17_9', 5)).assertEqual(5);
      expect(model.historyPush(history, 'v17_10', 5)).assertEqual(5);
      expect(model.historyPush(history, 'v17_11', 5)).assertEqual(5);
      expect(history.length).assertEqual(5);
      expect(history[0]).assertEqual('v17_7');
      expect(history[history.length - 1]).assertEqual('v17_11');
      expect(history.join('|')).assertEqual('v17_7|v17_8|v17_9|v17_10|v17_11');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory017 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2678
     * @tc.name    JsHistory018
     * @tc.desc    History limit 6 after 8 pushes keeps 6 seed 18
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory018', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v18_0', 6)).assertEqual(1);
      expect(model.historyPush(history, 'v18_1', 6)).assertEqual(2);
      expect(model.historyPush(history, 'v18_2', 6)).assertEqual(3);
      expect(model.historyPush(history, 'v18_3', 6)).assertEqual(4);
      expect(model.historyPush(history, 'v18_4', 6)).assertEqual(5);
      expect(model.historyPush(history, 'v18_5', 6)).assertEqual(6);
      expect(model.historyPush(history, 'v18_6', 6)).assertEqual(6);
      expect(model.historyPush(history, 'v18_7', 6)).assertEqual(6);
      expect(history.length).assertEqual(6);
      expect(history[0]).assertEqual('v18_2');
      expect(history[history.length - 1]).assertEqual('v18_7');
      expect(history.join('|')).assertEqual('v18_2|v18_3|v18_4|v18_5|v18_6|v18_7');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory018 done');
    });
}

function StateHistoryWindowPart010() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2679
     * @tc.name    JsHistory019
     * @tc.desc    History limit 7 after 4 pushes keeps 4 seed 19
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory019', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v19_0', 7)).assertEqual(1);
      expect(model.historyPush(history, 'v19_1', 7)).assertEqual(2);
      expect(model.historyPush(history, 'v19_2', 7)).assertEqual(3);
      expect(model.historyPush(history, 'v19_3', 7)).assertEqual(4);
      expect(history.length).assertEqual(4);
      expect(history[0]).assertEqual('v19_0');
      expect(history[history.length - 1]).assertEqual('v19_3');
      expect(history.join('|')).assertEqual('v19_0|v19_1|v19_2|v19_3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory019 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2680
     * @tc.name    JsHistory020
     * @tc.desc    History limit 3 after 11 pushes keeps 3 seed 20
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory020', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v20_0', 3)).assertEqual(1);
      expect(model.historyPush(history, 'v20_1', 3)).assertEqual(2);
      expect(model.historyPush(history, 'v20_2', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v20_3', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v20_4', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v20_5', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v20_6', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v20_7', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v20_8', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v20_9', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v20_10', 3)).assertEqual(3);
      expect(history.length).assertEqual(3);
      expect(history[0]).assertEqual('v20_8');
      expect(history[history.length - 1]).assertEqual('v20_10');
      expect(history.join('|')).assertEqual('v20_8|v20_9|v20_10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory020 done');
    });
}

function StateHistoryWindowPart011() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2681
     * @tc.name    JsHistory021
     * @tc.desc    History limit 4 after 7 pushes keeps 4 seed 21
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory021', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v21_0', 4)).assertEqual(1);
      expect(model.historyPush(history, 'v21_1', 4)).assertEqual(2);
      expect(model.historyPush(history, 'v21_2', 4)).assertEqual(3);
      expect(model.historyPush(history, 'v21_3', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v21_4', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v21_5', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v21_6', 4)).assertEqual(4);
      expect(history.length).assertEqual(4);
      expect(history[0]).assertEqual('v21_3');
      expect(history[history.length - 1]).assertEqual('v21_6');
      expect(history.join('|')).assertEqual('v21_3|v21_4|v21_5|v21_6');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory021 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2682
     * @tc.name    JsHistory022
     * @tc.desc    History limit 5 after 3 pushes keeps 3 seed 22
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory022', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v22_0', 5)).assertEqual(1);
      expect(model.historyPush(history, 'v22_1', 5)).assertEqual(2);
      expect(model.historyPush(history, 'v22_2', 5)).assertEqual(3);
      expect(history.length).assertEqual(3);
      expect(history[0]).assertEqual('v22_0');
      expect(history[history.length - 1]).assertEqual('v22_2');
      expect(history.join('|')).assertEqual('v22_0|v22_1|v22_2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory022 done');
    });
}

function StateHistoryWindowPart012() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2683
     * @tc.name    JsHistory023
     * @tc.desc    History limit 6 after 10 pushes keeps 6 seed 23
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory023', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v23_0', 6)).assertEqual(1);
      expect(model.historyPush(history, 'v23_1', 6)).assertEqual(2);
      expect(model.historyPush(history, 'v23_2', 6)).assertEqual(3);
      expect(model.historyPush(history, 'v23_3', 6)).assertEqual(4);
      expect(model.historyPush(history, 'v23_4', 6)).assertEqual(5);
      expect(model.historyPush(history, 'v23_5', 6)).assertEqual(6);
      expect(model.historyPush(history, 'v23_6', 6)).assertEqual(6);
      expect(model.historyPush(history, 'v23_7', 6)).assertEqual(6);
      expect(model.historyPush(history, 'v23_8', 6)).assertEqual(6);
      expect(model.historyPush(history, 'v23_9', 6)).assertEqual(6);
      expect(history.length).assertEqual(6);
      expect(history[0]).assertEqual('v23_4');
      expect(history[history.length - 1]).assertEqual('v23_9');
      expect(history.join('|')).assertEqual('v23_4|v23_5|v23_6|v23_7|v23_8|v23_9');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory023 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2684
     * @tc.name    JsHistory024
     * @tc.desc    History limit 7 after 6 pushes keeps 6 seed 24
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory024', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v24_0', 7)).assertEqual(1);
      expect(model.historyPush(history, 'v24_1', 7)).assertEqual(2);
      expect(model.historyPush(history, 'v24_2', 7)).assertEqual(3);
      expect(model.historyPush(history, 'v24_3', 7)).assertEqual(4);
      expect(model.historyPush(history, 'v24_4', 7)).assertEqual(5);
      expect(model.historyPush(history, 'v24_5', 7)).assertEqual(6);
      expect(history.length).assertEqual(6);
      expect(history[0]).assertEqual('v24_0');
      expect(history[history.length - 1]).assertEqual('v24_5');
      expect(history.join('|')).assertEqual('v24_0|v24_1|v24_2|v24_3|v24_4|v24_5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory024 done');
    });
}

function StateHistoryWindowPart013() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2685
     * @tc.name    JsHistory025
     * @tc.desc    History limit 3 after 13 pushes keeps 3 seed 25
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory025', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v25_0', 3)).assertEqual(1);
      expect(model.historyPush(history, 'v25_1', 3)).assertEqual(2);
      expect(model.historyPush(history, 'v25_2', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v25_3', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v25_4', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v25_5', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v25_6', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v25_7', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v25_8', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v25_9', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v25_10', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v25_11', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v25_12', 3)).assertEqual(3);
      expect(history.length).assertEqual(3);
      expect(history[0]).assertEqual('v25_10');
      expect(history[history.length - 1]).assertEqual('v25_12');
      expect(history.join('|')).assertEqual('v25_10|v25_11|v25_12');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory025 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2686
     * @tc.name    JsHistory026
     * @tc.desc    History limit 4 after 9 pushes keeps 4 seed 26
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory026', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v26_0', 4)).assertEqual(1);
      expect(model.historyPush(history, 'v26_1', 4)).assertEqual(2);
      expect(model.historyPush(history, 'v26_2', 4)).assertEqual(3);
      expect(model.historyPush(history, 'v26_3', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v26_4', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v26_5', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v26_6', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v26_7', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v26_8', 4)).assertEqual(4);
      expect(history.length).assertEqual(4);
      expect(history[0]).assertEqual('v26_5');
      expect(history[history.length - 1]).assertEqual('v26_8');
      expect(history.join('|')).assertEqual('v26_5|v26_6|v26_7|v26_8');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory026 done');
    });
}

function StateHistoryWindowPart014() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2687
     * @tc.name    JsHistory027
     * @tc.desc    History limit 5 after 5 pushes keeps 5 seed 27
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory027', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v27_0', 5)).assertEqual(1);
      expect(model.historyPush(history, 'v27_1', 5)).assertEqual(2);
      expect(model.historyPush(history, 'v27_2', 5)).assertEqual(3);
      expect(model.historyPush(history, 'v27_3', 5)).assertEqual(4);
      expect(model.historyPush(history, 'v27_4', 5)).assertEqual(5);
      expect(history.length).assertEqual(5);
      expect(history[0]).assertEqual('v27_0');
      expect(history[history.length - 1]).assertEqual('v27_4');
      expect(history.join('|')).assertEqual('v27_0|v27_1|v27_2|v27_3|v27_4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory027 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2688
     * @tc.name    JsHistory028
     * @tc.desc    History limit 6 after 12 pushes keeps 6 seed 28
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory028', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v28_0', 6)).assertEqual(1);
      expect(model.historyPush(history, 'v28_1', 6)).assertEqual(2);
      expect(model.historyPush(history, 'v28_2', 6)).assertEqual(3);
      expect(model.historyPush(history, 'v28_3', 6)).assertEqual(4);
      expect(model.historyPush(history, 'v28_4', 6)).assertEqual(5);
      expect(model.historyPush(history, 'v28_5', 6)).assertEqual(6);
      expect(model.historyPush(history, 'v28_6', 6)).assertEqual(6);
      expect(model.historyPush(history, 'v28_7', 6)).assertEqual(6);
      expect(model.historyPush(history, 'v28_8', 6)).assertEqual(6);
      expect(model.historyPush(history, 'v28_9', 6)).assertEqual(6);
      expect(model.historyPush(history, 'v28_10', 6)).assertEqual(6);
      expect(model.historyPush(history, 'v28_11', 6)).assertEqual(6);
      expect(history.length).assertEqual(6);
      expect(history[0]).assertEqual('v28_6');
      expect(history[history.length - 1]).assertEqual('v28_11');
      expect(history.join('|')).assertEqual('v28_6|v28_7|v28_8|v28_9|v28_10|v28_11');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory028 done');
    });
}

function StateHistoryWindowPart015() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2689
     * @tc.name    JsHistory029
     * @tc.desc    History limit 7 after 8 pushes keeps 7 seed 29
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory029', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v29_0', 7)).assertEqual(1);
      expect(model.historyPush(history, 'v29_1', 7)).assertEqual(2);
      expect(model.historyPush(history, 'v29_2', 7)).assertEqual(3);
      expect(model.historyPush(history, 'v29_3', 7)).assertEqual(4);
      expect(model.historyPush(history, 'v29_4', 7)).assertEqual(5);
      expect(model.historyPush(history, 'v29_5', 7)).assertEqual(6);
      expect(model.historyPush(history, 'v29_6', 7)).assertEqual(7);
      expect(model.historyPush(history, 'v29_7', 7)).assertEqual(7);
      expect(history.length).assertEqual(7);
      expect(history[0]).assertEqual('v29_1');
      expect(history[history.length - 1]).assertEqual('v29_7');
      expect(history.join('|')).assertEqual('v29_1|v29_2|v29_3|v29_4|v29_5|v29_6|v29_7');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory029 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2690
     * @tc.name    JsHistory030
     * @tc.desc    History limit 3 after 4 pushes keeps 3 seed 30
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory030', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v30_0', 3)).assertEqual(1);
      expect(model.historyPush(history, 'v30_1', 3)).assertEqual(2);
      expect(model.historyPush(history, 'v30_2', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v30_3', 3)).assertEqual(3);
      expect(history.length).assertEqual(3);
      expect(history[0]).assertEqual('v30_1');
      expect(history[history.length - 1]).assertEqual('v30_3');
      expect(history.join('|')).assertEqual('v30_1|v30_2|v30_3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory030 done');
    });
}

function StateHistoryWindowPart016() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2691
     * @tc.name    JsHistory031
     * @tc.desc    History limit 4 after 11 pushes keeps 4 seed 31
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory031', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v31_0', 4)).assertEqual(1);
      expect(model.historyPush(history, 'v31_1', 4)).assertEqual(2);
      expect(model.historyPush(history, 'v31_2', 4)).assertEqual(3);
      expect(model.historyPush(history, 'v31_3', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v31_4', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v31_5', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v31_6', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v31_7', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v31_8', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v31_9', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v31_10', 4)).assertEqual(4);
      expect(history.length).assertEqual(4);
      expect(history[0]).assertEqual('v31_7');
      expect(history[history.length - 1]).assertEqual('v31_10');
      expect(history.join('|')).assertEqual('v31_7|v31_8|v31_9|v31_10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory031 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2692
     * @tc.name    JsHistory032
     * @tc.desc    History limit 5 after 7 pushes keeps 5 seed 32
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory032', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v32_0', 5)).assertEqual(1);
      expect(model.historyPush(history, 'v32_1', 5)).assertEqual(2);
      expect(model.historyPush(history, 'v32_2', 5)).assertEqual(3);
      expect(model.historyPush(history, 'v32_3', 5)).assertEqual(4);
      expect(model.historyPush(history, 'v32_4', 5)).assertEqual(5);
      expect(model.historyPush(history, 'v32_5', 5)).assertEqual(5);
      expect(model.historyPush(history, 'v32_6', 5)).assertEqual(5);
      expect(history.length).assertEqual(5);
      expect(history[0]).assertEqual('v32_2');
      expect(history[history.length - 1]).assertEqual('v32_6');
      expect(history.join('|')).assertEqual('v32_2|v32_3|v32_4|v32_5|v32_6');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory032 done');
    });
}

function StateHistoryWindowPart017() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2693
     * @tc.name    JsHistory033
     * @tc.desc    History limit 6 after 3 pushes keeps 3 seed 33
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory033', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v33_0', 6)).assertEqual(1);
      expect(model.historyPush(history, 'v33_1', 6)).assertEqual(2);
      expect(model.historyPush(history, 'v33_2', 6)).assertEqual(3);
      expect(history.length).assertEqual(3);
      expect(history[0]).assertEqual('v33_0');
      expect(history[history.length - 1]).assertEqual('v33_2');
      expect(history.join('|')).assertEqual('v33_0|v33_1|v33_2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory033 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2694
     * @tc.name    JsHistory034
     * @tc.desc    History limit 7 after 10 pushes keeps 7 seed 34
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory034', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v34_0', 7)).assertEqual(1);
      expect(model.historyPush(history, 'v34_1', 7)).assertEqual(2);
      expect(model.historyPush(history, 'v34_2', 7)).assertEqual(3);
      expect(model.historyPush(history, 'v34_3', 7)).assertEqual(4);
      expect(model.historyPush(history, 'v34_4', 7)).assertEqual(5);
      expect(model.historyPush(history, 'v34_5', 7)).assertEqual(6);
      expect(model.historyPush(history, 'v34_6', 7)).assertEqual(7);
      expect(model.historyPush(history, 'v34_7', 7)).assertEqual(7);
      expect(model.historyPush(history, 'v34_8', 7)).assertEqual(7);
      expect(model.historyPush(history, 'v34_9', 7)).assertEqual(7);
      expect(history.length).assertEqual(7);
      expect(history[0]).assertEqual('v34_3');
      expect(history[history.length - 1]).assertEqual('v34_9');
      expect(history.join('|')).assertEqual('v34_3|v34_4|v34_5|v34_6|v34_7|v34_8|v34_9');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory034 done');
    });
}

function StateHistoryWindowPart018() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2695
     * @tc.name    JsHistory035
     * @tc.desc    History limit 3 after 6 pushes keeps 3 seed 35
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory035', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v35_0', 3)).assertEqual(1);
      expect(model.historyPush(history, 'v35_1', 3)).assertEqual(2);
      expect(model.historyPush(history, 'v35_2', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v35_3', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v35_4', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v35_5', 3)).assertEqual(3);
      expect(history.length).assertEqual(3);
      expect(history[0]).assertEqual('v35_3');
      expect(history[history.length - 1]).assertEqual('v35_5');
      expect(history.join('|')).assertEqual('v35_3|v35_4|v35_5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory035 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2696
     * @tc.name    JsHistory036
     * @tc.desc    History limit 4 after 13 pushes keeps 4 seed 36
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory036', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v36_0', 4)).assertEqual(1);
      expect(model.historyPush(history, 'v36_1', 4)).assertEqual(2);
      expect(model.historyPush(history, 'v36_2', 4)).assertEqual(3);
      expect(model.historyPush(history, 'v36_3', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v36_4', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v36_5', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v36_6', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v36_7', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v36_8', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v36_9', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v36_10', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v36_11', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v36_12', 4)).assertEqual(4);
      expect(history.length).assertEqual(4);
      expect(history[0]).assertEqual('v36_9');
      expect(history[history.length - 1]).assertEqual('v36_12');
      expect(history.join('|')).assertEqual('v36_9|v36_10|v36_11|v36_12');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory036 done');
    });
}

function StateHistoryWindowPart019() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2697
     * @tc.name    JsHistory037
     * @tc.desc    History limit 5 after 9 pushes keeps 5 seed 37
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory037', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v37_0', 5)).assertEqual(1);
      expect(model.historyPush(history, 'v37_1', 5)).assertEqual(2);
      expect(model.historyPush(history, 'v37_2', 5)).assertEqual(3);
      expect(model.historyPush(history, 'v37_3', 5)).assertEqual(4);
      expect(model.historyPush(history, 'v37_4', 5)).assertEqual(5);
      expect(model.historyPush(history, 'v37_5', 5)).assertEqual(5);
      expect(model.historyPush(history, 'v37_6', 5)).assertEqual(5);
      expect(model.historyPush(history, 'v37_7', 5)).assertEqual(5);
      expect(model.historyPush(history, 'v37_8', 5)).assertEqual(5);
      expect(history.length).assertEqual(5);
      expect(history[0]).assertEqual('v37_4');
      expect(history[history.length - 1]).assertEqual('v37_8');
      expect(history.join('|')).assertEqual('v37_4|v37_5|v37_6|v37_7|v37_8');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory037 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2698
     * @tc.name    JsHistory038
     * @tc.desc    History limit 6 after 5 pushes keeps 5 seed 38
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory038', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v38_0', 6)).assertEqual(1);
      expect(model.historyPush(history, 'v38_1', 6)).assertEqual(2);
      expect(model.historyPush(history, 'v38_2', 6)).assertEqual(3);
      expect(model.historyPush(history, 'v38_3', 6)).assertEqual(4);
      expect(model.historyPush(history, 'v38_4', 6)).assertEqual(5);
      expect(history.length).assertEqual(5);
      expect(history[0]).assertEqual('v38_0');
      expect(history[history.length - 1]).assertEqual('v38_4');
      expect(history.join('|')).assertEqual('v38_0|v38_1|v38_2|v38_3|v38_4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory038 done');
    });
}

function StateHistoryWindowPart020() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2699
     * @tc.name    JsHistory039
     * @tc.desc    History limit 7 after 12 pushes keeps 7 seed 39
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory039', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v39_0', 7)).assertEqual(1);
      expect(model.historyPush(history, 'v39_1', 7)).assertEqual(2);
      expect(model.historyPush(history, 'v39_2', 7)).assertEqual(3);
      expect(model.historyPush(history, 'v39_3', 7)).assertEqual(4);
      expect(model.historyPush(history, 'v39_4', 7)).assertEqual(5);
      expect(model.historyPush(history, 'v39_5', 7)).assertEqual(6);
      expect(model.historyPush(history, 'v39_6', 7)).assertEqual(7);
      expect(model.historyPush(history, 'v39_7', 7)).assertEqual(7);
      expect(model.historyPush(history, 'v39_8', 7)).assertEqual(7);
      expect(model.historyPush(history, 'v39_9', 7)).assertEqual(7);
      expect(model.historyPush(history, 'v39_10', 7)).assertEqual(7);
      expect(model.historyPush(history, 'v39_11', 7)).assertEqual(7);
      expect(history.length).assertEqual(7);
      expect(history[0]).assertEqual('v39_5');
      expect(history[history.length - 1]).assertEqual('v39_11');
      expect(history.join('|')).assertEqual('v39_5|v39_6|v39_7|v39_8|v39_9|v39_10|v39_11');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory039 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2700
     * @tc.name    JsHistory040
     * @tc.desc    History limit 3 after 8 pushes keeps 3 seed 40
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory040', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v40_0', 3)).assertEqual(1);
      expect(model.historyPush(history, 'v40_1', 3)).assertEqual(2);
      expect(model.historyPush(history, 'v40_2', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v40_3', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v40_4', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v40_5', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v40_6', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v40_7', 3)).assertEqual(3);
      expect(history.length).assertEqual(3);
      expect(history[0]).assertEqual('v40_5');
      expect(history[history.length - 1]).assertEqual('v40_7');
      expect(history.join('|')).assertEqual('v40_5|v40_6|v40_7');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory040 done');
    });
}

function StateHistoryWindowPart021() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2701
     * @tc.name    JsHistory041
     * @tc.desc    History limit 4 after 4 pushes keeps 4 seed 41
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory041', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v41_0', 4)).assertEqual(1);
      expect(model.historyPush(history, 'v41_1', 4)).assertEqual(2);
      expect(model.historyPush(history, 'v41_2', 4)).assertEqual(3);
      expect(model.historyPush(history, 'v41_3', 4)).assertEqual(4);
      expect(history.length).assertEqual(4);
      expect(history[0]).assertEqual('v41_0');
      expect(history[history.length - 1]).assertEqual('v41_3');
      expect(history.join('|')).assertEqual('v41_0|v41_1|v41_2|v41_3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory041 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2702
     * @tc.name    JsHistory042
     * @tc.desc    History limit 5 after 11 pushes keeps 5 seed 42
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory042', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v42_0', 5)).assertEqual(1);
      expect(model.historyPush(history, 'v42_1', 5)).assertEqual(2);
      expect(model.historyPush(history, 'v42_2', 5)).assertEqual(3);
      expect(model.historyPush(history, 'v42_3', 5)).assertEqual(4);
      expect(model.historyPush(history, 'v42_4', 5)).assertEqual(5);
      expect(model.historyPush(history, 'v42_5', 5)).assertEqual(5);
      expect(model.historyPush(history, 'v42_6', 5)).assertEqual(5);
      expect(model.historyPush(history, 'v42_7', 5)).assertEqual(5);
      expect(model.historyPush(history, 'v42_8', 5)).assertEqual(5);
      expect(model.historyPush(history, 'v42_9', 5)).assertEqual(5);
      expect(model.historyPush(history, 'v42_10', 5)).assertEqual(5);
      expect(history.length).assertEqual(5);
      expect(history[0]).assertEqual('v42_6');
      expect(history[history.length - 1]).assertEqual('v42_10');
      expect(history.join('|')).assertEqual('v42_6|v42_7|v42_8|v42_9|v42_10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory042 done');
    });
}

function StateHistoryWindowPart022() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2703
     * @tc.name    JsHistory043
     * @tc.desc    History limit 6 after 7 pushes keeps 6 seed 43
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory043', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v43_0', 6)).assertEqual(1);
      expect(model.historyPush(history, 'v43_1', 6)).assertEqual(2);
      expect(model.historyPush(history, 'v43_2', 6)).assertEqual(3);
      expect(model.historyPush(history, 'v43_3', 6)).assertEqual(4);
      expect(model.historyPush(history, 'v43_4', 6)).assertEqual(5);
      expect(model.historyPush(history, 'v43_5', 6)).assertEqual(6);
      expect(model.historyPush(history, 'v43_6', 6)).assertEqual(6);
      expect(history.length).assertEqual(6);
      expect(history[0]).assertEqual('v43_1');
      expect(history[history.length - 1]).assertEqual('v43_6');
      expect(history.join('|')).assertEqual('v43_1|v43_2|v43_3|v43_4|v43_5|v43_6');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory043 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2704
     * @tc.name    JsHistory044
     * @tc.desc    History limit 7 after 3 pushes keeps 3 seed 44
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory044', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v44_0', 7)).assertEqual(1);
      expect(model.historyPush(history, 'v44_1', 7)).assertEqual(2);
      expect(model.historyPush(history, 'v44_2', 7)).assertEqual(3);
      expect(history.length).assertEqual(3);
      expect(history[0]).assertEqual('v44_0');
      expect(history[history.length - 1]).assertEqual('v44_2');
      expect(history.join('|')).assertEqual('v44_0|v44_1|v44_2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory044 done');
    });
}

function StateHistoryWindowPart023() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2705
     * @tc.name    JsHistory045
     * @tc.desc    History limit 3 after 10 pushes keeps 3 seed 45
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory045', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v45_0', 3)).assertEqual(1);
      expect(model.historyPush(history, 'v45_1', 3)).assertEqual(2);
      expect(model.historyPush(history, 'v45_2', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v45_3', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v45_4', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v45_5', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v45_6', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v45_7', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v45_8', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v45_9', 3)).assertEqual(3);
      expect(history.length).assertEqual(3);
      expect(history[0]).assertEqual('v45_7');
      expect(history[history.length - 1]).assertEqual('v45_9');
      expect(history.join('|')).assertEqual('v45_7|v45_8|v45_9');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory045 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2706
     * @tc.name    JsHistory046
     * @tc.desc    History limit 4 after 6 pushes keeps 4 seed 46
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory046', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v46_0', 4)).assertEqual(1);
      expect(model.historyPush(history, 'v46_1', 4)).assertEqual(2);
      expect(model.historyPush(history, 'v46_2', 4)).assertEqual(3);
      expect(model.historyPush(history, 'v46_3', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v46_4', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v46_5', 4)).assertEqual(4);
      expect(history.length).assertEqual(4);
      expect(history[0]).assertEqual('v46_2');
      expect(history[history.length - 1]).assertEqual('v46_5');
      expect(history.join('|')).assertEqual('v46_2|v46_3|v46_4|v46_5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory046 done');
    });
}

function StateHistoryWindowPart024() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2707
     * @tc.name    JsHistory047
     * @tc.desc    History limit 5 after 13 pushes keeps 5 seed 47
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory047', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v47_0', 5)).assertEqual(1);
      expect(model.historyPush(history, 'v47_1', 5)).assertEqual(2);
      expect(model.historyPush(history, 'v47_2', 5)).assertEqual(3);
      expect(model.historyPush(history, 'v47_3', 5)).assertEqual(4);
      expect(model.historyPush(history, 'v47_4', 5)).assertEqual(5);
      expect(model.historyPush(history, 'v47_5', 5)).assertEqual(5);
      expect(model.historyPush(history, 'v47_6', 5)).assertEqual(5);
      expect(model.historyPush(history, 'v47_7', 5)).assertEqual(5);
      expect(model.historyPush(history, 'v47_8', 5)).assertEqual(5);
      expect(model.historyPush(history, 'v47_9', 5)).assertEqual(5);
      expect(model.historyPush(history, 'v47_10', 5)).assertEqual(5);
      expect(model.historyPush(history, 'v47_11', 5)).assertEqual(5);
      expect(model.historyPush(history, 'v47_12', 5)).assertEqual(5);
      expect(history.length).assertEqual(5);
      expect(history[0]).assertEqual('v47_8');
      expect(history[history.length - 1]).assertEqual('v47_12');
      expect(history.join('|')).assertEqual('v47_8|v47_9|v47_10|v47_11|v47_12');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory047 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2708
     * @tc.name    JsHistory048
     * @tc.desc    History limit 6 after 9 pushes keeps 6 seed 48
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory048', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v48_0', 6)).assertEqual(1);
      expect(model.historyPush(history, 'v48_1', 6)).assertEqual(2);
      expect(model.historyPush(history, 'v48_2', 6)).assertEqual(3);
      expect(model.historyPush(history, 'v48_3', 6)).assertEqual(4);
      expect(model.historyPush(history, 'v48_4', 6)).assertEqual(5);
      expect(model.historyPush(history, 'v48_5', 6)).assertEqual(6);
      expect(model.historyPush(history, 'v48_6', 6)).assertEqual(6);
      expect(model.historyPush(history, 'v48_7', 6)).assertEqual(6);
      expect(model.historyPush(history, 'v48_8', 6)).assertEqual(6);
      expect(history.length).assertEqual(6);
      expect(history[0]).assertEqual('v48_3');
      expect(history[history.length - 1]).assertEqual('v48_8');
      expect(history.join('|')).assertEqual('v48_3|v48_4|v48_5|v48_6|v48_7|v48_8');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory048 done');
    });
}

function StateHistoryWindowPart025() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2709
     * @tc.name    JsHistory049
     * @tc.desc    History limit 7 after 5 pushes keeps 5 seed 49
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory049', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v49_0', 7)).assertEqual(1);
      expect(model.historyPush(history, 'v49_1', 7)).assertEqual(2);
      expect(model.historyPush(history, 'v49_2', 7)).assertEqual(3);
      expect(model.historyPush(history, 'v49_3', 7)).assertEqual(4);
      expect(model.historyPush(history, 'v49_4', 7)).assertEqual(5);
      expect(history.length).assertEqual(5);
      expect(history[0]).assertEqual('v49_0');
      expect(history[history.length - 1]).assertEqual('v49_4');
      expect(history.join('|')).assertEqual('v49_0|v49_1|v49_2|v49_3|v49_4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory049 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2710
     * @tc.name    JsHistory050
     * @tc.desc    History limit 3 after 12 pushes keeps 3 seed 50
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory050', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v50_0', 3)).assertEqual(1);
      expect(model.historyPush(history, 'v50_1', 3)).assertEqual(2);
      expect(model.historyPush(history, 'v50_2', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v50_3', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v50_4', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v50_5', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v50_6', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v50_7', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v50_8', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v50_9', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v50_10', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v50_11', 3)).assertEqual(3);
      expect(history.length).assertEqual(3);
      expect(history[0]).assertEqual('v50_9');
      expect(history[history.length - 1]).assertEqual('v50_11');
      expect(history.join('|')).assertEqual('v50_9|v50_10|v50_11');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory050 done');
    });
}

function StateHistoryWindowPart026() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2711
     * @tc.name    JsHistory051
     * @tc.desc    History limit 4 after 8 pushes keeps 4 seed 51
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory051', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v51_0', 4)).assertEqual(1);
      expect(model.historyPush(history, 'v51_1', 4)).assertEqual(2);
      expect(model.historyPush(history, 'v51_2', 4)).assertEqual(3);
      expect(model.historyPush(history, 'v51_3', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v51_4', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v51_5', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v51_6', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v51_7', 4)).assertEqual(4);
      expect(history.length).assertEqual(4);
      expect(history[0]).assertEqual('v51_4');
      expect(history[history.length - 1]).assertEqual('v51_7');
      expect(history.join('|')).assertEqual('v51_4|v51_5|v51_6|v51_7');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory051 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2712
     * @tc.name    JsHistory052
     * @tc.desc    History limit 5 after 4 pushes keeps 4 seed 52
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory052', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v52_0', 5)).assertEqual(1);
      expect(model.historyPush(history, 'v52_1', 5)).assertEqual(2);
      expect(model.historyPush(history, 'v52_2', 5)).assertEqual(3);
      expect(model.historyPush(history, 'v52_3', 5)).assertEqual(4);
      expect(history.length).assertEqual(4);
      expect(history[0]).assertEqual('v52_0');
      expect(history[history.length - 1]).assertEqual('v52_3');
      expect(history.join('|')).assertEqual('v52_0|v52_1|v52_2|v52_3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory052 done');
    });
}

function StateHistoryWindowPart027() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2713
     * @tc.name    JsHistory053
     * @tc.desc    History limit 6 after 11 pushes keeps 6 seed 53
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory053', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v53_0', 6)).assertEqual(1);
      expect(model.historyPush(history, 'v53_1', 6)).assertEqual(2);
      expect(model.historyPush(history, 'v53_2', 6)).assertEqual(3);
      expect(model.historyPush(history, 'v53_3', 6)).assertEqual(4);
      expect(model.historyPush(history, 'v53_4', 6)).assertEqual(5);
      expect(model.historyPush(history, 'v53_5', 6)).assertEqual(6);
      expect(model.historyPush(history, 'v53_6', 6)).assertEqual(6);
      expect(model.historyPush(history, 'v53_7', 6)).assertEqual(6);
      expect(model.historyPush(history, 'v53_8', 6)).assertEqual(6);
      expect(model.historyPush(history, 'v53_9', 6)).assertEqual(6);
      expect(model.historyPush(history, 'v53_10', 6)).assertEqual(6);
      expect(history.length).assertEqual(6);
      expect(history[0]).assertEqual('v53_5');
      expect(history[history.length - 1]).assertEqual('v53_10');
      expect(history.join('|')).assertEqual('v53_5|v53_6|v53_7|v53_8|v53_9|v53_10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory053 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2714
     * @tc.name    JsHistory054
     * @tc.desc    History limit 7 after 7 pushes keeps 7 seed 54
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory054', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v54_0', 7)).assertEqual(1);
      expect(model.historyPush(history, 'v54_1', 7)).assertEqual(2);
      expect(model.historyPush(history, 'v54_2', 7)).assertEqual(3);
      expect(model.historyPush(history, 'v54_3', 7)).assertEqual(4);
      expect(model.historyPush(history, 'v54_4', 7)).assertEqual(5);
      expect(model.historyPush(history, 'v54_5', 7)).assertEqual(6);
      expect(model.historyPush(history, 'v54_6', 7)).assertEqual(7);
      expect(history.length).assertEqual(7);
      expect(history[0]).assertEqual('v54_0');
      expect(history[history.length - 1]).assertEqual('v54_6');
      expect(history.join('|')).assertEqual('v54_0|v54_1|v54_2|v54_3|v54_4|v54_5|v54_6');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory054 done');
    });
}

function StateHistoryWindowPart028() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2715
     * @tc.name    JsHistory055
     * @tc.desc    History limit 3 after 3 pushes keeps 3 seed 55
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory055', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v55_0', 3)).assertEqual(1);
      expect(model.historyPush(history, 'v55_1', 3)).assertEqual(2);
      expect(model.historyPush(history, 'v55_2', 3)).assertEqual(3);
      expect(history.length).assertEqual(3);
      expect(history[0]).assertEqual('v55_0');
      expect(history[history.length - 1]).assertEqual('v55_2');
      expect(history.join('|')).assertEqual('v55_0|v55_1|v55_2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory055 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2716
     * @tc.name    JsHistory056
     * @tc.desc    History limit 4 after 10 pushes keeps 4 seed 56
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory056', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v56_0', 4)).assertEqual(1);
      expect(model.historyPush(history, 'v56_1', 4)).assertEqual(2);
      expect(model.historyPush(history, 'v56_2', 4)).assertEqual(3);
      expect(model.historyPush(history, 'v56_3', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v56_4', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v56_5', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v56_6', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v56_7', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v56_8', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v56_9', 4)).assertEqual(4);
      expect(history.length).assertEqual(4);
      expect(history[0]).assertEqual('v56_6');
      expect(history[history.length - 1]).assertEqual('v56_9');
      expect(history.join('|')).assertEqual('v56_6|v56_7|v56_8|v56_9');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory056 done');
    });
}

function StateHistoryWindowPart029() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2717
     * @tc.name    JsHistory057
     * @tc.desc    History limit 5 after 6 pushes keeps 5 seed 57
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory057', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v57_0', 5)).assertEqual(1);
      expect(model.historyPush(history, 'v57_1', 5)).assertEqual(2);
      expect(model.historyPush(history, 'v57_2', 5)).assertEqual(3);
      expect(model.historyPush(history, 'v57_3', 5)).assertEqual(4);
      expect(model.historyPush(history, 'v57_4', 5)).assertEqual(5);
      expect(model.historyPush(history, 'v57_5', 5)).assertEqual(5);
      expect(history.length).assertEqual(5);
      expect(history[0]).assertEqual('v57_1');
      expect(history[history.length - 1]).assertEqual('v57_5');
      expect(history.join('|')).assertEqual('v57_1|v57_2|v57_3|v57_4|v57_5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory057 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2718
     * @tc.name    JsHistory058
     * @tc.desc    History limit 6 after 13 pushes keeps 6 seed 58
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory058', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v58_0', 6)).assertEqual(1);
      expect(model.historyPush(history, 'v58_1', 6)).assertEqual(2);
      expect(model.historyPush(history, 'v58_2', 6)).assertEqual(3);
      expect(model.historyPush(history, 'v58_3', 6)).assertEqual(4);
      expect(model.historyPush(history, 'v58_4', 6)).assertEqual(5);
      expect(model.historyPush(history, 'v58_5', 6)).assertEqual(6);
      expect(model.historyPush(history, 'v58_6', 6)).assertEqual(6);
      expect(model.historyPush(history, 'v58_7', 6)).assertEqual(6);
      expect(model.historyPush(history, 'v58_8', 6)).assertEqual(6);
      expect(model.historyPush(history, 'v58_9', 6)).assertEqual(6);
      expect(model.historyPush(history, 'v58_10', 6)).assertEqual(6);
      expect(model.historyPush(history, 'v58_11', 6)).assertEqual(6);
      expect(model.historyPush(history, 'v58_12', 6)).assertEqual(6);
      expect(history.length).assertEqual(6);
      expect(history[0]).assertEqual('v58_7');
      expect(history[history.length - 1]).assertEqual('v58_12');
      expect(history.join('|')).assertEqual('v58_7|v58_8|v58_9|v58_10|v58_11|v58_12');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory058 done');
    });
}

export default function stateHistoryWindowSuite() {
  describe('StateHistoryWindowSuite', function () {
    StateHistoryWindowPart001();
    StateHistoryWindowPart002();
    StateHistoryWindowPart003();
    StateHistoryWindowPart004();
    StateHistoryWindowPart005();
    StateHistoryWindowPart006();
    StateHistoryWindowPart007();
    StateHistoryWindowPart008();
    StateHistoryWindowPart009();
    StateHistoryWindowPart010();
    StateHistoryWindowPart011();
    StateHistoryWindowPart012();
    StateHistoryWindowPart013();
    StateHistoryWindowPart014();
    StateHistoryWindowPart015();
    StateHistoryWindowPart016();
    StateHistoryWindowPart017();
    StateHistoryWindowPart018();
    StateHistoryWindowPart019();
    StateHistoryWindowPart020();
    StateHistoryWindowPart021();
    StateHistoryWindowPart022();
    StateHistoryWindowPart023();
    StateHistoryWindowPart024();
    StateHistoryWindowPart025();
    StateHistoryWindowPart026();
    StateHistoryWindowPart027();
    StateHistoryWindowPart028();
    StateHistoryWindowPart029();
  });
}
