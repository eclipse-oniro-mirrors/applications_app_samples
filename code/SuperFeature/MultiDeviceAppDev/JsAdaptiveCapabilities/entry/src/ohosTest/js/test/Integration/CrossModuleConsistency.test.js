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

function CrossModuleConsistencyPart001() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0701
     * @tc.name    JsConsistency001
     * @tc.desc    Cross module consistency at width 389 seed 1
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency001', 0, async function () {
      await yieldThread();
      const width = 389;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('sm');
      expect(model.columnsForWidth(width)).assertEqual(2);
      expect(model.itemWidthOf(width)).assertEqual(172);
      expect(model.marginOf(width)).assertEqual(16);
      expect(model.gutterOf(width)).assertEqual(12);
      expect(model.itemWidthOf(width) * 2 + 12 <= 357).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency001 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0702
     * @tc.name    JsConsistency002
     * @tc.desc    Cross module consistency at width 418 seed 2
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency002', 0, async function () {
      await yieldThread();
      const width = 418;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('sm');
      expect(model.columnsForWidth(width)).assertEqual(2);
      expect(model.itemWidthOf(width)).assertEqual(187);
      expect(model.marginOf(width)).assertEqual(16);
      expect(model.gutterOf(width)).assertEqual(12);
      expect(model.itemWidthOf(width) * 2 + 12 <= 386).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency002 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0703
     * @tc.name    JsConsistency003
     * @tc.desc    Cross module consistency at width 447 seed 3
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency003', 0, async function () {
      await yieldThread();
      const width = 447;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('sm');
      expect(model.columnsForWidth(width)).assertEqual(2);
      expect(model.itemWidthOf(width)).assertEqual(201);
      expect(model.marginOf(width)).assertEqual(16);
      expect(model.gutterOf(width)).assertEqual(12);
      expect(model.itemWidthOf(width) * 2 + 12 <= 415).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency003 done');
    });
}

function CrossModuleConsistencyPart002() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0704
     * @tc.name    JsConsistency004
     * @tc.desc    Cross module consistency at width 476 seed 4
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency004', 0, async function () {
      await yieldThread();
      const width = 476;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('sm');
      expect(model.columnsForWidth(width)).assertEqual(2);
      expect(model.itemWidthOf(width)).assertEqual(216);
      expect(model.marginOf(width)).assertEqual(16);
      expect(model.gutterOf(width)).assertEqual(12);
      expect(model.itemWidthOf(width) * 2 + 12 <= 444).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency004 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0705
     * @tc.name    JsConsistency005
     * @tc.desc    Cross module consistency at width 505 seed 5
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency005', 0, async function () {
      await yieldThread();
      const width = 505;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('sm');
      expect(model.columnsForWidth(width)).assertEqual(2);
      expect(model.itemWidthOf(width)).assertEqual(230);
      expect(model.marginOf(width)).assertEqual(16);
      expect(model.gutterOf(width)).assertEqual(12);
      expect(model.itemWidthOf(width) * 2 + 12 <= 473).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency005 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0706
     * @tc.name    JsConsistency006
     * @tc.desc    Cross module consistency at width 534 seed 6
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency006', 0, async function () {
      await yieldThread();
      const width = 534;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('sm');
      expect(model.columnsForWidth(width)).assertEqual(2);
      expect(model.itemWidthOf(width)).assertEqual(245);
      expect(model.marginOf(width)).assertEqual(16);
      expect(model.gutterOf(width)).assertEqual(12);
      expect(model.itemWidthOf(width) * 2 + 12 <= 502).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency006 done');
    });
}

function CrossModuleConsistencyPart003() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0707
     * @tc.name    JsConsistency007
     * @tc.desc    Cross module consistency at width 563 seed 7
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency007', 0, async function () {
      await yieldThread();
      const width = 563;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('sm');
      expect(model.columnsForWidth(width)).assertEqual(2);
      expect(model.itemWidthOf(width)).assertEqual(259);
      expect(model.marginOf(width)).assertEqual(16);
      expect(model.gutterOf(width)).assertEqual(12);
      expect(model.itemWidthOf(width) * 2 + 12 <= 531).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency007 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0708
     * @tc.name    JsConsistency008
     * @tc.desc    Cross module consistency at width 592 seed 8
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency008', 0, async function () {
      await yieldThread();
      const width = 592;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('sm');
      expect(model.columnsForWidth(width)).assertEqual(2);
      expect(model.itemWidthOf(width)).assertEqual(274);
      expect(model.marginOf(width)).assertEqual(16);
      expect(model.gutterOf(width)).assertEqual(12);
      expect(model.itemWidthOf(width) * 2 + 12 <= 560).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency008 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0709
     * @tc.name    JsConsistency009
     * @tc.desc    Cross module consistency at width 621 seed 9
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency009', 0, async function () {
      await yieldThread();
      const width = 621;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('md');
      expect(model.columnsForWidth(width)).assertEqual(3);
      expect(model.itemWidthOf(width)).assertEqual(169);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 3 + 48 <= 557).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency009 done');
    });
}

function CrossModuleConsistencyPart004() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0710
     * @tc.name    JsConsistency010
     * @tc.desc    Cross module consistency at width 650 seed 10
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency010', 0, async function () {
      await yieldThread();
      const width = 650;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('md');
      expect(model.columnsForWidth(width)).assertEqual(3);
      expect(model.itemWidthOf(width)).assertEqual(179);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 3 + 48 <= 586).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency010 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0711
     * @tc.name    JsConsistency011
     * @tc.desc    Cross module consistency at width 679 seed 11
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency011', 0, async function () {
      await yieldThread();
      const width = 679;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('md');
      expect(model.columnsForWidth(width)).assertEqual(3);
      expect(model.itemWidthOf(width)).assertEqual(189);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 3 + 48 <= 615).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency011 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0712
     * @tc.name    JsConsistency012
     * @tc.desc    Cross module consistency at width 708 seed 12
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency012', 0, async function () {
      await yieldThread();
      const width = 708;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('md');
      expect(model.columnsForWidth(width)).assertEqual(3);
      expect(model.itemWidthOf(width)).assertEqual(198);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 3 + 48 <= 644).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency012 done');
    });
}

function CrossModuleConsistencyPart005() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0713
     * @tc.name    JsConsistency013
     * @tc.desc    Cross module consistency at width 737 seed 13
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency013', 0, async function () {
      await yieldThread();
      const width = 737;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('md');
      expect(model.columnsForWidth(width)).assertEqual(3);
      expect(model.itemWidthOf(width)).assertEqual(208);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 3 + 48 <= 673).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency013 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0714
     * @tc.name    JsConsistency014
     * @tc.desc    Cross module consistency at width 766 seed 14
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency014', 0, async function () {
      await yieldThread();
      const width = 766;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('md');
      expect(model.columnsForWidth(width)).assertEqual(3);
      expect(model.itemWidthOf(width)).assertEqual(218);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 3 + 48 <= 702).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency014 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0715
     * @tc.name    JsConsistency015
     * @tc.desc    Cross module consistency at width 795 seed 15
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency015', 0, async function () {
      await yieldThread();
      const width = 795;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('md');
      expect(model.columnsForWidth(width)).assertEqual(3);
      expect(model.itemWidthOf(width)).assertEqual(227);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 3 + 48 <= 731).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency015 done');
    });
}

