/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, beforeEach } from '@ohos/hypium';
import hilog from '@ohos.hilog';
import { NavBarModel } from '../Shared/NavBarModel';
import { NAV_SUB_COUNTS } from '../Shared/NavBarModel';

const DOMAIN: number = 0xF811;
const TAG: string = '[NavAppTests]';

export default function navAppOperationWorkflowSuite() {
  describe('NavAppOperationWorkflowSuite', () => {
    let m: NavBarModel = new NavBarModel();

    beforeEach(() => {
      m = new NavBarModel();
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0104
     * @tc.name    NavAppOperationWorkflow104
     * @tc.desc    NavBar sub count for top 4 probe 104
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow104', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 104) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0105
     * @tc.name    NavAppOperationWorkflow105
     * @tc.desc    NavBar sub count for top 0 probe 105
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow105', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 105) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0106
     * @tc.name    NavAppOperationWorkflow106
     * @tc.desc    NavBar sub count for top 1 probe 106
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow106', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 106) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0107
     * @tc.name    NavAppOperationWorkflow107
     * @tc.desc    NavBar sub count for top 2 probe 107
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow107', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 107) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0108
     * @tc.name    NavAppOperationWorkflow108
     * @tc.desc    NavBar sub count for top 3 probe 108
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow108', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 108) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0109
     * @tc.name    NavAppOperationWorkflow109
     * @tc.desc    NavBar sub count for top 4 probe 109
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow109', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 109) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0110
     * @tc.name    NavAppOperationWorkflow110
     * @tc.desc    NavBar sub count for top 0 probe 110
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow110', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 110) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0111
     * @tc.name    NavAppOperationWorkflow111
     * @tc.desc    NavBar sub count for top 1 probe 111
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow111', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 111) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0112
     * @tc.name    NavAppOperationWorkflow112
     * @tc.desc    NavBar sub count for top 2 probe 112
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow112', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 112) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0113
     * @tc.name    NavAppOperationWorkflow113
     * @tc.desc    NavBar sub count for top 3 probe 113
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow113', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 113) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0114
     * @tc.name    NavAppOperationWorkflow114
     * @tc.desc    NavBar sub count for top 4 probe 114
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow114', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 114) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0115
     * @tc.name    NavAppOperationWorkflow115
     * @tc.desc    NavBar sub count for top 0 probe 115
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow115', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 115) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0116
     * @tc.name    NavAppOperationWorkflow116
     * @tc.desc    NavBar sub count for top 1 probe 116
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow116', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 116) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0117
     * @tc.name    NavAppOperationWorkflow117
     * @tc.desc    NavBar sub count for top 2 probe 117
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow117', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 117) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0118
     * @tc.name    NavAppOperationWorkflow118
     * @tc.desc    NavBar sub count for top 3 probe 118
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow118', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 118) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0119
     * @tc.name    NavAppOperationWorkflow119
     * @tc.desc    NavBar sub count for top 4 probe 119
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow119', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 119) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0120
     * @tc.name    NavAppOperationWorkflow120
     * @tc.desc    NavBar sub count for top 0 probe 120
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow120', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 120) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0121
     * @tc.name    NavAppOperationWorkflow121
     * @tc.desc    NavBar sub count for top 1 probe 121
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow121', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 121) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0122
     * @tc.name    NavAppOperationWorkflow122
     * @tc.desc    NavBar sub count for top 2 probe 122
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow122', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 122) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0123
     * @tc.name    NavAppOperationWorkflow123
     * @tc.desc    NavBar sub count for top 3 probe 123
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow123', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 123) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0124
     * @tc.name    NavAppOperationWorkflow124
     * @tc.desc    NavBar sub count for top 4 probe 124
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow124', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 124) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0125
     * @tc.name    NavAppOperationWorkflow125
     * @tc.desc    NavBar sub count for top 0 probe 125
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow125', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 125) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0126
     * @tc.name    NavAppOperationWorkflow126
     * @tc.desc    NavBar sub count for top 1 probe 126
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow126', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 126) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0127
     * @tc.name    NavAppOperationWorkflow127
     * @tc.desc    NavBar sub count for top 2 probe 127
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow127', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 127) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0128
     * @tc.name    NavAppOperationWorkflow128
     * @tc.desc    NavBar sub count for top 3 probe 128
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow128', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 128) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0129
     * @tc.name    NavAppOperationWorkflow129
     * @tc.desc    NavBar sub count for top 4 probe 129
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow129', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 129) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0130
     * @tc.name    NavAppOperationWorkflow130
     * @tc.desc    NavBar sub count for top 0 probe 130
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow130', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 130) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0131
     * @tc.name    NavAppOperationWorkflow131
     * @tc.desc    NavBar sub count for top 1 probe 131
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow131', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 131) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0132
     * @tc.name    NavAppOperationWorkflow132
     * @tc.desc    NavBar sub count for top 2 probe 132
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow132', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 132) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0133
     * @tc.name    NavAppOperationWorkflow133
     * @tc.desc    NavBar sub count for top 3 probe 133
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow133', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 133) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0134
     * @tc.name    NavAppOperationWorkflow134
     * @tc.desc    NavBar sub count for top 4 probe 134
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow134', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 134) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0135
     * @tc.name    NavAppOperationWorkflow135
     * @tc.desc    NavBar sub count for top 0 probe 135
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow135', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 135) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0136
     * @tc.name    NavAppOperationWorkflow136
     * @tc.desc    NavBar sub count for top 1 probe 136
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow136', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 136) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0137
     * @tc.name    NavAppOperationWorkflow137
     * @tc.desc    NavBar sub count for top 2 probe 137
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow137', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 137) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0138
     * @tc.name    NavAppOperationWorkflow138
     * @tc.desc    NavBar sub count for top 3 probe 138
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow138', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 138) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0139
     * @tc.name    NavAppOperationWorkflow139
     * @tc.desc    NavBar sub count for top 4 probe 139
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow139', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 139) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0140
     * @tc.name    NavAppOperationWorkflow140
     * @tc.desc    NavBar sub count for top 0 probe 140
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow140', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 140) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0141
     * @tc.name    NavAppOperationWorkflow141
     * @tc.desc    NavBar sub count for top 1 probe 141
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow141', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 141) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0142
     * @tc.name    NavAppOperationWorkflow142
     * @tc.desc    NavBar sub count for top 2 probe 142
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow142', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 142) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0143
     * @tc.name    NavAppOperationWorkflow143
     * @tc.desc    NavBar sub count for top 3 probe 143
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow143', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 143) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0144
     * @tc.name    NavAppOperationWorkflow144
     * @tc.desc    NavBar sub count for top 4 probe 144
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow144', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 144) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0145
     * @tc.name    NavAppOperationWorkflow145
     * @tc.desc    NavBar sub count for top 0 probe 145
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow145', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 145) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0146
     * @tc.name    NavAppOperationWorkflow146
     * @tc.desc    NavBar sub count for top 1 probe 146
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow146', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 146) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0147
     * @tc.name    NavAppOperationWorkflow147
     * @tc.desc    NavBar sub count for top 2 probe 147
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow147', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 147) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0148
     * @tc.name    NavAppOperationWorkflow148
     * @tc.desc    NavBar sub count for top 3 probe 148
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow148', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 148) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0149
     * @tc.name    NavAppOperationWorkflow149
     * @tc.desc    NavBar sub count for top 4 probe 149
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow149', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 149) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0150
     * @tc.name    NavAppOperationWorkflow150
     * @tc.desc    NavBar sub count for top 0 probe 150
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow150', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 150) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0151
     * @tc.name    NavAppOperationWorkflow151
     * @tc.desc    NavBar sub count for top 1 probe 151
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow151', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 151) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0152
     * @tc.name    NavAppOperationWorkflow152
     * @tc.desc    NavBar sub count for top 2 probe 152
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow152', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 152) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0153
     * @tc.name    NavAppOperationWorkflow153
     * @tc.desc    NavBar sub count for top 3 probe 153
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow153', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 153) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0154
     * @tc.name    NavAppOperationWorkflow154
     * @tc.desc    NavBar sub count for top 4 probe 154
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow154', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 154) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0155
     * @tc.name    NavAppOperationWorkflow155
     * @tc.desc    NavBar sub count for top 0 probe 155
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow155', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 155) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0156
     * @tc.name    NavAppOperationWorkflow156
     * @tc.desc    NavBar sub count for top 1 probe 156
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow156', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 156) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0157
     * @tc.name    NavAppOperationWorkflow157
     * @tc.desc    NavBar sub count for top 2 probe 157
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow157', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 157) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0158
     * @tc.name    NavAppOperationWorkflow158
     * @tc.desc    NavBar sub count for top 3 probe 158
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow158', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 158) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0159
     * @tc.name    NavAppOperationWorkflow159
     * @tc.desc    NavBar sub count for top 4 probe 159
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow159', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 159) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0160
     * @tc.name    NavAppOperationWorkflow160
     * @tc.desc    NavBar sub count for top 0 probe 160
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow160', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 160) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0161
     * @tc.name    NavAppOperationWorkflow161
     * @tc.desc    NavBar sub count for top 1 probe 161
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow161', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 161) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0162
     * @tc.name    NavAppOperationWorkflow162
     * @tc.desc    NavBar sub count for top 2 probe 162
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow162', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 162) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0163
     * @tc.name    NavAppOperationWorkflow163
     * @tc.desc    NavBar sub count for top 3 probe 163
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow163', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 163) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0164
     * @tc.name    NavAppOperationWorkflow164
     * @tc.desc    NavBar sub count for top 4 probe 164
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow164', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 164) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0165
     * @tc.name    NavAppOperationWorkflow165
     * @tc.desc    NavBar sub count for top 0 probe 165
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow165', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 165) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0166
     * @tc.name    NavAppOperationWorkflow166
     * @tc.desc    NavBar sub count for top 1 probe 166
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow166', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 166) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0167
     * @tc.name    NavAppOperationWorkflow167
     * @tc.desc    NavBar sub count for top 2 probe 167
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow167', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 167) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0168
     * @tc.name    NavAppOperationWorkflow168
     * @tc.desc    NavBar sub count for top 3 probe 168
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow168', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 168) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0169
     * @tc.name    NavAppOperationWorkflow169
     * @tc.desc    NavBar sub count for top 4 probe 169
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow169', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 169) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0170
     * @tc.name    NavAppOperationWorkflow170
     * @tc.desc    NavBar sub count for top 0 probe 170
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow170', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 170) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0171
     * @tc.name    NavAppOperationWorkflow171
     * @tc.desc    NavBar sub count for top 1 probe 171
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow171', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 171) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0172
     * @tc.name    NavAppOperationWorkflow172
     * @tc.desc    NavBar sub count for top 2 probe 172
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow172', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 172) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0173
     * @tc.name    NavAppOperationWorkflow173
     * @tc.desc    NavBar sub count for top 3 probe 173
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow173', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 173) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0174
     * @tc.name    NavAppOperationWorkflow174
     * @tc.desc    NavBar sub count for top 4 probe 174
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow174', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 174) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0175
     * @tc.name    NavAppOperationWorkflow175
     * @tc.desc    NavBar sub count for top 0 probe 175
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow175', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 175) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0176
     * @tc.name    NavAppOperationWorkflow176
     * @tc.desc    NavBar sub count for top 1 probe 176
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow176', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 176) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0177
     * @tc.name    NavAppOperationWorkflow177
     * @tc.desc    NavBar sub count for top 2 probe 177
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow177', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 177) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0178
     * @tc.name    NavAppOperationWorkflow178
     * @tc.desc    NavBar sub count for top 3 probe 178
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow178', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 178) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0179
     * @tc.name    NavAppOperationWorkflow179
     * @tc.desc    NavBar sub count for top 4 probe 179
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow179', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 179) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0180
     * @tc.name    NavAppOperationWorkflow180
     * @tc.desc    NavBar sub count for top 0 probe 180
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow180', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 180) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0181
     * @tc.name    NavAppOperationWorkflow181
     * @tc.desc    NavBar sub count for top 1 probe 181
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow181', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 181) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0182
     * @tc.name    NavAppOperationWorkflow182
     * @tc.desc    NavBar sub count for top 2 probe 182
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow182', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 182) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0183
     * @tc.name    NavAppOperationWorkflow183
     * @tc.desc    NavBar sub count for top 3 probe 183
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow183', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 183) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0184
     * @tc.name    NavAppOperationWorkflow184
     * @tc.desc    NavBar sub count for top 4 probe 184
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow184', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 184) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0185
     * @tc.name    NavAppOperationWorkflow185
     * @tc.desc    NavBar sub count for top 0 probe 185
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow185', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 185) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0186
     * @tc.name    NavAppOperationWorkflow186
     * @tc.desc    NavBar sub count for top 1 probe 186
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow186', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 186) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0187
     * @tc.name    NavAppOperationWorkflow187
     * @tc.desc    NavBar sub count for top 2 probe 187
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow187', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 187) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0188
     * @tc.name    NavAppOperationWorkflow188
     * @tc.desc    NavBar sub count for top 3 probe 188
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow188', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 188) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0189
     * @tc.name    NavAppOperationWorkflow189
     * @tc.desc    NavBar sub count for top 4 probe 189
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow189', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 189) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0190
     * @tc.name    NavAppOperationWorkflow190
     * @tc.desc    NavBar sub count for top 0 probe 190
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow190', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 190) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0191
     * @tc.name    NavAppOperationWorkflow191
     * @tc.desc    NavBar sub count for top 1 probe 191
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow191', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 191) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0192
     * @tc.name    NavAppOperationWorkflow192
     * @tc.desc    NavBar sub count for top 2 probe 192
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow192', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 192) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0193
     * @tc.name    NavAppOperationWorkflow193
     * @tc.desc    NavBar sub count for top 3 probe 193
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow193', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 193) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0194
     * @tc.name    NavAppOperationWorkflow194
     * @tc.desc    NavBar sub count for top 4 probe 194
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow194', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 194) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0195
     * @tc.name    NavAppOperationWorkflow195
     * @tc.desc    NavBar sub count for top 0 probe 195
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow195', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 195) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0196
     * @tc.name    NavAppOperationWorkflow196
     * @tc.desc    NavBar sub count for top 1 probe 196
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow196', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 196) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0197
     * @tc.name    NavAppOperationWorkflow197
     * @tc.desc    NavBar sub count for top 2 probe 197
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow197', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 197) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0198
     * @tc.name    NavAppOperationWorkflow198
     * @tc.desc    NavBar sub count for top 3 probe 198
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow198', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 198) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0199
     * @tc.name    NavAppOperationWorkflow199
     * @tc.desc    NavBar sub count for top 4 probe 199
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow199', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 199) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0200
     * @tc.name    NavAppOperationWorkflow200
     * @tc.desc    NavBar sub count for top 0 probe 200
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow200', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 200) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0201
     * @tc.name    NavAppOperationWorkflow201
     * @tc.desc    NavBar sub count for top 1 probe 201
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow201', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 201) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0202
     * @tc.name    NavAppOperationWorkflow202
     * @tc.desc    NavBar sub count for top 2 probe 202
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow202', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 202) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0203
     * @tc.name    NavAppOperationWorkflow203
     * @tc.desc    NavBar sub count for top 3 probe 203
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow203', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 203) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0204
     * @tc.name    NavAppOperationWorkflow204
     * @tc.desc    NavBar sub count for top 4 probe 204
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow204', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 204) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0205
     * @tc.name    NavAppOperationWorkflow205
     * @tc.desc    NavBar sub count for top 0 probe 205
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow205', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 205) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0206
     * @tc.name    NavAppOperationWorkflow206
     * @tc.desc    NavBar sub count for top 1 probe 206
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow206', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 206) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0207
     * @tc.name    NavAppOperationWorkflow207
     * @tc.desc    NavBar sub count for top 2 probe 207
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow207', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 207) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0208
     * @tc.name    NavAppOperationWorkflow208
     * @tc.desc    NavBar sub count for top 3 probe 208
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow208', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 208) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0209
     * @tc.name    NavAppOperationWorkflow209
     * @tc.desc    NavBar sub count for top 4 probe 209
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow209', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 209) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0210
     * @tc.name    NavAppOperationWorkflow210
     * @tc.desc    NavBar sub count for top 0 probe 210
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow210', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 210) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0211
     * @tc.name    NavAppOperationWorkflow211
     * @tc.desc    NavBar sub count for top 1 probe 211
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow211', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 211) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0212
     * @tc.name    NavAppOperationWorkflow212
     * @tc.desc    NavBar sub count for top 2 probe 212
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppOperationWorkflow212', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 212) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });
