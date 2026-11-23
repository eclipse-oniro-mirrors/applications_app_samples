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

function StateHistoryWindowPart051() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2761
     * @tc.name    JsHistory101
     * @tc.desc    History limit 4 after 6 pushes keeps 4 seed 101
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory101', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v101_0', 4)).assertEqual(1);
      expect(model.historyPush(history, 'v101_1', 4)).assertEqual(2);
      expect(model.historyPush(history, 'v101_2', 4)).assertEqual(3);
      expect(model.historyPush(history, 'v101_3', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v101_4', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v101_5', 4)).assertEqual(4);
      expect(history.length).assertEqual(4);
      expect(history[0]).assertEqual('v101_2');
      expect(history[history.length - 1]).assertEqual('v101_5');
      expect(history.join('|')).assertEqual('v101_2|v101_3|v101_4|v101_5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory101 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2762
     * @tc.name    JsHistory102
     * @tc.desc    History limit 5 after 13 pushes keeps 5 seed 102
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory102', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v102_0', 5)).assertEqual(1);
      expect(model.historyPush(history, 'v102_1', 5)).assertEqual(2);
      expect(model.historyPush(history, 'v102_2', 5)).assertEqual(3);
      expect(model.historyPush(history, 'v102_3', 5)).assertEqual(4);
      expect(model.historyPush(history, 'v102_4', 5)).assertEqual(5);
      expect(model.historyPush(history, 'v102_5', 5)).assertEqual(5);
      expect(model.historyPush(history, 'v102_6', 5)).assertEqual(5);
      expect(model.historyPush(history, 'v102_7', 5)).assertEqual(5);
      expect(model.historyPush(history, 'v102_8', 5)).assertEqual(5);
      expect(model.historyPush(history, 'v102_9', 5)).assertEqual(5);
      expect(model.historyPush(history, 'v102_10', 5)).assertEqual(5);
      expect(model.historyPush(history, 'v102_11', 5)).assertEqual(5);
      expect(model.historyPush(history, 'v102_12', 5)).assertEqual(5);
      expect(history.length).assertEqual(5);
      expect(history[0]).assertEqual('v102_8');
      expect(history[history.length - 1]).assertEqual('v102_12');
      expect(history.join('|')).assertEqual('v102_8|v102_9|v102_10|v102_11|v102_12');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory102 done');
    });
}

function StateHistoryWindowPart052() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2763
     * @tc.name    JsHistory103
     * @tc.desc    History limit 6 after 9 pushes keeps 6 seed 103
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory103', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v103_0', 6)).assertEqual(1);
      expect(model.historyPush(history, 'v103_1', 6)).assertEqual(2);
      expect(model.historyPush(history, 'v103_2', 6)).assertEqual(3);
      expect(model.historyPush(history, 'v103_3', 6)).assertEqual(4);
      expect(model.historyPush(history, 'v103_4', 6)).assertEqual(5);
      expect(model.historyPush(history, 'v103_5', 6)).assertEqual(6);
      expect(model.historyPush(history, 'v103_6', 6)).assertEqual(6);
      expect(model.historyPush(history, 'v103_7', 6)).assertEqual(6);
      expect(model.historyPush(history, 'v103_8', 6)).assertEqual(6);
      expect(history.length).assertEqual(6);
      expect(history[0]).assertEqual('v103_3');
      expect(history[history.length - 1]).assertEqual('v103_8');
      expect(history.join('|')).assertEqual('v103_3|v103_4|v103_5|v103_6|v103_7|v103_8');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory103 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2764
     * @tc.name    JsHistory104
     * @tc.desc    History limit 7 after 5 pushes keeps 5 seed 104
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory104', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v104_0', 7)).assertEqual(1);
      expect(model.historyPush(history, 'v104_1', 7)).assertEqual(2);
      expect(model.historyPush(history, 'v104_2', 7)).assertEqual(3);
      expect(model.historyPush(history, 'v104_3', 7)).assertEqual(4);
      expect(model.historyPush(history, 'v104_4', 7)).assertEqual(5);
      expect(history.length).assertEqual(5);
      expect(history[0]).assertEqual('v104_0');
      expect(history[history.length - 1]).assertEqual('v104_4');
      expect(history.join('|')).assertEqual('v104_0|v104_1|v104_2|v104_3|v104_4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory104 done');
    });
}

