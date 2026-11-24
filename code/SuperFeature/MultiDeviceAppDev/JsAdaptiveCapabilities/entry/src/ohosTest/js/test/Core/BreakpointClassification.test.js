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

function BreakpointClassificationPart001() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0001
     * @tc.name    JsBreakpoint001
     * @tc.desc    Width 357 mapped to sm with 2 columns seed 1
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint001', 0, async function () {
      await yieldThread();
      const width = 357;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('sm');
      expect(model.columnsOf(bp)).assertEqual(2);
      expect(model.gutterOf(width)).assertEqual(12);
      expect(model.marginOf(width)).assertEqual(16);
      expect(model.fontScaleOf(bp)).assertEqual(1.0);
      expect(model.contentWidthOf(width)).assertEqual(325);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint001 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0002
     * @tc.name    JsBreakpoint002
     * @tc.desc    Width 394 mapped to sm with 2 columns seed 2
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint002', 0, async function () {
      await yieldThread();
      const width = 394;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('sm');
      expect(model.columnsOf(bp)).assertEqual(2);
      expect(model.gutterOf(width)).assertEqual(12);
      expect(model.marginOf(width)).assertEqual(16);
      expect(model.fontScaleOf(bp)).assertEqual(1.0);
      expect(model.contentWidthOf(width)).assertEqual(362);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint002 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0003
     * @tc.name    JsBreakpoint003
     * @tc.desc    Width 431 mapped to sm with 2 columns seed 3
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint003', 0, async function () {
      await yieldThread();
      const width = 431;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('sm');
      expect(model.columnsOf(bp)).assertEqual(2);
      expect(model.gutterOf(width)).assertEqual(12);
      expect(model.marginOf(width)).assertEqual(16);
      expect(model.fontScaleOf(bp)).assertEqual(1.0);
      expect(model.contentWidthOf(width)).assertEqual(399);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint003 done');
    });
}

function BreakpointClassificationPart002() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0004
     * @tc.name    JsBreakpoint004
     * @tc.desc    Width 468 mapped to sm with 2 columns seed 4
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint004', 0, async function () {
      await yieldThread();
      const width = 468;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('sm');
      expect(model.columnsOf(bp)).assertEqual(2);
      expect(model.gutterOf(width)).assertEqual(12);
      expect(model.marginOf(width)).assertEqual(16);
      expect(model.fontScaleOf(bp)).assertEqual(1.0);
      expect(model.contentWidthOf(width)).assertEqual(436);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint004 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0005
     * @tc.name    JsBreakpoint005
     * @tc.desc    Width 505 mapped to sm with 2 columns seed 5
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint005', 0, async function () {
      await yieldThread();
      const width = 505;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('sm');
      expect(model.columnsOf(bp)).assertEqual(2);
      expect(model.gutterOf(width)).assertEqual(12);
      expect(model.marginOf(width)).assertEqual(16);
      expect(model.fontScaleOf(bp)).assertEqual(1.0);
      expect(model.contentWidthOf(width)).assertEqual(473);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint005 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0006
     * @tc.name    JsBreakpoint006
     * @tc.desc    Width 542 mapped to sm with 2 columns seed 6
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint006', 0, async function () {
      await yieldThread();
      const width = 542;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('sm');
      expect(model.columnsOf(bp)).assertEqual(2);
      expect(model.gutterOf(width)).assertEqual(12);
      expect(model.marginOf(width)).assertEqual(16);
      expect(model.fontScaleOf(bp)).assertEqual(1.0);
      expect(model.contentWidthOf(width)).assertEqual(510);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint006 done');
    });
}

function BreakpointClassificationPart003() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0007
     * @tc.name    JsBreakpoint007
     * @tc.desc    Width 579 mapped to sm with 2 columns seed 7
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint007', 0, async function () {
      await yieldThread();
      const width = 579;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('sm');
      expect(model.columnsOf(bp)).assertEqual(2);
      expect(model.gutterOf(width)).assertEqual(12);
      expect(model.marginOf(width)).assertEqual(16);
      expect(model.fontScaleOf(bp)).assertEqual(1.0);
      expect(model.contentWidthOf(width)).assertEqual(547);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint007 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0008
     * @tc.name    JsBreakpoint008
     * @tc.desc    Width 616 mapped to md with 3 columns seed 8
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint008', 0, async function () {
      await yieldThread();
      const width = 616;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('md');
      expect(model.columnsOf(bp)).assertEqual(3);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.1);
      expect(model.contentWidthOf(width)).assertEqual(552);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint008 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0009
     * @tc.name    JsBreakpoint009
     * @tc.desc    Width 653 mapped to md with 3 columns seed 9
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint009', 0, async function () {
      await yieldThread();
      const width = 653;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('md');
      expect(model.columnsOf(bp)).assertEqual(3);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.1);
      expect(model.contentWidthOf(width)).assertEqual(589);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint009 done');
    });
}

function BreakpointClassificationPart004() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0010
     * @tc.name    JsBreakpoint010
     * @tc.desc    Width 690 mapped to md with 3 columns seed 10
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint010', 0, async function () {
      await yieldThread();
      const width = 690;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('md');
      expect(model.columnsOf(bp)).assertEqual(3);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.1);
      expect(model.contentWidthOf(width)).assertEqual(626);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint010 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0011
     * @tc.name    JsBreakpoint011
     * @tc.desc    Width 727 mapped to md with 3 columns seed 11
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint011', 0, async function () {
      await yieldThread();
      const width = 727;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('md');
      expect(model.columnsOf(bp)).assertEqual(3);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.1);
      expect(model.contentWidthOf(width)).assertEqual(663);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint011 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0012
     * @tc.name    JsBreakpoint012
     * @tc.desc    Width 764 mapped to md with 3 columns seed 12
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint012', 0, async function () {
      await yieldThread();
      const width = 764;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('md');
      expect(model.columnsOf(bp)).assertEqual(3);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.1);
      expect(model.contentWidthOf(width)).assertEqual(700);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint012 done');
    });
}

function BreakpointClassificationPart005() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0013
     * @tc.name    JsBreakpoint013
     * @tc.desc    Width 801 mapped to md with 3 columns seed 13
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint013', 0, async function () {
      await yieldThread();
      const width = 801;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('md');
      expect(model.columnsOf(bp)).assertEqual(3);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.1);
      expect(model.contentWidthOf(width)).assertEqual(737);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint013 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0014
     * @tc.name    JsBreakpoint014
     * @tc.desc    Width 838 mapped to md with 3 columns seed 14
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint014', 0, async function () {
      await yieldThread();
      const width = 838;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('md');
      expect(model.columnsOf(bp)).assertEqual(3);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.1);
      expect(model.contentWidthOf(width)).assertEqual(774);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint014 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0015
     * @tc.name    JsBreakpoint015
     * @tc.desc    Width 875 mapped to lg with 4 columns seed 15
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint015', 0, async function () {
      await yieldThread();
      const width = 875;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsOf(bp)).assertEqual(4);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.2);
      expect(model.contentWidthOf(width)).assertEqual(811);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint015 done');
    });
}