function CrossModuleConsistencyPart006() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0716
     * @tc.name    JsConsistency016
     * @tc.desc    Cross module consistency at width 824 seed 16
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency016', 0, async function () {
      await yieldThread();
      const width = 824;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('md');
      expect(model.columnsForWidth(width)).assertEqual(3);
      expect(model.itemWidthOf(width)).assertEqual(237);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 3 + 48 <= 760).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency016 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0717
     * @tc.name    JsConsistency017
     * @tc.desc    Cross module consistency at width 853 seed 17
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency017', 0, async function () {
      await yieldThread();
      const width = 853;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsForWidth(width)).assertEqual(4);
      expect(model.itemWidthOf(width)).assertEqual(179);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 4 + 72 <= 789).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency017 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0718
     * @tc.name    JsConsistency018
     * @tc.desc    Cross module consistency at width 882 seed 18
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency018', 0, async function () {
      await yieldThread();
      const width = 882;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsForWidth(width)).assertEqual(4);
      expect(model.itemWidthOf(width)).assertEqual(186);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 4 + 72 <= 818).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency018 done');
    });
}

function CrossModuleConsistencyPart007() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0719
     * @tc.name    JsConsistency019
     * @tc.desc    Cross module consistency at width 911 seed 19
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency019', 0, async function () {
      await yieldThread();
      const width = 911;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsForWidth(width)).assertEqual(4);
      expect(model.itemWidthOf(width)).assertEqual(193);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 4 + 72 <= 847).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency019 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0720
     * @tc.name    JsConsistency020
     * @tc.desc    Cross module consistency at width 940 seed 20
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency020', 0, async function () {
      await yieldThread();
      const width = 940;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsForWidth(width)).assertEqual(4);
      expect(model.itemWidthOf(width)).assertEqual(201);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 4 + 72 <= 876).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency020 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0721
     * @tc.name    JsConsistency021
     * @tc.desc    Cross module consistency at width 969 seed 21
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency021', 0, async function () {
      await yieldThread();
      const width = 969;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsForWidth(width)).assertEqual(4);
      expect(model.itemWidthOf(width)).assertEqual(208);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 4 + 72 <= 905).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency021 done');
    });
}

function CrossModuleConsistencyPart008() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0722
     * @tc.name    JsConsistency022
     * @tc.desc    Cross module consistency at width 998 seed 22
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency022', 0, async function () {
      await yieldThread();
      const width = 998;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsForWidth(width)).assertEqual(4);
      expect(model.itemWidthOf(width)).assertEqual(215);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 4 + 72 <= 934).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency022 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0723
     * @tc.name    JsConsistency023
     * @tc.desc    Cross module consistency at width 1027 seed 23
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency023', 0, async function () {
      await yieldThread();
      const width = 1027;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsForWidth(width)).assertEqual(4);
      expect(model.itemWidthOf(width)).assertEqual(222);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 4 + 72 <= 963).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency023 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0724
     * @tc.name    JsConsistency024
     * @tc.desc    Cross module consistency at width 1056 seed 24
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency024', 0, async function () {
      await yieldThread();
      const width = 1056;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsForWidth(width)).assertEqual(4);
      expect(model.itemWidthOf(width)).assertEqual(230);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 4 + 72 <= 992).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency024 done');
    });
}

function CrossModuleConsistencyPart009() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0725
     * @tc.name    JsConsistency025
     * @tc.desc    Cross module consistency at width 1085 seed 25
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency025', 0, async function () {
      await yieldThread();
      const width = 1085;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsForWidth(width)).assertEqual(4);
      expect(model.itemWidthOf(width)).assertEqual(237);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 4 + 72 <= 1021).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency025 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0726
     * @tc.name    JsConsistency026
     * @tc.desc    Cross module consistency at width 1114 seed 26
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency026', 0, async function () {
      await yieldThread();
      const width = 1114;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsForWidth(width)).assertEqual(4);
      expect(model.itemWidthOf(width)).assertEqual(244);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 4 + 72 <= 1050).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency026 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0727
     * @tc.name    JsConsistency027
     * @tc.desc    Cross module consistency at width 1143 seed 27
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency027', 0, async function () {
      await yieldThread();
      const width = 1143;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsForWidth(width)).assertEqual(4);
      expect(model.itemWidthOf(width)).assertEqual(251);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 4 + 72 <= 1079).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency027 done');
    });
}

function CrossModuleConsistencyPart010() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0728
     * @tc.name    JsConsistency028
     * @tc.desc    Cross module consistency at width 1172 seed 28
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency028', 0, async function () {
      await yieldThread();
      const width = 1172;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsForWidth(width)).assertEqual(4);
      expect(model.itemWidthOf(width)).assertEqual(259);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 4 + 72 <= 1108).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency028 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0729
     * @tc.name    JsConsistency029
     * @tc.desc    Cross module consistency at width 1201 seed 29
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency029', 0, async function () {
      await yieldThread();
      const width = 1201;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsForWidth(width)).assertEqual(4);
      expect(model.itemWidthOf(width)).assertEqual(266);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 4 + 72 <= 1137).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency029 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0730
     * @tc.name    JsConsistency030
     * @tc.desc    Cross module consistency at width 1230 seed 30
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency030', 0, async function () {
      await yieldThread();
      const width = 1230;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsForWidth(width)).assertEqual(4);
      expect(model.itemWidthOf(width)).assertEqual(273);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 4 + 72 <= 1166).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency030 done');
    });
}

function CrossModuleConsistencyPart011() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0731
     * @tc.name    JsConsistency031
     * @tc.desc    Cross module consistency at width 1259 seed 31
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency031', 0, async function () {
      await yieldThread();
      const width = 1259;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsForWidth(width)).assertEqual(4);
      expect(model.itemWidthOf(width)).assertEqual(280);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 4 + 72 <= 1195).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency031 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0732
     * @tc.name    JsConsistency032
     * @tc.desc    Cross module consistency at width 1288 seed 32
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency032', 0, async function () {
      await yieldThread();
      const width = 1288;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsForWidth(width)).assertEqual(4);
      expect(model.itemWidthOf(width)).assertEqual(288);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 4 + 72 <= 1224).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency032 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0733
     * @tc.name    JsConsistency033
     * @tc.desc    Cross module consistency at width 1317 seed 33
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency033', 0, async function () {
      await yieldThread();
      const width = 1317;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsForWidth(width)).assertEqual(4);
      expect(model.itemWidthOf(width)).assertEqual(295);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 4 + 72 <= 1253).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency033 done');
    });
}

function CrossModuleConsistencyPart012() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0734
     * @tc.name    JsConsistency034
     * @tc.desc    Cross module consistency at width 1346 seed 34
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency034', 0, async function () {
      await yieldThread();
      const width = 1346;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsForWidth(width)).assertEqual(4);
      expect(model.itemWidthOf(width)).assertEqual(302);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 4 + 72 <= 1282).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency034 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0735
     * @tc.name    JsConsistency035
     * @tc.desc    Cross module consistency at width 1375 seed 35
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency035', 0, async function () {
      await yieldThread();
      const width = 1375;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsForWidth(width)).assertEqual(4);
      expect(model.itemWidthOf(width)).assertEqual(309);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 4 + 72 <= 1311).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency035 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0736
     * @tc.name    JsConsistency036
     * @tc.desc    Cross module consistency at width 1404 seed 36
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency036', 0, async function () {
      await yieldThread();
      const width = 1404;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsForWidth(width)).assertEqual(4);
      expect(model.itemWidthOf(width)).assertEqual(317);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 4 + 72 <= 1340).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency036 done');
    });
}

