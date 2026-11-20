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

function RepeatedLayoutStabilityPart001() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0981
     * @tc.name    JsStability001
     * @tc.desc    Repeated layout for width 361 stays 158 seed 1
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability001', 0, async function () {
      await yieldThread();
      const width = 361;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(158);
      expect(model.breakpointOf(width)).assertEqual('sm');
      expect(model.contentWidthOf(width)).assertEqual(329);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability001 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0982
     * @tc.name    JsStability002
     * @tc.desc    Repeated layout for width 402 stays 179 seed 2
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability002', 0, async function () {
      await yieldThread();
      const width = 402;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(179);
      expect(model.breakpointOf(width)).assertEqual('sm');
      expect(model.contentWidthOf(width)).assertEqual(370);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability002 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0983
     * @tc.name    JsStability003
     * @tc.desc    Repeated layout for width 443 stays 199 seed 3
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability003', 0, async function () {
      await yieldThread();
      const width = 443;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(199);
      expect(model.breakpointOf(width)).assertEqual('sm');
      expect(model.contentWidthOf(width)).assertEqual(411);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability003 done');
    });
}

function RepeatedLayoutStabilityPart002() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0984
     * @tc.name    JsStability004
     * @tc.desc    Repeated layout for width 484 stays 220 seed 4
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability004', 0, async function () {
      await yieldThread();
      const width = 484;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(220);
      expect(model.breakpointOf(width)).assertEqual('sm');
      expect(model.contentWidthOf(width)).assertEqual(452);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability004 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0985
     * @tc.name    JsStability005
     * @tc.desc    Repeated layout for width 525 stays 240 seed 5
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability005', 0, async function () {
      await yieldThread();
      const width = 525;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(240);
      expect(model.breakpointOf(width)).assertEqual('sm');
      expect(model.contentWidthOf(width)).assertEqual(493);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability005 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0986
     * @tc.name    JsStability006
     * @tc.desc    Repeated layout for width 566 stays 261 seed 6
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability006', 0, async function () {
      await yieldThread();
      const width = 566;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(261);
      expect(model.breakpointOf(width)).assertEqual('sm');
      expect(model.contentWidthOf(width)).assertEqual(534);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability006 done');
    });
}

function RepeatedLayoutStabilityPart003() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0987
     * @tc.name    JsStability007
     * @tc.desc    Repeated layout for width 607 stays 165 seed 7
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability007', 0, async function () {
      await yieldThread();
      const width = 607;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(165);
      expect(model.breakpointOf(width)).assertEqual('md');
      expect(model.contentWidthOf(width)).assertEqual(543);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability007 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0988
     * @tc.name    JsStability008
     * @tc.desc    Repeated layout for width 648 stays 178 seed 8
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability008', 0, async function () {
      await yieldThread();
      const width = 648;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(178);
      expect(model.breakpointOf(width)).assertEqual('md');
      expect(model.contentWidthOf(width)).assertEqual(584);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability008 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0989
     * @tc.name    JsStability009
     * @tc.desc    Repeated layout for width 689 stays 192 seed 9
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability009', 0, async function () {
      await yieldThread();
      const width = 689;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(192);
      expect(model.breakpointOf(width)).assertEqual('md');
      expect(model.contentWidthOf(width)).assertEqual(625);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability009 done');
    });
}

function RepeatedLayoutStabilityPart004() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0990
     * @tc.name    JsStability010
     * @tc.desc    Repeated layout for width 730 stays 206 seed 10
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability010', 0, async function () {
      await yieldThread();
      const width = 730;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(206);
      expect(model.breakpointOf(width)).assertEqual('md');
      expect(model.contentWidthOf(width)).assertEqual(666);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability010 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0991
     * @tc.name    JsStability011
     * @tc.desc    Repeated layout for width 771 stays 219 seed 11
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability011', 0, async function () {
      await yieldThread();
      const width = 771;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(219);
      expect(model.breakpointOf(width)).assertEqual('md');
      expect(model.contentWidthOf(width)).assertEqual(707);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability011 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0992
     * @tc.name    JsStability012
     * @tc.desc    Repeated layout for width 812 stays 233 seed 12
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability012', 0, async function () {
      await yieldThread();
      const width = 812;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(233);
      expect(model.breakpointOf(width)).assertEqual('md');
      expect(model.contentWidthOf(width)).assertEqual(748);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability012 done');
    });
}

function RepeatedLayoutStabilityPart005() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0993
     * @tc.name    JsStability013
     * @tc.desc    Repeated layout for width 853 stays 179 seed 13
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability013', 0, async function () {
      await yieldThread();
      const width = 853;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(179);
      expect(model.breakpointOf(width)).assertEqual('lg');
      expect(model.contentWidthOf(width)).assertEqual(789);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability013 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0994
     * @tc.name    JsStability014
     * @tc.desc    Repeated layout for width 894 stays 189 seed 14
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability014', 0, async function () {
      await yieldThread();
      const width = 894;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(189);
      expect(model.breakpointOf(width)).assertEqual('lg');
      expect(model.contentWidthOf(width)).assertEqual(830);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability014 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0995
     * @tc.name    JsStability015
     * @tc.desc    Repeated layout for width 935 stays 199 seed 15
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability015', 0, async function () {
      await yieldThread();
      const width = 935;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(199);
      expect(model.breakpointOf(width)).assertEqual('lg');
      expect(model.contentWidthOf(width)).assertEqual(871);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability015 done');
    });
}

function RepeatedLayoutStabilityPart006() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0996
     * @tc.name    JsStability016
     * @tc.desc    Repeated layout for width 976 stays 210 seed 16
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability016', 0, async function () {
      await yieldThread();
      const width = 976;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(210);
      expect(model.breakpointOf(width)).assertEqual('lg');
      expect(model.contentWidthOf(width)).assertEqual(912);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability016 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0997
     * @tc.name    JsStability017
     * @tc.desc    Repeated layout for width 1017 stays 220 seed 17
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability017', 0, async function () {
      await yieldThread();
      const width = 1017;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(220);
      expect(model.breakpointOf(width)).assertEqual('lg');
      expect(model.contentWidthOf(width)).assertEqual(953);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability017 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0998
     * @tc.name    JsStability018
     * @tc.desc    Repeated layout for width 1058 stays 230 seed 18
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability018', 0, async function () {
      await yieldThread();
      const width = 1058;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(230);
      expect(model.breakpointOf(width)).assertEqual('lg');
      expect(model.contentWidthOf(width)).assertEqual(994);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability018 done');
    });
}