function BreakpointClassificationPart006() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0016
     * @tc.name    JsBreakpoint016
     * @tc.desc    Width 912 mapped to lg with 4 columns seed 16
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint016', 0, async function () {
      await yieldThread();
      const width = 912;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsOf(bp)).assertEqual(4);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.2);
      expect(model.contentWidthOf(width)).assertEqual(848);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint016 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0017
     * @tc.name    JsBreakpoint017
     * @tc.desc    Width 949 mapped to lg with 4 columns seed 17
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint017', 0, async function () {
      await yieldThread();
      const width = 949;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsOf(bp)).assertEqual(4);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.2);
      expect(model.contentWidthOf(width)).assertEqual(885);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint017 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0018
     * @tc.name    JsBreakpoint018
     * @tc.desc    Width 986 mapped to lg with 4 columns seed 18
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint018', 0, async function () {
      await yieldThread();
      const width = 986;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsOf(bp)).assertEqual(4);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.2);
      expect(model.contentWidthOf(width)).assertEqual(922);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint018 done');
    });
}

function BreakpointClassificationPart007() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0019
     * @tc.name    JsBreakpoint019
     * @tc.desc    Width 1023 mapped to lg with 4 columns seed 19
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint019', 0, async function () {
      await yieldThread();
      const width = 1023;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsOf(bp)).assertEqual(4);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.2);
      expect(model.contentWidthOf(width)).assertEqual(959);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint019 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0020
     * @tc.name    JsBreakpoint020
     * @tc.desc    Width 1060 mapped to lg with 4 columns seed 20
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint020', 0, async function () {
      await yieldThread();
      const width = 1060;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsOf(bp)).assertEqual(4);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.2);
      expect(model.contentWidthOf(width)).assertEqual(996);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint020 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0021
     * @tc.name    JsBreakpoint021
     * @tc.desc    Width 1097 mapped to lg with 4 columns seed 21
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint021', 0, async function () {
      await yieldThread();
      const width = 1097;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsOf(bp)).assertEqual(4);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.2);
      expect(model.contentWidthOf(width)).assertEqual(1033);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint021 done');
    });
}

function BreakpointClassificationPart008() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0022
     * @tc.name    JsBreakpoint022
     * @tc.desc    Width 1134 mapped to lg with 4 columns seed 22
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint022', 0, async function () {
      await yieldThread();
      const width = 1134;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsOf(bp)).assertEqual(4);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.2);
      expect(model.contentWidthOf(width)).assertEqual(1070);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint022 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0023
     * @tc.name    JsBreakpoint023
     * @tc.desc    Width 1171 mapped to lg with 4 columns seed 23
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint023', 0, async function () {
      await yieldThread();
      const width = 1171;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsOf(bp)).assertEqual(4);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.2);
      expect(model.contentWidthOf(width)).assertEqual(1107);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint023 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0024
     * @tc.name    JsBreakpoint024
     * @tc.desc    Width 1208 mapped to lg with 4 columns seed 24
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint024', 0, async function () {
      await yieldThread();
      const width = 1208;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsOf(bp)).assertEqual(4);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.2);
      expect(model.contentWidthOf(width)).assertEqual(1144);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint024 done');
    });
}

function BreakpointClassificationPart009() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0025
     * @tc.name    JsBreakpoint025
     * @tc.desc    Width 1245 mapped to lg with 4 columns seed 25
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint025', 0, async function () {
      await yieldThread();
      const width = 1245;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsOf(bp)).assertEqual(4);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.2);
      expect(model.contentWidthOf(width)).assertEqual(1181);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint025 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0026
     * @tc.name    JsBreakpoint026
     * @tc.desc    Width 1282 mapped to lg with 4 columns seed 26
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint026', 0, async function () {
      await yieldThread();
      const width = 1282;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsOf(bp)).assertEqual(4);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.2);
      expect(model.contentWidthOf(width)).assertEqual(1218);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint026 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0027
     * @tc.name    JsBreakpoint027
     * @tc.desc    Width 1319 mapped to lg with 4 columns seed 27
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint027', 0, async function () {
      await yieldThread();
      const width = 1319;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsOf(bp)).assertEqual(4);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.2);
      expect(model.contentWidthOf(width)).assertEqual(1255);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint027 done');
    });
}

function BreakpointClassificationPart010() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0028
     * @tc.name    JsBreakpoint028
     * @tc.desc    Width 1356 mapped to lg with 4 columns seed 28
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint028', 0, async function () {
      await yieldThread();
      const width = 1356;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsOf(bp)).assertEqual(4);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.2);
      expect(model.contentWidthOf(width)).assertEqual(1292);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint028 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0029
     * @tc.name    JsBreakpoint029
     * @tc.desc    Width 1393 mapped to lg with 4 columns seed 29
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint029', 0, async function () {
      await yieldThread();
      const width = 1393;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsOf(bp)).assertEqual(4);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.2);
      expect(model.contentWidthOf(width)).assertEqual(1329);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint029 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0030
     * @tc.name    JsBreakpoint030
     * @tc.desc    Width 1430 mapped to lg with 4 columns seed 30
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint030', 0, async function () {
      await yieldThread();
      const width = 1430;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsOf(bp)).assertEqual(4);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.2);
      expect(model.contentWidthOf(width)).assertEqual(1366);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint030 done');
    });
}

function BreakpointClassificationPart011() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0031
     * @tc.name    JsBreakpoint031
     * @tc.desc    Width 347 mapped to sm with 2 columns seed 31
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint031', 0, async function () {
      await yieldThread();
      const width = 347;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('sm');
      expect(model.columnsOf(bp)).assertEqual(2);
      expect(model.gutterOf(width)).assertEqual(12);
      expect(model.marginOf(width)).assertEqual(16);
      expect(model.fontScaleOf(bp)).assertEqual(1.0);
      expect(model.contentWidthOf(width)).assertEqual(315);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint031 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0032
     * @tc.name    JsBreakpoint032
     * @tc.desc    Width 384 mapped to sm with 2 columns seed 32
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint032', 0, async function () {
      await yieldThread();
      const width = 384;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('sm');
      expect(model.columnsOf(bp)).assertEqual(2);
      expect(model.gutterOf(width)).assertEqual(12);
      expect(model.marginOf(width)).assertEqual(16);
      expect(model.fontScaleOf(bp)).assertEqual(1.0);
      expect(model.contentWidthOf(width)).assertEqual(352);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint032 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0033
     * @tc.name    JsBreakpoint033
     * @tc.desc    Width 421 mapped to sm with 2 columns seed 33
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint033', 0, async function () {
      await yieldThread();
      const width = 421;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('sm');
      expect(model.columnsOf(bp)).assertEqual(2);
      expect(model.gutterOf(width)).assertEqual(12);
      expect(model.marginOf(width)).assertEqual(16);
      expect(model.fontScaleOf(bp)).assertEqual(1.0);
      expect(model.contentWidthOf(width)).assertEqual(389);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint033 done');
    });
}

function BreakpointClassificationPart012() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0034
     * @tc.name    JsBreakpoint034
     * @tc.desc    Width 458 mapped to sm with 2 columns seed 34
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint034', 0, async function () {
      await yieldThread();
      const width = 458;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('sm');
      expect(model.columnsOf(bp)).assertEqual(2);
      expect(model.gutterOf(width)).assertEqual(12);
      expect(model.marginOf(width)).assertEqual(16);
      expect(model.fontScaleOf(bp)).assertEqual(1.0);
      expect(model.contentWidthOf(width)).assertEqual(426);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint034 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0035
     * @tc.name    JsBreakpoint035
     * @tc.desc    Width 495 mapped to sm with 2 columns seed 35
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint035', 0, async function () {
      await yieldThread();
      const width = 495;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('sm');
      expect(model.columnsOf(bp)).assertEqual(2);
      expect(model.gutterOf(width)).assertEqual(12);
      expect(model.marginOf(width)).assertEqual(16);
      expect(model.fontScaleOf(bp)).assertEqual(1.0);
      expect(model.contentWidthOf(width)).assertEqual(463);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint035 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0036
     * @tc.name    JsBreakpoint036
     * @tc.desc    Width 532 mapped to sm with 2 columns seed 36
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint036', 0, async function () {
      await yieldThread();
      const width = 532;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('sm');
      expect(model.columnsOf(bp)).assertEqual(2);
      expect(model.gutterOf(width)).assertEqual(12);
      expect(model.marginOf(width)).assertEqual(16);
      expect(model.fontScaleOf(bp)).assertEqual(1.0);
      expect(model.contentWidthOf(width)).assertEqual(500);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint036 done');
    });
}