function CrossModuleConsistencyPart013() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0737
     * @tc.name    JsConsistency037
     * @tc.desc    Cross module consistency at width 1433 seed 37
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency037', 0, async function () {
      await yieldThread();
      const width = 1433;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsForWidth(width)).assertEqual(4);
      expect(model.itemWidthOf(width)).assertEqual(324);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 4 + 72 <= 1369).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency037 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0738
     * @tc.name    JsConsistency038
     * @tc.desc    Cross module consistency at width 382 seed 38
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency038', 0, async function () {
      await yieldThread();
      const width = 382;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('sm');
      expect(model.columnsForWidth(width)).assertEqual(2);
      expect(model.itemWidthOf(width)).assertEqual(169);
      expect(model.marginOf(width)).assertEqual(16);
      expect(model.gutterOf(width)).assertEqual(12);
      expect(model.itemWidthOf(width) * 2 + 12 <= 350).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency038 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0739
     * @tc.name    JsConsistency039
     * @tc.desc    Cross module consistency at width 411 seed 39
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency039', 0, async function () {
      await yieldThread();
      const width = 411;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('sm');
      expect(model.columnsForWidth(width)).assertEqual(2);
      expect(model.itemWidthOf(width)).assertEqual(183);
      expect(model.marginOf(width)).assertEqual(16);
      expect(model.gutterOf(width)).assertEqual(12);
      expect(model.itemWidthOf(width) * 2 + 12 <= 379).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency039 done');
    });
}

function CrossModuleConsistencyPart014() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0740
     * @tc.name    JsConsistency040
     * @tc.desc    Cross module consistency at width 440 seed 40
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency040', 0, async function () {
      await yieldThread();
      const width = 440;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('sm');
      expect(model.columnsForWidth(width)).assertEqual(2);
      expect(model.itemWidthOf(width)).assertEqual(198);
      expect(model.marginOf(width)).assertEqual(16);
      expect(model.gutterOf(width)).assertEqual(12);
      expect(model.itemWidthOf(width) * 2 + 12 <= 408).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency040 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0741
     * @tc.name    JsConsistency041
     * @tc.desc    Cross module consistency at width 469 seed 41
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency041', 0, async function () {
      await yieldThread();
      const width = 469;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('sm');
      expect(model.columnsForWidth(width)).assertEqual(2);
      expect(model.itemWidthOf(width)).assertEqual(212);
      expect(model.marginOf(width)).assertEqual(16);
      expect(model.gutterOf(width)).assertEqual(12);
      expect(model.itemWidthOf(width) * 2 + 12 <= 437).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency041 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0742
     * @tc.name    JsConsistency042
     * @tc.desc    Cross module consistency at width 498 seed 42
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency042', 0, async function () {
      await yieldThread();
      const width = 498;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('sm');
      expect(model.columnsForWidth(width)).assertEqual(2);
      expect(model.itemWidthOf(width)).assertEqual(227);
      expect(model.marginOf(width)).assertEqual(16);
      expect(model.gutterOf(width)).assertEqual(12);
      expect(model.itemWidthOf(width) * 2 + 12 <= 466).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency042 done');
    });
}

function CrossModuleConsistencyPart015() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0743
     * @tc.name    JsConsistency043
     * @tc.desc    Cross module consistency at width 527 seed 43
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency043', 0, async function () {
      await yieldThread();
      const width = 527;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('sm');
      expect(model.columnsForWidth(width)).assertEqual(2);
      expect(model.itemWidthOf(width)).assertEqual(241);
      expect(model.marginOf(width)).assertEqual(16);
      expect(model.gutterOf(width)).assertEqual(12);
      expect(model.itemWidthOf(width) * 2 + 12 <= 495).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency043 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0744
     * @tc.name    JsConsistency044
     * @tc.desc    Cross module consistency at width 556 seed 44
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency044', 0, async function () {
      await yieldThread();
      const width = 556;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('sm');
      expect(model.columnsForWidth(width)).assertEqual(2);
      expect(model.itemWidthOf(width)).assertEqual(256);
      expect(model.marginOf(width)).assertEqual(16);
      expect(model.gutterOf(width)).assertEqual(12);
      expect(model.itemWidthOf(width) * 2 + 12 <= 524).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency044 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0745
     * @tc.name    JsConsistency045
     * @tc.desc    Cross module consistency at width 585 seed 45
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency045', 0, async function () {
      await yieldThread();
      const width = 585;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('sm');
      expect(model.columnsForWidth(width)).assertEqual(2);
      expect(model.itemWidthOf(width)).assertEqual(270);
      expect(model.marginOf(width)).assertEqual(16);
      expect(model.gutterOf(width)).assertEqual(12);
      expect(model.itemWidthOf(width) * 2 + 12 <= 553).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency045 done');
    });
}

function CrossModuleConsistencyPart016() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0746
     * @tc.name    JsConsistency046
     * @tc.desc    Cross module consistency at width 614 seed 46
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency046', 0, async function () {
      await yieldThread();
      const width = 614;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('md');
      expect(model.columnsForWidth(width)).assertEqual(3);
      expect(model.itemWidthOf(width)).assertEqual(167);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 3 + 48 <= 550).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency046 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0747
     * @tc.name    JsConsistency047
     * @tc.desc    Cross module consistency at width 643 seed 47
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency047', 0, async function () {
      await yieldThread();
      const width = 643;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('md');
      expect(model.columnsForWidth(width)).assertEqual(3);
      expect(model.itemWidthOf(width)).assertEqual(177);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 3 + 48 <= 579).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency047 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0748
     * @tc.name    JsConsistency048
     * @tc.desc    Cross module consistency at width 672 seed 48
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency048', 0, async function () {
      await yieldThread();
      const width = 672;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('md');
      expect(model.columnsForWidth(width)).assertEqual(3);
      expect(model.itemWidthOf(width)).assertEqual(186);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 3 + 48 <= 608).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency048 done');
    });
}

function CrossModuleConsistencyPart017() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0749
     * @tc.name    JsConsistency049
     * @tc.desc    Cross module consistency at width 701 seed 49
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency049', 0, async function () {
      await yieldThread();
      const width = 701;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('md');
      expect(model.columnsForWidth(width)).assertEqual(3);
      expect(model.itemWidthOf(width)).assertEqual(196);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 3 + 48 <= 637).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency049 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0750
     * @tc.name    JsConsistency050
     * @tc.desc    Cross module consistency at width 730 seed 50
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency050', 0, async function () {
      await yieldThread();
      const width = 730;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('md');
      expect(model.columnsForWidth(width)).assertEqual(3);
      expect(model.itemWidthOf(width)).assertEqual(206);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 3 + 48 <= 666).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency050 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0751
     * @tc.name    JsConsistency051
     * @tc.desc    Cross module consistency at width 759 seed 51
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency051', 0, async function () {
      await yieldThread();
      const width = 759;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('md');
      expect(model.columnsForWidth(width)).assertEqual(3);
      expect(model.itemWidthOf(width)).assertEqual(215);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 3 + 48 <= 695).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency051 done');
    });
}

function CrossModuleConsistencyPart018() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0752
     * @tc.name    JsConsistency052
     * @tc.desc    Cross module consistency at width 788 seed 52
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency052', 0, async function () {
      await yieldThread();
      const width = 788;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('md');
      expect(model.columnsForWidth(width)).assertEqual(3);
      expect(model.itemWidthOf(width)).assertEqual(225);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 3 + 48 <= 724).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency052 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0753
     * @tc.name    JsConsistency053
     * @tc.desc    Cross module consistency at width 817 seed 53
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency053', 0, async function () {
      await yieldThread();
      const width = 817;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('md');
      expect(model.columnsForWidth(width)).assertEqual(3);
      expect(model.itemWidthOf(width)).assertEqual(235);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 3 + 48 <= 753).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency053 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0754
     * @tc.name    JsConsistency054
     * @tc.desc    Cross module consistency at width 846 seed 54
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency054', 0, async function () {
      await yieldThread();
      const width = 846;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsForWidth(width)).assertEqual(4);
      expect(model.itemWidthOf(width)).assertEqual(177);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 4 + 72 <= 782).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency054 done');
    });
}

