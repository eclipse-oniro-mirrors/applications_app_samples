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

function NavigationStackPart049() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0657
     * @tc.name    JsNavigate097
     * @tc.desc    Push 6 routes then pop 1 seed 97
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate097', 0, async function () {
      await yieldThread();
      const stack = [];
      expect(model.pushRoute(stack, 'pages/page0')).assertEqual(1);
      expect(model.pushRoute(stack, 'pages/page1')).assertEqual(2);
      expect(model.pushRoute(stack, 'pages/page2')).assertEqual(3);
      expect(model.pushRoute(stack, 'pages/page3')).assertEqual(4);
      expect(model.pushRoute(stack, 'pages/page4')).assertEqual(5);
      expect(model.pushRoute(stack, 'pages/page5')).assertEqual(6);
      expect(stack.length).assertEqual(6);
      expect(model.topRoute(stack)).assertEqual('pages/page5');
      expect(model.canBack(stack)).assertEqual(true);
      expect(model.indexOfRoute(stack, 'pages/page1')).assertEqual(1);
      expect(model.popRoute(stack)).assertEqual('pages/page5');
      expect(stack.length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate097 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0658
     * @tc.name    JsNavigate098
     * @tc.desc    Push 11 routes then pop 2 seed 98
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate098', 0, async function () {
      await yieldThread();
      const stack = [];
      expect(model.pushRoute(stack, 'pages/page0')).assertEqual(1);
      expect(model.pushRoute(stack, 'pages/page1')).assertEqual(2);
      expect(model.pushRoute(stack, 'pages/page2')).assertEqual(3);
      expect(model.pushRoute(stack, 'pages/page3')).assertEqual(4);
      expect(model.pushRoute(stack, 'pages/page4')).assertEqual(5);
      expect(model.pushRoute(stack, 'pages/page5')).assertEqual(6);
      expect(model.pushRoute(stack, 'pages/page6')).assertEqual(7);
      expect(model.pushRoute(stack, 'pages/page7')).assertEqual(8);
      expect(model.pushRoute(stack, 'pages/page8')).assertEqual(9);
      expect(model.pushRoute(stack, 'pages/page9')).assertEqual(10);
      expect(model.pushRoute(stack, 'pages/page10')).assertEqual(11);
      expect(stack.length).assertEqual(11);
      expect(model.topRoute(stack)).assertEqual('pages/page10');
      expect(model.canBack(stack)).assertEqual(true);
      expect(model.indexOfRoute(stack, 'pages/page1')).assertEqual(1);
      expect(model.popRoute(stack)).assertEqual('pages/page10');
      expect(model.popRoute(stack)).assertEqual('pages/page9');
      expect(stack.length).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate098 done');
    });
}

function NavigationStackPart050() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0659
     * @tc.name    JsNavigate099
     * @tc.desc    Push 4 routes then pop 3 seed 99
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate099', 0, async function () {
      await yieldThread();
      const stack = [];
      expect(model.pushRoute(stack, 'pages/page0')).assertEqual(1);
      expect(model.pushRoute(stack, 'pages/page1')).assertEqual(2);
      expect(model.pushRoute(stack, 'pages/page2')).assertEqual(3);
      expect(model.pushRoute(stack, 'pages/page3')).assertEqual(4);
      expect(stack.length).assertEqual(4);
      expect(model.topRoute(stack)).assertEqual('pages/page3');
      expect(model.canBack(stack)).assertEqual(true);
      expect(model.indexOfRoute(stack, 'pages/page1')).assertEqual(1);
      expect(model.popRoute(stack)).assertEqual('pages/page3');
      expect(model.popRoute(stack)).assertEqual('pages/page2');
      expect(model.popRoute(stack)).assertEqual('pages/page1');
      expect(stack.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate099 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0660
     * @tc.name    JsNavigate100
     * @tc.desc    Push 9 routes then pop 0 seed 100
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate100', 0, async function () {
      await yieldThread();
      const stack = [];
      expect(model.pushRoute(stack, 'pages/page0')).assertEqual(1);
      expect(model.pushRoute(stack, 'pages/page1')).assertEqual(2);
      expect(model.pushRoute(stack, 'pages/page2')).assertEqual(3);
      expect(model.pushRoute(stack, 'pages/page3')).assertEqual(4);
      expect(model.pushRoute(stack, 'pages/page4')).assertEqual(5);
      expect(model.pushRoute(stack, 'pages/page5')).assertEqual(6);
      expect(model.pushRoute(stack, 'pages/page6')).assertEqual(7);
      expect(model.pushRoute(stack, 'pages/page7')).assertEqual(8);
      expect(model.pushRoute(stack, 'pages/page8')).assertEqual(9);
      expect(stack.length).assertEqual(9);
      expect(model.topRoute(stack)).assertEqual('pages/page8');
      expect(model.canBack(stack)).assertEqual(true);
      expect(model.indexOfRoute(stack, 'pages/page1')).assertEqual(1);
      expect(stack.length).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate100 done');
    });
}

function NavigationStackPart051() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0661
     * @tc.name    JsNavigate101
     * @tc.desc    Push 2 routes then pop 1 seed 101
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate101', 0, async function () {
      await yieldThread();
      const stack = [];
      expect(model.pushRoute(stack, 'pages/page0')).assertEqual(1);
      expect(model.pushRoute(stack, 'pages/page1')).assertEqual(2);
      expect(stack.length).assertEqual(2);
      expect(model.topRoute(stack)).assertEqual('pages/page1');
      expect(model.canBack(stack)).assertEqual(true);
      expect(model.indexOfRoute(stack, 'pages/page1')).assertEqual(1);
      expect(model.popRoute(stack)).assertEqual('pages/page1');
      expect(stack.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate101 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0662
     * @tc.name    JsNavigate102
     * @tc.desc    Push 7 routes then pop 2 seed 102
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate102', 0, async function () {
      await yieldThread();
      const stack = [];
      expect(model.pushRoute(stack, 'pages/page0')).assertEqual(1);
      expect(model.pushRoute(stack, 'pages/page1')).assertEqual(2);
      expect(model.pushRoute(stack, 'pages/page2')).assertEqual(3);
      expect(model.pushRoute(stack, 'pages/page3')).assertEqual(4);
      expect(model.pushRoute(stack, 'pages/page4')).assertEqual(5);
      expect(model.pushRoute(stack, 'pages/page5')).assertEqual(6);
      expect(model.pushRoute(stack, 'pages/page6')).assertEqual(7);
      expect(stack.length).assertEqual(7);
      expect(model.topRoute(stack)).assertEqual('pages/page6');
      expect(model.canBack(stack)).assertEqual(true);
      expect(model.indexOfRoute(stack, 'pages/page1')).assertEqual(1);
      expect(model.popRoute(stack)).assertEqual('pages/page6');
      expect(model.popRoute(stack)).assertEqual('pages/page5');
      expect(stack.length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate102 done');
    });
}