function RepeatedLayoutStabilityPart007() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0999
     * @tc.name    JsStability019
     * @tc.desc    Repeated layout for width 1099 stays 240 seed 19
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability019', 0, async function () {
      await yieldThread();
      const width = 1099;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(240);
      expect(model.breakpointOf(width)).assertEqual('lg');
      expect(model.contentWidthOf(width)).assertEqual(1035);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability019 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1000
     * @tc.name    JsStability020
     * @tc.desc    Repeated layout for width 1140 stays 251 seed 20
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability020', 0, async function () {
      await yieldThread();
      const width = 1140;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(251);
      expect(model.breakpointOf(width)).assertEqual('lg');
      expect(model.contentWidthOf(width)).assertEqual(1076);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability020 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1001
     * @tc.name    JsStability021
     * @tc.desc    Repeated layout for width 1181 stays 261 seed 21
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability021', 0, async function () {
      await yieldThread();
      const width = 1181;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(261);
      expect(model.breakpointOf(width)).assertEqual('lg');
      expect(model.contentWidthOf(width)).assertEqual(1117);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability021 done');
    });
}

function RepeatedLayoutStabilityPart008() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1002
     * @tc.name    JsStability022
     * @tc.desc    Repeated layout for width 1222 stays 271 seed 22
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability022', 0, async function () {
      await yieldThread();
      const width = 1222;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(271);
      expect(model.breakpointOf(width)).assertEqual('lg');
      expect(model.contentWidthOf(width)).assertEqual(1158);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability022 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1003
     * @tc.name    JsStability023
     * @tc.desc    Repeated layout for width 1263 stays 281 seed 23
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability023', 0, async function () {
      await yieldThread();
      const width = 1263;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(281);
      expect(model.breakpointOf(width)).assertEqual('lg');
      expect(model.contentWidthOf(width)).assertEqual(1199);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability023 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1004
     * @tc.name    JsStability024
     * @tc.desc    Repeated layout for width 1304 stays 292 seed 24
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability024', 0, async function () {
      await yieldThread();
      const width = 1304;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(292);
      expect(model.breakpointOf(width)).assertEqual('lg');
      expect(model.contentWidthOf(width)).assertEqual(1240);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability024 done');
    });
}

function RepeatedLayoutStabilityPart009() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1005
     * @tc.name    JsStability025
     * @tc.desc    Repeated layout for width 1345 stays 302 seed 25
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability025', 0, async function () {
      await yieldThread();
      const width = 1345;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(302);
      expect(model.breakpointOf(width)).assertEqual('lg');
      expect(model.contentWidthOf(width)).assertEqual(1281);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability025 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1006
     * @tc.name    JsStability026
     * @tc.desc    Repeated layout for width 1386 stays 312 seed 26
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability026', 0, async function () {
      await yieldThread();
      const width = 1386;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(312);
      expect(model.breakpointOf(width)).assertEqual('lg');
      expect(model.contentWidthOf(width)).assertEqual(1322);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability026 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1007
     * @tc.name    JsStability027
     * @tc.desc    Repeated layout for width 1427 stays 322 seed 27
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability027', 0, async function () {
      await yieldThread();
      const width = 1427;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(322);
      expect(model.breakpointOf(width)).assertEqual('lg');
      expect(model.contentWidthOf(width)).assertEqual(1363);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability027 done');
    });
}

function RepeatedLayoutStabilityPart010() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1008
     * @tc.name    JsStability028
     * @tc.desc    Repeated layout for width 348 stays 152 seed 28
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability028', 0, async function () {
      await yieldThread();
      const width = 348;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(152);
      expect(model.breakpointOf(width)).assertEqual('sm');
      expect(model.contentWidthOf(width)).assertEqual(316);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability028 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1009
     * @tc.name    JsStability029
     * @tc.desc    Repeated layout for width 389 stays 172 seed 29
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability029', 0, async function () {
      await yieldThread();
      const width = 389;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(172);
      expect(model.breakpointOf(width)).assertEqual('sm');
      expect(model.contentWidthOf(width)).assertEqual(357);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability029 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1010
     * @tc.name    JsStability030
     * @tc.desc    Repeated layout for width 430 stays 193 seed 30
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability030', 0, async function () {
      await yieldThread();
      const width = 430;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(193);
      expect(model.breakpointOf(width)).assertEqual('sm');
      expect(model.contentWidthOf(width)).assertEqual(398);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability030 done');
    });
}

function RepeatedLayoutStabilityPart011() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1011
     * @tc.name    JsStability031
     * @tc.desc    Repeated layout for width 471 stays 213 seed 31
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability031', 0, async function () {
      await yieldThread();
      const width = 471;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(213);
      expect(model.breakpointOf(width)).assertEqual('sm');
      expect(model.contentWidthOf(width)).assertEqual(439);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability031 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1012
     * @tc.name    JsStability032
     * @tc.desc    Repeated layout for width 512 stays 234 seed 32
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability032', 0, async function () {
      await yieldThread();
      const width = 512;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(234);
      expect(model.breakpointOf(width)).assertEqual('sm');
      expect(model.contentWidthOf(width)).assertEqual(480);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability032 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1013
     * @tc.name    JsStability033
     * @tc.desc    Repeated layout for width 553 stays 254 seed 33
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability033', 0, async function () {
      await yieldThread();
      const width = 553;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(254);
      expect(model.breakpointOf(width)).assertEqual('sm');
      expect(model.contentWidthOf(width)).assertEqual(521);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability033 done');
    });
}

function RepeatedLayoutStabilityPart012() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1014
     * @tc.name    JsStability034
     * @tc.desc    Repeated layout for width 594 stays 275 seed 34
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability034', 0, async function () {
      await yieldThread();
      const width = 594;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(275);
      expect(model.breakpointOf(width)).assertEqual('sm');
      expect(model.contentWidthOf(width)).assertEqual(562);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability034 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1015
     * @tc.name    JsStability035
     * @tc.desc    Repeated layout for width 635 stays 174 seed 35
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability035', 0, async function () {
      await yieldThread();
      const width = 635;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(174);
      expect(model.breakpointOf(width)).assertEqual('md');
      expect(model.contentWidthOf(width)).assertEqual(571);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability035 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1016
     * @tc.name    JsStability036
     * @tc.desc    Repeated layout for width 676 stays 188 seed 36
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability036', 0, async function () {
      await yieldThread();
      const width = 676;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(188);
      expect(model.breakpointOf(width)).assertEqual('md');
      expect(model.contentWidthOf(width)).assertEqual(612);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability036 done');
    });
}