function CrossModuleConsistencyPart019() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0755
     * @tc.name    JsConsistency055
     * @tc.desc    Cross module consistency at width 875 seed 55
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency055', 0, async function () {
      await yieldThread();
      const width = 875;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsForWidth(width)).assertEqual(4);
      expect(model.itemWidthOf(width)).assertEqual(184);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 4 + 72 <= 811).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency055 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0756
     * @tc.name    JsConsistency056
     * @tc.desc    Cross module consistency at width 904 seed 56
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency056', 0, async function () {
      await yieldThread();
      const width = 904;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsForWidth(width)).assertEqual(4);
      expect(model.itemWidthOf(width)).assertEqual(192);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 4 + 72 <= 840).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency056 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0757
     * @tc.name    JsConsistency057
     * @tc.desc    Cross module consistency at width 933 seed 57
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency057', 0, async function () {
      await yieldThread();
      const width = 933;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsForWidth(width)).assertEqual(4);
      expect(model.itemWidthOf(width)).assertEqual(199);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 4 + 72 <= 869).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency057 done');
    });
}

function CrossModuleConsistencyPart020() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0758
     * @tc.name    JsConsistency058
     * @tc.desc    Cross module consistency at width 962 seed 58
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency058', 0, async function () {
      await yieldThread();
      const width = 962;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsForWidth(width)).assertEqual(4);
      expect(model.itemWidthOf(width)).assertEqual(206);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 4 + 72 <= 898).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency058 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0759
     * @tc.name    JsConsistency059
     * @tc.desc    Cross module consistency at width 991 seed 59
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency059', 0, async function () {
      await yieldThread();
      const width = 991;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsForWidth(width)).assertEqual(4);
      expect(model.itemWidthOf(width)).assertEqual(213);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 4 + 72 <= 927).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency059 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0760
     * @tc.name    JsConsistency060
     * @tc.desc    Cross module consistency at width 1020 seed 60
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency060', 0, async function () {
      await yieldThread();
      const width = 1020;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsForWidth(width)).assertEqual(4);
      expect(model.itemWidthOf(width)).assertEqual(221);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 4 + 72 <= 956).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency060 done');
    });
}

function CrossModuleConsistencyPart021() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0761
     * @tc.name    JsConsistency061
     * @tc.desc    Cross module consistency at width 1049 seed 61
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency061', 0, async function () {
      await yieldThread();
      const width = 1049;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsForWidth(width)).assertEqual(4);
      expect(model.itemWidthOf(width)).assertEqual(228);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 4 + 72 <= 985).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency061 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0762
     * @tc.name    JsConsistency062
     * @tc.desc    Cross module consistency at width 1078 seed 62
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency062', 0, async function () {
      await yieldThread();
      const width = 1078;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsForWidth(width)).assertEqual(4);
      expect(model.itemWidthOf(width)).assertEqual(235);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 4 + 72 <= 1014).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency062 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0763
     * @tc.name    JsConsistency063
     * @tc.desc    Cross module consistency at width 1107 seed 63
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency063', 0, async function () {
      await yieldThread();
      const width = 1107;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsForWidth(width)).assertEqual(4);
      expect(model.itemWidthOf(width)).assertEqual(242);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 4 + 72 <= 1043).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency063 done');
    });
}

function CrossModuleConsistencyPart022() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0764
     * @tc.name    JsConsistency064
     * @tc.desc    Cross module consistency at width 1136 seed 64
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency064', 0, async function () {
      await yieldThread();
      const width = 1136;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsForWidth(width)).assertEqual(4);
      expect(model.itemWidthOf(width)).assertEqual(250);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 4 + 72 <= 1072).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency064 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0765
     * @tc.name    JsConsistency065
     * @tc.desc    Cross module consistency at width 1165 seed 65
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency065', 0, async function () {
      await yieldThread();
      const width = 1165;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsForWidth(width)).assertEqual(4);
      expect(model.itemWidthOf(width)).assertEqual(257);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 4 + 72 <= 1101).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency065 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0766
     * @tc.name    JsConsistency066
     * @tc.desc    Cross module consistency at width 1194 seed 66
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency066', 0, async function () {
      await yieldThread();
      const width = 1194;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsForWidth(width)).assertEqual(4);
      expect(model.itemWidthOf(width)).assertEqual(264);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 4 + 72 <= 1130).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency066 done');
    });
}

function CrossModuleConsistencyPart023() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0767
     * @tc.name    JsConsistency067
     * @tc.desc    Cross module consistency at width 1223 seed 67
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency067', 0, async function () {
      await yieldThread();
      const width = 1223;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsForWidth(width)).assertEqual(4);
      expect(model.itemWidthOf(width)).assertEqual(271);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 4 + 72 <= 1159).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency067 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0768
     * @tc.name    JsConsistency068
     * @tc.desc    Cross module consistency at width 1252 seed 68
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency068', 0, async function () {
      await yieldThread();
      const width = 1252;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsForWidth(width)).assertEqual(4);
      expect(model.itemWidthOf(width)).assertEqual(279);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 4 + 72 <= 1188).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency068 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0769
     * @tc.name    JsConsistency069
     * @tc.desc    Cross module consistency at width 1281 seed 69
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency069', 0, async function () {
      await yieldThread();
      const width = 1281;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsForWidth(width)).assertEqual(4);
      expect(model.itemWidthOf(width)).assertEqual(286);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 4 + 72 <= 1217).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency069 done');
    });
}

function CrossModuleConsistencyPart024() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0770
     * @tc.name    JsConsistency070
     * @tc.desc    Cross module consistency at width 1310 seed 70
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency070', 0, async function () {
      await yieldThread();
      const width = 1310;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsForWidth(width)).assertEqual(4);
      expect(model.itemWidthOf(width)).assertEqual(293);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 4 + 72 <= 1246).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency070 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0771
     * @tc.name    JsConsistency071
     * @tc.desc    Cross module consistency at width 1339 seed 71
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency071', 0, async function () {
      await yieldThread();
      const width = 1339;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsForWidth(width)).assertEqual(4);
      expect(model.itemWidthOf(width)).assertEqual(300);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 4 + 72 <= 1275).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency071 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0772
     * @tc.name    JsConsistency072
     * @tc.desc    Cross module consistency at width 1368 seed 72
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency072', 0, async function () {
      await yieldThread();
      const width = 1368;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsForWidth(width)).assertEqual(4);
      expect(model.itemWidthOf(width)).assertEqual(308);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 4 + 72 <= 1304).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency072 done');
    });
}