function NavigationStackPart052() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0663
     * @tc.name    JsNavigate103
     * @tc.desc    Push 12 routes then pop 3 seed 103
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate103', 0, async function () {
      await yieldThread();
      const stack = [];
      expect(model.pushRoute(stack, 'pages/page0')).assertEqual(1);
      expect(model.pushRoute(stack, 'pages/page1')).assertEqual(2);
      expect(model.pushRoute(stack, 'pages/page2')).assertEqual(3);
      expect(model.pushRoute(stack, 'pages/page3')).assertEqual(4);
      expect(model.pushRoute(stack, 'pages/page4')).assertEqual(5);
      expect(model.pushRoute(stack, 'pages/page5')).assertEqual(6);
      expect(model.pushRoute(stack, 'pages/page6')).assertEqual(7);
      expect(model.pushRoute(stack, 'pages/page7')).assertEqual(8);
      expect(model.pushRoute(stack, 'pages/page8')).assertEqual(9);
      expect(model.pushRoute(stack, 'pages/page9')).assertEqual(10);
      expect(model.pushRoute(stack, 'pages/page10')).assertEqual(11);
      expect(model.pushRoute(stack, 'pages/page11')).assertEqual(12);
      expect(stack.length).assertEqual(12);
      expect(model.topRoute(stack)).assertEqual('pages/page11');
      expect(model.canBack(stack)).assertEqual(true);
      expect(model.indexOfRoute(stack, 'pages/page1')).assertEqual(1);
      expect(model.popRoute(stack)).assertEqual('pages/page11');
      expect(model.popRoute(stack)).assertEqual('pages/page10');
      expect(model.popRoute(stack)).assertEqual('pages/page9');
      expect(stack.length).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate103 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0664
     * @tc.name    JsNavigate104
     * @tc.desc    Push 5 routes then pop 0 seed 104
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate104', 0, async function () {
      await yieldThread();
      const stack = [];
      expect(model.pushRoute(stack, 'pages/page0')).assertEqual(1);
      expect(model.pushRoute(stack, 'pages/page1')).assertEqual(2);
      expect(model.pushRoute(stack, 'pages/page2')).assertEqual(3);
      expect(model.pushRoute(stack, 'pages/page3')).assertEqual(4);
      expect(model.pushRoute(stack, 'pages/page4')).assertEqual(5);
      expect(stack.length).assertEqual(5);
      expect(model.topRoute(stack)).assertEqual('pages/page4');
      expect(model.canBack(stack)).assertEqual(true);
      expect(model.indexOfRoute(stack, 'pages/page1')).assertEqual(1);
      expect(stack.length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate104 done');
    });
}

function NavigationStackPart053() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0665
     * @tc.name    JsNavigate105
     * @tc.desc    Push 10 routes then pop 1 seed 105
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate105', 0, async function () {
      await yieldThread();
      const stack = [];
      expect(model.pushRoute(stack, 'pages/page0')).assertEqual(1);
      expect(model.pushRoute(stack, 'pages/page1')).assertEqual(2);
      expect(model.pushRoute(stack, 'pages/page2')).assertEqual(3);
      expect(model.pushRoute(stack, 'pages/page3')).assertEqual(4);
      expect(model.pushRoute(stack, 'pages/page4')).assertEqual(5);
      expect(model.pushRoute(stack, 'pages/page5')).assertEqual(6);
      expect(model.pushRoute(stack, 'pages/page6')).assertEqual(7);
      expect(model.pushRoute(stack, 'pages/page7')).assertEqual(8);
      expect(model.pushRoute(stack, 'pages/page8')).assertEqual(9);
      expect(model.pushRoute(stack, 'pages/page9')).assertEqual(10);
      expect(stack.length).assertEqual(10);
      expect(model.topRoute(stack)).assertEqual('pages/page9');
      expect(model.canBack(stack)).assertEqual(true);
      expect(model.indexOfRoute(stack, 'pages/page1')).assertEqual(1);
      expect(model.popRoute(stack)).assertEqual('pages/page9');
      expect(stack.length).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate105 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0666
     * @tc.name    JsNavigate106
     * @tc.desc    Push 3 routes then pop 2 seed 106
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate106', 0, async function () {
      await yieldThread();
      const stack = [];
      expect(model.pushRoute(stack, 'pages/page0')).assertEqual(1);
      expect(model.pushRoute(stack, 'pages/page1')).assertEqual(2);
      expect(model.pushRoute(stack, 'pages/page2')).assertEqual(3);
      expect(stack.length).assertEqual(3);
      expect(model.topRoute(stack)).assertEqual('pages/page2');
      expect(model.canBack(stack)).assertEqual(true);
      expect(model.indexOfRoute(stack, 'pages/page1')).assertEqual(1);
      expect(model.popRoute(stack)).assertEqual('pages/page2');
      expect(model.popRoute(stack)).assertEqual('pages/page1');
      expect(stack.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate106 done');
    });
}

function NavigationStackPart054() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0667
     * @tc.name    JsNavigate107
     * @tc.desc    Push 8 routes then pop 3 seed 107
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate107', 0, async function () {
      await yieldThread();
      const stack = [];
      expect(model.pushRoute(stack, 'pages/page0')).assertEqual(1);
      expect(model.pushRoute(stack, 'pages/page1')).assertEqual(2);
      expect(model.pushRoute(stack, 'pages/page2')).assertEqual(3);
      expect(model.pushRoute(stack, 'pages/page3')).assertEqual(4);
      expect(model.pushRoute(stack, 'pages/page4')).assertEqual(5);
      expect(model.pushRoute(stack, 'pages/page5')).assertEqual(6);
      expect(model.pushRoute(stack, 'pages/page6')).assertEqual(7);
      expect(model.pushRoute(stack, 'pages/page7')).assertEqual(8);
      expect(stack.length).assertEqual(8);
      expect(model.topRoute(stack)).assertEqual('pages/page7');
      expect(model.canBack(stack)).assertEqual(true);
      expect(model.indexOfRoute(stack, 'pages/page1')).assertEqual(1);
      expect(model.popRoute(stack)).assertEqual('pages/page7');
      expect(model.popRoute(stack)).assertEqual('pages/page6');
      expect(model.popRoute(stack)).assertEqual('pages/page5');
      expect(stack.length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate107 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0668
     * @tc.name    JsNavigate108
     * @tc.desc    Push 1 routes then pop 0 seed 108
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate108', 0, async function () {
      await yieldThread();
      const stack = [];
      expect(model.pushRoute(stack, 'pages/page0')).assertEqual(1);
      expect(stack.length).assertEqual(1);
      expect(model.topRoute(stack)).assertEqual('pages/page0');
      expect(model.canBack(stack)).assertEqual(false);
      expect(model.indexOfRoute(stack, 'pages/page0')).assertEqual(0);
      expect(stack.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate108 done');
    });
}