function RepeatedLayoutStabilityPart013() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1017
     * @tc.name    JsStability037
     * @tc.desc    Repeated layout for width 717 stays 201 seed 37
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability037', 0, async function () {
      await yieldThread();
      const width = 717;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(201);
      expect(model.breakpointOf(width)).assertEqual('md');
      expect(model.contentWidthOf(width)).assertEqual(653);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability037 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1018
     * @tc.name    JsStability038
     * @tc.desc    Repeated layout for width 758 stays 215 seed 38
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability038', 0, async function () {
      await yieldThread();
      const width = 758;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(215);
      expect(model.breakpointOf(width)).assertEqual('md');
      expect(model.contentWidthOf(width)).assertEqual(694);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability038 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1019
     * @tc.name    JsStability039
     * @tc.desc    Repeated layout for width 799 stays 229 seed 39
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability039', 0, async function () {
      await yieldThread();
      const width = 799;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(229);
      expect(model.breakpointOf(width)).assertEqual('md');
      expect(model.contentWidthOf(width)).assertEqual(735);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability039 done');
    });
}

function RepeatedLayoutStabilityPart014() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1020
     * @tc.name    JsStability040
     * @tc.desc    Repeated layout for width 840 stays 176 seed 40
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability040', 0, async function () {
      await yieldThread();
      const width = 840;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(176);
      expect(model.breakpointOf(width)).assertEqual('lg');
      expect(model.contentWidthOf(width)).assertEqual(776);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability040 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1021
     * @tc.name    JsStability041
     * @tc.desc    Repeated layout for width 881 stays 186 seed 41
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability041', 0, async function () {
      await yieldThread();
      const width = 881;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(186);
      expect(model.breakpointOf(width)).assertEqual('lg');
      expect(model.contentWidthOf(width)).assertEqual(817);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability041 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1022
     * @tc.name    JsStability042
     * @tc.desc    Repeated layout for width 922 stays 196 seed 42
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability042', 0, async function () {
      await yieldThread();
      const width = 922;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(196);
      expect(model.breakpointOf(width)).assertEqual('lg');
      expect(model.contentWidthOf(width)).assertEqual(858);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability042 done');
    });
}

function RepeatedLayoutStabilityPart015() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1023
     * @tc.name    JsStability043
     * @tc.desc    Repeated layout for width 963 stays 206 seed 43
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability043', 0, async function () {
      await yieldThread();
      const width = 963;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(206);
      expect(model.breakpointOf(width)).assertEqual('lg');
      expect(model.contentWidthOf(width)).assertEqual(899);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability043 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1024
     * @tc.name    JsStability044
     * @tc.desc    Repeated layout for width 1004 stays 217 seed 44
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability044', 0, async function () {
      await yieldThread();
      const width = 1004;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(217);
      expect(model.breakpointOf(width)).assertEqual('lg');
      expect(model.contentWidthOf(width)).assertEqual(940);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability044 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1025
     * @tc.name    JsStability045
     * @tc.desc    Repeated layout for width 1045 stays 227 seed 45
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability045', 0, async function () {
      await yieldThread();
      const width = 1045;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(227);
      expect(model.breakpointOf(width)).assertEqual('lg');
      expect(model.contentWidthOf(width)).assertEqual(981);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability045 done');
    });
}

function RepeatedLayoutStabilityPart016() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1026
     * @tc.name    JsStability046
     * @tc.desc    Repeated layout for width 1086 stays 237 seed 46
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability046', 0, async function () {
      await yieldThread();
      const width = 1086;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(237);
      expect(model.breakpointOf(width)).assertEqual('lg');
      expect(model.contentWidthOf(width)).assertEqual(1022);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability046 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1027
     * @tc.name    JsStability047
     * @tc.desc    Repeated layout for width 1127 stays 247 seed 47
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability047', 0, async function () {
      await yieldThread();
      const width = 1127;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(247);
      expect(model.breakpointOf(width)).assertEqual('lg');
      expect(model.contentWidthOf(width)).assertEqual(1063);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability047 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1028
     * @tc.name    JsStability048
     * @tc.desc    Repeated layout for width 1168 stays 258 seed 48
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability048', 0, async function () {
      await yieldThread();
      const width = 1168;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(258);
      expect(model.breakpointOf(width)).assertEqual('lg');
      expect(model.contentWidthOf(width)).assertEqual(1104);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability048 done');
    });
}

function RepeatedLayoutStabilityPart017() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1029
     * @tc.name    JsStability049
     * @tc.desc    Repeated layout for width 1209 stays 268 seed 49
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability049', 0, async function () {
      await yieldThread();
      const width = 1209;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(268);
      expect(model.breakpointOf(width)).assertEqual('lg');
      expect(model.contentWidthOf(width)).assertEqual(1145);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability049 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1030
     * @tc.name    JsStability050
     * @tc.desc    Repeated layout for width 1250 stays 278 seed 50
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability050', 0, async function () {
      await yieldThread();
      const width = 1250;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(278);
      expect(model.breakpointOf(width)).assertEqual('lg');
      expect(model.contentWidthOf(width)).assertEqual(1186);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability050 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1031
     * @tc.name    JsStability051
     * @tc.desc    Repeated layout for width 1291 stays 288 seed 51
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability051', 0, async function () {
      await yieldThread();
      const width = 1291;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(288);
      expect(model.breakpointOf(width)).assertEqual('lg');
      expect(model.contentWidthOf(width)).assertEqual(1227);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability051 done');
    });
}

function RepeatedLayoutStabilityPart018() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1032
     * @tc.name    JsStability052
     * @tc.desc    Repeated layout for width 1332 stays 299 seed 52
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability052', 0, async function () {
      await yieldThread();
      const width = 1332;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(299);
      expect(model.breakpointOf(width)).assertEqual('lg');
      expect(model.contentWidthOf(width)).assertEqual(1268);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability052 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1033
     * @tc.name    JsStability053
     * @tc.desc    Repeated layout for width 1373 stays 309 seed 53
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability053', 0, async function () {
      await yieldThread();
      const width = 1373;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(309);
      expect(model.breakpointOf(width)).assertEqual('lg');
      expect(model.contentWidthOf(width)).assertEqual(1309);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability053 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1034
     * @tc.name    JsStability054
     * @tc.desc    Repeated layout for width 1414 stays 319 seed 54
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability054', 0, async function () {
      await yieldThread();
      const width = 1414;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(319);
      expect(model.breakpointOf(width)).assertEqual('lg');
      expect(model.contentWidthOf(width)).assertEqual(1350);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability054 done');
    });
}