function StateHistoryWindowPart053() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2765
     * @tc.name    JsHistory105
     * @tc.desc    History limit 3 after 12 pushes keeps 3 seed 105
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory105', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v105_0', 3)).assertEqual(1);
      expect(model.historyPush(history, 'v105_1', 3)).assertEqual(2);
      expect(model.historyPush(history, 'v105_2', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v105_3', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v105_4', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v105_5', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v105_6', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v105_7', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v105_8', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v105_9', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v105_10', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v105_11', 3)).assertEqual(3);
      expect(history.length).assertEqual(3);
      expect(history[0]).assertEqual('v105_9');
      expect(history[history.length - 1]).assertEqual('v105_11');
      expect(history.join('|')).assertEqual('v105_9|v105_10|v105_11');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory105 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2766
     * @tc.name    JsHistory106
     * @tc.desc    History limit 4 after 8 pushes keeps 4 seed 106
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory106', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v106_0', 4)).assertEqual(1);
      expect(model.historyPush(history, 'v106_1', 4)).assertEqual(2);
      expect(model.historyPush(history, 'v106_2', 4)).assertEqual(3);
      expect(model.historyPush(history, 'v106_3', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v106_4', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v106_5', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v106_6', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v106_7', 4)).assertEqual(4);
      expect(history.length).assertEqual(4);
      expect(history[0]).assertEqual('v106_4');
      expect(history[history.length - 1]).assertEqual('v106_7');
      expect(history.join('|')).assertEqual('v106_4|v106_5|v106_6|v106_7');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory106 done');
    });
}

function StateHistoryWindowPart054() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2767
     * @tc.name    JsHistory107
     * @tc.desc    History limit 5 after 4 pushes keeps 4 seed 107
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory107', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v107_0', 5)).assertEqual(1);
      expect(model.historyPush(history, 'v107_1', 5)).assertEqual(2);
      expect(model.historyPush(history, 'v107_2', 5)).assertEqual(3);
      expect(model.historyPush(history, 'v107_3', 5)).assertEqual(4);
      expect(history.length).assertEqual(4);
      expect(history[0]).assertEqual('v107_0');
      expect(history[history.length - 1]).assertEqual('v107_3');
      expect(history.join('|')).assertEqual('v107_0|v107_1|v107_2|v107_3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory107 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2768
     * @tc.name    JsHistory108
     * @tc.desc    History limit 6 after 11 pushes keeps 6 seed 108
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory108', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v108_0', 6)).assertEqual(1);
      expect(model.historyPush(history, 'v108_1', 6)).assertEqual(2);
      expect(model.historyPush(history, 'v108_2', 6)).assertEqual(3);
      expect(model.historyPush(history, 'v108_3', 6)).assertEqual(4);
      expect(model.historyPush(history, 'v108_4', 6)).assertEqual(5);
      expect(model.historyPush(history, 'v108_5', 6)).assertEqual(6);
      expect(model.historyPush(history, 'v108_6', 6)).assertEqual(6);
      expect(model.historyPush(history, 'v108_7', 6)).assertEqual(6);
      expect(model.historyPush(history, 'v108_8', 6)).assertEqual(6);
      expect(model.historyPush(history, 'v108_9', 6)).assertEqual(6);
      expect(model.historyPush(history, 'v108_10', 6)).assertEqual(6);
      expect(history.length).assertEqual(6);
      expect(history[0]).assertEqual('v108_5');
      expect(history[history.length - 1]).assertEqual('v108_10');
      expect(history.join('|')).assertEqual('v108_5|v108_6|v108_7|v108_8|v108_9|v108_10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory108 done');
    });
}

function StateHistoryWindowPart055() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2769
     * @tc.name    JsHistory109
     * @tc.desc    History limit 7 after 7 pushes keeps 7 seed 109
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory109', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v109_0', 7)).assertEqual(1);
      expect(model.historyPush(history, 'v109_1', 7)).assertEqual(2);
      expect(model.historyPush(history, 'v109_2', 7)).assertEqual(3);
      expect(model.historyPush(history, 'v109_3', 7)).assertEqual(4);
      expect(model.historyPush(history, 'v109_4', 7)).assertEqual(5);
      expect(model.historyPush(history, 'v109_5', 7)).assertEqual(6);
      expect(model.historyPush(history, 'v109_6', 7)).assertEqual(7);
      expect(history.length).assertEqual(7);
      expect(history[0]).assertEqual('v109_0');
      expect(history[history.length - 1]).assertEqual('v109_6');
      expect(history.join('|')).assertEqual('v109_0|v109_1|v109_2|v109_3|v109_4|v109_5|v109_6');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory109 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2770
     * @tc.name    JsHistory110
     * @tc.desc    History limit 3 after 3 pushes keeps 3 seed 110
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory110', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v110_0', 3)).assertEqual(1);
      expect(model.historyPush(history, 'v110_1', 3)).assertEqual(2);
      expect(model.historyPush(history, 'v110_2', 3)).assertEqual(3);
      expect(history.length).assertEqual(3);
      expect(history[0]).assertEqual('v110_0');
      expect(history[history.length - 1]).assertEqual('v110_2');
      expect(history.join('|')).assertEqual('v110_0|v110_1|v110_2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory110 done');
    });
}