function NavigationStackPart055() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0669
     * @tc.name    JsNavigate109
     * @tc.desc    Push 6 routes then pop 1 seed 109
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate109', 0, async function () {
      await yieldThread();
      const stack = [];
      expect(model.pushRoute(stack, 'pages/page0')).assertEqual(1);
      expect(model.pushRoute(stack, 'pages/page1')).assertEqual(2);
      expect(model.pushRoute(stack, 'pages/page2')).assertEqual(3);
      expect(model.pushRoute(stack, 'pages/page3')).assertEqual(4);
      expect(model.pushRoute(stack, 'pages/page4')).assertEqual(5);
      expect(model.pushRoute(stack, 'pages/page5')).assertEqual(6);
      expect(stack.length).assertEqual(6);
      expect(model.topRoute(stack)).assertEqual('pages/page5');
      expect(model.canBack(stack)).assertEqual(true);
      expect(model.indexOfRoute(stack, 'pages/page1')).assertEqual(1);
      expect(model.popRoute(stack)).assertEqual('pages/page5');
      expect(stack.length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate109 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0670
     * @tc.name    JsNavigate110
     * @tc.desc    Push 11 routes then pop 2 seed 110
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate110', 0, async function () {
      await yieldThread();
      const stack = [];
      expect(model.pushRoute(stack, 'pages/page0')).assertEqual(1);
      expect(model.pushRoute(stack, 'pages/page1')).assertEqual(2);
      expect(model.pushRoute(stack, 'pages/page2')).assertEqual(3);
      expect(model.pushRoute(stack, 'pages/page3')).assertEqual(4);
      expect(model.pushRoute(stack, 'pages/page4')).assertEqual(5);
      expect(model.pushRoute(stack, 'pages/page5')).assertEqual(6);
      expect(model.pushRoute(stack, 'pages/page6')).assertEqual(7);
      expect(model.pushRoute(stack, 'pages/page7')).assertEqual(8);
      expect(model.pushRoute(stack, 'pages/page8')).assertEqual(9);
      expect(model.pushRoute(stack, 'pages/page9')).assertEqual(10);
      expect(model.pushRoute(stack, 'pages/page10')).assertEqual(11);
      expect(stack.length).assertEqual(11);
      expect(model.topRoute(stack)).assertEqual('pages/page10');
      expect(model.canBack(stack)).assertEqual(true);
      expect(model.indexOfRoute(stack, 'pages/page1')).assertEqual(1);
      expect(model.popRoute(stack)).assertEqual('pages/page10');
      expect(model.popRoute(stack)).assertEqual('pages/page9');
      expect(stack.length).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate110 done');
    });
}

function NavigationStackPart056() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0671
     * @tc.name    JsNavigate111
     * @tc.desc    Push 4 routes then pop 3 seed 111
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate111', 0, async function () {
      await yieldThread();
      const stack = [];
      expect(model.pushRoute(stack, 'pages/page0')).assertEqual(1);
      expect(model.pushRoute(stack, 'pages/page1')).assertEqual(2);
      expect(model.pushRoute(stack, 'pages/page2')).assertEqual(3);
      expect(model.pushRoute(stack, 'pages/page3')).assertEqual(4);
      expect(stack.length).assertEqual(4);
      expect(model.topRoute(stack)).assertEqual('pages/page3');
      expect(model.canBack(stack)).assertEqual(true);
      expect(model.indexOfRoute(stack, 'pages/page1')).assertEqual(1);
      expect(model.popRoute(stack)).assertEqual('pages/page3');
      expect(model.popRoute(stack)).assertEqual('pages/page2');
      expect(model.popRoute(stack)).assertEqual('pages/page1');
      expect(stack.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate111 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0672
     * @tc.name    JsNavigate112
     * @tc.desc    Push 9 routes then pop 0 seed 112
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate112', 0, async function () {
      await yieldThread();
      const stack = [];
      expect(model.pushRoute(stack, 'pages/page0')).assertEqual(1);
      expect(model.pushRoute(stack, 'pages/page1')).assertEqual(2);
      expect(model.pushRoute(stack, 'pages/page2')).assertEqual(3);
      expect(model.pushRoute(stack, 'pages/page3')).assertEqual(4);
      expect(model.pushRoute(stack, 'pages/page4')).assertEqual(5);
      expect(model.pushRoute(stack, 'pages/page5')).assertEqual(6);
      expect(model.pushRoute(stack, 'pages/page6')).assertEqual(7);
      expect(model.pushRoute(stack, 'pages/page7')).assertEqual(8);
      expect(model.pushRoute(stack, 'pages/page8')).assertEqual(9);
      expect(stack.length).assertEqual(9);
      expect(model.topRoute(stack)).assertEqual('pages/page8');
      expect(model.canBack(stack)).assertEqual(true);
      expect(model.indexOfRoute(stack, 'pages/page1')).assertEqual(1);
      expect(stack.length).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate112 done');
    });
}