function RepeatedLayoutStabilityPart019() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1035
     * @tc.name    JsStability055
     * @tc.desc    Repeated layout for width 335 stays 145 seed 55
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability055', 0, async function () {
      await yieldThread();
      const width = 335;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(145);
      expect(model.breakpointOf(width)).assertEqual('sm');
      expect(model.contentWidthOf(width)).assertEqual(303);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability055 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1036
     * @tc.name    JsStability056
     * @tc.desc    Repeated layout for width 376 stays 166 seed 56
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability056', 0, async function () {
      await yieldThread();
      const width = 376;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(166);
      expect(model.breakpointOf(width)).assertEqual('sm');
      expect(model.contentWidthOf(width)).assertEqual(344);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability056 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1037
     * @tc.name    JsStability057
     * @tc.desc    Repeated layout for width 417 stays 186 seed 57
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability057', 0, async function () {
      await yieldThread();
      const width = 417;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(186);
      expect(model.breakpointOf(width)).assertEqual('sm');
      expect(model.contentWidthOf(width)).assertEqual(385);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability057 done');
    });
}

function RepeatedLayoutStabilityPart020() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1038
     * @tc.name    JsStability058
     * @tc.desc    Repeated layout for width 458 stays 207 seed 58
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability058', 0, async function () {
      await yieldThread();
      const width = 458;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(207);
      expect(model.breakpointOf(width)).assertEqual('sm');
      expect(model.contentWidthOf(width)).assertEqual(426);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability058 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1039
     * @tc.name    JsStability059
     * @tc.desc    Repeated layout for width 499 stays 227 seed 59
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability059', 0, async function () {
      await yieldThread();
      const width = 499;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(227);
      expect(model.breakpointOf(width)).assertEqual('sm');
      expect(model.contentWidthOf(width)).assertEqual(467);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability059 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1040
     * @tc.name    JsStability060
     * @tc.desc    Repeated layout for width 540 stays 248 seed 60
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability060', 0, async function () {
      await yieldThread();
      const width = 540;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(248);
      expect(model.breakpointOf(width)).assertEqual('sm');
      expect(model.contentWidthOf(width)).assertEqual(508);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability060 done');
    });
}

function RepeatedLayoutStabilityPart021() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1041
     * @tc.name    JsStability061
     * @tc.desc    Repeated layout for width 581 stays 268 seed 61
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability061', 0, async function () {
      await yieldThread();
      const width = 581;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(268);
      expect(model.breakpointOf(width)).assertEqual('sm');
      expect(model.contentWidthOf(width)).assertEqual(549);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability061 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1042
     * @tc.name    JsStability062
     * @tc.desc    Repeated layout for width 622 stays 170 seed 62
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability062', 0, async function () {
      await yieldThread();
      const width = 622;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(170);
      expect(model.breakpointOf(width)).assertEqual('md');
      expect(model.contentWidthOf(width)).assertEqual(558);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability062 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1043
     * @tc.name    JsStability063
     * @tc.desc    Repeated layout for width 663 stays 183 seed 63
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability063', 0, async function () {
      await yieldThread();
      const width = 663;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(183);
      expect(model.breakpointOf(width)).assertEqual('md');
      expect(model.contentWidthOf(width)).assertEqual(599);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability063 done');
    });
}

function RepeatedLayoutStabilityPart022() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1044
     * @tc.name    JsStability064
     * @tc.desc    Repeated layout for width 704 stays 197 seed 64
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability064', 0, async function () {
      await yieldThread();
      const width = 704;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(197);
      expect(model.breakpointOf(width)).assertEqual('md');
      expect(model.contentWidthOf(width)).assertEqual(640);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability064 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1045
     * @tc.name    JsStability065
     * @tc.desc    Repeated layout for width 745 stays 211 seed 65
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability065', 0, async function () {
      await yieldThread();
      const width = 745;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(211);
      expect(model.breakpointOf(width)).assertEqual('md');
      expect(model.contentWidthOf(width)).assertEqual(681);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability065 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1046
     * @tc.name    JsStability066
     * @tc.desc    Repeated layout for width 786 stays 224 seed 66
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability066', 0, async function () {
      await yieldThread();
      const width = 786;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(224);
      expect(model.breakpointOf(width)).assertEqual('md');
      expect(model.contentWidthOf(width)).assertEqual(722);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability066 done');
    });
}

function RepeatedLayoutStabilityPart023() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1047
     * @tc.name    JsStability067
     * @tc.desc    Repeated layout for width 827 stays 238 seed 67
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability067', 0, async function () {
      await yieldThread();
      const width = 827;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(238);
      expect(model.breakpointOf(width)).assertEqual('md');
      expect(model.contentWidthOf(width)).assertEqual(763);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability067 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1048
     * @tc.name    JsStability068
     * @tc.desc    Repeated layout for width 868 stays 183 seed 68
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability068', 0, async function () {
      await yieldThread();
      const width = 868;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(183);
      expect(model.breakpointOf(width)).assertEqual('lg');
      expect(model.contentWidthOf(width)).assertEqual(804);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability068 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1049
     * @tc.name    JsStability069
     * @tc.desc    Repeated layout for width 909 stays 193 seed 69
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability069', 0, async function () {
      await yieldThread();
      const width = 909;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(193);
      expect(model.breakpointOf(width)).assertEqual('lg');
      expect(model.contentWidthOf(width)).assertEqual(845);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability069 done');
    });
}

function RepeatedLayoutStabilityPart024() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1050
     * @tc.name    JsStability070
     * @tc.desc    Repeated layout for width 950 stays 203 seed 70
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability070', 0, async function () {
      await yieldThread();
      const width = 950;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(203);
      expect(model.breakpointOf(width)).assertEqual('lg');
      expect(model.contentWidthOf(width)).assertEqual(886);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability070 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1051
     * @tc.name    JsStability071
     * @tc.desc    Repeated layout for width 991 stays 213 seed 71
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability071', 0, async function () {
      await yieldThread();
      const width = 991;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(213);
      expect(model.breakpointOf(width)).assertEqual('lg');
      expect(model.contentWidthOf(width)).assertEqual(927);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability071 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1052
     * @tc.name    JsStability072
     * @tc.desc    Repeated layout for width 1032 stays 224 seed 72
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability072', 0, async function () {
      await yieldThread();
      const width = 1032;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(224);
      expect(model.breakpointOf(width)).assertEqual('lg');
      expect(model.contentWidthOf(width)).assertEqual(968);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability072 done');
    });
}

function RepeatedLayoutStabilityPart025() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1053
     * @tc.name    JsStability073
     * @tc.desc    Repeated layout for width 1073 stays 234 seed 73
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability073', 0, async function () {
      await yieldThread();
      const width = 1073;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(234);
      expect(model.breakpointOf(width)).assertEqual('lg');
      expect(model.contentWidthOf(width)).assertEqual(1009);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability073 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1054
     * @tc.name    JsStability074
     * @tc.desc    Repeated layout for width 1114 stays 244 seed 74
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability074', 0, async function () {
      await yieldThread();
      const width = 1114;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(244);
      expect(model.breakpointOf(width)).assertEqual('lg');
      expect(model.contentWidthOf(width)).assertEqual(1050);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability074 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1055
     * @tc.name    JsStability075
     * @tc.desc    Repeated layout for width 1155 stays 254 seed 75
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability075', 0, async function () {
      await yieldThread();
      const width = 1155;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(254);
      expect(model.breakpointOf(width)).assertEqual('lg');
      expect(model.contentWidthOf(width)).assertEqual(1091);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability075 done');
    });
}