function CrossModuleConsistencyPart025() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0773
     * @tc.name    JsConsistency073
     * @tc.desc    Cross module consistency at width 1397 seed 73
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency073', 0, async function () {
      await yieldThread();
      const width = 1397;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsForWidth(width)).assertEqual(4);
      expect(model.itemWidthOf(width)).assertEqual(315);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 4 + 72 <= 1333).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency073 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0774
     * @tc.name    JsConsistency074
     * @tc.desc    Cross module consistency at width 1426 seed 74
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency074', 0, async function () {
      await yieldThread();
      const width = 1426;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsForWidth(width)).assertEqual(4);
      expect(model.itemWidthOf(width)).assertEqual(322);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 4 + 72 <= 1362).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency074 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0775
     * @tc.name    JsConsistency075
     * @tc.desc    Cross module consistency at width 375 seed 75
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency075', 0, async function () {
      await yieldThread();
      const width = 375;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('sm');
      expect(model.columnsForWidth(width)).assertEqual(2);
      expect(model.itemWidthOf(width)).assertEqual(165);
      expect(model.marginOf(width)).assertEqual(16);
      expect(model.gutterOf(width)).assertEqual(12);
      expect(model.itemWidthOf(width) * 2 + 12 <= 343).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency075 done');
    });
}

function CrossModuleConsistencyPart026() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0776
     * @tc.name    JsConsistency076
     * @tc.desc    Cross module consistency at width 404 seed 76
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency076', 0, async function () {
      await yieldThread();
      const width = 404;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('sm');
      expect(model.columnsForWidth(width)).assertEqual(2);
      expect(model.itemWidthOf(width)).assertEqual(180);
      expect(model.marginOf(width)).assertEqual(16);
      expect(model.gutterOf(width)).assertEqual(12);
      expect(model.itemWidthOf(width) * 2 + 12 <= 372).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency076 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0777
     * @tc.name    JsConsistency077
     * @tc.desc    Cross module consistency at width 433 seed 77
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency077', 0, async function () {
      await yieldThread();
      const width = 433;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('sm');
      expect(model.columnsForWidth(width)).assertEqual(2);
      expect(model.itemWidthOf(width)).assertEqual(194);
      expect(model.marginOf(width)).assertEqual(16);
      expect(model.gutterOf(width)).assertEqual(12);
      expect(model.itemWidthOf(width) * 2 + 12 <= 401).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency077 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0778
     * @tc.name    JsConsistency078
     * @tc.desc    Cross module consistency at width 462 seed 78
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency078', 0, async function () {
      await yieldThread();
      const width = 462;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('sm');
      expect(model.columnsForWidth(width)).assertEqual(2);
      expect(model.itemWidthOf(width)).assertEqual(209);
      expect(model.marginOf(width)).assertEqual(16);
      expect(model.gutterOf(width)).assertEqual(12);
      expect(model.itemWidthOf(width) * 2 + 12 <= 430).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency078 done');
    });
}

function CrossModuleConsistencyPart027() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0779
     * @tc.name    JsConsistency079
     * @tc.desc    Cross module consistency at width 491 seed 79
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency079', 0, async function () {
      await yieldThread();
      const width = 491;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('sm');
      expect(model.columnsForWidth(width)).assertEqual(2);
      expect(model.itemWidthOf(width)).assertEqual(223);
      expect(model.marginOf(width)).assertEqual(16);
      expect(model.gutterOf(width)).assertEqual(12);
      expect(model.itemWidthOf(width) * 2 + 12 <= 459).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency079 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0780
     * @tc.name    JsConsistency080
     * @tc.desc    Cross module consistency at width 520 seed 80
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency080', 0, async function () {
      await yieldThread();
      const width = 520;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('sm');
      expect(model.columnsForWidth(width)).assertEqual(2);
      expect(model.itemWidthOf(width)).assertEqual(238);
      expect(model.marginOf(width)).assertEqual(16);
      expect(model.gutterOf(width)).assertEqual(12);
      expect(model.itemWidthOf(width) * 2 + 12 <= 488).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency080 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0781
     * @tc.name    JsConsistency081
     * @tc.desc    Cross module consistency at width 549 seed 81
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency081', 0, async function () {
      await yieldThread();
      const width = 549;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('sm');
      expect(model.columnsForWidth(width)).assertEqual(2);
      expect(model.itemWidthOf(width)).assertEqual(252);
      expect(model.marginOf(width)).assertEqual(16);
      expect(model.gutterOf(width)).assertEqual(12);
      expect(model.itemWidthOf(width) * 2 + 12 <= 517).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency081 done');
    });
}

function CrossModuleConsistencyPart028() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0782
     * @tc.name    JsConsistency082
     * @tc.desc    Cross module consistency at width 578 seed 82
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency082', 0, async function () {
      await yieldThread();
      const width = 578;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('sm');
      expect(model.columnsForWidth(width)).assertEqual(2);
      expect(model.itemWidthOf(width)).assertEqual(267);
      expect(model.marginOf(width)).assertEqual(16);
      expect(model.gutterOf(width)).assertEqual(12);
      expect(model.itemWidthOf(width) * 2 + 12 <= 546).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency082 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0783
     * @tc.name    JsConsistency083
     * @tc.desc    Cross module consistency at width 607 seed 83
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency083', 0, async function () {
      await yieldThread();
      const width = 607;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('md');
      expect(model.columnsForWidth(width)).assertEqual(3);
      expect(model.itemWidthOf(width)).assertEqual(165);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 3 + 48 <= 543).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency083 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0784
     * @tc.name    JsConsistency084
     * @tc.desc    Cross module consistency at width 636 seed 84
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency084', 0, async function () {
      await yieldThread();
      const width = 636;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('md');
      expect(model.columnsForWidth(width)).assertEqual(3);
      expect(model.itemWidthOf(width)).assertEqual(174);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 3 + 48 <= 572).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency084 done');
    });
}

function CrossModuleConsistencyPart029() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0785
     * @tc.name    JsConsistency085
     * @tc.desc    Cross module consistency at width 665 seed 85
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency085', 0, async function () {
      await yieldThread();
      const width = 665;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('md');
      expect(model.columnsForWidth(width)).assertEqual(3);
      expect(model.itemWidthOf(width)).assertEqual(184);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 3 + 48 <= 601).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency085 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0786
     * @tc.name    JsConsistency086
     * @tc.desc    Cross module consistency at width 694 seed 86
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency086', 0, async function () {
      await yieldThread();
      const width = 694;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('md');
      expect(model.columnsForWidth(width)).assertEqual(3);
      expect(model.itemWidthOf(width)).assertEqual(194);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 3 + 48 <= 630).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency086 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0787
     * @tc.name    JsConsistency087
     * @tc.desc    Cross module consistency at width 723 seed 87
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency087', 0, async function () {
      await yieldThread();
      const width = 723;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('md');
      expect(model.columnsForWidth(width)).assertEqual(3);
      expect(model.itemWidthOf(width)).assertEqual(203);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 3 + 48 <= 659).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency087 done');
    });
}

function CrossModuleConsistencyPart030() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0788
     * @tc.name    JsConsistency088
     * @tc.desc    Cross module consistency at width 752 seed 88
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency088', 0, async function () {
      await yieldThread();
      const width = 752;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('md');
      expect(model.columnsForWidth(width)).assertEqual(3);
      expect(model.itemWidthOf(width)).assertEqual(213);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 3 + 48 <= 688).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency088 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0789
     * @tc.name    JsConsistency089
     * @tc.desc    Cross module consistency at width 781 seed 89
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency089', 0, async function () {
      await yieldThread();
      const width = 781;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('md');
      expect(model.columnsForWidth(width)).assertEqual(3);
      expect(model.itemWidthOf(width)).assertEqual(223);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 3 + 48 <= 717).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency089 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0790
     * @tc.name    JsConsistency090
     * @tc.desc    Cross module consistency at width 810 seed 90
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency090', 0, async function () {
      await yieldThread();
      const width = 810;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('md');
      expect(model.columnsForWidth(width)).assertEqual(3);
      expect(model.itemWidthOf(width)).assertEqual(232);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 3 + 48 <= 746).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency090 done');
    });
}