function NavigationStackPart057() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0673
     * @tc.name    JsNavigate113
     * @tc.desc    Push 2 routes then pop 1 seed 113
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate113', 0, async function () {
      await yieldThread();
      const stack = [];
      expect(model.pushRoute(stack, 'pages/page0')).assertEqual(1);
      expect(model.pushRoute(stack, 'pages/page1')).assertEqual(2);
      expect(stack.length).assertEqual(2);
      expect(model.topRoute(stack)).assertEqual('pages/page1');
      expect(model.canBack(stack)).assertEqual(true);
      expect(model.indexOfRoute(stack, 'pages/page1')).assertEqual(1);
      expect(model.popRoute(stack)).assertEqual('pages/page1');
      expect(stack.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate113 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0674
     * @tc.name    JsNavigate114
     * @tc.desc    Push 7 routes then pop 2 seed 114
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate114', 0, async function () {
      await yieldThread();
      const stack = [];
      expect(model.pushRoute(stack, 'pages/page0')).assertEqual(1);
      expect(model.pushRoute(stack, 'pages/page1')).assertEqual(2);
      expect(model.pushRoute(stack, 'pages/page2')).assertEqual(3);
      expect(model.pushRoute(stack, 'pages/page3')).assertEqual(4);
      expect(model.pushRoute(stack, 'pages/page4')).assertEqual(5);
      expect(model.pushRoute(stack, 'pages/page5')).assertEqual(6);
      expect(model.pushRoute(stack, 'pages/page6')).assertEqual(7);
      expect(stack.length).assertEqual(7);
      expect(model.topRoute(stack)).assertEqual('pages/page6');
      expect(model.canBack(stack)).assertEqual(true);
      expect(model.indexOfRoute(stack, 'pages/page1')).assertEqual(1);
      expect(model.popRoute(stack)).assertEqual('pages/page6');
      expect(model.popRoute(stack)).assertEqual('pages/page5');
      expect(stack.length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate114 done');
    });
}

function NavigationStackPart058() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0675
     * @tc.name    JsNavigate115
     * @tc.desc    Push 12 routes then pop 3 seed 115
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate115', 0, async function () {
      await yieldThread();
      const stack = [];
      expect(model.pushRoute(stack, 'pages/page0')).assertEqual(1);
      expect(model.pushRoute(stack, 'pages/page1')).assertEqual(2);
      expect(model.pushRoute(stack, 'pages/page2')).assertEqual(3);
      expect(model.pushRoute(stack, 'pages/page3')).assertEqual(4);
      expect(model.pushRoute(stack, 'pages/page4')).assertEqual(5);
      expect(model.pushRoute(stack, 'pages/page5')).assertEqual(6);
      expect(model.pushRoute(stack, 'pages/page6')).assertEqual(7);
      expect(model.pushRoute(stack, 'pages/page7')).assertEqual(8);
      expect(model.pushRoute(stack, 'pages/page8')).assertEqual(9);
      expect(model.pushRoute(stack, 'pages/page9')).assertEqual(10);
      expect(model.pushRoute(stack, 'pages/page10')).assertEqual(11);
      expect(model.pushRoute(stack, 'pages/page11')).assertEqual(12);
      expect(stack.length).assertEqual(12);
      expect(model.topRoute(stack)).assertEqual('pages/page11');
      expect(model.canBack(stack)).assertEqual(true);
      expect(model.indexOfRoute(stack, 'pages/page1')).assertEqual(1);
      expect(model.popRoute(stack)).assertEqual('pages/page11');
      expect(model.popRoute(stack)).assertEqual('pages/page10');
      expect(model.popRoute(stack)).assertEqual('pages/page9');
      expect(stack.length).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate115 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0676
     * @tc.name    JsNavigate116
     * @tc.desc    Push 5 routes then pop 0 seed 116
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate116', 0, async function () {
      await yieldThread();
      const stack = [];
      expect(model.pushRoute(stack, 'pages/page0')).assertEqual(1);
      expect(model.pushRoute(stack, 'pages/page1')).assertEqual(2);
      expect(model.pushRoute(stack, 'pages/page2')).assertEqual(3);
      expect(model.pushRoute(stack, 'pages/page3')).assertEqual(4);
      expect(model.pushRoute(stack, 'pages/page4')).assertEqual(5);
      expect(stack.length).assertEqual(5);
      expect(model.topRoute(stack)).assertEqual('pages/page4');
      expect(model.canBack(stack)).assertEqual(true);
      expect(model.indexOfRoute(stack, 'pages/page1')).assertEqual(1);
      expect(stack.length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate116 done');
    });
}

function NavigationStackPart059() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0677
     * @tc.name    JsNavigate117
     * @tc.desc    Push 10 routes then pop 1 seed 117
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate117', 0, async function () {
      await yieldThread();
      const stack = [];
      expect(model.pushRoute(stack, 'pages/page0')).assertEqual(1);
      expect(model.pushRoute(stack, 'pages/page1')).assertEqual(2);
      expect(model.pushRoute(stack, 'pages/page2')).assertEqual(3);
      expect(model.pushRoute(stack, 'pages/page3')).assertEqual(4);
      expect(model.pushRoute(stack, 'pages/page4')).assertEqual(5);
      expect(model.pushRoute(stack, 'pages/page5')).assertEqual(6);
      expect(model.pushRoute(stack, 'pages/page6')).assertEqual(7);
      expect(model.pushRoute(stack, 'pages/page7')).assertEqual(8);
      expect(model.pushRoute(stack, 'pages/page8')).assertEqual(9);
      expect(model.pushRoute(stack, 'pages/page9')).assertEqual(10);
      expect(stack.length).assertEqual(10);
      expect(model.topRoute(stack)).assertEqual('pages/page9');
      expect(model.canBack(stack)).assertEqual(true);
      expect(model.indexOfRoute(stack, 'pages/page1')).assertEqual(1);
      expect(model.popRoute(stack)).assertEqual('pages/page9');
      expect(stack.length).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate117 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0678
     * @tc.name    JsNavigate118
     * @tc.desc    Push 3 routes then pop 2 seed 118
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate118', 0, async function () {
      await yieldThread();
      const stack = [];
      expect(model.pushRoute(stack, 'pages/page0')).assertEqual(1);
      expect(model.pushRoute(stack, 'pages/page1')).assertEqual(2);
      expect(model.pushRoute(stack, 'pages/page2')).assertEqual(3);
      expect(stack.length).assertEqual(3);
      expect(model.topRoute(stack)).assertEqual('pages/page2');
      expect(model.canBack(stack)).assertEqual(true);
      expect(model.indexOfRoute(stack, 'pages/page1')).assertEqual(1);
      expect(model.popRoute(stack)).assertEqual('pages/page2');
      expect(model.popRoute(stack)).assertEqual('pages/page1');
      expect(stack.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate118 done');
    });
}