function BreakpointClassificationPart013() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0037
     * @tc.name    JsBreakpoint037
     * @tc.desc    Width 569 mapped to sm with 2 columns seed 37
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint037', 0, async function () {
      await yieldThread();
      const width = 569;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('sm');
      expect(model.columnsOf(bp)).assertEqual(2);
      expect(model.gutterOf(width)).assertEqual(12);
      expect(model.marginOf(width)).assertEqual(16);
      expect(model.fontScaleOf(bp)).assertEqual(1.0);
      expect(model.contentWidthOf(width)).assertEqual(537);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint037 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0038
     * @tc.name    JsBreakpoint038
     * @tc.desc    Width 606 mapped to md with 3 columns seed 38
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint038', 0, async function () {
      await yieldThread();
      const width = 606;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('md');
      expect(model.columnsOf(bp)).assertEqual(3);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.1);
      expect(model.contentWidthOf(width)).assertEqual(542);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint038 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0039
     * @tc.name    JsBreakpoint039
     * @tc.desc    Width 643 mapped to md with 3 columns seed 39
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint039', 0, async function () {
      await yieldThread();
      const width = 643;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('md');
      expect(model.columnsOf(bp)).assertEqual(3);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.1);
      expect(model.contentWidthOf(width)).assertEqual(579);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint039 done');
    });
}

function BreakpointClassificationPart014() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0040
     * @tc.name    JsBreakpoint040
     * @tc.desc    Width 680 mapped to md with 3 columns seed 40
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint040', 0, async function () {
      await yieldThread();
      const width = 680;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('md');
      expect(model.columnsOf(bp)).assertEqual(3);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.1);
      expect(model.contentWidthOf(width)).assertEqual(616);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint040 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0041
     * @tc.name    JsBreakpoint041
     * @tc.desc    Width 717 mapped to md with 3 columns seed 41
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint041', 0, async function () {
      await yieldThread();
      const width = 717;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('md');
      expect(model.columnsOf(bp)).assertEqual(3);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.1);
      expect(model.contentWidthOf(width)).assertEqual(653);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint041 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0042
     * @tc.name    JsBreakpoint042
     * @tc.desc    Width 754 mapped to md with 3 columns seed 42
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint042', 0, async function () {
      await yieldThread();
      const width = 754;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('md');
      expect(model.columnsOf(bp)).assertEqual(3);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.1);
      expect(model.contentWidthOf(width)).assertEqual(690);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint042 done');
    });
}

function BreakpointClassificationPart015() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0043
     * @tc.name    JsBreakpoint043
     * @tc.desc    Width 791 mapped to md with 3 columns seed 43
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint043', 0, async function () {
      await yieldThread();
      const width = 791;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('md');
      expect(model.columnsOf(bp)).assertEqual(3);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.1);
      expect(model.contentWidthOf(width)).assertEqual(727);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint043 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0044
     * @tc.name    JsBreakpoint044
     * @tc.desc    Width 828 mapped to md with 3 columns seed 44
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint044', 0, async function () {
      await yieldThread();
      const width = 828;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('md');
      expect(model.columnsOf(bp)).assertEqual(3);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.1);
      expect(model.contentWidthOf(width)).assertEqual(764);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint044 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0045
     * @tc.name    JsBreakpoint045
     * @tc.desc    Width 865 mapped to lg with 4 columns seed 45
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint045', 0, async function () {
      await yieldThread();
      const width = 865;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsOf(bp)).assertEqual(4);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.2);
      expect(model.contentWidthOf(width)).assertEqual(801);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint045 done');
    });
}

function BreakpointClassificationPart016() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0046
     * @tc.name    JsBreakpoint046
     * @tc.desc    Width 902 mapped to lg with 4 columns seed 46
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint046', 0, async function () {
      await yieldThread();
      const width = 902;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsOf(bp)).assertEqual(4);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.2);
      expect(model.contentWidthOf(width)).assertEqual(838);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint046 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0047
     * @tc.name    JsBreakpoint047
     * @tc.desc    Width 939 mapped to lg with 4 columns seed 47
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint047', 0, async function () {
      await yieldThread();
      const width = 939;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsOf(bp)).assertEqual(4);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.2);
      expect(model.contentWidthOf(width)).assertEqual(875);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint047 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0048
     * @tc.name    JsBreakpoint048
     * @tc.desc    Width 976 mapped to lg with 4 columns seed 48
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint048', 0, async function () {
      await yieldThread();
      const width = 976;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsOf(bp)).assertEqual(4);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.2);
      expect(model.contentWidthOf(width)).assertEqual(912);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint048 done');
    });
}

function BreakpointClassificationPart017() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0049
     * @tc.name    JsBreakpoint049
     * @tc.desc    Width 1013 mapped to lg with 4 columns seed 49
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint049', 0, async function () {
      await yieldThread();
      const width = 1013;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsOf(bp)).assertEqual(4);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.2);
      expect(model.contentWidthOf(width)).assertEqual(949);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint049 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0050
     * @tc.name    JsBreakpoint050
     * @tc.desc    Width 1050 mapped to lg with 4 columns seed 50
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint050', 0, async function () {
      await yieldThread();
      const width = 1050;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsOf(bp)).assertEqual(4);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.2);
      expect(model.contentWidthOf(width)).assertEqual(986);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint050 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0051
     * @tc.name    JsBreakpoint051
     * @tc.desc    Width 1087 mapped to lg with 4 columns seed 51
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint051', 0, async function () {
      await yieldThread();
      const width = 1087;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsOf(bp)).assertEqual(4);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.2);
      expect(model.contentWidthOf(width)).assertEqual(1023);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint051 done');
    });
}

function BreakpointClassificationPart018() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0052
     * @tc.name    JsBreakpoint052
     * @tc.desc    Width 1124 mapped to lg with 4 columns seed 52
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint052', 0, async function () {
      await yieldThread();
      const width = 1124;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsOf(bp)).assertEqual(4);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.2);
      expect(model.contentWidthOf(width)).assertEqual(1060);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint052 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0053
     * @tc.name    JsBreakpoint053
     * @tc.desc    Width 1161 mapped to lg with 4 columns seed 53
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint053', 0, async function () {
      await yieldThread();
      const width = 1161;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsOf(bp)).assertEqual(4);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.2);
      expect(model.contentWidthOf(width)).assertEqual(1097);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint053 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0054
     * @tc.name    JsBreakpoint054
     * @tc.desc    Width 1198 mapped to lg with 4 columns seed 54
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint054', 0, async function () {
      await yieldThread();
      const width = 1198;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsOf(bp)).assertEqual(4);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.2);
      expect(model.contentWidthOf(width)).assertEqual(1134);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint054 done');
    });
}