function CrossModuleConsistencyPart031() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0791
     * @tc.name    JsConsistency091
     * @tc.desc    Cross module consistency at width 839 seed 91
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency091', 0, async function () {
      await yieldThread();
      const width = 839;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('md');
      expect(model.columnsForWidth(width)).assertEqual(3);
      expect(model.itemWidthOf(width)).assertEqual(242);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 3 + 48 <= 775).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency091 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0792
     * @tc.name    JsConsistency092
     * @tc.desc    Cross module consistency at width 868 seed 92
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency092', 0, async function () {
      await yieldThread();
      const width = 868;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsForWidth(width)).assertEqual(4);
      expect(model.itemWidthOf(width)).assertEqual(183);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 4 + 72 <= 804).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency092 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0793
     * @tc.name    JsConsistency093
     * @tc.desc    Cross module consistency at width 897 seed 93
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency093', 0, async function () {
      await yieldThread();
      const width = 897;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsForWidth(width)).assertEqual(4);
      expect(model.itemWidthOf(width)).assertEqual(190);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 4 + 72 <= 833).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency093 done');
    });
}

function CrossModuleConsistencyPart032() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0794
     * @tc.name    JsConsistency094
     * @tc.desc    Cross module consistency at width 926 seed 94
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency094', 0, async function () {
      await yieldThread();
      const width = 926;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsForWidth(width)).assertEqual(4);
      expect(model.itemWidthOf(width)).assertEqual(197);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 4 + 72 <= 862).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency094 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0795
     * @tc.name    JsConsistency095
     * @tc.desc    Cross module consistency at width 955 seed 95
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency095', 0, async function () {
      await yieldThread();
      const width = 955;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsForWidth(width)).assertEqual(4);
      expect(model.itemWidthOf(width)).assertEqual(204);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 4 + 72 <= 891).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency095 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0796
     * @tc.name    JsConsistency096
     * @tc.desc    Cross module consistency at width 984 seed 96
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency096', 0, async function () {
      await yieldThread();
      const width = 984;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsForWidth(width)).assertEqual(4);
      expect(model.itemWidthOf(width)).assertEqual(212);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 4 + 72 <= 920).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency096 done');
    });
}

function CrossModuleConsistencyPart033() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0797
     * @tc.name    JsConsistency097
     * @tc.desc    Cross module consistency at width 1013 seed 97
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency097', 0, async function () {
      await yieldThread();
      const width = 1013;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsForWidth(width)).assertEqual(4);
      expect(model.itemWidthOf(width)).assertEqual(219);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 4 + 72 <= 949).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency097 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0798
     * @tc.name    JsConsistency098
     * @tc.desc    Cross module consistency at width 1042 seed 98
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency098', 0, async function () {
      await yieldThread();
      const width = 1042;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsForWidth(width)).assertEqual(4);
      expect(model.itemWidthOf(width)).assertEqual(226);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 4 + 72 <= 978).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency098 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0799
     * @tc.name    JsConsistency099
     * @tc.desc    Cross module consistency at width 1071 seed 99
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency099', 0, async function () {
      await yieldThread();
      const width = 1071;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsForWidth(width)).assertEqual(4);
      expect(model.itemWidthOf(width)).assertEqual(233);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 4 + 72 <= 1007).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency099 done');
    });
}

function CrossModuleConsistencyPart034() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0800
     * @tc.name    JsConsistency100
     * @tc.desc    Cross module consistency at width 1100 seed 100
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency100', 0, async function () {
      await yieldThread();
      const width = 1100;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsForWidth(width)).assertEqual(4);
      expect(model.itemWidthOf(width)).assertEqual(241);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 4 + 72 <= 1036).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency100 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0801
     * @tc.name    JsConsistency101
     * @tc.desc    Cross module consistency at width 1129 seed 101
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency101', 0, async function () {
      await yieldThread();
      const width = 1129;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsForWidth(width)).assertEqual(4);
      expect(model.itemWidthOf(width)).assertEqual(248);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 4 + 72 <= 1065).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency101 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0802
     * @tc.name    JsConsistency102
     * @tc.desc    Cross module consistency at width 1158 seed 102
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency102', 0, async function () {
      await yieldThread();
      const width = 1158;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsForWidth(width)).assertEqual(4);
      expect(model.itemWidthOf(width)).assertEqual(255);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 4 + 72 <= 1094).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency102 done');
    });
}

function CrossModuleConsistencyPart035() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0803
     * @tc.name    JsConsistency103
     * @tc.desc    Cross module consistency at width 1187 seed 103
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency103', 0, async function () {
      await yieldThread();
      const width = 1187;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsForWidth(width)).assertEqual(4);
      expect(model.itemWidthOf(width)).assertEqual(262);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 4 + 72 <= 1123).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency103 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0804
     * @tc.name    JsConsistency104
     * @tc.desc    Cross module consistency at width 1216 seed 104
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency104', 0, async function () {
      await yieldThread();
      const width = 1216;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsForWidth(width)).assertEqual(4);
      expect(model.itemWidthOf(width)).assertEqual(270);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 4 + 72 <= 1152).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency104 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0805
     * @tc.name    JsConsistency105
     * @tc.desc    Cross module consistency at width 1245 seed 105
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency105', 0, async function () {
      await yieldThread();
      const width = 1245;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsForWidth(width)).assertEqual(4);
      expect(model.itemWidthOf(width)).assertEqual(277);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 4 + 72 <= 1181).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency105 done');
    });
}

function CrossModuleConsistencyPart036() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0806
     * @tc.name    JsConsistency106
     * @tc.desc    Cross module consistency at width 1274 seed 106
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency106', 0, async function () {
      await yieldThread();
      const width = 1274;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsForWidth(width)).assertEqual(4);
      expect(model.itemWidthOf(width)).assertEqual(284);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 4 + 72 <= 1210).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency106 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0807
     * @tc.name    JsConsistency107
     * @tc.desc    Cross module consistency at width 1303 seed 107
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency107', 0, async function () {
      await yieldThread();
      const width = 1303;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsForWidth(width)).assertEqual(4);
      expect(model.itemWidthOf(width)).assertEqual(291);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 4 + 72 <= 1239).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency107 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0808
     * @tc.name    JsConsistency108
     * @tc.desc    Cross module consistency at width 1332 seed 108
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency108', 0, async function () {
      await yieldThread();
      const width = 1332;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsForWidth(width)).assertEqual(4);
      expect(model.itemWidthOf(width)).assertEqual(299);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 4 + 72 <= 1268).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency108 done');
    });
}

function CrossModuleConsistencyPart037() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0809
     * @tc.name    JsConsistency109
     * @tc.desc    Cross module consistency at width 1361 seed 109
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency109', 0, async function () {
      await yieldThread();
      const width = 1361;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsForWidth(width)).assertEqual(4);
      expect(model.itemWidthOf(width)).assertEqual(306);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 4 + 72 <= 1297).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency109 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0810
     * @tc.name    JsConsistency110
     * @tc.desc    Cross module consistency at width 1390 seed 110
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency110', 0, async function () {
      await yieldThread();
      const width = 1390;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsForWidth(width)).assertEqual(4);
      expect(model.itemWidthOf(width)).assertEqual(313);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 4 + 72 <= 1326).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency110 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0811
     * @tc.name    JsConsistency111
     * @tc.desc    Cross module consistency at width 1419 seed 111
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency111', 0, async function () {
      await yieldThread();
      const width = 1419;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsForWidth(width)).assertEqual(4);
      expect(model.itemWidthOf(width)).assertEqual(320);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 4 + 72 <= 1355).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency111 done');
    });
}

