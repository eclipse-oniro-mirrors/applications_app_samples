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

function NavigationStackPart001() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0561
     * @tc.name    JsNavigate001
     * @tc.desc    Push 6 routes then pop 1 seed 1
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate001', 0, async function () {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate001 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0562
     * @tc.name    JsNavigate002
     * @tc.desc    Push 11 routes then pop 2 seed 2
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate002', 0, async function () {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate002 done');
    });
}

function NavigationStackPart002() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0563
     * @tc.name    JsNavigate003
     * @tc.desc    Push 4 routes then pop 3 seed 3
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate003', 0, async function () {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate003 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0564
     * @tc.name    JsNavigate004
     * @tc.desc    Push 9 routes then pop 0 seed 4
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate004', 0, async function () {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate004 done');
    });
}

function NavigationStackPart003() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0565
     * @tc.name    JsNavigate005
     * @tc.desc    Push 2 routes then pop 1 seed 5
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate005', 0, async function () {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate005 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0566
     * @tc.name    JsNavigate006
     * @tc.desc    Push 7 routes then pop 2 seed 6
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate006', 0, async function () {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate006 done');
    });
}

function NavigationStackPart004() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0567
     * @tc.name    JsNavigate007
     * @tc.desc    Push 12 routes then pop 3 seed 7
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate007', 0, async function () {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate007 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0568
     * @tc.name    JsNavigate008
     * @tc.desc    Push 5 routes then pop 0 seed 8
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate008', 0, async function () {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate008 done');
    });
}

function NavigationStackPart005() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0569
     * @tc.name    JsNavigate009
     * @tc.desc    Push 10 routes then pop 1 seed 9
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate009', 0, async function () {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate009 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0570
     * @tc.name    JsNavigate010
     * @tc.desc    Push 3 routes then pop 2 seed 10
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate010', 0, async function () {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate010 done');
    });
}

function NavigationStackPart006() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0571
     * @tc.name    JsNavigate011
     * @tc.desc    Push 8 routes then pop 3 seed 11
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate011', 0, async function () {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate011 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0572
     * @tc.name    JsNavigate012
     * @tc.desc    Push 1 routes then pop 0 seed 12
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate012', 0, async function () {
      await yieldThread();
      const stack = [];
      expect(model.pushRoute(stack, 'pages/page0')).assertEqual(1);
      expect(stack.length).assertEqual(1);
      expect(model.topRoute(stack)).assertEqual('pages/page0');
      expect(model.canBack(stack)).assertEqual(false);
      expect(model.indexOfRoute(stack, 'pages/page0')).assertEqual(0);
      expect(stack.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate012 done');
    });
}

function NavigationStackPart007() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0573
     * @tc.name    JsNavigate013
     * @tc.desc    Push 6 routes then pop 1 seed 13
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate013', 0, async function () {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate013 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0574
     * @tc.name    JsNavigate014
     * @tc.desc    Push 11 routes then pop 2 seed 14
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate014', 0, async function () {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate014 done');
    });
}

function NavigationStackPart008() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0575
     * @tc.name    JsNavigate015
     * @tc.desc    Push 4 routes then pop 3 seed 15
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate015', 0, async function () {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate015 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0576
     * @tc.name    JsNavigate016
     * @tc.desc    Push 9 routes then pop 0 seed 16
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate016', 0, async function () {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate016 done');
    });
}

function NavigationStackPart009() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0577
     * @tc.name    JsNavigate017
     * @tc.desc    Push 2 routes then pop 1 seed 17
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate017', 0, async function () {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate017 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0578
     * @tc.name    JsNavigate018
     * @tc.desc    Push 7 routes then pop 2 seed 18
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate018', 0, async function () {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate018 done');
    });
}

function NavigationStackPart010() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0579
     * @tc.name    JsNavigate019
     * @tc.desc    Push 12 routes then pop 3 seed 19
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate019', 0, async function () {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate019 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0580
     * @tc.name    JsNavigate020
     * @tc.desc    Push 5 routes then pop 0 seed 20
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate020', 0, async function () {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate020 done');
    });
}

