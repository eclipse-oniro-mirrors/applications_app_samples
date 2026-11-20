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

export default function breakpointClassificationSuite() {
  describe('BreakpointClassificationSuite', function () {
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
  });
}