function StateHistoryWindowPart056() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2771
     * @tc.name    JsHistory111
     * @tc.desc    History limit 4 after 10 pushes keeps 4 seed 111
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory111', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v111_0', 4)).assertEqual(1);
      expect(model.historyPush(history, 'v111_1', 4)).assertEqual(2);
      expect(model.historyPush(history, 'v111_2', 4)).assertEqual(3);
      expect(model.historyPush(history, 'v111_3', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v111_4', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v111_5', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v111_6', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v111_7', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v111_8', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v111_9', 4)).assertEqual(4);
      expect(history.length).assertEqual(4);
      expect(history[0]).assertEqual('v111_6');
      expect(history[history.length - 1]).assertEqual('v111_9');
      expect(history.join('|')).assertEqual('v111_6|v111_7|v111_8|v111_9');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory111 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2772
     * @tc.name    JsHistory112
     * @tc.desc    History limit 5 after 6 pushes keeps 5 seed 112
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory112', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v112_0', 5)).assertEqual(1);
      expect(model.historyPush(history, 'v112_1', 5)).assertEqual(2);
      expect(model.historyPush(history, 'v112_2', 5)).assertEqual(3);
      expect(model.historyPush(history, 'v112_3', 5)).assertEqual(4);
      expect(model.historyPush(history, 'v112_4', 5)).assertEqual(5);
      expect(model.historyPush(history, 'v112_5', 5)).assertEqual(5);
      expect(history.length).assertEqual(5);
      expect(history[0]).assertEqual('v112_1');
      expect(history[history.length - 1]).assertEqual('v112_5');
      expect(history.join('|')).assertEqual('v112_1|v112_2|v112_3|v112_4|v112_5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory112 done');
    });
}

function StateHistoryWindowPart057() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2773
     * @tc.name    JsHistory113
     * @tc.desc    History limit 6 after 13 pushes keeps 6 seed 113
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory113', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v113_0', 6)).assertEqual(1);
      expect(model.historyPush(history, 'v113_1', 6)).assertEqual(2);
      expect(model.historyPush(history, 'v113_2', 6)).assertEqual(3);
      expect(model.historyPush(history, 'v113_3', 6)).assertEqual(4);
      expect(model.historyPush(history, 'v113_4', 6)).assertEqual(5);
      expect(model.historyPush(history, 'v113_5', 6)).assertEqual(6);
      expect(model.historyPush(history, 'v113_6', 6)).assertEqual(6);
      expect(model.historyPush(history, 'v113_7', 6)).assertEqual(6);
      expect(model.historyPush(history, 'v113_8', 6)).assertEqual(6);
      expect(model.historyPush(history, 'v113_9', 6)).assertEqual(6);
      expect(model.historyPush(history, 'v113_10', 6)).assertEqual(6);
      expect(model.historyPush(history, 'v113_11', 6)).assertEqual(6);
      expect(model.historyPush(history, 'v113_12', 6)).assertEqual(6);
      expect(history.length).assertEqual(6);
      expect(history[0]).assertEqual('v113_7');
      expect(history[history.length - 1]).assertEqual('v113_12');
      expect(history.join('|')).assertEqual('v113_7|v113_8|v113_9|v113_10|v113_11|v113_12');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory113 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2774
     * @tc.name    JsHistory114
     * @tc.desc    History limit 7 after 9 pushes keeps 7 seed 114
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory114', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v114_0', 7)).assertEqual(1);
      expect(model.historyPush(history, 'v114_1', 7)).assertEqual(2);
      expect(model.historyPush(history, 'v114_2', 7)).assertEqual(3);
      expect(model.historyPush(history, 'v114_3', 7)).assertEqual(4);
      expect(model.historyPush(history, 'v114_4', 7)).assertEqual(5);
      expect(model.historyPush(history, 'v114_5', 7)).assertEqual(6);
      expect(model.historyPush(history, 'v114_6', 7)).assertEqual(7);
      expect(model.historyPush(history, 'v114_7', 7)).assertEqual(7);
      expect(model.historyPush(history, 'v114_8', 7)).assertEqual(7);
      expect(history.length).assertEqual(7);
      expect(history[0]).assertEqual('v114_2');
      expect(history[history.length - 1]).assertEqual('v114_8');
      expect(history.join('|')).assertEqual('v114_2|v114_3|v114_4|v114_5|v114_6|v114_7|v114_8');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory114 done');
    });
}

function StateHistoryWindowPart058() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2775
     * @tc.name    JsHistory115
     * @tc.desc    History limit 3 after 5 pushes keeps 3 seed 115
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory115', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v115_0', 3)).assertEqual(1);
      expect(model.historyPush(history, 'v115_1', 3)).assertEqual(2);
      expect(model.historyPush(history, 'v115_2', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v115_3', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v115_4', 3)).assertEqual(3);
      expect(history.length).assertEqual(3);
      expect(history[0]).assertEqual('v115_2');
      expect(history[history.length - 1]).assertEqual('v115_4');
      expect(history.join('|')).assertEqual('v115_2|v115_3|v115_4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory115 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2776
     * @tc.name    JsHistory116
     * @tc.desc    History limit 4 after 12 pushes keeps 4 seed 116
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory116', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v116_0', 4)).assertEqual(1);
      expect(model.historyPush(history, 'v116_1', 4)).assertEqual(2);
      expect(model.historyPush(history, 'v116_2', 4)).assertEqual(3);
      expect(model.historyPush(history, 'v116_3', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v116_4', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v116_5', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v116_6', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v116_7', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v116_8', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v116_9', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v116_10', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v116_11', 4)).assertEqual(4);
      expect(history.length).assertEqual(4);
      expect(history[0]).assertEqual('v116_8');
      expect(history[history.length - 1]).assertEqual('v116_11');
      expect(history.join('|')).assertEqual('v116_8|v116_9|v116_10|v116_11');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory116 done');
    });
}