function BreakpointClassificationPart019() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0055
     * @tc.name    JsBreakpoint055
     * @tc.desc    Width 1235 mapped to lg with 4 columns seed 55
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint055', 0, async function () {
      await yieldThread();
      const width = 1235;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsOf(bp)).assertEqual(4);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.2);
      expect(model.contentWidthOf(width)).assertEqual(1171);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint055 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0056
     * @tc.name    JsBreakpoint056
     * @tc.desc    Width 1272 mapped to lg with 4 columns seed 56
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint056', 0, async function () {
      await yieldThread();
      const width = 1272;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsOf(bp)).assertEqual(4);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.2);
      expect(model.contentWidthOf(width)).assertEqual(1208);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint056 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0057
     * @tc.name    JsBreakpoint057
     * @tc.desc    Width 1309 mapped to lg with 4 columns seed 57
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint057', 0, async function () {
      await yieldThread();
      const width = 1309;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsOf(bp)).assertEqual(4);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.2);
      expect(model.contentWidthOf(width)).assertEqual(1245);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint057 done');
    });
}

function BreakpointClassificationPart020() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0058
     * @tc.name    JsBreakpoint058
     * @tc.desc    Width 1346 mapped to lg with 4 columns seed 58
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint058', 0, async function () {
      await yieldThread();
      const width = 1346;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsOf(bp)).assertEqual(4);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.2);
      expect(model.contentWidthOf(width)).assertEqual(1282);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint058 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0059
     * @tc.name    JsBreakpoint059
     * @tc.desc    Width 1383 mapped to lg with 4 columns seed 59
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint059', 0, async function () {
      await yieldThread();
      const width = 1383;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsOf(bp)).assertEqual(4);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.2);
      expect(model.contentWidthOf(width)).assertEqual(1319);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint059 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0060
     * @tc.name    JsBreakpoint060
     * @tc.desc    Width 1420 mapped to lg with 4 columns seed 60
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint060', 0, async function () {
      await yieldThread();
      const width = 1420;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsOf(bp)).assertEqual(4);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.2);
      expect(model.contentWidthOf(width)).assertEqual(1356);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint060 done');
    });
}

function BreakpointClassificationPart021() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0061
     * @tc.name    JsBreakpoint061
     * @tc.desc    Width 337 mapped to sm with 2 columns seed 61
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint061', 0, async function () {
      await yieldThread();
      const width = 337;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('sm');
      expect(model.columnsOf(bp)).assertEqual(2);
      expect(model.gutterOf(width)).assertEqual(12);
      expect(model.marginOf(width)).assertEqual(16);
      expect(model.fontScaleOf(bp)).assertEqual(1.0);
      expect(model.contentWidthOf(width)).assertEqual(305);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint061 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0062
     * @tc.name    JsBreakpoint062
     * @tc.desc    Width 374 mapped to sm with 2 columns seed 62
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint062', 0, async function () {
      await yieldThread();
      const width = 374;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('sm');
      expect(model.columnsOf(bp)).assertEqual(2);
      expect(model.gutterOf(width)).assertEqual(12);
      expect(model.marginOf(width)).assertEqual(16);
      expect(model.fontScaleOf(bp)).assertEqual(1.0);
      expect(model.contentWidthOf(width)).assertEqual(342);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint062 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0063
     * @tc.name    JsBreakpoint063
     * @tc.desc    Width 411 mapped to sm with 2 columns seed 63
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint063', 0, async function () {
      await yieldThread();
      const width = 411;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('sm');
      expect(model.columnsOf(bp)).assertEqual(2);
      expect(model.gutterOf(width)).assertEqual(12);
      expect(model.marginOf(width)).assertEqual(16);
      expect(model.fontScaleOf(bp)).assertEqual(1.0);
      expect(model.contentWidthOf(width)).assertEqual(379);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint063 done');
    });
}

function BreakpointClassificationPart022() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0064
     * @tc.name    JsBreakpoint064
     * @tc.desc    Width 448 mapped to sm with 2 columns seed 64
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint064', 0, async function () {
      await yieldThread();
      const width = 448;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('sm');
      expect(model.columnsOf(bp)).assertEqual(2);
      expect(model.gutterOf(width)).assertEqual(12);
      expect(model.marginOf(width)).assertEqual(16);
      expect(model.fontScaleOf(bp)).assertEqual(1.0);
      expect(model.contentWidthOf(width)).assertEqual(416);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint064 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0065
     * @tc.name    JsBreakpoint065
     * @tc.desc    Width 485 mapped to sm with 2 columns seed 65
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint065', 0, async function () {
      await yieldThread();
      const width = 485;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('sm');
      expect(model.columnsOf(bp)).assertEqual(2);
      expect(model.gutterOf(width)).assertEqual(12);
      expect(model.marginOf(width)).assertEqual(16);
      expect(model.fontScaleOf(bp)).assertEqual(1.0);
      expect(model.contentWidthOf(width)).assertEqual(453);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint065 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0066
     * @tc.name    JsBreakpoint066
     * @tc.desc    Width 522 mapped to sm with 2 columns seed 66
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint066', 0, async function () {
      await yieldThread();
      const width = 522;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('sm');
      expect(model.columnsOf(bp)).assertEqual(2);
      expect(model.gutterOf(width)).assertEqual(12);
      expect(model.marginOf(width)).assertEqual(16);
      expect(model.fontScaleOf(bp)).assertEqual(1.0);
      expect(model.contentWidthOf(width)).assertEqual(490);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint066 done');
    });
}

function BreakpointClassificationPart023() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0067
     * @tc.name    JsBreakpoint067
     * @tc.desc    Width 559 mapped to sm with 2 columns seed 67
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint067', 0, async function () {
      await yieldThread();
      const width = 559;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('sm');
      expect(model.columnsOf(bp)).assertEqual(2);
      expect(model.gutterOf(width)).assertEqual(12);
      expect(model.marginOf(width)).assertEqual(16);
      expect(model.fontScaleOf(bp)).assertEqual(1.0);
      expect(model.contentWidthOf(width)).assertEqual(527);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint067 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0068
     * @tc.name    JsBreakpoint068
     * @tc.desc    Width 596 mapped to sm with 2 columns seed 68
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint068', 0, async function () {
      await yieldThread();
      const width = 596;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('sm');
      expect(model.columnsOf(bp)).assertEqual(2);
      expect(model.gutterOf(width)).assertEqual(12);
      expect(model.marginOf(width)).assertEqual(16);
      expect(model.fontScaleOf(bp)).assertEqual(1.0);
      expect(model.contentWidthOf(width)).assertEqual(564);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint068 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0069
     * @tc.name    JsBreakpoint069
     * @tc.desc    Width 633 mapped to md with 3 columns seed 69
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint069', 0, async function () {
      await yieldThread();
      const width = 633;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('md');
      expect(model.columnsOf(bp)).assertEqual(3);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.1);
      expect(model.contentWidthOf(width)).assertEqual(569);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint069 done');
    });
}

function BreakpointClassificationPart024() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0070
     * @tc.name    JsBreakpoint070
     * @tc.desc    Width 670 mapped to md with 3 columns seed 70
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint070', 0, async function () {
      await yieldThread();
      const width = 670;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('md');
      expect(model.columnsOf(bp)).assertEqual(3);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.1);
      expect(model.contentWidthOf(width)).assertEqual(606);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint070 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0071
     * @tc.name    JsBreakpoint071
     * @tc.desc    Width 707 mapped to md with 3 columns seed 71
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint071', 0, async function () {
      await yieldThread();
      const width = 707;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('md');
      expect(model.columnsOf(bp)).assertEqual(3);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.1);
      expect(model.contentWidthOf(width)).assertEqual(643);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint071 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0072
     * @tc.name    JsBreakpoint072
     * @tc.desc    Width 744 mapped to md with 3 columns seed 72
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint072', 0, async function () {
      await yieldThread();
      const width = 744;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('md');
      expect(model.columnsOf(bp)).assertEqual(3);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.1);
      expect(model.contentWidthOf(width)).assertEqual(680);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint072 done');
    });
}