function NavigationStackPart060() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0679
     * @tc.name    JsNavigate119
     * @tc.desc    Push 8 routes then pop 3 seed 119
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate119', 0, async function () {
      await yieldThread();
      const stack = [];
      expect(model.pushRoute(stack, 'pages/page0')).assertEqual(1);
      expect(model.pushRoute(stack, 'pages/page1')).assertEqual(2);
      expect(model.pushRoute(stack, 'pages/page2')).assertEqual(3);
      expect(model.pushRoute(stack, 'pages/page3')).assertEqual(4);
      expect(model.pushRoute(stack, 'pages/page4')).assertEqual(5);
      expect(model.pushRoute(stack, 'pages/page5')).assertEqual(6);
      expect(model.pushRoute(stack, 'pages/page6')).assertEqual(7);
      expect(model.pushRoute(stack, 'pages/page7')).assertEqual(8);
      expect(stack.length).assertEqual(8);
      expect(model.topRoute(stack)).assertEqual('pages/page7');
      expect(model.canBack(stack)).assertEqual(true);
      expect(model.indexOfRoute(stack, 'pages/page1')).assertEqual(1);
      expect(model.popRoute(stack)).assertEqual('pages/page7');
      expect(model.popRoute(stack)).assertEqual('pages/page6');
      expect(model.popRoute(stack)).assertEqual('pages/page5');
      expect(stack.length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate119 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0680
     * @tc.name    JsNavigate120
     * @tc.desc    Push 1 routes then pop 0 seed 120
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate120', 0, async function () {
      await yieldThread();
      const stack = [];
      expect(model.pushRoute(stack, 'pages/page0')).assertEqual(1);
      expect(stack.length).assertEqual(1);
      expect(model.topRoute(stack)).assertEqual('pages/page0');
      expect(model.canBack(stack)).assertEqual(false);
      expect(model.indexOfRoute(stack, 'pages/page0')).assertEqual(0);
      expect(stack.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate120 done');
    });
}

function NavigationStackPart061() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0681
     * @tc.name    JsNavigate121
     * @tc.desc    Push 6 routes then pop 1 seed 121
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate121', 0, async function () {
      await yieldThread();
      const stack = [];
      expect(model.pushRoute(stack, 'pages/page0')).assertEqual(1);
      expect(model.pushRoute(stack, 'pages/page1')).assertEqual(2);
      expect(model.pushRoute(stack, 'pages/page2')).assertEqual(3);
      expect(model.pushRoute(stack, 'pages/page3')).assertEqual(4);
      expect(model.pushRoute(stack, 'pages/page4')).assertEqual(5);
      expect(model.pushRoute(stack, 'pages/page5')).assertEqual(6);
      expect(stack.length).assertEqual(6);
      expect(model.topRoute(stack)).assertEqual('pages/page5');
      expect(model.canBack(stack)).assertEqual(true);
      expect(model.indexOfRoute(stack, 'pages/page1')).assertEqual(1);
      expect(model.popRoute(stack)).assertEqual('pages/page5');
      expect(stack.length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate121 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0682
     * @tc.name    JsNavigate122
     * @tc.desc    Push 11 routes then pop 2 seed 122
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate122', 0, async function () {
      await yieldThread();
      const stack = [];
      expect(model.pushRoute(stack, 'pages/page0')).assertEqual(1);
      expect(model.pushRoute(stack, 'pages/page1')).assertEqual(2);
      expect(model.pushRoute(stack, 'pages/page2')).assertEqual(3);
      expect(model.pushRoute(stack, 'pages/page3')).assertEqual(4);
      expect(model.pushRoute(stack, 'pages/page4')).assertEqual(5);
      expect(model.pushRoute(stack, 'pages/page5')).assertEqual(6);
      expect(model.pushRoute(stack, 'pages/page6')).assertEqual(7);
      expect(model.pushRoute(stack, 'pages/page7')).assertEqual(8);
      expect(model.pushRoute(stack, 'pages/page8')).assertEqual(9);
      expect(model.pushRoute(stack, 'pages/page9')).assertEqual(10);
      expect(model.pushRoute(stack, 'pages/page10')).assertEqual(11);
      expect(stack.length).assertEqual(11);
      expect(model.topRoute(stack)).assertEqual('pages/page10');
      expect(model.canBack(stack)).assertEqual(true);
      expect(model.indexOfRoute(stack, 'pages/page1')).assertEqual(1);
      expect(model.popRoute(stack)).assertEqual('pages/page10');
      expect(model.popRoute(stack)).assertEqual('pages/page9');
      expect(stack.length).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate122 done');
    });
}

function NavigationStackPart062() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0683
     * @tc.name    JsNavigate123
     * @tc.desc    Push 4 routes then pop 3 seed 123
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate123', 0, async function () {
      await yieldThread();
      const stack = [];
      expect(model.pushRoute(stack, 'pages/page0')).assertEqual(1);
      expect(model.pushRoute(stack, 'pages/page1')).assertEqual(2);
      expect(model.pushRoute(stack, 'pages/page2')).assertEqual(3);
      expect(model.pushRoute(stack, 'pages/page3')).assertEqual(4);
      expect(stack.length).assertEqual(4);
      expect(model.topRoute(stack)).assertEqual('pages/page3');
      expect(model.canBack(stack)).assertEqual(true);
      expect(model.indexOfRoute(stack, 'pages/page1')).assertEqual(1);
      expect(model.popRoute(stack)).assertEqual('pages/page3');
      expect(model.popRoute(stack)).assertEqual('pages/page2');
      expect(model.popRoute(stack)).assertEqual('pages/page1');
      expect(stack.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate123 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0684
     * @tc.name    JsNavigate124
     * @tc.desc    Push 9 routes then pop 0 seed 124
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate124', 0, async function () {
      await yieldThread();
      const stack = [];
      expect(model.pushRoute(stack, 'pages/page0')).assertEqual(1);
      expect(model.pushRoute(stack, 'pages/page1')).assertEqual(2);
      expect(model.pushRoute(stack, 'pages/page2')).assertEqual(3);
      expect(model.pushRoute(stack, 'pages/page3')).assertEqual(4);
      expect(model.pushRoute(stack, 'pages/page4')).assertEqual(5);
      expect(model.pushRoute(stack, 'pages/page5')).assertEqual(6);
      expect(model.pushRoute(stack, 'pages/page6')).assertEqual(7);
      expect(model.pushRoute(stack, 'pages/page7')).assertEqual(8);
      expect(model.pushRoute(stack, 'pages/page8')).assertEqual(9);
      expect(stack.length).assertEqual(9);
      expect(model.topRoute(stack)).assertEqual('pages/page8');
      expect(model.canBack(stack)).assertEqual(true);
      expect(model.indexOfRoute(stack, 'pages/page1')).assertEqual(1);
      expect(stack.length).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate124 done');
    });
}