function RepeatedLayoutStabilityPart026() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1056
     * @tc.name    JsStability076
     * @tc.desc    Repeated layout for width 1196 stays 265 seed 76
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability076', 0, async function () {
      await yieldThread();
      const width = 1196;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(265);
      expect(model.breakpointOf(width)).assertEqual('lg');
      expect(model.contentWidthOf(width)).assertEqual(1132);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability076 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1057
     * @tc.name    JsStability077
     * @tc.desc    Repeated layout for width 1237 stays 275 seed 77
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability077', 0, async function () {
      await yieldThread();
      const width = 1237;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(275);
      expect(model.breakpointOf(width)).assertEqual('lg');
      expect(model.contentWidthOf(width)).assertEqual(1173);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability077 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1058
     * @tc.name    JsStability078
     * @tc.desc    Repeated layout for width 1278 stays 285 seed 78
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability078', 0, async function () {
      await yieldThread();
      const width = 1278;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(285);
      expect(model.breakpointOf(width)).assertEqual('lg');
      expect(model.contentWidthOf(width)).assertEqual(1214);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability078 done');
    });
}

function RepeatedLayoutStabilityPart027() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1059
     * @tc.name    JsStability079
     * @tc.desc    Repeated layout for width 1319 stays 295 seed 79
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability079', 0, async function () {
      await yieldThread();
      const width = 1319;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(295);
      expect(model.breakpointOf(width)).assertEqual('lg');
      expect(model.contentWidthOf(width)).assertEqual(1255);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability079 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1060
     * @tc.name    JsStability080
     * @tc.desc    Repeated layout for width 1360 stays 306 seed 80
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability080', 0, async function () {
      await yieldThread();
      const width = 1360;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(306);
      expect(model.breakpointOf(width)).assertEqual('lg');
      expect(model.contentWidthOf(width)).assertEqual(1296);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability080 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1061
     * @tc.name    JsStability081
     * @tc.desc    Repeated layout for width 1401 stays 316 seed 81
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability081', 0, async function () {
      await yieldThread();
      const width = 1401;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(316);
      expect(model.breakpointOf(width)).assertEqual('lg');
      expect(model.contentWidthOf(width)).assertEqual(1337);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability081 done');
    });
}

function RepeatedLayoutStabilityPart028() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1062
     * @tc.name    JsStability082
     * @tc.desc    Repeated layout for width 322 stays 139 seed 82
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability082', 0, async function () {
      await yieldThread();
      const width = 322;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(139);
      expect(model.breakpointOf(width)).assertEqual('sm');
      expect(model.contentWidthOf(width)).assertEqual(290);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability082 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1063
     * @tc.name    JsStability083
     * @tc.desc    Repeated layout for width 363 stays 159 seed 83
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability083', 0, async function () {
      await yieldThread();
      const width = 363;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(159);
      expect(model.breakpointOf(width)).assertEqual('sm');
      expect(model.contentWidthOf(width)).assertEqual(331);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability083 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1064
     * @tc.name    JsStability084
     * @tc.desc    Repeated layout for width 404 stays 180 seed 84
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability084', 0, async function () {
      await yieldThread();
      const width = 404;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(180);
      expect(model.breakpointOf(width)).assertEqual('sm');
      expect(model.contentWidthOf(width)).assertEqual(372);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability084 done');
    });
}

function RepeatedLayoutStabilityPart029() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1065
     * @tc.name    JsStability085
     * @tc.desc    Repeated layout for width 445 stays 200 seed 85
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability085', 0, async function () {
      await yieldThread();
      const width = 445;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(200);
      expect(model.breakpointOf(width)).assertEqual('sm');
      expect(model.contentWidthOf(width)).assertEqual(413);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability085 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1066
     * @tc.name    JsStability086
     * @tc.desc    Repeated layout for width 486 stays 221 seed 86
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability086', 0, async function () {
      await yieldThread();
      const width = 486;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(221);
      expect(model.breakpointOf(width)).assertEqual('sm');
      expect(model.contentWidthOf(width)).assertEqual(454);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability086 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1067
     * @tc.name    JsStability087
     * @tc.desc    Repeated layout for width 527 stays 241 seed 87
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability087', 0, async function () {
      await yieldThread();
      const width = 527;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(241);
      expect(model.breakpointOf(width)).assertEqual('sm');
      expect(model.contentWidthOf(width)).assertEqual(495);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability087 done');
    });
}

function RepeatedLayoutStabilityPart030() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1068
     * @tc.name    JsStability088
     * @tc.desc    Repeated layout for width 568 stays 262 seed 88
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability088', 0, async function () {
      await yieldThread();
      const width = 568;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(262);
      expect(model.breakpointOf(width)).assertEqual('sm');
      expect(model.contentWidthOf(width)).assertEqual(536);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability088 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1069
     * @tc.name    JsStability089
     * @tc.desc    Repeated layout for width 609 stays 165 seed 89
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability089', 0, async function () {
      await yieldThread();
      const width = 609;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(165);
      expect(model.breakpointOf(width)).assertEqual('md');
      expect(model.contentWidthOf(width)).assertEqual(545);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability089 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1070
     * @tc.name    JsStability090
     * @tc.desc    Repeated layout for width 650 stays 179 seed 90
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability090', 0, async function () {
      await yieldThread();
      const width = 650;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(179);
      expect(model.breakpointOf(width)).assertEqual('md');
      expect(model.contentWidthOf(width)).assertEqual(586);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability090 done');
    });
}

function RepeatedLayoutStabilityPart031() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1071
     * @tc.name    JsStability091
     * @tc.desc    Repeated layout for width 691 stays 193 seed 91
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability091', 0, async function () {
      await yieldThread();
      const width = 691;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(193);
      expect(model.breakpointOf(width)).assertEqual('md');
      expect(model.contentWidthOf(width)).assertEqual(627);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability091 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1072
     * @tc.name    JsStability092
     * @tc.desc    Repeated layout for width 732 stays 206 seed 92
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability092', 0, async function () {
      await yieldThread();
      const width = 732;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(206);
      expect(model.breakpointOf(width)).assertEqual('md');
      expect(model.contentWidthOf(width)).assertEqual(668);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability092 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1073
     * @tc.name    JsStability093
     * @tc.desc    Repeated layout for width 773 stays 220 seed 93
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability093', 0, async function () {
      await yieldThread();
      const width = 773;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(220);
      expect(model.breakpointOf(width)).assertEqual('md');
      expect(model.contentWidthOf(width)).assertEqual(709);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability093 done');
    });
}