function StateHistoryWindowPart059() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2777
     * @tc.name    JsHistory117
     * @tc.desc    History limit 5 after 8 pushes keeps 5 seed 117
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory117', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v117_0', 5)).assertEqual(1);
      expect(model.historyPush(history, 'v117_1', 5)).assertEqual(2);
      expect(model.historyPush(history, 'v117_2', 5)).assertEqual(3);
      expect(model.historyPush(history, 'v117_3', 5)).assertEqual(4);
      expect(model.historyPush(history, 'v117_4', 5)).assertEqual(5);
      expect(model.historyPush(history, 'v117_5', 5)).assertEqual(5);
      expect(model.historyPush(history, 'v117_6', 5)).assertEqual(5);
      expect(model.historyPush(history, 'v117_7', 5)).assertEqual(5);
      expect(history.length).assertEqual(5);
      expect(history[0]).assertEqual('v117_3');
      expect(history[history.length - 1]).assertEqual('v117_7');
      expect(history.join('|')).assertEqual('v117_3|v117_4|v117_5|v117_6|v117_7');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory117 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2778
     * @tc.name    JsHistory118
     * @tc.desc    History limit 6 after 4 pushes keeps 4 seed 118
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory118', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v118_0', 6)).assertEqual(1);
      expect(model.historyPush(history, 'v118_1', 6)).assertEqual(2);
      expect(model.historyPush(history, 'v118_2', 6)).assertEqual(3);
      expect(model.historyPush(history, 'v118_3', 6)).assertEqual(4);
      expect(history.length).assertEqual(4);
      expect(history[0]).assertEqual('v118_0');
      expect(history[history.length - 1]).assertEqual('v118_3');
      expect(history.join('|')).assertEqual('v118_0|v118_1|v118_2|v118_3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory118 done');
    });
}

function StateHistoryWindowPart060() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2779
     * @tc.name    JsHistory119
     * @tc.desc    History limit 7 after 11 pushes keeps 7 seed 119
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory119', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v119_0', 7)).assertEqual(1);
      expect(model.historyPush(history, 'v119_1', 7)).assertEqual(2);
      expect(model.historyPush(history, 'v119_2', 7)).assertEqual(3);
      expect(model.historyPush(history, 'v119_3', 7)).assertEqual(4);
      expect(model.historyPush(history, 'v119_4', 7)).assertEqual(5);
      expect(model.historyPush(history, 'v119_5', 7)).assertEqual(6);
      expect(model.historyPush(history, 'v119_6', 7)).assertEqual(7);
      expect(model.historyPush(history, 'v119_7', 7)).assertEqual(7);
      expect(model.historyPush(history, 'v119_8', 7)).assertEqual(7);
      expect(model.historyPush(history, 'v119_9', 7)).assertEqual(7);
      expect(model.historyPush(history, 'v119_10', 7)).assertEqual(7);
      expect(history.length).assertEqual(7);
      expect(history[0]).assertEqual('v119_4');
      expect(history[history.length - 1]).assertEqual('v119_10');
      expect(history.join('|')).assertEqual('v119_4|v119_5|v119_6|v119_7|v119_8|v119_9|v119_10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory119 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2780
     * @tc.name    JsHistory120
     * @tc.desc    History limit 3 after 7 pushes keeps 3 seed 120
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory120', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v120_0', 3)).assertEqual(1);
      expect(model.historyPush(history, 'v120_1', 3)).assertEqual(2);
      expect(model.historyPush(history, 'v120_2', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v120_3', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v120_4', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v120_5', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v120_6', 3)).assertEqual(3);
      expect(history.length).assertEqual(3);
      expect(history[0]).assertEqual('v120_4');
      expect(history[history.length - 1]).assertEqual('v120_6');
      expect(history.join('|')).assertEqual('v120_4|v120_5|v120_6');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory120 done');
    });
}