function NavigationStackPart063() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0685
     * @tc.name    JsNavigate125
     * @tc.desc    Push 2 routes then pop 1 seed 125
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate125', 0, async function () {
      await yieldThread();
      const stack = [];
      expect(model.pushRoute(stack, 'pages/page0')).assertEqual(1);
      expect(model.pushRoute(stack, 'pages/page1')).assertEqual(2);
      expect(stack.length).assertEqual(2);
      expect(model.topRoute(stack)).assertEqual('pages/page1');
      expect(model.canBack(stack)).assertEqual(true);
      expect(model.indexOfRoute(stack, 'pages/page1')).assertEqual(1);
      expect(model.popRoute(stack)).assertEqual('pages/page1');
      expect(stack.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate125 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0686
     * @tc.name    JsNavigate126
     * @tc.desc    Push 7 routes then pop 2 seed 126
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate126', 0, async function () {
      await yieldThread();
      const stack = [];
      expect(model.pushRoute(stack, 'pages/page0')).assertEqual(1);
      expect(model.pushRoute(stack, 'pages/page1')).assertEqual(2);
      expect(model.pushRoute(stack, 'pages/page2')).assertEqual(3);
      expect(model.pushRoute(stack, 'pages/page3')).assertEqual(4);
      expect(model.pushRoute(stack, 'pages/page4')).assertEqual(5);
      expect(model.pushRoute(stack, 'pages/page5')).assertEqual(6);
      expect(model.pushRoute(stack, 'pages/page6')).assertEqual(7);
      expect(stack.length).assertEqual(7);
      expect(model.topRoute(stack)).assertEqual('pages/page6');
      expect(model.canBack(stack)).assertEqual(true);
      expect(model.indexOfRoute(stack, 'pages/page1')).assertEqual(1);
      expect(model.popRoute(stack)).assertEqual('pages/page6');
      expect(model.popRoute(stack)).assertEqual('pages/page5');
      expect(stack.length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate126 done');
    });
}

function NavigationStackPart064() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0687
     * @tc.name    JsNavigate127
     * @tc.desc    Push 12 routes then pop 3 seed 127
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate127', 0, async function () {
      await yieldThread();
      const stack = [];
      expect(model.pushRoute(stack, 'pages/page0')).assertEqual(1);
      expect(model.pushRoute(stack, 'pages/page1')).assertEqual(2);
      expect(model.pushRoute(stack, 'pages/page2')).assertEqual(3);
      expect(model.pushRoute(stack, 'pages/page3')).assertEqual(4);
      expect(model.pushRoute(stack, 'pages/page4')).assertEqual(5);
      expect(model.pushRoute(stack, 'pages/page5')).assertEqual(6);
      expect(model.pushRoute(stack, 'pages/page6')).assertEqual(7);
      expect(model.pushRoute(stack, 'pages/page7')).assertEqual(8);
      expect(model.pushRoute(stack, 'pages/page8')).assertEqual(9);
      expect(model.pushRoute(stack, 'pages/page9')).assertEqual(10);
      expect(model.pushRoute(stack, 'pages/page10')).assertEqual(11);
      expect(model.pushRoute(stack, 'pages/page11')).assertEqual(12);
      expect(stack.length).assertEqual(12);
      expect(model.topRoute(stack)).assertEqual('pages/page11');
      expect(model.canBack(stack)).assertEqual(true);
      expect(model.indexOfRoute(stack, 'pages/page1')).assertEqual(1);
      expect(model.popRoute(stack)).assertEqual('pages/page11');
      expect(model.popRoute(stack)).assertEqual('pages/page10');
      expect(model.popRoute(stack)).assertEqual('pages/page9');
      expect(stack.length).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate127 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0688
     * @tc.name    JsNavigate128
     * @tc.desc    Push 5 routes then pop 0 seed 128
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate128', 0, async function () {
      await yieldThread();
      const stack = [];
      expect(model.pushRoute(stack, 'pages/page0')).assertEqual(1);
      expect(model.pushRoute(stack, 'pages/page1')).assertEqual(2);
      expect(model.pushRoute(stack, 'pages/page2')).assertEqual(3);
      expect(model.pushRoute(stack, 'pages/page3')).assertEqual(4);
      expect(model.pushRoute(stack, 'pages/page4')).assertEqual(5);
      expect(stack.length).assertEqual(5);
      expect(model.topRoute(stack)).assertEqual('pages/page4');
      expect(model.canBack(stack)).assertEqual(true);
      expect(model.indexOfRoute(stack, 'pages/page1')).assertEqual(1);
      expect(stack.length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate128 done');
    });
}

function NavigationStackPart065() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0689
     * @tc.name    JsNavigate129
     * @tc.desc    Push 10 routes then pop 1 seed 129
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate129', 0, async function () {
      await yieldThread();
      const stack = [];
      expect(model.pushRoute(stack, 'pages/page0')).assertEqual(1);
      expect(model.pushRoute(stack, 'pages/page1')).assertEqual(2);
      expect(model.pushRoute(stack, 'pages/page2')).assertEqual(3);
      expect(model.pushRoute(stack, 'pages/page3')).assertEqual(4);
      expect(model.pushRoute(stack, 'pages/page4')).assertEqual(5);
      expect(model.pushRoute(stack, 'pages/page5')).assertEqual(6);
      expect(model.pushRoute(stack, 'pages/page6')).assertEqual(7);
      expect(model.pushRoute(stack, 'pages/page7')).assertEqual(8);
      expect(model.pushRoute(stack, 'pages/page8')).assertEqual(9);
      expect(model.pushRoute(stack, 'pages/page9')).assertEqual(10);
      expect(stack.length).assertEqual(10);
      expect(model.topRoute(stack)).assertEqual('pages/page9');
      expect(model.canBack(stack)).assertEqual(true);
      expect(model.indexOfRoute(stack, 'pages/page1')).assertEqual(1);
      expect(model.popRoute(stack)).assertEqual('pages/page9');
      expect(stack.length).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate129 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0690
     * @tc.name    JsNavigate130
     * @tc.desc    Push 3 routes then pop 2 seed 130
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate130', 0, async function () {
      await yieldThread();
      const stack = [];
      expect(model.pushRoute(stack, 'pages/page0')).assertEqual(1);
      expect(model.pushRoute(stack, 'pages/page1')).assertEqual(2);
      expect(model.pushRoute(stack, 'pages/page2')).assertEqual(3);
      expect(stack.length).assertEqual(3);
      expect(model.topRoute(stack)).assertEqual('pages/page2');
      expect(model.canBack(stack)).assertEqual(true);
      expect(model.indexOfRoute(stack, 'pages/page1')).assertEqual(1);
      expect(model.popRoute(stack)).assertEqual('pages/page2');
      expect(model.popRoute(stack)).assertEqual('pages/page1');
      expect(stack.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate130 done');
    });
}