function RepeatedLayoutStabilityPart032() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1074
     * @tc.name    JsStability094
     * @tc.desc    Repeated layout for width 814 stays 234 seed 94
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability094', 0, async function () {
      await yieldThread();
      const width = 814;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(234);
      expect(model.breakpointOf(width)).assertEqual('md');
      expect(model.contentWidthOf(width)).assertEqual(750);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability094 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1075
     * @tc.name    JsStability095
     * @tc.desc    Repeated layout for width 855 stays 179 seed 95
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability095', 0, async function () {
      await yieldThread();
      const width = 855;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(179);
      expect(model.breakpointOf(width)).assertEqual('lg');
      expect(model.contentWidthOf(width)).assertEqual(791);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability095 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1076
     * @tc.name    JsStability096
     * @tc.desc    Repeated layout for width 896 stays 190 seed 96
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability096', 0, async function () {
      await yieldThread();
      const width = 896;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(190);
      expect(model.breakpointOf(width)).assertEqual('lg');
      expect(model.contentWidthOf(width)).assertEqual(832);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability096 done');
    });
}

function RepeatedLayoutStabilityPart033() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1077
     * @tc.name    JsStability097
     * @tc.desc    Repeated layout for width 937 stays 200 seed 97
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability097', 0, async function () {
      await yieldThread();
      const width = 937;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(200);
      expect(model.breakpointOf(width)).assertEqual('lg');
      expect(model.contentWidthOf(width)).assertEqual(873);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability097 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1078
     * @tc.name    JsStability098
     * @tc.desc    Repeated layout for width 978 stays 210 seed 98
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability098', 0, async function () {
      await yieldThread();
      const width = 978;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(210);
      expect(model.breakpointOf(width)).assertEqual('lg');
      expect(model.contentWidthOf(width)).assertEqual(914);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability098 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1079
     * @tc.name    JsStability099
     * @tc.desc    Repeated layout for width 1019 stays 220 seed 99
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability099', 0, async function () {
      await yieldThread();
      const width = 1019;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(220);
      expect(model.breakpointOf(width)).assertEqual('lg');
      expect(model.contentWidthOf(width)).assertEqual(955);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability099 done');
    });
}

function RepeatedLayoutStabilityPart034() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1080
     * @tc.name    JsStability100
     * @tc.desc    Repeated layout for width 1060 stays 231 seed 100
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability100', 0, async function () {
      await yieldThread();
      const width = 1060;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(231);
      expect(model.breakpointOf(width)).assertEqual('lg');
      expect(model.contentWidthOf(width)).assertEqual(996);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability100 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1081
     * @tc.name    JsStability101
     * @tc.desc    Repeated layout for width 1101 stays 241 seed 101
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability101', 0, async function () {
      await yieldThread();
      const width = 1101;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(241);
      expect(model.breakpointOf(width)).assertEqual('lg');
      expect(model.contentWidthOf(width)).assertEqual(1037);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability101 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1082
     * @tc.name    JsStability102
     * @tc.desc    Repeated layout for width 1142 stays 251 seed 102
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability102', 0, async function () {
      await yieldThread();
      const width = 1142;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(251);
      expect(model.breakpointOf(width)).assertEqual('lg');
      expect(model.contentWidthOf(width)).assertEqual(1078);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability102 done');
    });
}

function RepeatedLayoutStabilityPart035() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1083
     * @tc.name    JsStability103
     * @tc.desc    Repeated layout for width 1183 stays 261 seed 103
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability103', 0, async function () {
      await yieldThread();
      const width = 1183;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(261);
      expect(model.breakpointOf(width)).assertEqual('lg');
      expect(model.contentWidthOf(width)).assertEqual(1119);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability103 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1084
     * @tc.name    JsStability104
     * @tc.desc    Repeated layout for width 1224 stays 272 seed 104
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability104', 0, async function () {
      await yieldThread();
      const width = 1224;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(272);
      expect(model.breakpointOf(width)).assertEqual('lg');
      expect(model.contentWidthOf(width)).assertEqual(1160);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability104 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1085
     * @tc.name    JsStability105
     * @tc.desc    Repeated layout for width 1265 stays 282 seed 105
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability105', 0, async function () {
      await yieldThread();
      const width = 1265;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(282);
      expect(model.breakpointOf(width)).assertEqual('lg');
      expect(model.contentWidthOf(width)).assertEqual(1201);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability105 done');
    });
}

function RepeatedLayoutStabilityPart036() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1086
     * @tc.name    JsStability106
     * @tc.desc    Repeated layout for width 1306 stays 292 seed 106
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability106', 0, async function () {
      await yieldThread();
      const width = 1306;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(292);
      expect(model.breakpointOf(width)).assertEqual('lg');
      expect(model.contentWidthOf(width)).assertEqual(1242);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability106 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1087
     * @tc.name    JsStability107
     * @tc.desc    Repeated layout for width 1347 stays 302 seed 107
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability107', 0, async function () {
      await yieldThread();
      const width = 1347;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(302);
      expect(model.breakpointOf(width)).assertEqual('lg');
      expect(model.contentWidthOf(width)).assertEqual(1283);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability107 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1088
     * @tc.name    JsStability108
     * @tc.desc    Repeated layout for width 1388 stays 313 seed 108
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability108', 0, async function () {
      await yieldThread();
      const width = 1388;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(313);
      expect(model.breakpointOf(width)).assertEqual('lg');
      expect(model.contentWidthOf(width)).assertEqual(1324);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability108 done');
    });
}

function RepeatedLayoutStabilityPart037() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1089
     * @tc.name    JsStability109
     * @tc.desc    Repeated layout for width 1429 stays 323 seed 109
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability109', 0, async function () {
      await yieldThread();
      const width = 1429;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(323);
      expect(model.breakpointOf(width)).assertEqual('lg');
      expect(model.contentWidthOf(width)).assertEqual(1365);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability109 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1090
     * @tc.name    JsStability110
     * @tc.desc    Repeated layout for width 350 stays 153 seed 110
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability110', 0, async function () {
      await yieldThread();
      const width = 350;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(153);
      expect(model.breakpointOf(width)).assertEqual('sm');
      expect(model.contentWidthOf(width)).assertEqual(318);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability110 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1091
     * @tc.name    JsStability111
     * @tc.desc    Repeated layout for width 391 stays 173 seed 111
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability111', 0, async function () {
      await yieldThread();
      const width = 391;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(173);
      expect(model.breakpointOf(width)).assertEqual('sm');
      expect(model.contentWidthOf(width)).assertEqual(359);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability111 done');
    });
}