function BreakpointClassificationPart025() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0073
     * @tc.name    JsBreakpoint073
     * @tc.desc    Width 781 mapped to md with 3 columns seed 73
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint073', 0, async function () {
      await yieldThread();
      const width = 781;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('md');
      expect(model.columnsOf(bp)).assertEqual(3);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.1);
      expect(model.contentWidthOf(width)).assertEqual(717);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint073 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0074
     * @tc.name    JsBreakpoint074
     * @tc.desc    Width 818 mapped to md with 3 columns seed 74
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint074', 0, async function () {
      await yieldThread();
      const width = 818;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('md');
      expect(model.columnsOf(bp)).assertEqual(3);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.1);
      expect(model.contentWidthOf(width)).assertEqual(754);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint074 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0075
     * @tc.name    JsBreakpoint075
     * @tc.desc    Width 855 mapped to lg with 4 columns seed 75
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint075', 0, async function () {
      await yieldThread();
      const width = 855;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsOf(bp)).assertEqual(4);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.2);
      expect(model.contentWidthOf(width)).assertEqual(791);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint075 done');
    });
}

function BreakpointClassificationPart026() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0076
     * @tc.name    JsBreakpoint076
     * @tc.desc    Width 892 mapped to lg with 4 columns seed 76
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint076', 0, async function () {
      await yieldThread();
      const width = 892;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsOf(bp)).assertEqual(4);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.2);
      expect(model.contentWidthOf(width)).assertEqual(828);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint076 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0077
     * @tc.name    JsBreakpoint077
     * @tc.desc    Width 929 mapped to lg with 4 columns seed 77
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint077', 0, async function () {
      await yieldThread();
      const width = 929;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsOf(bp)).assertEqual(4);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.2);
      expect(model.contentWidthOf(width)).assertEqual(865);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint077 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0078
     * @tc.name    JsBreakpoint078
     * @tc.desc    Width 966 mapped to lg with 4 columns seed 78
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint078', 0, async function () {
      await yieldThread();
      const width = 966;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsOf(bp)).assertEqual(4);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.2);
      expect(model.contentWidthOf(width)).assertEqual(902);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint078 done');
    });
}

function BreakpointClassificationPart027() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0079
     * @tc.name    JsBreakpoint079
     * @tc.desc    Width 1003 mapped to lg with 4 columns seed 79
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint079', 0, async function () {
      await yieldThread();
      const width = 1003;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsOf(bp)).assertEqual(4);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.2);
      expect(model.contentWidthOf(width)).assertEqual(939);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint079 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0080
     * @tc.name    JsBreakpoint080
     * @tc.desc    Width 1040 mapped to lg with 4 columns seed 80
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint080', 0, async function () {
      await yieldThread();
      const width = 1040;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsOf(bp)).assertEqual(4);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.2);
      expect(model.contentWidthOf(width)).assertEqual(976);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint080 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0081
     * @tc.name    JsBreakpoint081
     * @tc.desc    Width 1077 mapped to lg with 4 columns seed 81
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint081', 0, async function () {
      await yieldThread();
      const width = 1077;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsOf(bp)).assertEqual(4);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.2);
      expect(model.contentWidthOf(width)).assertEqual(1013);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint081 done');
    });
}

function BreakpointClassificationPart028() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0082
     * @tc.name    JsBreakpoint082
     * @tc.desc    Width 1114 mapped to lg with 4 columns seed 82
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint082', 0, async function () {
      await yieldThread();
      const width = 1114;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsOf(bp)).assertEqual(4);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.2);
      expect(model.contentWidthOf(width)).assertEqual(1050);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint082 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0083
     * @tc.name    JsBreakpoint083
     * @tc.desc    Width 1151 mapped to lg with 4 columns seed 83
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint083', 0, async function () {
      await yieldThread();
      const width = 1151;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsOf(bp)).assertEqual(4);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.2);
      expect(model.contentWidthOf(width)).assertEqual(1087);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint083 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0084
     * @tc.name    JsBreakpoint084
     * @tc.desc    Width 1188 mapped to lg with 4 columns seed 84
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint084', 0, async function () {
      await yieldThread();
      const width = 1188;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsOf(bp)).assertEqual(4);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.2);
      expect(model.contentWidthOf(width)).assertEqual(1124);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint084 done');
    });
}

function BreakpointClassificationPart029() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0085
     * @tc.name    JsBreakpoint085
     * @tc.desc    Width 1225 mapped to lg with 4 columns seed 85
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint085', 0, async function () {
      await yieldThread();
      const width = 1225;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsOf(bp)).assertEqual(4);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.2);
      expect(model.contentWidthOf(width)).assertEqual(1161);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint085 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0086
     * @tc.name    JsBreakpoint086
     * @tc.desc    Width 1262 mapped to lg with 4 columns seed 86
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint086', 0, async function () {
      await yieldThread();
      const width = 1262;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsOf(bp)).assertEqual(4);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.2);
      expect(model.contentWidthOf(width)).assertEqual(1198);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint086 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0087
     * @tc.name    JsBreakpoint087
     * @tc.desc    Width 1299 mapped to lg with 4 columns seed 87
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint087', 0, async function () {
      await yieldThread();
      const width = 1299;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsOf(bp)).assertEqual(4);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.2);
      expect(model.contentWidthOf(width)).assertEqual(1235);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint087 done');
    });
}

function BreakpointClassificationPart030() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0088
     * @tc.name    JsBreakpoint088
     * @tc.desc    Width 1336 mapped to lg with 4 columns seed 88
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint088', 0, async function () {
      await yieldThread();
      const width = 1336;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsOf(bp)).assertEqual(4);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.2);
      expect(model.contentWidthOf(width)).assertEqual(1272);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint088 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0089
     * @tc.name    JsBreakpoint089
     * @tc.desc    Width 1373 mapped to lg with 4 columns seed 89
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint089', 0, async function () {
      await yieldThread();
      const width = 1373;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsOf(bp)).assertEqual(4);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.2);
      expect(model.contentWidthOf(width)).assertEqual(1309);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint089 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0090
     * @tc.name    JsBreakpoint090
     * @tc.desc    Width 1410 mapped to lg with 4 columns seed 90
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint090', 0, async function () {
      await yieldThread();
      const width = 1410;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsOf(bp)).assertEqual(4);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.2);
      expect(model.contentWidthOf(width)).assertEqual(1346);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint090 done');
    });
}