function StateHistoryWindowPart061() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2781
     * @tc.name    JsHistory121
     * @tc.desc    History limit 4 after 3 pushes keeps 3 seed 121
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory121', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v121_0', 4)).assertEqual(1);
      expect(model.historyPush(history, 'v121_1', 4)).assertEqual(2);
      expect(model.historyPush(history, 'v121_2', 4)).assertEqual(3);
      expect(history.length).assertEqual(3);
      expect(history[0]).assertEqual('v121_0');
      expect(history[history.length - 1]).assertEqual('v121_2');
      expect(history.join('|')).assertEqual('v121_0|v121_1|v121_2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory121 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2782
     * @tc.name    JsHistory122
     * @tc.desc    History limit 5 after 10 pushes keeps 5 seed 122
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory122', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v122_0', 5)).assertEqual(1);
      expect(model.historyPush(history, 'v122_1', 5)).assertEqual(2);
      expect(model.historyPush(history, 'v122_2', 5)).assertEqual(3);
      expect(model.historyPush(history, 'v122_3', 5)).assertEqual(4);
      expect(model.historyPush(history, 'v122_4', 5)).assertEqual(5);
      expect(model.historyPush(history, 'v122_5', 5)).assertEqual(5);
      expect(model.historyPush(history, 'v122_6', 5)).assertEqual(5);
      expect(model.historyPush(history, 'v122_7', 5)).assertEqual(5);
      expect(model.historyPush(history, 'v122_8', 5)).assertEqual(5);
      expect(model.historyPush(history, 'v122_9', 5)).assertEqual(5);
      expect(history.length).assertEqual(5);
      expect(history[0]).assertEqual('v122_5');
      expect(history[history.length - 1]).assertEqual('v122_9');
      expect(history.join('|')).assertEqual('v122_5|v122_6|v122_7|v122_8|v122_9');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory122 done');
    });
}

function StateHistoryWindowPart062() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2783
     * @tc.name    JsHistory123
     * @tc.desc    History limit 6 after 6 pushes keeps 6 seed 123
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory123', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v123_0', 6)).assertEqual(1);
      expect(model.historyPush(history, 'v123_1', 6)).assertEqual(2);
      expect(model.historyPush(history, 'v123_2', 6)).assertEqual(3);
      expect(model.historyPush(history, 'v123_3', 6)).assertEqual(4);
      expect(model.historyPush(history, 'v123_4', 6)).assertEqual(5);
      expect(model.historyPush(history, 'v123_5', 6)).assertEqual(6);
      expect(history.length).assertEqual(6);
      expect(history[0]).assertEqual('v123_0');
      expect(history[history.length - 1]).assertEqual('v123_5');
      expect(history.join('|')).assertEqual('v123_0|v123_1|v123_2|v123_3|v123_4|v123_5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory123 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2784
     * @tc.name    JsHistory124
     * @tc.desc    History limit 7 after 13 pushes keeps 7 seed 124
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory124', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v124_0', 7)).assertEqual(1);
      expect(model.historyPush(history, 'v124_1', 7)).assertEqual(2);
      expect(model.historyPush(history, 'v124_2', 7)).assertEqual(3);
      expect(model.historyPush(history, 'v124_3', 7)).assertEqual(4);
      expect(model.historyPush(history, 'v124_4', 7)).assertEqual(5);
      expect(model.historyPush(history, 'v124_5', 7)).assertEqual(6);
      expect(model.historyPush(history, 'v124_6', 7)).assertEqual(7);
      expect(model.historyPush(history, 'v124_7', 7)).assertEqual(7);
      expect(model.historyPush(history, 'v124_8', 7)).assertEqual(7);
      expect(model.historyPush(history, 'v124_9', 7)).assertEqual(7);
      expect(model.historyPush(history, 'v124_10', 7)).assertEqual(7);
      expect(model.historyPush(history, 'v124_11', 7)).assertEqual(7);
      expect(model.historyPush(history, 'v124_12', 7)).assertEqual(7);
      expect(history.length).assertEqual(7);
      expect(history[0]).assertEqual('v124_6');
      expect(history[history.length - 1]).assertEqual('v124_12');
      expect(history.join('|')).assertEqual('v124_6|v124_7|v124_8|v124_9|v124_10|v124_11|v124_12');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory124 done');
    });
}

function StateHistoryWindowPart063() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2785
     * @tc.name    JsHistory125
     * @tc.desc    History limit 3 after 9 pushes keeps 3 seed 125
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory125', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v125_0', 3)).assertEqual(1);
      expect(model.historyPush(history, 'v125_1', 3)).assertEqual(2);
      expect(model.historyPush(history, 'v125_2', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v125_3', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v125_4', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v125_5', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v125_6', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v125_7', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v125_8', 3)).assertEqual(3);
      expect(history.length).assertEqual(3);
      expect(history[0]).assertEqual('v125_6');
      expect(history[history.length - 1]).assertEqual('v125_8');
      expect(history.join('|')).assertEqual('v125_6|v125_7|v125_8');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory125 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2786
     * @tc.name    JsHistory126
     * @tc.desc    History limit 4 after 5 pushes keeps 4 seed 126
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory126', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v126_0', 4)).assertEqual(1);
      expect(model.historyPush(history, 'v126_1', 4)).assertEqual(2);
      expect(model.historyPush(history, 'v126_2', 4)).assertEqual(3);
      expect(model.historyPush(history, 'v126_3', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v126_4', 4)).assertEqual(4);
      expect(history.length).assertEqual(4);
      expect(history[0]).assertEqual('v126_1');
      expect(history[history.length - 1]).assertEqual('v126_4');
      expect(history.join('|')).assertEqual('v126_1|v126_2|v126_3|v126_4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory126 done');
    });
}

