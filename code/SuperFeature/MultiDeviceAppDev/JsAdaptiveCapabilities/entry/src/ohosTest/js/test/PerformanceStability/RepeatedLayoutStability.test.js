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

export default function repeatedLayoutStabilitySuite() {
  describe('RepeatedLayoutStabilitySuite', function () {
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
  });
}