function NavigationStackPart011() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0581
     * @tc.name    JsNavigate021
     * @tc.desc    Push 10 routes then pop 1 seed 21
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate021', 0, async function () {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate021 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0582
     * @tc.name    JsNavigate022
     * @tc.desc    Push 3 routes then pop 2 seed 22
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate022', 0, async function () {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate022 done');
    });
}

function NavigationStackPart012() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0583
     * @tc.name    JsNavigate023
     * @tc.desc    Push 8 routes then pop 3 seed 23
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate023', 0, async function () {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate023 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0584
     * @tc.name    JsNavigate024
     * @tc.desc    Push 1 routes then pop 0 seed 24
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate024', 0, async function () {
      await yieldThread();
      const stack = [];
      expect(model.pushRoute(stack, 'pages/page0')).assertEqual(1);
      expect(stack.length).assertEqual(1);
      expect(model.topRoute(stack)).assertEqual('pages/page0');
      expect(model.canBack(stack)).assertEqual(false);
      expect(model.indexOfRoute(stack, 'pages/page0')).assertEqual(0);
      expect(stack.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate024 done');
    });
}

function NavigationStackPart013() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0585
     * @tc.name    JsNavigate025
     * @tc.desc    Push 6 routes then pop 1 seed 25
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate025', 0, async function () {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate025 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0586
     * @tc.name    JsNavigate026
     * @tc.desc    Push 11 routes then pop 2 seed 26
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate026', 0, async function () {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate026 done');
    });
}

function NavigationStackPart014() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0587
     * @tc.name    JsNavigate027
     * @tc.desc    Push 4 routes then pop 3 seed 27
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate027', 0, async function () {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate027 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0588
     * @tc.name    JsNavigate028
     * @tc.desc    Push 9 routes then pop 0 seed 28
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate028', 0, async function () {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate028 done');
    });
}

function NavigationStackPart015() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0589
     * @tc.name    JsNavigate029
     * @tc.desc    Push 2 routes then pop 1 seed 29
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate029', 0, async function () {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate029 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0590
     * @tc.name    JsNavigate030
     * @tc.desc    Push 7 routes then pop 2 seed 30
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate030', 0, async function () {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate030 done');
    });
}

function NavigationStackPart016() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0591
     * @tc.name    JsNavigate031
     * @tc.desc    Push 12 routes then pop 3 seed 31
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate031', 0, async function () {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate031 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0592
     * @tc.name    JsNavigate032
     * @tc.desc    Push 5 routes then pop 0 seed 32
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate032', 0, async function () {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate032 done');
    });
}

function NavigationStackPart017() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0593
     * @tc.name    JsNavigate033
     * @tc.desc    Push 10 routes then pop 1 seed 33
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate033', 0, async function () {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate033 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0594
     * @tc.name    JsNavigate034
     * @tc.desc    Push 3 routes then pop 2 seed 34
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate034', 0, async function () {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate034 done');
    });
}

function NavigationStackPart018() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0595
     * @tc.name    JsNavigate035
     * @tc.desc    Push 8 routes then pop 3 seed 35
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate035', 0, async function () {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate035 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0596
     * @tc.name    JsNavigate036
     * @tc.desc    Push 1 routes then pop 0 seed 36
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate036', 0, async function () {
      await yieldThread();
      const stack = [];
      expect(model.pushRoute(stack, 'pages/page0')).assertEqual(1);
      expect(stack.length).assertEqual(1);
      expect(model.topRoute(stack)).assertEqual('pages/page0');
      expect(model.canBack(stack)).assertEqual(false);
      expect(model.indexOfRoute(stack, 'pages/page0')).assertEqual(0);
      expect(stack.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate036 done');
    });
}

function NavigationStackPart019() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0597
     * @tc.name    JsNavigate037
     * @tc.desc    Push 6 routes then pop 1 seed 37
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate037', 0, async function () {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate037 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0598
     * @tc.name    JsNavigate038
     * @tc.desc    Push 11 routes then pop 2 seed 38
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate038', 0, async function () {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate038 done');
    });
}

function NavigationStackPart020() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0599
     * @tc.name    JsNavigate039
     * @tc.desc    Push 4 routes then pop 3 seed 39
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate039', 0, async function () {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate039 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0600
     * @tc.name    JsNavigate040
     * @tc.desc    Push 9 routes then pop 0 seed 40
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate040', 0, async function () {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate040 done');
    });
}