function StateHistoryWindowPart064() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2787
     * @tc.name    JsHistory127
     * @tc.desc    History limit 5 after 12 pushes keeps 5 seed 127
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory127', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v127_0', 5)).assertEqual(1);
      expect(model.historyPush(history, 'v127_1', 5)).assertEqual(2);
      expect(model.historyPush(history, 'v127_2', 5)).assertEqual(3);
      expect(model.historyPush(history, 'v127_3', 5)).assertEqual(4);
      expect(model.historyPush(history, 'v127_4', 5)).assertEqual(5);
      expect(model.historyPush(history, 'v127_5', 5)).assertEqual(5);
      expect(model.historyPush(history, 'v127_6', 5)).assertEqual(5);
      expect(model.historyPush(history, 'v127_7', 5)).assertEqual(5);
      expect(model.historyPush(history, 'v127_8', 5)).assertEqual(5);
      expect(model.historyPush(history, 'v127_9', 5)).assertEqual(5);
      expect(model.historyPush(history, 'v127_10', 5)).assertEqual(5);
      expect(model.historyPush(history, 'v127_11', 5)).assertEqual(5);
      expect(history.length).assertEqual(5);
      expect(history[0]).assertEqual('v127_7');
      expect(history[history.length - 1]).assertEqual('v127_11');
      expect(history.join('|')).assertEqual('v127_7|v127_8|v127_9|v127_10|v127_11');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory127 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2788
     * @tc.name    JsHistory128
     * @tc.desc    History limit 6 after 8 pushes keeps 6 seed 128
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory128', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v128_0', 6)).assertEqual(1);
      expect(model.historyPush(history, 'v128_1', 6)).assertEqual(2);
      expect(model.historyPush(history, 'v128_2', 6)).assertEqual(3);
      expect(model.historyPush(history, 'v128_3', 6)).assertEqual(4);
      expect(model.historyPush(history, 'v128_4', 6)).assertEqual(5);
      expect(model.historyPush(history, 'v128_5', 6)).assertEqual(6);
      expect(model.historyPush(history, 'v128_6', 6)).assertEqual(6);
      expect(model.historyPush(history, 'v128_7', 6)).assertEqual(6);
      expect(history.length).assertEqual(6);
      expect(history[0]).assertEqual('v128_2');
      expect(history[history.length - 1]).assertEqual('v128_7');
      expect(history.join('|')).assertEqual('v128_2|v128_3|v128_4|v128_5|v128_6|v128_7');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory128 done');
    });
}

function StateHistoryWindowPart065() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2789
     * @tc.name    JsHistory129
     * @tc.desc    History limit 7 after 4 pushes keeps 4 seed 129
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory129', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v129_0', 7)).assertEqual(1);
      expect(model.historyPush(history, 'v129_1', 7)).assertEqual(2);
      expect(model.historyPush(history, 'v129_2', 7)).assertEqual(3);
      expect(model.historyPush(history, 'v129_3', 7)).assertEqual(4);
      expect(history.length).assertEqual(4);
      expect(history[0]).assertEqual('v129_0');
      expect(history[history.length - 1]).assertEqual('v129_3');
      expect(history.join('|')).assertEqual('v129_0|v129_1|v129_2|v129_3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory129 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2790
     * @tc.name    JsHistory130
     * @tc.desc    History limit 3 after 11 pushes keeps 3 seed 130
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory130', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v130_0', 3)).assertEqual(1);
      expect(model.historyPush(history, 'v130_1', 3)).assertEqual(2);
      expect(model.historyPush(history, 'v130_2', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v130_3', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v130_4', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v130_5', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v130_6', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v130_7', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v130_8', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v130_9', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v130_10', 3)).assertEqual(3);
      expect(history.length).assertEqual(3);
      expect(history[0]).assertEqual('v130_8');
      expect(history[history.length - 1]).assertEqual('v130_10');
      expect(history.join('|')).assertEqual('v130_8|v130_9|v130_10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory130 done');
    });
}

