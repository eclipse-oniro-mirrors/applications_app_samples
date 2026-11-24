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

export default function navAppSystemIntegrationSuite() {
  describe('NavAppSystemIntegrationSuite', () => {
    let m: NavBarModel = new NavBarModel();

    beforeEach(() => {
      m = new NavBarModel();
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0234
     * @tc.name    NavAppSystemIntegration234
     * @tc.desc    NavBar total sub menu count 234 probe 234
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppSystemIntegration234', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let sum = 0;
      for (let k = 0; k < m.getTopCount(); k++) { sum += m.getSubCount(k); }
      expect(m.getTotalSubCount()).assertEqual(sum);
      expect(m.getNodes().length).assertEqual(m.getTopCount());
      expect(m.countChildrenOf(4)).assertEqual(0);
      expect(m.getNode(1000 + 234) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0235
     * @tc.name    NavAppSystemIntegration235
     * @tc.desc    NavBar total sub menu count 235 probe 235
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppSystemIntegration235', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let sum = 0;
      for (let k = 0; k < m.getTopCount(); k++) { sum += m.getSubCount(k); }
      expect(m.getTotalSubCount()).assertEqual(sum);
      expect(m.getNodes().length).assertEqual(m.getTopCount());
      expect(m.countChildrenOf(0)).assertEqual(0);
      expect(m.getNode(1000 + 235) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0236
     * @tc.name    NavAppSystemIntegration236
     * @tc.desc    NavBar total sub menu count 236 probe 236
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppSystemIntegration236', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let sum = 0;
      for (let k = 0; k < m.getTopCount(); k++) { sum += m.getSubCount(k); }
      expect(m.getTotalSubCount()).assertEqual(sum);
      expect(m.getNodes().length).assertEqual(m.getTopCount());
      expect(m.countChildrenOf(1)).assertEqual(0);
      expect(m.getNode(1000 + 236) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0237
     * @tc.name    NavAppSystemIntegration237
     * @tc.desc    NavBar total sub menu count 237 probe 237
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppSystemIntegration237', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let sum = 0;
      for (let k = 0; k < m.getTopCount(); k++) { sum += m.getSubCount(k); }
      expect(m.getTotalSubCount()).assertEqual(sum);
      expect(m.getNodes().length).assertEqual(m.getTopCount());
      expect(m.countChildrenOf(2)).assertEqual(0);
      expect(m.getNode(1000 + 237) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0238
     * @tc.name    NavAppSystemIntegration238
     * @tc.desc    NavBar total sub menu count 238 probe 238
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppSystemIntegration238', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let sum = 0;
      for (let k = 0; k < m.getTopCount(); k++) { sum += m.getSubCount(k); }
      expect(m.getTotalSubCount()).assertEqual(sum);
      expect(m.getNodes().length).assertEqual(m.getTopCount());
      expect(m.countChildrenOf(3)).assertEqual(0);
      expect(m.getNode(1000 + 238) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0239
     * @tc.name    NavAppSystemIntegration239
     * @tc.desc    NavBar total sub menu count 239 probe 239
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppSystemIntegration239', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let sum = 0;
      for (let k = 0; k < m.getTopCount(); k++) { sum += m.getSubCount(k); }
      expect(m.getTotalSubCount()).assertEqual(sum);
      expect(m.getNodes().length).assertEqual(m.getTopCount());
      expect(m.countChildrenOf(4)).assertEqual(0);
      expect(m.getNode(1000 + 239) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0240
     * @tc.name    NavAppSystemIntegration240
     * @tc.desc    NavBar total sub menu count 240 probe 240
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppSystemIntegration240', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let sum = 0;
      for (let k = 0; k < m.getTopCount(); k++) { sum += m.getSubCount(k); }
      expect(m.getTotalSubCount()).assertEqual(sum);
      expect(m.getNodes().length).assertEqual(m.getTopCount());
      expect(m.countChildrenOf(0)).assertEqual(0);
      expect(m.getNode(1000 + 240) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0241
     * @tc.name    NavAppSystemIntegration241
     * @tc.desc    NavBar total sub menu count 241 probe 241
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppSystemIntegration241', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let sum = 0;
      for (let k = 0; k < m.getTopCount(); k++) { sum += m.getSubCount(k); }
      expect(m.getTotalSubCount()).assertEqual(sum);
      expect(m.getNodes().length).assertEqual(m.getTopCount());
      expect(m.countChildrenOf(1)).assertEqual(0);
      expect(m.getNode(1000 + 241) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0242
     * @tc.name    NavAppSystemIntegration242
     * @tc.desc    NavBar total sub menu count 242 probe 242
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppSystemIntegration242', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let sum = 0;
      for (let k = 0; k < m.getTopCount(); k++) { sum += m.getSubCount(k); }
      expect(m.getTotalSubCount()).assertEqual(sum);
      expect(m.getNodes().length).assertEqual(m.getTopCount());
      expect(m.countChildrenOf(2)).assertEqual(0);
      expect(m.getNode(1000 + 242) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0243
     * @tc.name    NavAppSystemIntegration243
     * @tc.desc    NavBar total sub menu count 243 probe 243
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppSystemIntegration243', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let sum = 0;
      for (let k = 0; k < m.getTopCount(); k++) { sum += m.getSubCount(k); }
      expect(m.getTotalSubCount()).assertEqual(sum);
      expect(m.getNodes().length).assertEqual(m.getTopCount());
      expect(m.countChildrenOf(3)).assertEqual(0);
      expect(m.getNode(1000 + 243) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0244
     * @tc.name    NavAppSystemIntegration244
     * @tc.desc    NavBar total sub menu count 244 probe 244
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppSystemIntegration244', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let sum = 0;
      for (let k = 0; k < m.getTopCount(); k++) { sum += m.getSubCount(k); }
      expect(m.getTotalSubCount()).assertEqual(sum);
      expect(m.getNodes().length).assertEqual(m.getTopCount());
      expect(m.countChildrenOf(4)).assertEqual(0);
      expect(m.getNode(1000 + 244) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0245
     * @tc.name    NavAppSystemIntegration245
     * @tc.desc    NavBar total sub menu count 245 probe 245
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppSystemIntegration245', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let sum = 0;
      for (let k = 0; k < m.getTopCount(); k++) { sum += m.getSubCount(k); }
      expect(m.getTotalSubCount()).assertEqual(sum);
      expect(m.getNodes().length).assertEqual(m.getTopCount());
      expect(m.countChildrenOf(0)).assertEqual(0);
      expect(m.getNode(1000 + 245) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0246
     * @tc.name    NavAppSystemIntegration246
     * @tc.desc    NavBar total sub menu count 246 probe 246
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppSystemIntegration246', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let sum = 0;
      for (let k = 0; k < m.getTopCount(); k++) { sum += m.getSubCount(k); }
      expect(m.getTotalSubCount()).assertEqual(sum);
      expect(m.getNodes().length).assertEqual(m.getTopCount());
      expect(m.countChildrenOf(1)).assertEqual(0);
      expect(m.getNode(1000 + 246) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0247
     * @tc.name    NavAppSystemIntegration247
     * @tc.desc    NavBar total sub menu count 247 probe 247
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppSystemIntegration247', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let sum = 0;
      for (let k = 0; k < m.getTopCount(); k++) { sum += m.getSubCount(k); }
      expect(m.getTotalSubCount()).assertEqual(sum);
      expect(m.getNodes().length).assertEqual(m.getTopCount());
      expect(m.countChildrenOf(2)).assertEqual(0);
      expect(m.getNode(1000 + 247) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0248
     * @tc.name    NavAppSystemIntegration248
     * @tc.desc    NavBar total sub menu count 248 probe 248
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppSystemIntegration248', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let sum = 0;
      for (let k = 0; k < m.getTopCount(); k++) { sum += m.getSubCount(k); }
      expect(m.getTotalSubCount()).assertEqual(sum);
      expect(m.getNodes().length).assertEqual(m.getTopCount());
      expect(m.countChildrenOf(3)).assertEqual(0);
      expect(m.getNode(1000 + 248) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0249
     * @tc.name    NavAppSystemIntegration249
     * @tc.desc    NavBar total sub menu count 249 probe 249
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppSystemIntegration249', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let sum = 0;
      for (let k = 0; k < m.getTopCount(); k++) { sum += m.getSubCount(k); }
      expect(m.getTotalSubCount()).assertEqual(sum);
      expect(m.getNodes().length).assertEqual(m.getTopCount());
      expect(m.countChildrenOf(4)).assertEqual(0);
      expect(m.getNode(1000 + 249) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0250
     * @tc.name    NavAppSystemIntegration250
     * @tc.desc    NavBar total sub menu count 250 probe 250
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppSystemIntegration250', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let sum = 0;
      for (let k = 0; k < m.getTopCount(); k++) { sum += m.getSubCount(k); }
      expect(m.getTotalSubCount()).assertEqual(sum);
      expect(m.getNodes().length).assertEqual(m.getTopCount());
      expect(m.countChildrenOf(0)).assertEqual(0);
      expect(m.getNode(1000 + 250) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0251
     * @tc.name    NavAppSystemIntegration251
     * @tc.desc    NavBar total sub menu count 251 probe 251
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppSystemIntegration251', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let sum = 0;
      for (let k = 0; k < m.getTopCount(); k++) { sum += m.getSubCount(k); }
      expect(m.getTotalSubCount()).assertEqual(sum);
      expect(m.getNodes().length).assertEqual(m.getTopCount());
      expect(m.countChildrenOf(1)).assertEqual(0);
      expect(m.getNode(1000 + 251) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0252
     * @tc.name    NavAppSystemIntegration252
     * @tc.desc    NavBar total sub menu count 252 probe 252
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppSystemIntegration252', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let sum = 0;
      for (let k = 0; k < m.getTopCount(); k++) { sum += m.getSubCount(k); }
      expect(m.getTotalSubCount()).assertEqual(sum);
      expect(m.getNodes().length).assertEqual(m.getTopCount());
      expect(m.countChildrenOf(2)).assertEqual(0);
      expect(m.getNode(1000 + 252) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0253
     * @tc.name    NavAppSystemIntegration253
     * @tc.desc    NavBar total sub menu count 253 probe 253
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppSystemIntegration253', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let sum = 0;
      for (let k = 0; k < m.getTopCount(); k++) { sum += m.getSubCount(k); }
      expect(m.getTotalSubCount()).assertEqual(sum);
      expect(m.getNodes().length).assertEqual(m.getTopCount());
      expect(m.countChildrenOf(3)).assertEqual(0);
      expect(m.getNode(1000 + 253) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0254
     * @tc.name    NavAppSystemIntegration254
     * @tc.desc    NavBar total sub menu count 254 probe 254
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppSystemIntegration254', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let sum = 0;
      for (let k = 0; k < m.getTopCount(); k++) { sum += m.getSubCount(k); }
      expect(m.getTotalSubCount()).assertEqual(sum);
      expect(m.getNodes().length).assertEqual(m.getTopCount());
      expect(m.countChildrenOf(4)).assertEqual(0);
      expect(m.getNode(1000 + 254) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0255
     * @tc.name    NavAppSystemIntegration255
     * @tc.desc    NavBar total sub menu count 255 probe 255
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppSystemIntegration255', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let sum = 0;
      for (let k = 0; k < m.getTopCount(); k++) { sum += m.getSubCount(k); }
      expect(m.getTotalSubCount()).assertEqual(sum);
      expect(m.getNodes().length).assertEqual(m.getTopCount());
      expect(m.countChildrenOf(0)).assertEqual(0);
      expect(m.getNode(1000 + 255) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0256
     * @tc.name    NavAppSystemIntegration256
     * @tc.desc    NavBar total sub menu count 256 probe 256
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppSystemIntegration256', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let sum = 0;
      for (let k = 0; k < m.getTopCount(); k++) { sum += m.getSubCount(k); }
      expect(m.getTotalSubCount()).assertEqual(sum);
      expect(m.getNodes().length).assertEqual(m.getTopCount());
      expect(m.countChildrenOf(1)).assertEqual(0);
      expect(m.getNode(1000 + 256) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0257
     * @tc.name    NavAppSystemIntegration257
     * @tc.desc    NavBar total sub menu count 257 probe 257
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppSystemIntegration257', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let sum = 0;
      for (let k = 0; k < m.getTopCount(); k++) { sum += m.getSubCount(k); }
      expect(m.getTotalSubCount()).assertEqual(sum);
      expect(m.getNodes().length).assertEqual(m.getTopCount());
      expect(m.countChildrenOf(2)).assertEqual(0);
      expect(m.getNode(1000 + 257) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0258
     * @tc.name    NavAppSystemIntegration258
     * @tc.desc    NavBar total sub menu count 258 probe 258
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppSystemIntegration258', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let sum = 0;
      for (let k = 0; k < m.getTopCount(); k++) { sum += m.getSubCount(k); }
      expect(m.getTotalSubCount()).assertEqual(sum);
      expect(m.getNodes().length).assertEqual(m.getTopCount());
      expect(m.countChildrenOf(3)).assertEqual(0);
      expect(m.getNode(1000 + 258) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0259
     * @tc.name    NavAppSystemIntegration259
     * @tc.desc    NavBar total sub menu count 259 probe 259
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppSystemIntegration259', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let sum = 0;
      for (let k = 0; k < m.getTopCount(); k++) { sum += m.getSubCount(k); }
      expect(m.getTotalSubCount()).assertEqual(sum);
      expect(m.getNodes().length).assertEqual(m.getTopCount());
      expect(m.countChildrenOf(4)).assertEqual(0);
      expect(m.getNode(1000 + 259) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0260
     * @tc.name    NavAppSystemIntegration260
     * @tc.desc    NavBar total sub menu count 260 probe 260
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppSystemIntegration260', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let sum = 0;
      for (let k = 0; k < m.getTopCount(); k++) { sum += m.getSubCount(k); }
      expect(m.getTotalSubCount()).assertEqual(sum);
      expect(m.getNodes().length).assertEqual(m.getTopCount());
      expect(m.countChildrenOf(0)).assertEqual(0);
      expect(m.getNode(1000 + 260) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0261
     * @tc.name    NavAppSystemIntegration261
     * @tc.desc    NavBar total sub menu count 261 probe 261
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppSystemIntegration261', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let sum = 0;
      for (let k = 0; k < m.getTopCount(); k++) { sum += m.getSubCount(k); }
      expect(m.getTotalSubCount()).assertEqual(sum);
      expect(m.getNodes().length).assertEqual(m.getTopCount());
      expect(m.countChildrenOf(1)).assertEqual(0);
      expect(m.getNode(1000 + 261) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0262
     * @tc.name    NavAppSystemIntegration262
     * @tc.desc    NavBar total sub menu count 262 probe 262
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppSystemIntegration262', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let sum = 0;
      for (let k = 0; k < m.getTopCount(); k++) { sum += m.getSubCount(k); }
      expect(m.getTotalSubCount()).assertEqual(sum);
      expect(m.getNodes().length).assertEqual(m.getTopCount());
      expect(m.countChildrenOf(2)).assertEqual(0);
      expect(m.getNode(1000 + 262) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0263
     * @tc.name    NavAppSystemIntegration263
     * @tc.desc    NavBar total sub menu count 263 probe 263
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppSystemIntegration263', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let sum = 0;
      for (let k = 0; k < m.getTopCount(); k++) { sum += m.getSubCount(k); }
      expect(m.getTotalSubCount()).assertEqual(sum);
      expect(m.getNodes().length).assertEqual(m.getTopCount());
      expect(m.countChildrenOf(3)).assertEqual(0);
      expect(m.getNode(1000 + 263) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0264
     * @tc.name    NavAppSystemIntegration264
     * @tc.desc    NavBar total sub menu count 264 probe 264
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppSystemIntegration264', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let sum = 0;
      for (let k = 0; k < m.getTopCount(); k++) { sum += m.getSubCount(k); }
      expect(m.getTotalSubCount()).assertEqual(sum);
      expect(m.getNodes().length).assertEqual(m.getTopCount());
      expect(m.countChildrenOf(4)).assertEqual(0);
      expect(m.getNode(1000 + 264) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0265
     * @tc.name    NavAppSystemIntegration265
     * @tc.desc    NavBar total sub menu count 265 probe 265
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppSystemIntegration265', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let sum = 0;
      for (let k = 0; k < m.getTopCount(); k++) { sum += m.getSubCount(k); }
      expect(m.getTotalSubCount()).assertEqual(sum);
      expect(m.getNodes().length).assertEqual(m.getTopCount());
      expect(m.countChildrenOf(0)).assertEqual(0);
      expect(m.getNode(1000 + 265) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0266
     * @tc.name    NavAppSystemIntegration266
     * @tc.desc    NavBar total sub menu count 266 probe 266
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppSystemIntegration266', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let sum = 0;
      for (let k = 0; k < m.getTopCount(); k++) { sum += m.getSubCount(k); }
      expect(m.getTotalSubCount()).assertEqual(sum);
      expect(m.getNodes().length).assertEqual(m.getTopCount());
      expect(m.countChildrenOf(1)).assertEqual(0);
      expect(m.getNode(1000 + 266) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0267
     * @tc.name    NavAppSystemIntegration267
     * @tc.desc    NavBar total sub menu count 267 probe 267
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppSystemIntegration267', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let sum = 0;
      for (let k = 0; k < m.getTopCount(); k++) { sum += m.getSubCount(k); }
      expect(m.getTotalSubCount()).assertEqual(sum);
      expect(m.getNodes().length).assertEqual(m.getTopCount());
      expect(m.countChildrenOf(2)).assertEqual(0);
      expect(m.getNode(1000 + 267) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0268
     * @tc.name    NavAppSystemIntegration268
     * @tc.desc    NavBar total sub menu count 268 probe 268
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppSystemIntegration268', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let sum = 0;
      for (let k = 0; k < m.getTopCount(); k++) { sum += m.getSubCount(k); }
      expect(m.getTotalSubCount()).assertEqual(sum);
      expect(m.getNodes().length).assertEqual(m.getTopCount());
      expect(m.countChildrenOf(3)).assertEqual(0);
      expect(m.getNode(1000 + 268) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0269
     * @tc.name    NavAppSystemIntegration269
     * @tc.desc    NavBar total sub menu count 269 probe 269
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppSystemIntegration269', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let sum = 0;
      for (let k = 0; k < m.getTopCount(); k++) { sum += m.getSubCount(k); }
      expect(m.getTotalSubCount()).assertEqual(sum);
      expect(m.getNodes().length).assertEqual(m.getTopCount());
      expect(m.countChildrenOf(4)).assertEqual(0);
      expect(m.getNode(1000 + 269) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0270
     * @tc.name    NavAppSystemIntegration270
     * @tc.desc    NavBar total sub menu count 270 probe 270
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppSystemIntegration270', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let sum = 0;
      for (let k = 0; k < m.getTopCount(); k++) { sum += m.getSubCount(k); }
      expect(m.getTotalSubCount()).assertEqual(sum);
      expect(m.getNodes().length).assertEqual(m.getTopCount());
      expect(m.countChildrenOf(0)).assertEqual(0);
      expect(m.getNode(1000 + 270) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0271
     * @tc.name    NavAppSystemIntegration271
     * @tc.desc    NavBar total sub menu count 271 probe 271
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppSystemIntegration271', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let sum = 0;
      for (let k = 0; k < m.getTopCount(); k++) { sum += m.getSubCount(k); }
      expect(m.getTotalSubCount()).assertEqual(sum);
      expect(m.getNodes().length).assertEqual(m.getTopCount());
      expect(m.countChildrenOf(1)).assertEqual(0);
      expect(m.getNode(1000 + 271) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0272
     * @tc.name    NavAppSystemIntegration272
     * @tc.desc    NavBar total sub menu count 272 probe 272
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppSystemIntegration272', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let sum = 0;
      for (let k = 0; k < m.getTopCount(); k++) { sum += m.getSubCount(k); }
      expect(m.getTotalSubCount()).assertEqual(sum);
      expect(m.getNodes().length).assertEqual(m.getTopCount());
      expect(m.countChildrenOf(2)).assertEqual(0);
      expect(m.getNode(1000 + 272) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0273
     * @tc.name    NavAppSystemIntegration273
     * @tc.desc    NavBar total sub menu count 273 probe 273
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppSystemIntegration273', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let sum = 0;
      for (let k = 0; k < m.getTopCount(); k++) { sum += m.getSubCount(k); }
      expect(m.getTotalSubCount()).assertEqual(sum);
      expect(m.getNodes().length).assertEqual(m.getTopCount());
      expect(m.countChildrenOf(3)).assertEqual(0);
      expect(m.getNode(1000 + 273) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0274
     * @tc.name    NavAppSystemIntegration274
     * @tc.desc    NavBar total sub menu count 274 probe 274
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppSystemIntegration274', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let sum = 0;
      for (let k = 0; k < m.getTopCount(); k++) { sum += m.getSubCount(k); }
      expect(m.getTotalSubCount()).assertEqual(sum);
      expect(m.getNodes().length).assertEqual(m.getTopCount());
      expect(m.countChildrenOf(4)).assertEqual(0);
      expect(m.getNode(1000 + 274) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0275
     * @tc.name    NavAppSystemIntegration275
     * @tc.desc    NavBar total sub menu count 275 probe 275
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppSystemIntegration275', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let sum = 0;
      for (let k = 0; k < m.getTopCount(); k++) { sum += m.getSubCount(k); }
      expect(m.getTotalSubCount()).assertEqual(sum);
      expect(m.getNodes().length).assertEqual(m.getTopCount());
      expect(m.countChildrenOf(0)).assertEqual(0);
      expect(m.getNode(1000 + 275) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0276
     * @tc.name    NavAppSystemIntegration276
     * @tc.desc    NavBar total sub menu count 276 probe 276
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppSystemIntegration276', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let sum = 0;
      for (let k = 0; k < m.getTopCount(); k++) { sum += m.getSubCount(k); }
      expect(m.getTotalSubCount()).assertEqual(sum);
      expect(m.getNodes().length).assertEqual(m.getTopCount());
      expect(m.countChildrenOf(1)).assertEqual(0);
      expect(m.getNode(1000 + 276) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0277
     * @tc.name    NavAppSystemIntegration277
     * @tc.desc    NavBar total sub menu count 277 probe 277
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppSystemIntegration277', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let sum = 0;
      for (let k = 0; k < m.getTopCount(); k++) { sum += m.getSubCount(k); }
      expect(m.getTotalSubCount()).assertEqual(sum);
      expect(m.getNodes().length).assertEqual(m.getTopCount());
      expect(m.countChildrenOf(2)).assertEqual(0);
      expect(m.getNode(1000 + 277) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0278
     * @tc.name    NavAppSystemIntegration278
     * @tc.desc    NavBar total sub menu count 278 probe 278
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppSystemIntegration278', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let sum = 0;
      for (let k = 0; k < m.getTopCount(); k++) { sum += m.getSubCount(k); }
      expect(m.getTotalSubCount()).assertEqual(sum);
      expect(m.getNodes().length).assertEqual(m.getTopCount());
      expect(m.countChildrenOf(3)).assertEqual(0);
      expect(m.getNode(1000 + 278) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0279
     * @tc.name    NavAppSystemIntegration279
     * @tc.desc    NavBar total sub menu count 279 probe 279
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppSystemIntegration279', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let sum = 0;
      for (let k = 0; k < m.getTopCount(); k++) { sum += m.getSubCount(k); }
      expect(m.getTotalSubCount()).assertEqual(sum);
      expect(m.getNodes().length).assertEqual(m.getTopCount());
      expect(m.countChildrenOf(4)).assertEqual(0);
      expect(m.getNode(1000 + 279) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0280
     * @tc.name    NavAppSystemIntegration280
     * @tc.desc    NavBar total sub menu count 280 probe 280
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppSystemIntegration280', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let sum = 0;
      for (let k = 0; k < m.getTopCount(); k++) { sum += m.getSubCount(k); }
      expect(m.getTotalSubCount()).assertEqual(sum);
      expect(m.getNodes().length).assertEqual(m.getTopCount());
      expect(m.countChildrenOf(0)).assertEqual(0);
      expect(m.getNode(1000 + 280) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0281
     * @tc.name    NavAppSystemIntegration281
     * @tc.desc    NavBar total sub menu count 281 probe 281
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppSystemIntegration281', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let sum = 0;
      for (let k = 0; k < m.getTopCount(); k++) { sum += m.getSubCount(k); }
      expect(m.getTotalSubCount()).assertEqual(sum);
      expect(m.getNodes().length).assertEqual(m.getTopCount());
      expect(m.countChildrenOf(1)).assertEqual(0);
      expect(m.getNode(1000 + 281) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0282
     * @tc.name    NavAppSystemIntegration282
     * @tc.desc    NavBar total sub menu count 282 probe 282
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppSystemIntegration282', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let sum = 0;
      for (let k = 0; k < m.getTopCount(); k++) { sum += m.getSubCount(k); }
      expect(m.getTotalSubCount()).assertEqual(sum);
      expect(m.getNodes().length).assertEqual(m.getTopCount());
      expect(m.countChildrenOf(2)).assertEqual(0);
      expect(m.getNode(1000 + 282) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0283
     * @tc.name    NavAppSystemIntegration283
     * @tc.desc    NavBar total sub menu count 283 probe 283
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppSystemIntegration283', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let sum = 0;
      for (let k = 0; k < m.getTopCount(); k++) { sum += m.getSubCount(k); }
      expect(m.getTotalSubCount()).assertEqual(sum);
      expect(m.getNodes().length).assertEqual(m.getTopCount());
      expect(m.countChildrenOf(3)).assertEqual(0);
      expect(m.getNode(1000 + 283) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0284
     * @tc.name    NavAppSystemIntegration284
     * @tc.desc    NavBar total sub menu count 284 probe 284
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppSystemIntegration284', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let sum = 0;
      for (let k = 0; k < m.getTopCount(); k++) { sum += m.getSubCount(k); }
      expect(m.getTotalSubCount()).assertEqual(sum);
      expect(m.getNodes().length).assertEqual(m.getTopCount());
      expect(m.countChildrenOf(4)).assertEqual(0);
      expect(m.getNode(1000 + 284) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0285
     * @tc.name    NavAppSystemIntegration285
     * @tc.desc    NavBar total sub menu count 285 probe 285
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppSystemIntegration285', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let sum = 0;
      for (let k = 0; k < m.getTopCount(); k++) { sum += m.getSubCount(k); }
      expect(m.getTotalSubCount()).assertEqual(sum);
      expect(m.getNodes().length).assertEqual(m.getTopCount());
      expect(m.countChildrenOf(0)).assertEqual(0);
      expect(m.getNode(1000 + 285) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0286
     * @tc.name    NavAppSystemIntegration286
     * @tc.desc    NavBar total sub menu count 286 probe 286
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppSystemIntegration286', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let sum = 0;
      for (let k = 0; k < m.getTopCount(); k++) { sum += m.getSubCount(k); }
      expect(m.getTotalSubCount()).assertEqual(sum);
      expect(m.getNodes().length).assertEqual(m.getTopCount());
      expect(m.countChildrenOf(1)).assertEqual(0);
      expect(m.getNode(1000 + 286) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0287
     * @tc.name    NavAppSystemIntegration287
     * @tc.desc    NavBar total sub menu count 287 probe 287
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppSystemIntegration287', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let sum = 0;
      for (let k = 0; k < m.getTopCount(); k++) { sum += m.getSubCount(k); }
      expect(m.getTotalSubCount()).assertEqual(sum);
      expect(m.getNodes().length).assertEqual(m.getTopCount());
      expect(m.countChildrenOf(2)).assertEqual(0);
      expect(m.getNode(1000 + 287) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0288
     * @tc.name    NavAppSystemIntegration288
     * @tc.desc    NavBar total sub menu count 288 probe 288
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppSystemIntegration288', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let sum = 0;
      for (let k = 0; k < m.getTopCount(); k++) { sum += m.getSubCount(k); }
      expect(m.getTotalSubCount()).assertEqual(sum);
      expect(m.getNodes().length).assertEqual(m.getTopCount());
      expect(m.countChildrenOf(3)).assertEqual(0);
      expect(m.getNode(1000 + 288) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0289
     * @tc.name    NavAppSystemIntegration289
     * @tc.desc    NavBar total sub menu count 289 probe 289
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppSystemIntegration289', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let sum = 0;
      for (let k = 0; k < m.getTopCount(); k++) { sum += m.getSubCount(k); }
      expect(m.getTotalSubCount()).assertEqual(sum);
      expect(m.getNodes().length).assertEqual(m.getTopCount());
      expect(m.countChildrenOf(4)).assertEqual(0);
      expect(m.getNode(1000 + 289) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0290
     * @tc.name    NavAppSystemIntegration290
     * @tc.desc    NavBar total sub menu count 290 probe 290
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppSystemIntegration290', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let sum = 0;
      for (let k = 0; k < m.getTopCount(); k++) { sum += m.getSubCount(k); }
      expect(m.getTotalSubCount()).assertEqual(sum);
      expect(m.getNodes().length).assertEqual(m.getTopCount());
      expect(m.countChildrenOf(0)).assertEqual(0);
      expect(m.getNode(1000 + 290) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0291
     * @tc.name    NavAppSystemIntegration291
     * @tc.desc    NavBar total sub menu count 291 probe 291
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppSystemIntegration291', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let sum = 0;
      for (let k = 0; k < m.getTopCount(); k++) { sum += m.getSubCount(k); }
      expect(m.getTotalSubCount()).assertEqual(sum);
      expect(m.getNodes().length).assertEqual(m.getTopCount());
      expect(m.countChildrenOf(1)).assertEqual(0);
      expect(m.getNode(1000 + 291) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0292
     * @tc.name    NavAppSystemIntegration292
     * @tc.desc    NavBar total sub menu count 292 probe 292
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppSystemIntegration292', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let sum = 0;
      for (let k = 0; k < m.getTopCount(); k++) { sum += m.getSubCount(k); }
      expect(m.getTotalSubCount()).assertEqual(sum);
      expect(m.getNodes().length).assertEqual(m.getTopCount());
      expect(m.countChildrenOf(2)).assertEqual(0);
      expect(m.getNode(1000 + 292) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0293
     * @tc.name    NavAppSystemIntegration293
     * @tc.desc    NavBar total sub menu count 293 probe 293
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppSystemIntegration293', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let sum = 0;
      for (let k = 0; k < m.getTopCount(); k++) { sum += m.getSubCount(k); }
      expect(m.getTotalSubCount()).assertEqual(sum);
      expect(m.getNodes().length).assertEqual(m.getTopCount());
      expect(m.countChildrenOf(3)).assertEqual(0);
      expect(m.getNode(1000 + 293) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0294
     * @tc.name    NavAppSystemIntegration294
     * @tc.desc    NavBar total sub menu count 294 probe 294
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppSystemIntegration294', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let sum = 0;
      for (let k = 0; k < m.getTopCount(); k++) { sum += m.getSubCount(k); }
      expect(m.getTotalSubCount()).assertEqual(sum);
      expect(m.getNodes().length).assertEqual(m.getTopCount());
      expect(m.countChildrenOf(4)).assertEqual(0);
      expect(m.getNode(1000 + 294) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0295
     * @tc.name    NavAppSystemIntegration295
     * @tc.desc    NavBar total sub menu count 295 probe 295
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppSystemIntegration295', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let sum = 0;
      for (let k = 0; k < m.getTopCount(); k++) { sum += m.getSubCount(k); }
      expect(m.getTotalSubCount()).assertEqual(sum);
      expect(m.getNodes().length).assertEqual(m.getTopCount());
      expect(m.countChildrenOf(0)).assertEqual(0);
      expect(m.getNode(1000 + 295) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0296
     * @tc.name    NavAppSystemIntegration296
     * @tc.desc    NavBar total sub menu count 296 probe 296
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppSystemIntegration296', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let sum = 0;
      for (let k = 0; k < m.getTopCount(); k++) { sum += m.getSubCount(k); }
      expect(m.getTotalSubCount()).assertEqual(sum);
      expect(m.getNodes().length).assertEqual(m.getTopCount());
      expect(m.countChildrenOf(1)).assertEqual(0);
      expect(m.getNode(1000 + 296) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0297
     * @tc.name    NavAppSystemIntegration297
     * @tc.desc    NavBar total sub menu count 297 probe 297
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppSystemIntegration297', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let sum = 0;
      for (let k = 0; k < m.getTopCount(); k++) { sum += m.getSubCount(k); }
      expect(m.getTotalSubCount()).assertEqual(sum);
      expect(m.getNodes().length).assertEqual(m.getTopCount());
      expect(m.countChildrenOf(2)).assertEqual(0);
      expect(m.getNode(1000 + 297) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0298
     * @tc.name    NavAppSystemIntegration298
     * @tc.desc    NavBar total sub menu count 298 probe 298
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppSystemIntegration298', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let sum = 0;
      for (let k = 0; k < m.getTopCount(); k++) { sum += m.getSubCount(k); }
      expect(m.getTotalSubCount()).assertEqual(sum);
      expect(m.getNodes().length).assertEqual(m.getTopCount());
      expect(m.countChildrenOf(3)).assertEqual(0);
      expect(m.getNode(1000 + 298) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0299
     * @tc.name    NavAppSystemIntegration299
     * @tc.desc    NavBar total sub menu count 299 probe 299
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppSystemIntegration299', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let sum = 0;
      for (let k = 0; k < m.getTopCount(); k++) { sum += m.getSubCount(k); }
      expect(m.getTotalSubCount()).assertEqual(sum);
      expect(m.getNodes().length).assertEqual(m.getTopCount());
      expect(m.countChildrenOf(4)).assertEqual(0);
      expect(m.getNode(1000 + 299) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

  });
}