function RepeatedLayoutStabilityPart038() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1092
     * @tc.name    JsStability112
     * @tc.desc    Repeated layout for width 432 stays 194 seed 112
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability112', 0, async function () {
      await yieldThread();
      const width = 432;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(194);
      expect(model.breakpointOf(width)).assertEqual('sm');
      expect(model.contentWidthOf(width)).assertEqual(400);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability112 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1093
     * @tc.name    JsStability113
     * @tc.desc    Repeated layout for width 473 stays 214 seed 113
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability113', 0, async function () {
      await yieldThread();
      const width = 473;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(214);
      expect(model.breakpointOf(width)).assertEqual('sm');
      expect(model.contentWidthOf(width)).assertEqual(441);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability113 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1094
     * @tc.name    JsStability114
     * @tc.desc    Repeated layout for width 514 stays 235 seed 114
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability114', 0, async function () {
      await yieldThread();
      const width = 514;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(235);
      expect(model.breakpointOf(width)).assertEqual('sm');
      expect(model.contentWidthOf(width)).assertEqual(482);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability114 done');
    });
}

function RepeatedLayoutStabilityPart039() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1095
     * @tc.name    JsStability115
     * @tc.desc    Repeated layout for width 555 stays 255 seed 115
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability115', 0, async function () {
      await yieldThread();
      const width = 555;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(255);
      expect(model.breakpointOf(width)).assertEqual('sm');
      expect(model.contentWidthOf(width)).assertEqual(523);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability115 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1096
     * @tc.name    JsStability116
     * @tc.desc    Repeated layout for width 596 stays 276 seed 116
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability116', 0, async function () {
      await yieldThread();
      const width = 596;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(276);
      expect(model.breakpointOf(width)).assertEqual('sm');
      expect(model.contentWidthOf(width)).assertEqual(564);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability116 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1097
     * @tc.name    JsStability117
     * @tc.desc    Repeated layout for width 637 stays 175 seed 117
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability117', 0, async function () {
      await yieldThread();
      const width = 637;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(175);
      expect(model.breakpointOf(width)).assertEqual('md');
      expect(model.contentWidthOf(width)).assertEqual(573);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability117 done');
    });
}

function RepeatedLayoutStabilityPart040() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1098
     * @tc.name    JsStability118
     * @tc.desc    Repeated layout for width 678 stays 188 seed 118
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability118', 0, async function () {
      await yieldThread();
      const width = 678;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(188);
      expect(model.breakpointOf(width)).assertEqual('md');
      expect(model.contentWidthOf(width)).assertEqual(614);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability118 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1099
     * @tc.name    JsStability119
     * @tc.desc    Repeated layout for width 719 stays 202 seed 119
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability119', 0, async function () {
      await yieldThread();
      const width = 719;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(202);
      expect(model.breakpointOf(width)).assertEqual('md');
      expect(model.contentWidthOf(width)).assertEqual(655);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability119 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1100
     * @tc.name    JsStability120
     * @tc.desc    Repeated layout for width 760 stays 216 seed 120
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability120', 0, async function () {
      await yieldThread();
      const width = 760;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(216);
      expect(model.breakpointOf(width)).assertEqual('md');
      expect(model.contentWidthOf(width)).assertEqual(696);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability120 done');
    });
}

function RepeatedLayoutStabilityPart041() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1101
     * @tc.name    JsStability121
     * @tc.desc    Repeated layout for width 801 stays 229 seed 121
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability121', 0, async function () {
      await yieldThread();
      const width = 801;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(229);
      expect(model.breakpointOf(width)).assertEqual('md');
      expect(model.contentWidthOf(width)).assertEqual(737);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability121 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1102
     * @tc.name    JsStability122
     * @tc.desc    Repeated layout for width 842 stays 176 seed 122
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability122', 0, async function () {
      await yieldThread();
      const width = 842;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(176);
      expect(model.breakpointOf(width)).assertEqual('lg');
      expect(model.contentWidthOf(width)).assertEqual(778);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability122 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1103
     * @tc.name    JsStability123
     * @tc.desc    Repeated layout for width 883 stays 186 seed 123
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability123', 0, async function () {
      await yieldThread();
      const width = 883;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(186);
      expect(model.breakpointOf(width)).assertEqual('lg');
      expect(model.contentWidthOf(width)).assertEqual(819);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability123 done');
    });
}

function RepeatedLayoutStabilityPart042() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1104
     * @tc.name    JsStability124
     * @tc.desc    Repeated layout for width 924 stays 197 seed 124
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability124', 0, async function () {
      await yieldThread();
      const width = 924;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(197);
      expect(model.breakpointOf(width)).assertEqual('lg');
      expect(model.contentWidthOf(width)).assertEqual(860);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability124 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1105
     * @tc.name    JsStability125
     * @tc.desc    Repeated layout for width 965 stays 207 seed 125
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability125', 0, async function () {
      await yieldThread();
      const width = 965;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(207);
      expect(model.breakpointOf(width)).assertEqual('lg');
      expect(model.contentWidthOf(width)).assertEqual(901);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability125 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1106
     * @tc.name    JsStability126
     * @tc.desc    Repeated layout for width 1006 stays 217 seed 126
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability126', 0, async function () {
      await yieldThread();
      const width = 1006;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(217);
      expect(model.breakpointOf(width)).assertEqual('lg');
      expect(model.contentWidthOf(width)).assertEqual(942);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability126 done');
    });
}

function RepeatedLayoutStabilityPart043() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1107
     * @tc.name    JsStability127
     * @tc.desc    Repeated layout for width 1047 stays 227 seed 127
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability127', 0, async function () {
      await yieldThread();
      const width = 1047;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(227);
      expect(model.breakpointOf(width)).assertEqual('lg');
      expect(model.contentWidthOf(width)).assertEqual(983);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability127 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1108
     * @tc.name    JsStability128
     * @tc.desc    Repeated layout for width 1088 stays 238 seed 128
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability128', 0, async function () {
      await yieldThread();
      const width = 1088;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(238);
      expect(model.breakpointOf(width)).assertEqual('lg');
      expect(model.contentWidthOf(width)).assertEqual(1024);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability128 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1109
     * @tc.name    JsStability129
     * @tc.desc    Repeated layout for width 1129 stays 248 seed 129
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability129', 0, async function () {
      await yieldThread();
      const width = 1129;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(248);
      expect(model.breakpointOf(width)).assertEqual('lg');
      expect(model.contentWidthOf(width)).assertEqual(1065);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability129 done');
    });
}