function NavigationStackPart066() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0691
     * @tc.name    JsNavigate131
     * @tc.desc    Push 8 routes then pop 3 seed 131
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate131', 0, async function () {
      await yieldThread();
      const stack = [];
      expect(model.pushRoute(stack, 'pages/page0')).assertEqual(1);
      expect(model.pushRoute(stack, 'pages/page1')).assertEqual(2);
      expect(model.pushRoute(stack, 'pages/page2')).assertEqual(3);
      expect(model.pushRoute(stack, 'pages/page3')).assertEqual(4);
      expect(model.pushRoute(stack, 'pages/page4')).assertEqual(5);
      expect(model.pushRoute(stack, 'pages/page5')).assertEqual(6);
      expect(model.pushRoute(stack, 'pages/page6')).assertEqual(7);
      expect(model.pushRoute(stack, 'pages/page7')).assertEqual(8);
      expect(stack.length).assertEqual(8);
      expect(model.topRoute(stack)).assertEqual('pages/page7');
      expect(model.canBack(stack)).assertEqual(true);
      expect(model.indexOfRoute(stack, 'pages/page1')).assertEqual(1);
      expect(model.popRoute(stack)).assertEqual('pages/page7');
      expect(model.popRoute(stack)).assertEqual('pages/page6');
      expect(model.popRoute(stack)).assertEqual('pages/page5');
      expect(stack.length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate131 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0692
     * @tc.name    JsNavigate132
     * @tc.desc    Push 1 routes then pop 0 seed 132
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate132', 0, async function () {
      await yieldThread();
      const stack = [];
      expect(model.pushRoute(stack, 'pages/page0')).assertEqual(1);
      expect(stack.length).assertEqual(1);
      expect(model.topRoute(stack)).assertEqual('pages/page0');
      expect(model.canBack(stack)).assertEqual(false);
      expect(model.indexOfRoute(stack, 'pages/page0')).assertEqual(0);
      expect(stack.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate132 done');
    });
}

function NavigationStackPart067() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0693
     * @tc.name    JsNavigate133
     * @tc.desc    Push 6 routes then pop 1 seed 133
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate133', 0, async function () {
      await yieldThread();
      const stack = [];
      expect(model.pushRoute(stack, 'pages/page0')).assertEqual(1);
      expect(model.pushRoute(stack, 'pages/page1')).assertEqual(2);
      expect(model.pushRoute(stack, 'pages/page2')).assertEqual(3);
      expect(model.pushRoute(stack, 'pages/page3')).assertEqual(4);
      expect(model.pushRoute(stack, 'pages/page4')).assertEqual(5);
      expect(model.pushRoute(stack, 'pages/page5')).assertEqual(6);
      expect(stack.length).assertEqual(6);
      expect(model.topRoute(stack)).assertEqual('pages/page5');
      expect(model.canBack(stack)).assertEqual(true);
      expect(model.indexOfRoute(stack, 'pages/page1')).assertEqual(1);
      expect(model.popRoute(stack)).assertEqual('pages/page5');
      expect(stack.length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate133 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0694
     * @tc.name    JsNavigate134
     * @tc.desc    Push 11 routes then pop 2 seed 134
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate134', 0, async function () {
      await yieldThread();
      const stack = [];
      expect(model.pushRoute(stack, 'pages/page0')).assertEqual(1);
      expect(model.pushRoute(stack, 'pages/page1')).assertEqual(2);
      expect(model.pushRoute(stack, 'pages/page2')).assertEqual(3);
      expect(model.pushRoute(stack, 'pages/page3')).assertEqual(4);
      expect(model.pushRoute(stack, 'pages/page4')).assertEqual(5);
      expect(model.pushRoute(stack, 'pages/page5')).assertEqual(6);
      expect(model.pushRoute(stack, 'pages/page6')).assertEqual(7);
      expect(model.pushRoute(stack, 'pages/page7')).assertEqual(8);
      expect(model.pushRoute(stack, 'pages/page8')).assertEqual(9);
      expect(model.pushRoute(stack, 'pages/page9')).assertEqual(10);
      expect(model.pushRoute(stack, 'pages/page10')).assertEqual(11);
      expect(stack.length).assertEqual(11);
      expect(model.topRoute(stack)).assertEqual('pages/page10');
      expect(model.canBack(stack)).assertEqual(true);
      expect(model.indexOfRoute(stack, 'pages/page1')).assertEqual(1);
      expect(model.popRoute(stack)).assertEqual('pages/page10');
      expect(model.popRoute(stack)).assertEqual('pages/page9');
      expect(stack.length).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate134 done');
    });
}

function NavigationStackPart068() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0695
     * @tc.name    JsNavigate135
     * @tc.desc    Push 4 routes then pop 3 seed 135
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate135', 0, async function () {
      await yieldThread();
      const stack = [];
      expect(model.pushRoute(stack, 'pages/page0')).assertEqual(1);
      expect(model.pushRoute(stack, 'pages/page1')).assertEqual(2);
      expect(model.pushRoute(stack, 'pages/page2')).assertEqual(3);
      expect(model.pushRoute(stack, 'pages/page3')).assertEqual(4);
      expect(stack.length).assertEqual(4);
      expect(model.topRoute(stack)).assertEqual('pages/page3');
      expect(model.canBack(stack)).assertEqual(true);
      expect(model.indexOfRoute(stack, 'pages/page1')).assertEqual(1);
      expect(model.popRoute(stack)).assertEqual('pages/page3');
      expect(model.popRoute(stack)).assertEqual('pages/page2');
      expect(model.popRoute(stack)).assertEqual('pages/page1');
      expect(stack.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate135 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0696
     * @tc.name    JsNavigate136
     * @tc.desc    Push 9 routes then pop 0 seed 136
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate136', 0, async function () {
      await yieldThread();
      const stack = [];
      expect(model.pushRoute(stack, 'pages/page0')).assertEqual(1);
      expect(model.pushRoute(stack, 'pages/page1')).assertEqual(2);
      expect(model.pushRoute(stack, 'pages/page2')).assertEqual(3);
      expect(model.pushRoute(stack, 'pages/page3')).assertEqual(4);
      expect(model.pushRoute(stack, 'pages/page4')).assertEqual(5);
      expect(model.pushRoute(stack, 'pages/page5')).assertEqual(6);
      expect(model.pushRoute(stack, 'pages/page6')).assertEqual(7);
      expect(model.pushRoute(stack, 'pages/page7')).assertEqual(8);
      expect(model.pushRoute(stack, 'pages/page8')).assertEqual(9);
      expect(stack.length).assertEqual(9);
      expect(model.topRoute(stack)).assertEqual('pages/page8');
      expect(model.canBack(stack)).assertEqual(true);
      expect(model.indexOfRoute(stack, 'pages/page1')).assertEqual(1);
      expect(stack.length).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate136 done');
    });
}