function StateHistoryWindowPart066() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2791
     * @tc.name    JsHistory131
     * @tc.desc    History limit 4 after 7 pushes keeps 4 seed 131
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory131', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v131_0', 4)).assertEqual(1);
      expect(model.historyPush(history, 'v131_1', 4)).assertEqual(2);
      expect(model.historyPush(history, 'v131_2', 4)).assertEqual(3);
      expect(model.historyPush(history, 'v131_3', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v131_4', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v131_5', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v131_6', 4)).assertEqual(4);
      expect(history.length).assertEqual(4);
      expect(history[0]).assertEqual('v131_3');
      expect(history[history.length - 1]).assertEqual('v131_6');
      expect(history.join('|')).assertEqual('v131_3|v131_4|v131_5|v131_6');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory131 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2792
     * @tc.name    JsHistory132
     * @tc.desc    History limit 5 after 3 pushes keeps 3 seed 132
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory132', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v132_0', 5)).assertEqual(1);
      expect(model.historyPush(history, 'v132_1', 5)).assertEqual(2);
      expect(model.historyPush(history, 'v132_2', 5)).assertEqual(3);
      expect(history.length).assertEqual(3);
      expect(history[0]).assertEqual('v132_0');
      expect(history[history.length - 1]).assertEqual('v132_2');
      expect(history.join('|')).assertEqual('v132_0|v132_1|v132_2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory132 done');
    });
}

function StateHistoryWindowPart067() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2793
     * @tc.name    JsHistory133
     * @tc.desc    History limit 6 after 10 pushes keeps 6 seed 133
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory133', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v133_0', 6)).assertEqual(1);
      expect(model.historyPush(history, 'v133_1', 6)).assertEqual(2);
      expect(model.historyPush(history, 'v133_2', 6)).assertEqual(3);
      expect(model.historyPush(history, 'v133_3', 6)).assertEqual(4);
      expect(model.historyPush(history, 'v133_4', 6)).assertEqual(5);
      expect(model.historyPush(history, 'v133_5', 6)).assertEqual(6);
      expect(model.historyPush(history, 'v133_6', 6)).assertEqual(6);
      expect(model.historyPush(history, 'v133_7', 6)).assertEqual(6);
      expect(model.historyPush(history, 'v133_8', 6)).assertEqual(6);
      expect(model.historyPush(history, 'v133_9', 6)).assertEqual(6);
      expect(history.length).assertEqual(6);
      expect(history[0]).assertEqual('v133_4');
      expect(history[history.length - 1]).assertEqual('v133_9');
      expect(history.join('|')).assertEqual('v133_4|v133_5|v133_6|v133_7|v133_8|v133_9');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory133 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2794
     * @tc.name    JsHistory134
     * @tc.desc    History limit 7 after 6 pushes keeps 6 seed 134
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory134', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v134_0', 7)).assertEqual(1);
      expect(model.historyPush(history, 'v134_1', 7)).assertEqual(2);
      expect(model.historyPush(history, 'v134_2', 7)).assertEqual(3);
      expect(model.historyPush(history, 'v134_3', 7)).assertEqual(4);
      expect(model.historyPush(history, 'v134_4', 7)).assertEqual(5);
      expect(model.historyPush(history, 'v134_5', 7)).assertEqual(6);
      expect(history.length).assertEqual(6);
      expect(history[0]).assertEqual('v134_0');
      expect(history[history.length - 1]).assertEqual('v134_5');
      expect(history.join('|')).assertEqual('v134_0|v134_1|v134_2|v134_3|v134_4|v134_5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory134 done');
    });
}

function StateHistoryWindowPart068() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2795
     * @tc.name    JsHistory135
     * @tc.desc    History limit 3 after 13 pushes keeps 3 seed 135
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory135', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v135_0', 3)).assertEqual(1);
      expect(model.historyPush(history, 'v135_1', 3)).assertEqual(2);
      expect(model.historyPush(history, 'v135_2', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v135_3', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v135_4', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v135_5', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v135_6', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v135_7', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v135_8', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v135_9', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v135_10', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v135_11', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v135_12', 3)).assertEqual(3);
      expect(history.length).assertEqual(3);
      expect(history[0]).assertEqual('v135_10');
      expect(history[history.length - 1]).assertEqual('v135_12');
      expect(history.join('|')).assertEqual('v135_10|v135_11|v135_12');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory135 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2796
     * @tc.name    JsHistory136
     * @tc.desc    History limit 4 after 9 pushes keeps 4 seed 136
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory136', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v136_0', 4)).assertEqual(1);
      expect(model.historyPush(history, 'v136_1', 4)).assertEqual(2);
      expect(model.historyPush(history, 'v136_2', 4)).assertEqual(3);
      expect(model.historyPush(history, 'v136_3', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v136_4', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v136_5', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v136_6', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v136_7', 4)).assertEqual(4);
      expect(model.historyPush(history, 'v136_8', 4)).assertEqual(4);
      expect(history.length).assertEqual(4);
      expect(history[0]).assertEqual('v136_5');
      expect(history[history.length - 1]).assertEqual('v136_8');
      expect(history.join('|')).assertEqual('v136_5|v136_6|v136_7|v136_8');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory136 done');
    });
}