function RepeatedLayoutStabilityPart044() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1110
     * @tc.name    JsStability130
     * @tc.desc    Repeated layout for width 1170 stays 258 seed 130
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability130', 0, async function () {
      await yieldThread();
      const width = 1170;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(258);
      expect(model.breakpointOf(width)).assertEqual('lg');
      expect(model.contentWidthOf(width)).assertEqual(1106);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability130 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1111
     * @tc.name    JsStability131
     * @tc.desc    Repeated layout for width 1211 stays 268 seed 131
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability131', 0, async function () {
      await yieldThread();
      const width = 1211;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(268);
      expect(model.breakpointOf(width)).assertEqual('lg');
      expect(model.contentWidthOf(width)).assertEqual(1147);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability131 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1112
     * @tc.name    JsStability132
     * @tc.desc    Repeated layout for width 1252 stays 279 seed 132
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability132', 0, async function () {
      await yieldThread();
      const width = 1252;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(279);
      expect(model.breakpointOf(width)).assertEqual('lg');
      expect(model.contentWidthOf(width)).assertEqual(1188);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability132 done');
    });
}

function RepeatedLayoutStabilityPart045() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1113
     * @tc.name    JsStability133
     * @tc.desc    Repeated layout for width 1293 stays 289 seed 133
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability133', 0, async function () {
      await yieldThread();
      const width = 1293;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(289);
      expect(model.breakpointOf(width)).assertEqual('lg');
      expect(model.contentWidthOf(width)).assertEqual(1229);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability133 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1114
     * @tc.name    JsStability134
     * @tc.desc    Repeated layout for width 1334 stays 299 seed 134
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability134', 0, async function () {
      await yieldThread();
      const width = 1334;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(299);
      expect(model.breakpointOf(width)).assertEqual('lg');
      expect(model.contentWidthOf(width)).assertEqual(1270);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability134 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1115
     * @tc.name    JsStability135
     * @tc.desc    Repeated layout for width 1375 stays 309 seed 135
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability135', 0, async function () {
      await yieldThread();
      const width = 1375;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(309);
      expect(model.breakpointOf(width)).assertEqual('lg');
      expect(model.contentWidthOf(width)).assertEqual(1311);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability135 done');
    });
}

function RepeatedLayoutStabilityPart046() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1116
     * @tc.name    JsStability136
     * @tc.desc    Repeated layout for width 1416 stays 320 seed 136
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability136', 0, async function () {
      await yieldThread();
      const width = 1416;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(320);
      expect(model.breakpointOf(width)).assertEqual('lg');
      expect(model.contentWidthOf(width)).assertEqual(1352);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability136 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1117
     * @tc.name    JsStability137
     * @tc.desc    Repeated layout for width 337 stays 146 seed 137
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability137', 0, async function () {
      await yieldThread();
      const width = 337;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(146);
      expect(model.breakpointOf(width)).assertEqual('sm');
      expect(model.contentWidthOf(width)).assertEqual(305);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability137 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1118
     * @tc.name    JsStability138
     * @tc.desc    Repeated layout for width 378 stays 167 seed 138
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability138', 0, async function () {
      await yieldThread();
      const width = 378;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(167);
      expect(model.breakpointOf(width)).assertEqual('sm');
      expect(model.contentWidthOf(width)).assertEqual(346);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability138 done');
    });
}

function RepeatedLayoutStabilityPart047() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1119
     * @tc.name    JsStability139
     * @tc.desc    Repeated layout for width 419 stays 187 seed 139
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability139', 0, async function () {
      await yieldThread();
      const width = 419;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(187);
      expect(model.breakpointOf(width)).assertEqual('sm');
      expect(model.contentWidthOf(width)).assertEqual(387);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability139 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1120
     * @tc.name    JsStability140
     * @tc.desc    Repeated layout for width 460 stays 208 seed 140
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsStability140', 0, async function () {
      await yieldThread();
      const width = 460;
      const first = model.itemWidthOf(width);
      for (let i = 0; i < 4; i++) {
        expect(model.itemWidthOf(width)).assertEqual(first);
      }
      expect(first).assertEqual(208);
      expect(model.breakpointOf(width)).assertEqual('sm');
      expect(model.contentWidthOf(width)).assertEqual(428);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsStability140 done');
    });
}

function RepeatedLayoutStabilityGroup001() {
  RepeatedLayoutStabilityPart001();
  RepeatedLayoutStabilityPart002();
  RepeatedLayoutStabilityPart003();
  RepeatedLayoutStabilityPart004();
  RepeatedLayoutStabilityPart005();
  RepeatedLayoutStabilityPart006();
  RepeatedLayoutStabilityPart007();
  RepeatedLayoutStabilityPart008();
  RepeatedLayoutStabilityPart009();
  RepeatedLayoutStabilityPart010();
  RepeatedLayoutStabilityPart011();
  RepeatedLayoutStabilityPart012();
  RepeatedLayoutStabilityPart013();
  RepeatedLayoutStabilityPart014();
  RepeatedLayoutStabilityPart015();
  RepeatedLayoutStabilityPart016();
  RepeatedLayoutStabilityPart017();
  RepeatedLayoutStabilityPart018();
  RepeatedLayoutStabilityPart019();
  RepeatedLayoutStabilityPart020();
  RepeatedLayoutStabilityPart021();
  RepeatedLayoutStabilityPart022();
  RepeatedLayoutStabilityPart023();
  RepeatedLayoutStabilityPart024();
  RepeatedLayoutStabilityPart025();
  RepeatedLayoutStabilityPart026();
  RepeatedLayoutStabilityPart027();
  RepeatedLayoutStabilityPart028();
  RepeatedLayoutStabilityPart029();
  RepeatedLayoutStabilityPart030();
  RepeatedLayoutStabilityPart031();
  RepeatedLayoutStabilityPart032();
  RepeatedLayoutStabilityPart033();
  RepeatedLayoutStabilityPart034();
  RepeatedLayoutStabilityPart035();
  RepeatedLayoutStabilityPart036();
  RepeatedLayoutStabilityPart037();
  RepeatedLayoutStabilityPart038();
  RepeatedLayoutStabilityPart039();
  RepeatedLayoutStabilityPart040();
}

function RepeatedLayoutStabilityGroup002() {
  RepeatedLayoutStabilityPart041();
  RepeatedLayoutStabilityPart042();
  RepeatedLayoutStabilityPart043();
  RepeatedLayoutStabilityPart044();
  RepeatedLayoutStabilityPart045();
  RepeatedLayoutStabilityPart046();
  RepeatedLayoutStabilityPart047();
}

export default function repeatedLayoutStabilitySuite() {
  describe('RepeatedLayoutStabilitySuite', function () {
    RepeatedLayoutStabilityGroup001();
    RepeatedLayoutStabilityGroup002();
  });
}