function BreakpointClassificationPart031() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0091
     * @tc.name    JsBreakpoint091
     * @tc.desc    Width 327 mapped to sm with 2 columns seed 91
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint091', 0, async function () {
      await yieldThread();
      const width = 327;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('sm');
      expect(model.columnsOf(bp)).assertEqual(2);
      expect(model.gutterOf(width)).assertEqual(12);
      expect(model.marginOf(width)).assertEqual(16);
      expect(model.fontScaleOf(bp)).assertEqual(1.0);
      expect(model.contentWidthOf(width)).assertEqual(295);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint091 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0092
     * @tc.name    JsBreakpoint092
     * @tc.desc    Width 364 mapped to sm with 2 columns seed 92
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint092', 0, async function () {
      await yieldThread();
      const width = 364;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('sm');
      expect(model.columnsOf(bp)).assertEqual(2);
      expect(model.gutterOf(width)).assertEqual(12);
      expect(model.marginOf(width)).assertEqual(16);
      expect(model.fontScaleOf(bp)).assertEqual(1.0);
      expect(model.contentWidthOf(width)).assertEqual(332);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint092 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0093
     * @tc.name    JsBreakpoint093
     * @tc.desc    Width 401 mapped to sm with 2 columns seed 93
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint093', 0, async function () {
      await yieldThread();
      const width = 401;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('sm');
      expect(model.columnsOf(bp)).assertEqual(2);
      expect(model.gutterOf(width)).assertEqual(12);
      expect(model.marginOf(width)).assertEqual(16);
      expect(model.fontScaleOf(bp)).assertEqual(1.0);
      expect(model.contentWidthOf(width)).assertEqual(369);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint093 done');
    });
}

function BreakpointClassificationPart032() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0094
     * @tc.name    JsBreakpoint094
     * @tc.desc    Width 438 mapped to sm with 2 columns seed 94
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint094', 0, async function () {
      await yieldThread();
      const width = 438;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('sm');
      expect(model.columnsOf(bp)).assertEqual(2);
      expect(model.gutterOf(width)).assertEqual(12);
      expect(model.marginOf(width)).assertEqual(16);
      expect(model.fontScaleOf(bp)).assertEqual(1.0);
      expect(model.contentWidthOf(width)).assertEqual(406);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint094 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0095
     * @tc.name    JsBreakpoint095
     * @tc.desc    Width 475 mapped to sm with 2 columns seed 95
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint095', 0, async function () {
      await yieldThread();
      const width = 475;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('sm');
      expect(model.columnsOf(bp)).assertEqual(2);
      expect(model.gutterOf(width)).assertEqual(12);
      expect(model.marginOf(width)).assertEqual(16);
      expect(model.fontScaleOf(bp)).assertEqual(1.0);
      expect(model.contentWidthOf(width)).assertEqual(443);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint095 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0096
     * @tc.name    JsBreakpoint096
     * @tc.desc    Width 512 mapped to sm with 2 columns seed 96
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint096', 0, async function () {
      await yieldThread();
      const width = 512;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('sm');
      expect(model.columnsOf(bp)).assertEqual(2);
      expect(model.gutterOf(width)).assertEqual(12);
      expect(model.marginOf(width)).assertEqual(16);
      expect(model.fontScaleOf(bp)).assertEqual(1.0);
      expect(model.contentWidthOf(width)).assertEqual(480);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint096 done');
    });
}

function BreakpointClassificationPart033() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0097
     * @tc.name    JsBreakpoint097
     * @tc.desc    Width 549 mapped to sm with 2 columns seed 97
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint097', 0, async function () {
      await yieldThread();
      const width = 549;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('sm');
      expect(model.columnsOf(bp)).assertEqual(2);
      expect(model.gutterOf(width)).assertEqual(12);
      expect(model.marginOf(width)).assertEqual(16);
      expect(model.fontScaleOf(bp)).assertEqual(1.0);
      expect(model.contentWidthOf(width)).assertEqual(517);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint097 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0098
     * @tc.name    JsBreakpoint098
     * @tc.desc    Width 586 mapped to sm with 2 columns seed 98
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint098', 0, async function () {
      await yieldThread();
      const width = 586;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('sm');
      expect(model.columnsOf(bp)).assertEqual(2);
      expect(model.gutterOf(width)).assertEqual(12);
      expect(model.marginOf(width)).assertEqual(16);
      expect(model.fontScaleOf(bp)).assertEqual(1.0);
      expect(model.contentWidthOf(width)).assertEqual(554);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint098 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0099
     * @tc.name    JsBreakpoint099
     * @tc.desc    Width 623 mapped to md with 3 columns seed 99
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint099', 0, async function () {
      await yieldThread();
      const width = 623;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('md');
      expect(model.columnsOf(bp)).assertEqual(3);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.1);
      expect(model.contentWidthOf(width)).assertEqual(559);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint099 done');
    });
}

function BreakpointClassificationPart034() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0100
     * @tc.name    JsBreakpoint100
     * @tc.desc    Width 660 mapped to md with 3 columns seed 100
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint100', 0, async function () {
      await yieldThread();
      const width = 660;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('md');
      expect(model.columnsOf(bp)).assertEqual(3);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.1);
      expect(model.contentWidthOf(width)).assertEqual(596);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint100 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0101
     * @tc.name    JsBreakpoint101
     * @tc.desc    Width 697 mapped to md with 3 columns seed 101
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint101', 0, async function () {
      await yieldThread();
      const width = 697;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('md');
      expect(model.columnsOf(bp)).assertEqual(3);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.1);
      expect(model.contentWidthOf(width)).assertEqual(633);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint101 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0102
     * @tc.name    JsBreakpoint102
     * @tc.desc    Width 734 mapped to md with 3 columns seed 102
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint102', 0, async function () {
      await yieldThread();
      const width = 734;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('md');
      expect(model.columnsOf(bp)).assertEqual(3);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.1);
      expect(model.contentWidthOf(width)).assertEqual(670);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint102 done');
    });
}

function BreakpointClassificationPart035() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0103
     * @tc.name    JsBreakpoint103
     * @tc.desc    Width 771 mapped to md with 3 columns seed 103
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint103', 0, async function () {
      await yieldThread();
      const width = 771;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('md');
      expect(model.columnsOf(bp)).assertEqual(3);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.1);
      expect(model.contentWidthOf(width)).assertEqual(707);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint103 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0104
     * @tc.name    JsBreakpoint104
     * @tc.desc    Width 808 mapped to md with 3 columns seed 104
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint104', 0, async function () {
      await yieldThread();
      const width = 808;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('md');
      expect(model.columnsOf(bp)).assertEqual(3);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.1);
      expect(model.contentWidthOf(width)).assertEqual(744);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint104 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0105
     * @tc.name    JsBreakpoint105
     * @tc.desc    Width 845 mapped to lg with 4 columns seed 105
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint105', 0, async function () {
      await yieldThread();
      const width = 845;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsOf(bp)).assertEqual(4);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.2);
      expect(model.contentWidthOf(width)).assertEqual(781);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint105 done');
    });
}

function BreakpointClassificationPart036() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0106
     * @tc.name    JsBreakpoint106
     * @tc.desc    Width 882 mapped to lg with 4 columns seed 106
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint106', 0, async function () {
      await yieldThread();
      const width = 882;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsOf(bp)).assertEqual(4);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.2);
      expect(model.contentWidthOf(width)).assertEqual(818);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint106 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0107
     * @tc.name    JsBreakpoint107
     * @tc.desc    Width 919 mapped to lg with 4 columns seed 107
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint107', 0, async function () {
      await yieldThread();
      const width = 919;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsOf(bp)).assertEqual(4);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.2);
      expect(model.contentWidthOf(width)).assertEqual(855);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint107 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0108
     * @tc.name    JsBreakpoint108
     * @tc.desc    Width 956 mapped to lg with 4 columns seed 108
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint108', 0, async function () {
      await yieldThread();
      const width = 956;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsOf(bp)).assertEqual(4);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.2);
      expect(model.contentWidthOf(width)).assertEqual(892);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint108 done');
    });
}