function StateHistoryWindowPart069() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2797
     * @tc.name    JsHistory137
     * @tc.desc    History limit 5 after 5 pushes keeps 5 seed 137
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory137', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v137_0', 5)).assertEqual(1);
      expect(model.historyPush(history, 'v137_1', 5)).assertEqual(2);
      expect(model.historyPush(history, 'v137_2', 5)).assertEqual(3);
      expect(model.historyPush(history, 'v137_3', 5)).assertEqual(4);
      expect(model.historyPush(history, 'v137_4', 5)).assertEqual(5);
      expect(history.length).assertEqual(5);
      expect(history[0]).assertEqual('v137_0');
      expect(history[history.length - 1]).assertEqual('v137_4');
      expect(history.join('|')).assertEqual('v137_0|v137_1|v137_2|v137_3|v137_4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory137 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2798
     * @tc.name    JsHistory138
     * @tc.desc    History limit 6 after 12 pushes keeps 6 seed 138
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory138', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v138_0', 6)).assertEqual(1);
      expect(model.historyPush(history, 'v138_1', 6)).assertEqual(2);
      expect(model.historyPush(history, 'v138_2', 6)).assertEqual(3);
      expect(model.historyPush(history, 'v138_3', 6)).assertEqual(4);
      expect(model.historyPush(history, 'v138_4', 6)).assertEqual(5);
      expect(model.historyPush(history, 'v138_5', 6)).assertEqual(6);
      expect(model.historyPush(history, 'v138_6', 6)).assertEqual(6);
      expect(model.historyPush(history, 'v138_7', 6)).assertEqual(6);
      expect(model.historyPush(history, 'v138_8', 6)).assertEqual(6);
      expect(model.historyPush(history, 'v138_9', 6)).assertEqual(6);
      expect(model.historyPush(history, 'v138_10', 6)).assertEqual(6);
      expect(model.historyPush(history, 'v138_11', 6)).assertEqual(6);
      expect(history.length).assertEqual(6);
      expect(history[0]).assertEqual('v138_6');
      expect(history[history.length - 1]).assertEqual('v138_11');
      expect(history.join('|')).assertEqual('v138_6|v138_7|v138_8|v138_9|v138_10|v138_11');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory138 done');
    });
}

function StateHistoryWindowPart070() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2799
     * @tc.name    JsHistory139
     * @tc.desc    History limit 7 after 8 pushes keeps 7 seed 139
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory139', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v139_0', 7)).assertEqual(1);
      expect(model.historyPush(history, 'v139_1', 7)).assertEqual(2);
      expect(model.historyPush(history, 'v139_2', 7)).assertEqual(3);
      expect(model.historyPush(history, 'v139_3', 7)).assertEqual(4);
      expect(model.historyPush(history, 'v139_4', 7)).assertEqual(5);
      expect(model.historyPush(history, 'v139_5', 7)).assertEqual(6);
      expect(model.historyPush(history, 'v139_6', 7)).assertEqual(7);
      expect(model.historyPush(history, 'v139_7', 7)).assertEqual(7);
      expect(history.length).assertEqual(7);
      expect(history[0]).assertEqual('v139_1');
      expect(history[history.length - 1]).assertEqual('v139_7');
      expect(history.join('|')).assertEqual('v139_1|v139_2|v139_3|v139_4|v139_5|v139_6|v139_7');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory139 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2800
     * @tc.name    JsHistory140
     * @tc.desc    History limit 3 after 4 pushes keeps 3 seed 140
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsHistory140', 0, async function () {
      await yieldThread();
      const history = [];
      expect(model.historyPush(history, 'v140_0', 3)).assertEqual(1);
      expect(model.historyPush(history, 'v140_1', 3)).assertEqual(2);
      expect(model.historyPush(history, 'v140_2', 3)).assertEqual(3);
      expect(model.historyPush(history, 'v140_3', 3)).assertEqual(3);
      expect(history.length).assertEqual(3);
      expect(history[0]).assertEqual('v140_1');
      expect(history[history.length - 1]).assertEqual('v140_3');
      expect(history.join('|')).assertEqual('v140_1|v140_2|v140_3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsHistory140 done');
    });
}

function StateHistoryWindowGroup003() {
  StateHistoryWindowPart051();
  StateHistoryWindowPart052();
  StateHistoryWindowPart053();
  StateHistoryWindowPart054();
  StateHistoryWindowPart055();
  StateHistoryWindowPart056();
  StateHistoryWindowPart057();
  StateHistoryWindowPart058();
  StateHistoryWindowPart059();
  StateHistoryWindowPart060();
  StateHistoryWindowPart061();
  StateHistoryWindowPart062();
  StateHistoryWindowPart063();
  StateHistoryWindowPart064();
  StateHistoryWindowPart065();
  StateHistoryWindowPart066();
  StateHistoryWindowPart067();
  StateHistoryWindowPart068();
  StateHistoryWindowPart069();
  StateHistoryWindowPart070();
}

export function registerStateHistoryWindowExtra2() {
  StateHistoryWindowGroup003();
}