function CrossModuleConsistencyPart038() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0812
     * @tc.name    JsConsistency112
     * @tc.desc    Cross module consistency at width 368 seed 112
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency112', 0, async function () {
      await yieldThread();
      const width = 368;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('sm');
      expect(model.columnsForWidth(width)).assertEqual(2);
      expect(model.itemWidthOf(width)).assertEqual(162);
      expect(model.marginOf(width)).assertEqual(16);
      expect(model.gutterOf(width)).assertEqual(12);
      expect(model.itemWidthOf(width) * 2 + 12 <= 336).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency112 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0813
     * @tc.name    JsConsistency113
     * @tc.desc    Cross module consistency at width 397 seed 113
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency113', 0, async function () {
      await yieldThread();
      const width = 397;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('sm');
      expect(model.columnsForWidth(width)).assertEqual(2);
      expect(model.itemWidthOf(width)).assertEqual(176);
      expect(model.marginOf(width)).assertEqual(16);
      expect(model.gutterOf(width)).assertEqual(12);
      expect(model.itemWidthOf(width) * 2 + 12 <= 365).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency113 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0814
     * @tc.name    JsConsistency114
     * @tc.desc    Cross module consistency at width 426 seed 114
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency114', 0, async function () {
      await yieldThread();
      const width = 426;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('sm');
      expect(model.columnsForWidth(width)).assertEqual(2);
      expect(model.itemWidthOf(width)).assertEqual(191);
      expect(model.marginOf(width)).assertEqual(16);
      expect(model.gutterOf(width)).assertEqual(12);
      expect(model.itemWidthOf(width) * 2 + 12 <= 394).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency114 done');
    });
}

function CrossModuleConsistencyPart039() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0815
     * @tc.name    JsConsistency115
     * @tc.desc    Cross module consistency at width 455 seed 115
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency115', 0, async function () {
      await yieldThread();
      const width = 455;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('sm');
      expect(model.columnsForWidth(width)).assertEqual(2);
      expect(model.itemWidthOf(width)).assertEqual(205);
      expect(model.marginOf(width)).assertEqual(16);
      expect(model.gutterOf(width)).assertEqual(12);
      expect(model.itemWidthOf(width) * 2 + 12 <= 423).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency115 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0816
     * @tc.name    JsConsistency116
     * @tc.desc    Cross module consistency at width 484 seed 116
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency116', 0, async function () {
      await yieldThread();
      const width = 484;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('sm');
      expect(model.columnsForWidth(width)).assertEqual(2);
      expect(model.itemWidthOf(width)).assertEqual(220);
      expect(model.marginOf(width)).assertEqual(16);
      expect(model.gutterOf(width)).assertEqual(12);
      expect(model.itemWidthOf(width) * 2 + 12 <= 452).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency116 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0817
     * @tc.name    JsConsistency117
     * @tc.desc    Cross module consistency at width 513 seed 117
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency117', 0, async function () {
      await yieldThread();
      const width = 513;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('sm');
      expect(model.columnsForWidth(width)).assertEqual(2);
      expect(model.itemWidthOf(width)).assertEqual(234);
      expect(model.marginOf(width)).assertEqual(16);
      expect(model.gutterOf(width)).assertEqual(12);
      expect(model.itemWidthOf(width) * 2 + 12 <= 481).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency117 done');
    });
}

function CrossModuleConsistencyPart040() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0818
     * @tc.name    JsConsistency118
     * @tc.desc    Cross module consistency at width 542 seed 118
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency118', 0, async function () {
      await yieldThread();
      const width = 542;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('sm');
      expect(model.columnsForWidth(width)).assertEqual(2);
      expect(model.itemWidthOf(width)).assertEqual(249);
      expect(model.marginOf(width)).assertEqual(16);
      expect(model.gutterOf(width)).assertEqual(12);
      expect(model.itemWidthOf(width) * 2 + 12 <= 510).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency118 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0819
     * @tc.name    JsConsistency119
     * @tc.desc    Cross module consistency at width 571 seed 119
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency119', 0, async function () {
      await yieldThread();
      const width = 571;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('sm');
      expect(model.columnsForWidth(width)).assertEqual(2);
      expect(model.itemWidthOf(width)).assertEqual(263);
      expect(model.marginOf(width)).assertEqual(16);
      expect(model.gutterOf(width)).assertEqual(12);
      expect(model.itemWidthOf(width) * 2 + 12 <= 539).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency119 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0820
     * @tc.name    JsConsistency120
     * @tc.desc    Cross module consistency at width 600 seed 120
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency120', 0, async function () {
      await yieldThread();
      const width = 600;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('md');
      expect(model.columnsForWidth(width)).assertEqual(3);
      expect(model.itemWidthOf(width)).assertEqual(162);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 3 + 48 <= 536).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency120 done');
    });
}

function CrossModuleConsistencyPart041() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0821
     * @tc.name    JsConsistency121
     * @tc.desc    Cross module consistency at width 629 seed 121
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency121', 0, async function () {
      await yieldThread();
      const width = 629;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('md');
      expect(model.columnsForWidth(width)).assertEqual(3);
      expect(model.itemWidthOf(width)).assertEqual(172);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 3 + 48 <= 565).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency121 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0822
     * @tc.name    JsConsistency122
     * @tc.desc    Cross module consistency at width 658 seed 122
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency122', 0, async function () {
      await yieldThread();
      const width = 658;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('md');
      expect(model.columnsForWidth(width)).assertEqual(3);
      expect(model.itemWidthOf(width)).assertEqual(182);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 3 + 48 <= 594).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency122 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0823
     * @tc.name    JsConsistency123
     * @tc.desc    Cross module consistency at width 687 seed 123
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency123', 0, async function () {
      await yieldThread();
      const width = 687;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('md');
      expect(model.columnsForWidth(width)).assertEqual(3);
      expect(model.itemWidthOf(width)).assertEqual(191);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 3 + 48 <= 623).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency123 done');
    });
}

function CrossModuleConsistencyPart042() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0824
     * @tc.name    JsConsistency124
     * @tc.desc    Cross module consistency at width 716 seed 124
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency124', 0, async function () {
      await yieldThread();
      const width = 716;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('md');
      expect(model.columnsForWidth(width)).assertEqual(3);
      expect(model.itemWidthOf(width)).assertEqual(201);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 3 + 48 <= 652).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency124 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0825
     * @tc.name    JsConsistency125
     * @tc.desc    Cross module consistency at width 745 seed 125
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency125', 0, async function () {
      await yieldThread();
      const width = 745;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('md');
      expect(model.columnsForWidth(width)).assertEqual(3);
      expect(model.itemWidthOf(width)).assertEqual(211);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 3 + 48 <= 681).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency125 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0826
     * @tc.name    JsConsistency126
     * @tc.desc    Cross module consistency at width 774 seed 126
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency126', 0, async function () {
      await yieldThread();
      const width = 774;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('md');
      expect(model.columnsForWidth(width)).assertEqual(3);
      expect(model.itemWidthOf(width)).assertEqual(220);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 3 + 48 <= 710).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency126 done');
    });
}