function NavigationStackPart069() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0697
     * @tc.name    JsNavigate137
     * @tc.desc    Push 2 routes then pop 1 seed 137
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate137', 0, async function () {
      await yieldThread();
      const stack = [];
      expect(model.pushRoute(stack, 'pages/page0')).assertEqual(1);
      expect(model.pushRoute(stack, 'pages/page1')).assertEqual(2);
      expect(stack.length).assertEqual(2);
      expect(model.topRoute(stack)).assertEqual('pages/page1');
      expect(model.canBack(stack)).assertEqual(true);
      expect(model.indexOfRoute(stack, 'pages/page1')).assertEqual(1);
      expect(model.popRoute(stack)).assertEqual('pages/page1');
      expect(stack.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate137 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0698
     * @tc.name    JsNavigate138
     * @tc.desc    Push 7 routes then pop 2 seed 138
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate138', 0, async function () {
      await yieldThread();
      const stack = [];
      expect(model.pushRoute(stack, 'pages/page0')).assertEqual(1);
      expect(model.pushRoute(stack, 'pages/page1')).assertEqual(2);
      expect(model.pushRoute(stack, 'pages/page2')).assertEqual(3);
      expect(model.pushRoute(stack, 'pages/page3')).assertEqual(4);
      expect(model.pushRoute(stack, 'pages/page4')).assertEqual(5);
      expect(model.pushRoute(stack, 'pages/page5')).assertEqual(6);
      expect(model.pushRoute(stack, 'pages/page6')).assertEqual(7);
      expect(stack.length).assertEqual(7);
      expect(model.topRoute(stack)).assertEqual('pages/page6');
      expect(model.canBack(stack)).assertEqual(true);
      expect(model.indexOfRoute(stack, 'pages/page1')).assertEqual(1);
      expect(model.popRoute(stack)).assertEqual('pages/page6');
      expect(model.popRoute(stack)).assertEqual('pages/page5');
      expect(stack.length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate138 done');
    });
}

function NavigationStackPart070() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0699
     * @tc.name    JsNavigate139
     * @tc.desc    Push 12 routes then pop 3 seed 139
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate139', 0, async function () {
      await yieldThread();
      const stack = [];
      expect(model.pushRoute(stack, 'pages/page0')).assertEqual(1);
      expect(model.pushRoute(stack, 'pages/page1')).assertEqual(2);
      expect(model.pushRoute(stack, 'pages/page2')).assertEqual(3);
      expect(model.pushRoute(stack, 'pages/page3')).assertEqual(4);
      expect(model.pushRoute(stack, 'pages/page4')).assertEqual(5);
      expect(model.pushRoute(stack, 'pages/page5')).assertEqual(6);
      expect(model.pushRoute(stack, 'pages/page6')).assertEqual(7);
      expect(model.pushRoute(stack, 'pages/page7')).assertEqual(8);
      expect(model.pushRoute(stack, 'pages/page8')).assertEqual(9);
      expect(model.pushRoute(stack, 'pages/page9')).assertEqual(10);
      expect(model.pushRoute(stack, 'pages/page10')).assertEqual(11);
      expect(model.pushRoute(stack, 'pages/page11')).assertEqual(12);
      expect(stack.length).assertEqual(12);
      expect(model.topRoute(stack)).assertEqual('pages/page11');
      expect(model.canBack(stack)).assertEqual(true);
      expect(model.indexOfRoute(stack, 'pages/page1')).assertEqual(1);
      expect(model.popRoute(stack)).assertEqual('pages/page11');
      expect(model.popRoute(stack)).assertEqual('pages/page10');
      expect(model.popRoute(stack)).assertEqual('pages/page9');
      expect(stack.length).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate139 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0700
     * @tc.name    JsNavigate140
     * @tc.desc    Push 5 routes then pop 0 seed 140
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate140', 0, async function () {
      await yieldThread();
      const stack = [];
      expect(model.pushRoute(stack, 'pages/page0')).assertEqual(1);
      expect(model.pushRoute(stack, 'pages/page1')).assertEqual(2);
      expect(model.pushRoute(stack, 'pages/page2')).assertEqual(3);
      expect(model.pushRoute(stack, 'pages/page3')).assertEqual(4);
      expect(model.pushRoute(stack, 'pages/page4')).assertEqual(5);
      expect(stack.length).assertEqual(5);
      expect(model.topRoute(stack)).assertEqual('pages/page4');
      expect(model.canBack(stack)).assertEqual(true);
      expect(model.indexOfRoute(stack, 'pages/page1')).assertEqual(1);
      expect(stack.length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate140 done');
    });
}

function NavigationStackGroup003() {
  NavigationStackPart049();
  NavigationStackPart050();
  NavigationStackPart051();
  NavigationStackPart052();
  NavigationStackPart053();
  NavigationStackPart054();
  NavigationStackPart055();
  NavigationStackPart056();
  NavigationStackPart057();
  NavigationStackPart058();
  NavigationStackPart059();
  NavigationStackPart060();
  NavigationStackPart061();
  NavigationStackPart062();
  NavigationStackPart063();
  NavigationStackPart064();
  NavigationStackPart065();
  NavigationStackPart066();
  NavigationStackPart067();
  NavigationStackPart068();
  NavigationStackPart069();
  NavigationStackPart070();
}

export function registerNavigationStackExtra2() {
  NavigationStackGroup003();
}