function NavigationStackPart021() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0601
     * @tc.name    JsNavigate041
     * @tc.desc    Push 2 routes then pop 1 seed 41
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate041', 0, async function () {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate041 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0602
     * @tc.name    JsNavigate042
     * @tc.desc    Push 7 routes then pop 2 seed 42
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate042', 0, async function () {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate042 done');
    });
}

function NavigationStackPart022() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0603
     * @tc.name    JsNavigate043
     * @tc.desc    Push 12 routes then pop 3 seed 43
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate043', 0, async function () {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate043 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0604
     * @tc.name    JsNavigate044
     * @tc.desc    Push 5 routes then pop 0 seed 44
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate044', 0, async function () {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate044 done');
    });
}

function NavigationStackPart023() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0605
     * @tc.name    JsNavigate045
     * @tc.desc    Push 10 routes then pop 1 seed 45
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate045', 0, async function () {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate045 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0606
     * @tc.name    JsNavigate046
     * @tc.desc    Push 3 routes then pop 2 seed 46
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate046', 0, async function () {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate046 done');
    });
}

function NavigationStackPart024() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0607
     * @tc.name    JsNavigate047
     * @tc.desc    Push 8 routes then pop 3 seed 47
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate047', 0, async function () {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate047 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0608
     * @tc.name    JsNavigate048
     * @tc.desc    Push 1 routes then pop 0 seed 48
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate048', 0, async function () {
      await yieldThread();
      const stack = [];
      expect(model.pushRoute(stack, 'pages/page0')).assertEqual(1);
      expect(stack.length).assertEqual(1);
      expect(model.topRoute(stack)).assertEqual('pages/page0');
      expect(model.canBack(stack)).assertEqual(false);
      expect(model.indexOfRoute(stack, 'pages/page0')).assertEqual(0);
      expect(stack.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate048 done');
    });
}

function NavigationStackPart025() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0609
     * @tc.name    JsNavigate049
     * @tc.desc    Push 6 routes then pop 1 seed 49
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate049', 0, async function () {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate049 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0610
     * @tc.name    JsNavigate050
     * @tc.desc    Push 11 routes then pop 2 seed 50
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate050', 0, async function () {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate050 done');
    });
}

function NavigationStackPart026() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0611
     * @tc.name    JsNavigate051
     * @tc.desc    Push 4 routes then pop 3 seed 51
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate051', 0, async function () {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate051 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0612
     * @tc.name    JsNavigate052
     * @tc.desc    Push 9 routes then pop 0 seed 52
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate052', 0, async function () {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate052 done');
    });
}

function NavigationStackPart027() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0613
     * @tc.name    JsNavigate053
     * @tc.desc    Push 2 routes then pop 1 seed 53
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate053', 0, async function () {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate053 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0614
     * @tc.name    JsNavigate054
     * @tc.desc    Push 7 routes then pop 2 seed 54
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate054', 0, async function () {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate054 done');
    });
}

function NavigationStackPart028() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0615
     * @tc.name    JsNavigate055
     * @tc.desc    Push 12 routes then pop 3 seed 55
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate055', 0, async function () {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate055 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0616
     * @tc.name    JsNavigate056
     * @tc.desc    Push 5 routes then pop 0 seed 56
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsNavigate056', 0, async function () {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsNavigate056 done');
    });
}

export default function navigationStackSuite() {
  describe('NavigationStackSuite', function () {
    NavigationStackPart001();
    NavigationStackPart002();
    NavigationStackPart003();
    NavigationStackPart004();
    NavigationStackPart005();
    NavigationStackPart006();
    NavigationStackPart007();
    NavigationStackPart008();
    NavigationStackPart009();
    NavigationStackPart010();
    NavigationStackPart011();
    NavigationStackPart012();
    NavigationStackPart013();
    NavigationStackPart014();
    NavigationStackPart015();
    NavigationStackPart016();
    NavigationStackPart017();
    NavigationStackPart018();
    NavigationStackPart019();
    NavigationStackPart020();
    NavigationStackPart021();
    NavigationStackPart022();
    NavigationStackPart023();
    NavigationStackPart024();
    NavigationStackPart025();
    NavigationStackPart026();
    NavigationStackPart027();
    NavigationStackPart028();
  });
}