function BreakpointClassificationPart037() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0109
     * @tc.name    JsBreakpoint109
     * @tc.desc    Width 993 mapped to lg with 4 columns seed 109
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint109', 0, async function () {
      await yieldThread();
      const width = 993;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsOf(bp)).assertEqual(4);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.2);
      expect(model.contentWidthOf(width)).assertEqual(929);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint109 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0110
     * @tc.name    JsBreakpoint110
     * @tc.desc    Width 1030 mapped to lg with 4 columns seed 110
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint110', 0, async function () {
      await yieldThread();
      const width = 1030;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsOf(bp)).assertEqual(4);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.2);
      expect(model.contentWidthOf(width)).assertEqual(966);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint110 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0111
     * @tc.name    JsBreakpoint111
     * @tc.desc    Width 1067 mapped to lg with 4 columns seed 111
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint111', 0, async function () {
      await yieldThread();
      const width = 1067;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsOf(bp)).assertEqual(4);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.2);
      expect(model.contentWidthOf(width)).assertEqual(1003);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint111 done');
    });
}

function BreakpointClassificationPart038() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0112
     * @tc.name    JsBreakpoint112
     * @tc.desc    Width 1104 mapped to lg with 4 columns seed 112
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint112', 0, async function () {
      await yieldThread();
      const width = 1104;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsOf(bp)).assertEqual(4);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.2);
      expect(model.contentWidthOf(width)).assertEqual(1040);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint112 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0113
     * @tc.name    JsBreakpoint113
     * @tc.desc    Width 1141 mapped to lg with 4 columns seed 113
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint113', 0, async function () {
      await yieldThread();
      const width = 1141;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsOf(bp)).assertEqual(4);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.2);
      expect(model.contentWidthOf(width)).assertEqual(1077);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint113 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0114
     * @tc.name    JsBreakpoint114
     * @tc.desc    Width 1178 mapped to lg with 4 columns seed 114
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint114', 0, async function () {
      await yieldThread();
      const width = 1178;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsOf(bp)).assertEqual(4);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.2);
      expect(model.contentWidthOf(width)).assertEqual(1114);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint114 done');
    });
}

function BreakpointClassificationPart039() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0115
     * @tc.name    JsBreakpoint115
     * @tc.desc    Width 1215 mapped to lg with 4 columns seed 115
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint115', 0, async function () {
      await yieldThread();
      const width = 1215;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsOf(bp)).assertEqual(4);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.2);
      expect(model.contentWidthOf(width)).assertEqual(1151);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint115 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0116
     * @tc.name    JsBreakpoint116
     * @tc.desc    Width 1252 mapped to lg with 4 columns seed 116
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint116', 0, async function () {
      await yieldThread();
      const width = 1252;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsOf(bp)).assertEqual(4);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.2);
      expect(model.contentWidthOf(width)).assertEqual(1188);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint116 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0117
     * @tc.name    JsBreakpoint117
     * @tc.desc    Width 1289 mapped to lg with 4 columns seed 117
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint117', 0, async function () {
      await yieldThread();
      const width = 1289;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsOf(bp)).assertEqual(4);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.2);
      expect(model.contentWidthOf(width)).assertEqual(1225);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint117 done');
    });
}

function BreakpointClassificationPart040() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0118
     * @tc.name    JsBreakpoint118
     * @tc.desc    Width 1326 mapped to lg with 4 columns seed 118
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint118', 0, async function () {
      await yieldThread();
      const width = 1326;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsOf(bp)).assertEqual(4);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.2);
      expect(model.contentWidthOf(width)).assertEqual(1262);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint118 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0119
     * @tc.name    JsBreakpoint119
     * @tc.desc    Width 1363 mapped to lg with 4 columns seed 119
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint119', 0, async function () {
      await yieldThread();
      const width = 1363;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsOf(bp)).assertEqual(4);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.2);
      expect(model.contentWidthOf(width)).assertEqual(1299);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint119 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0120
     * @tc.name    JsBreakpoint120
     * @tc.desc    Width 1400 mapped to lg with 4 columns seed 120
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint120', 0, async function () {
      await yieldThread();
      const width = 1400;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsOf(bp)).assertEqual(4);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.2);
      expect(model.contentWidthOf(width)).assertEqual(1336);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint120 done');
    });
}

function BreakpointClassificationPart041() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0121
     * @tc.name    JsBreakpoint121
     * @tc.desc    Width 1437 mapped to lg with 4 columns seed 121
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint121', 0, async function () {
      await yieldThread();
      const width = 1437;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsOf(bp)).assertEqual(4);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.2);
      expect(model.contentWidthOf(width)).assertEqual(1373);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint121 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0122
     * @tc.name    JsBreakpoint122
     * @tc.desc    Width 354 mapped to sm with 2 columns seed 122
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint122', 0, async function () {
      await yieldThread();
      const width = 354;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('sm');
      expect(model.columnsOf(bp)).assertEqual(2);
      expect(model.gutterOf(width)).assertEqual(12);
      expect(model.marginOf(width)).assertEqual(16);
      expect(model.fontScaleOf(bp)).assertEqual(1.0);
      expect(model.contentWidthOf(width)).assertEqual(322);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint122 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0123
     * @tc.name    JsBreakpoint123
     * @tc.desc    Width 391 mapped to sm with 2 columns seed 123
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint123', 0, async function () {
      await yieldThread();
      const width = 391;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('sm');
      expect(model.columnsOf(bp)).assertEqual(2);
      expect(model.gutterOf(width)).assertEqual(12);
      expect(model.marginOf(width)).assertEqual(16);
      expect(model.fontScaleOf(bp)).assertEqual(1.0);
      expect(model.contentWidthOf(width)).assertEqual(359);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint123 done');
    });
}

function BreakpointClassificationPart042() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0124
     * @tc.name    JsBreakpoint124
     * @tc.desc    Width 428 mapped to sm with 2 columns seed 124
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint124', 0, async function () {
      await yieldThread();
      const width = 428;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('sm');
      expect(model.columnsOf(bp)).assertEqual(2);
      expect(model.gutterOf(width)).assertEqual(12);
      expect(model.marginOf(width)).assertEqual(16);
      expect(model.fontScaleOf(bp)).assertEqual(1.0);
      expect(model.contentWidthOf(width)).assertEqual(396);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint124 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0125
     * @tc.name    JsBreakpoint125
     * @tc.desc    Width 465 mapped to sm with 2 columns seed 125
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint125', 0, async function () {
      await yieldThread();
      const width = 465;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('sm');
      expect(model.columnsOf(bp)).assertEqual(2);
      expect(model.gutterOf(width)).assertEqual(12);
      expect(model.marginOf(width)).assertEqual(16);
      expect(model.fontScaleOf(bp)).assertEqual(1.0);
      expect(model.contentWidthOf(width)).assertEqual(433);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint125 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0126
     * @tc.name    JsBreakpoint126
     * @tc.desc    Width 502 mapped to sm with 2 columns seed 126
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint126', 0, async function () {
      await yieldThread();
      const width = 502;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('sm');
      expect(model.columnsOf(bp)).assertEqual(2);
      expect(model.gutterOf(width)).assertEqual(12);
      expect(model.marginOf(width)).assertEqual(16);
      expect(model.fontScaleOf(bp)).assertEqual(1.0);
      expect(model.contentWidthOf(width)).assertEqual(470);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint126 done');
    });
}