function CrossModuleConsistencyPart043() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0827
     * @tc.name    JsConsistency127
     * @tc.desc    Cross module consistency at width 803 seed 127
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency127', 0, async function () {
      await yieldThread();
      const width = 803;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('md');
      expect(model.columnsForWidth(width)).assertEqual(3);
      expect(model.itemWidthOf(width)).assertEqual(230);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 3 + 48 <= 739).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency127 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0828
     * @tc.name    JsConsistency128
     * @tc.desc    Cross module consistency at width 832 seed 128
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency128', 0, async function () {
      await yieldThread();
      const width = 832;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('md');
      expect(model.columnsForWidth(width)).assertEqual(3);
      expect(model.itemWidthOf(width)).assertEqual(240);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 3 + 48 <= 768).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency128 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0829
     * @tc.name    JsConsistency129
     * @tc.desc    Cross module consistency at width 861 seed 129
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency129', 0, async function () {
      await yieldThread();
      const width = 861;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsForWidth(width)).assertEqual(4);
      expect(model.itemWidthOf(width)).assertEqual(181);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 4 + 72 <= 797).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency129 done');
    });
}

function CrossModuleConsistencyPart044() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0830
     * @tc.name    JsConsistency130
     * @tc.desc    Cross module consistency at width 890 seed 130
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency130', 0, async function () {
      await yieldThread();
      const width = 890;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsForWidth(width)).assertEqual(4);
      expect(model.itemWidthOf(width)).assertEqual(188);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 4 + 72 <= 826).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency130 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0831
     * @tc.name    JsConsistency131
     * @tc.desc    Cross module consistency at width 919 seed 131
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency131', 0, async function () {
      await yieldThread();
      const width = 919;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsForWidth(width)).assertEqual(4);
      expect(model.itemWidthOf(width)).assertEqual(195);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 4 + 72 <= 855).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency131 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0832
     * @tc.name    JsConsistency132
     * @tc.desc    Cross module consistency at width 948 seed 132
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency132', 0, async function () {
      await yieldThread();
      const width = 948;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsForWidth(width)).assertEqual(4);
      expect(model.itemWidthOf(width)).assertEqual(203);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 4 + 72 <= 884).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency132 done');
    });
}

function CrossModuleConsistencyPart045() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0833
     * @tc.name    JsConsistency133
     * @tc.desc    Cross module consistency at width 977 seed 133
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency133', 0, async function () {
      await yieldThread();
      const width = 977;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsForWidth(width)).assertEqual(4);
      expect(model.itemWidthOf(width)).assertEqual(210);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 4 + 72 <= 913).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency133 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0834
     * @tc.name    JsConsistency134
     * @tc.desc    Cross module consistency at width 1006 seed 134
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency134', 0, async function () {
      await yieldThread();
      const width = 1006;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsForWidth(width)).assertEqual(4);
      expect(model.itemWidthOf(width)).assertEqual(217);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 4 + 72 <= 942).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency134 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0835
     * @tc.name    JsConsistency135
     * @tc.desc    Cross module consistency at width 1035 seed 135
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency135', 0, async function () {
      await yieldThread();
      const width = 1035;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsForWidth(width)).assertEqual(4);
      expect(model.itemWidthOf(width)).assertEqual(224);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 4 + 72 <= 971).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency135 done');
    });
}

function CrossModuleConsistencyPart046() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0836
     * @tc.name    JsConsistency136
     * @tc.desc    Cross module consistency at width 1064 seed 136
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency136', 0, async function () {
      await yieldThread();
      const width = 1064;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsForWidth(width)).assertEqual(4);
      expect(model.itemWidthOf(width)).assertEqual(232);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 4 + 72 <= 1000).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency136 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0837
     * @tc.name    JsConsistency137
     * @tc.desc    Cross module consistency at width 1093 seed 137
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency137', 0, async function () {
      await yieldThread();
      const width = 1093;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsForWidth(width)).assertEqual(4);
      expect(model.itemWidthOf(width)).assertEqual(239);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 4 + 72 <= 1029).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency137 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0838
     * @tc.name    JsConsistency138
     * @tc.desc    Cross module consistency at width 1122 seed 138
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency138', 0, async function () {
      await yieldThread();
      const width = 1122;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsForWidth(width)).assertEqual(4);
      expect(model.itemWidthOf(width)).assertEqual(246);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 4 + 72 <= 1058).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency138 done');
    });
}

function CrossModuleConsistencyPart047() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0839
     * @tc.name    JsConsistency139
     * @tc.desc    Cross module consistency at width 1151 seed 139
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency139', 0, async function () {
      await yieldThread();
      const width = 1151;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsForWidth(width)).assertEqual(4);
      expect(model.itemWidthOf(width)).assertEqual(253);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 4 + 72 <= 1087).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency139 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0840
     * @tc.name    JsConsistency140
     * @tc.desc    Cross module consistency at width 1180 seed 140
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsConsistency140', 0, async function () {
      await yieldThread();
      const width = 1180;
      const bp = model.breakpointOf(width);
      expect(bp).assertEqual('lg');
      expect(model.columnsForWidth(width)).assertEqual(4);
      expect(model.itemWidthOf(width)).assertEqual(261);
      expect(model.marginOf(width)).assertEqual(32);
      expect(model.gutterOf(width)).assertEqual(24);
      expect(model.itemWidthOf(width) * 4 + 72 <= 1116).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsConsistency140 done');
    });
}

function CrossModuleConsistencyGroup001() {
  CrossModuleConsistencyPart001();
  CrossModuleConsistencyPart002();
  CrossModuleConsistencyPart003();
  CrossModuleConsistencyPart004();
  CrossModuleConsistencyPart005();
  CrossModuleConsistencyPart006();
  CrossModuleConsistencyPart007();
  CrossModuleConsistencyPart008();
  CrossModuleConsistencyPart009();
  CrossModuleConsistencyPart010();
  CrossModuleConsistencyPart011();
  CrossModuleConsistencyPart012();
  CrossModuleConsistencyPart013();
  CrossModuleConsistencyPart014();
  CrossModuleConsistencyPart015();
  CrossModuleConsistencyPart016();
  CrossModuleConsistencyPart017();
  CrossModuleConsistencyPart018();
  CrossModuleConsistencyPart019();
  CrossModuleConsistencyPart020();
  CrossModuleConsistencyPart021();
  CrossModuleConsistencyPart022();
  CrossModuleConsistencyPart023();
  CrossModuleConsistencyPart024();
  CrossModuleConsistencyPart025();
  CrossModuleConsistencyPart026();
  CrossModuleConsistencyPart027();
  CrossModuleConsistencyPart028();
  CrossModuleConsistencyPart029();
  CrossModuleConsistencyPart030();
  CrossModuleConsistencyPart031();
  CrossModuleConsistencyPart032();
  CrossModuleConsistencyPart033();
  CrossModuleConsistencyPart034();
  CrossModuleConsistencyPart035();
  CrossModuleConsistencyPart036();
  CrossModuleConsistencyPart037();
  CrossModuleConsistencyPart038();
  CrossModuleConsistencyPart039();
  CrossModuleConsistencyPart040();
}

function CrossModuleConsistencyGroup002() {
  CrossModuleConsistencyPart041();
  CrossModuleConsistencyPart042();
  CrossModuleConsistencyPart043();
  CrossModuleConsistencyPart044();
  CrossModuleConsistencyPart045();
  CrossModuleConsistencyPart046();
  CrossModuleConsistencyPart047();
}

export default function crossModuleConsistencySuite() {
  describe('CrossModuleConsistencySuite', function () {
    CrossModuleConsistencyGroup001();
    CrossModuleConsistencyGroup002();
  });
}