function BreakpointClassificationPart043() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0127
     * @tc.name    JsBreakpoint127
     * @tc.desc    Width 539 mapped to sm with 2 columns seed 127
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint127', 0, async function () {
      await yieldThread();
      const width = 539;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('sm');
      expect(model.columnsOf(bp)).assertEqual(2);
      expect(model.gutterOf(width)).assertEqual(12);
      expect(model.marginOf(width)).assertEqual(16);
      expect(model.fontScaleOf(bp)).assertEqual(1.0);
      expect(model.contentWidthOf(width)).assertEqual(507);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint127 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0128
     * @tc.name    JsBreakpoint128
     * @tc.desc    Width 576 mapped to sm with 2 columns seed 128
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint128', 0, async function () {
      await yieldThread();
      const width = 576;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('sm');
      expect(model.columnsOf(bp)).assertEqual(2);
      expect(model.gutterOf(width)).assertEqual(12);
      expect(model.marginOf(width)).assertEqual(16);
      expect(model.fontScaleOf(bp)).assertEqual(1.0);
      expect(model.contentWidthOf(width)).assertEqual(544);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint128 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0129
     * @tc.name    JsBreakpoint129
     * @tc.desc    Width 613 mapped to md with 3 columns seed 129
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint129', 0, async function () {
      await yieldThread();
      const width = 613;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('md');
      expect(model.columnsOf(bp)).assertEqual(3);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.1);
      expect(model.contentWidthOf(width)).assertEqual(549);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint129 done');
    });
}

function BreakpointClassificationPart044() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0130
     * @tc.name    JsBreakpoint130
     * @tc.desc    Width 650 mapped to md with 3 columns seed 130
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint130', 0, async function () {
      await yieldThread();
      const width = 650;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('md');
      expect(model.columnsOf(bp)).assertEqual(3);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.1);
      expect(model.contentWidthOf(width)).assertEqual(586);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint130 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0131
     * @tc.name    JsBreakpoint131
     * @tc.desc    Width 687 mapped to md with 3 columns seed 131
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint131', 0, async function () {
      await yieldThread();
      const width = 687;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('md');
      expect(model.columnsOf(bp)).assertEqual(3);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.1);
      expect(model.contentWidthOf(width)).assertEqual(623);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint131 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0132
     * @tc.name    JsBreakpoint132
     * @tc.desc    Width 724 mapped to md with 3 columns seed 132
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint132', 0, async function () {
      await yieldThread();
      const width = 724;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('md');
      expect(model.columnsOf(bp)).assertEqual(3);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.1);
      expect(model.contentWidthOf(width)).assertEqual(660);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint132 done');
    });
}

function BreakpointClassificationPart045() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0133
     * @tc.name    JsBreakpoint133
     * @tc.desc    Width 761 mapped to md with 3 columns seed 133
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint133', 0, async function () {
      await yieldThread();
      const width = 761;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('md');
      expect(model.columnsOf(bp)).assertEqual(3);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.1);
      expect(model.contentWidthOf(width)).assertEqual(697);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint133 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0134
     * @tc.name    JsBreakpoint134
     * @tc.desc    Width 798 mapped to md with 3 columns seed 134
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint134', 0, async function () {
      await yieldThread();
      const width = 798;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('md');
      expect(model.columnsOf(bp)).assertEqual(3);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.1);
      expect(model.contentWidthOf(width)).assertEqual(734);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint134 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0135
     * @tc.name    JsBreakpoint135
     * @tc.desc    Width 835 mapped to md with 3 columns seed 135
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint135', 0, async function () {
      await yieldThread();
      const width = 835;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('md');
      expect(model.columnsOf(bp)).assertEqual(3);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.1);
      expect(model.contentWidthOf(width)).assertEqual(771);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint135 done');
    });
}

function BreakpointClassificationPart046() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0136
     * @tc.name    JsBreakpoint136
     * @tc.desc    Width 872 mapped to lg with 4 columns seed 136
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint136', 0, async function () {
      await yieldThread();
      const width = 872;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsOf(bp)).assertEqual(4);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.2);
      expect(model.contentWidthOf(width)).assertEqual(808);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint136 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0137
     * @tc.name    JsBreakpoint137
     * @tc.desc    Width 909 mapped to lg with 4 columns seed 137
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint137', 0, async function () {
      await yieldThread();
      const width = 909;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsOf(bp)).assertEqual(4);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.2);
      expect(model.contentWidthOf(width)).assertEqual(845);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint137 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0138
     * @tc.name    JsBreakpoint138
     * @tc.desc    Width 946 mapped to lg with 4 columns seed 138
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint138', 0, async function () {
      await yieldThread();
      const width = 946;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsOf(bp)).assertEqual(4);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.2);
      expect(model.contentWidthOf(width)).assertEqual(882);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint138 done');
    });
}

function BreakpointClassificationPart047() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0139
     * @tc.name    JsBreakpoint139
     * @tc.desc    Width 983 mapped to lg with 4 columns seed 139
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint139', 0, async function () {
      await yieldThread();
      const width = 983;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsOf(bp)).assertEqual(4);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.2);
      expect(model.contentWidthOf(width)).assertEqual(919);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint139 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0140
     * @tc.name    JsBreakpoint140
     * @tc.desc    Width 1020 mapped to lg with 4 columns seed 140
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsBreakpoint140', 0, async function () {
      await yieldThread();
      const width = 1020;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsOf(bp)).assertEqual(4);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.fontScaleOf(bp)).assertEqual(1.2);
      expect(model.contentWidthOf(width)).assertEqual(956);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsBreakpoint140 done');
    });
}

function BreakpointClassificationGroup001() {
  BreakpointClassificationPart001();
  BreakpointClassificationPart002();
  BreakpointClassificationPart003();
  BreakpointClassificationPart004();
  BreakpointClassificationPart005();
  BreakpointClassificationPart006();
  BreakpointClassificationPart007();
  BreakpointClassificationPart008();
  BreakpointClassificationPart009();
  BreakpointClassificationPart010();
  BreakpointClassificationPart011();
  BreakpointClassificationPart012();
  BreakpointClassificationPart013();
  BreakpointClassificationPart014();
  BreakpointClassificationPart015();
  BreakpointClassificationPart016();
  BreakpointClassificationPart017();
  BreakpointClassificationPart018();
  BreakpointClassificationPart019();
  BreakpointClassificationPart020();
  BreakpointClassificationPart021();
  BreakpointClassificationPart022();
  BreakpointClassificationPart023();
  BreakpointClassificationPart024();
  BreakpointClassificationPart025();
  BreakpointClassificationPart026();
  BreakpointClassificationPart027();
  BreakpointClassificationPart028();
  BreakpointClassificationPart029();
  BreakpointClassificationPart030();
  BreakpointClassificationPart031();
  BreakpointClassificationPart032();
  BreakpointClassificationPart033();
  BreakpointClassificationPart034();
  BreakpointClassificationPart035();
  BreakpointClassificationPart036();
  BreakpointClassificationPart037();
  BreakpointClassificationPart038();
  BreakpointClassificationPart039();
  BreakpointClassificationPart040();
}

function BreakpointClassificationGroup002() {
  BreakpointClassificationPart041();
  BreakpointClassificationPart042();
  BreakpointClassificationPart043();
  BreakpointClassificationPart044();
  BreakpointClassificationPart045();
  BreakpointClassificationPart046();
  BreakpointClassificationPart047();
}

export default function breakpointClassificationSuite() {
  describe('BreakpointClassificationSuite', function () {
    BreakpointClassificationGroup001();
    BreakpointClassificationGroup002();
  });
}
