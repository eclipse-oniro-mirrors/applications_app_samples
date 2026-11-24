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
import { MarketModel } from '../Shared/MarketModel';

const DOMAIN: number = 0xF811;
const TAG: string = '[MarketTests]';

export default function marketIntegrationTestingSuite() {
  describe('MarketIntegrationTestingSuite', () => {
    let m: MarketModel = new MarketModel();

    beforeEach(() => {
      m = new MarketModel();
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0100
     * @tc.name    MarketIntegrationTesting001
     * @tc.desc    Market grouped counts with probe 286 probe 286
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countByGroup('app') + m.countByGroup('game')).assertEqual(m.getAppCount() + m.getGameCount());
      expect(m.countByGroup('missing286')).assertEqual(0);
      expect(m.searchTitle('nohit286')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0200
     * @tc.name    MarketIntegrationTesting002
     * @tc.desc    Market entrance catalogue size 287 probe 287
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getEntranceCount()).assertEqual(5);
      expect(m.getEntrances().length).assertEqual(5);
      expect(m.getAppCount()).assertEqual(21);
      expect(m.countByGroup('probe287')).assertEqual(0);
      expect(m.searchTitle('nohit287')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0300
     * @tc.name    MarketIntegrationTesting003
     * @tc.desc    Market grouped counts with probe 288 probe 288
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countByGroup('app') + m.countByGroup('game')).assertEqual(m.getAppCount() + m.getGameCount());
      expect(m.countByGroup('missing288')).assertEqual(0);
      expect(m.searchTitle('nohit288')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0400
     * @tc.name    MarketIntegrationTesting004
     * @tc.desc    Market entrance catalogue size 289 probe 289
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getEntranceCount()).assertEqual(5);
      expect(m.getEntrances().length).assertEqual(5);
      expect(m.getAppCount()).assertEqual(21);
      expect(m.countByGroup('probe289')).assertEqual(0);
      expect(m.searchTitle('nohit289')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0500
     * @tc.name    MarketIntegrationTesting005
     * @tc.desc    Market grouped counts with probe 290 probe 290
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countByGroup('app') + m.countByGroup('game')).assertEqual(m.getAppCount() + m.getGameCount());
      expect(m.countByGroup('missing290')).assertEqual(0);
      expect(m.searchTitle('nohit290')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0600
     * @tc.name    MarketIntegrationTesting006
     * @tc.desc    Market entrance catalogue size 291 probe 291
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getEntranceCount()).assertEqual(5);
      expect(m.getEntrances().length).assertEqual(5);
      expect(m.getAppCount()).assertEqual(21);
      expect(m.countByGroup('probe291')).assertEqual(0);
      expect(m.searchTitle('nohit291')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0700
     * @tc.name    MarketIntegrationTesting007
     * @tc.desc    Market grouped counts with probe 292 probe 292
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countByGroup('app') + m.countByGroup('game')).assertEqual(m.getAppCount() + m.getGameCount());
      expect(m.countByGroup('missing292')).assertEqual(0);
      expect(m.searchTitle('nohit292')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0800
     * @tc.name    MarketIntegrationTesting008
     * @tc.desc    Market entrance catalogue size 293 probe 293
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getEntranceCount()).assertEqual(5);
      expect(m.getEntrances().length).assertEqual(5);
      expect(m.getAppCount()).assertEqual(21);
      expect(m.countByGroup('probe293')).assertEqual(0);
      expect(m.searchTitle('nohit293')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0900
     * @tc.name    MarketIntegrationTesting009
     * @tc.desc    Market grouped counts with probe 294 probe 294
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countByGroup('app') + m.countByGroup('game')).assertEqual(m.getAppCount() + m.getGameCount());
      expect(m.countByGroup('missing294')).assertEqual(0);
      expect(m.searchTitle('nohit294')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1000
     * @tc.name    MarketIntegrationTesting010
     * @tc.desc    Market entrance catalogue size 295 probe 295
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getEntranceCount()).assertEqual(5);
      expect(m.getEntrances().length).assertEqual(5);
      expect(m.getAppCount()).assertEqual(21);
      expect(m.countByGroup('probe295')).assertEqual(0);
      expect(m.searchTitle('nohit295')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1100
     * @tc.name    MarketIntegrationTesting011
     * @tc.desc    Market grouped counts with probe 296 probe 296
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countByGroup('app') + m.countByGroup('game')).assertEqual(m.getAppCount() + m.getGameCount());
      expect(m.countByGroup('missing296')).assertEqual(0);
      expect(m.searchTitle('nohit296')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1200
     * @tc.name    MarketIntegrationTesting012
     * @tc.desc    Market entrance catalogue size 297 probe 297
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getEntranceCount()).assertEqual(5);
      expect(m.getEntrances().length).assertEqual(5);
      expect(m.getAppCount()).assertEqual(21);
      expect(m.countByGroup('probe297')).assertEqual(0);
      expect(m.searchTitle('nohit297')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1300
     * @tc.name    MarketIntegrationTesting013
     * @tc.desc    Market grouped counts with probe 298 probe 298
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countByGroup('app') + m.countByGroup('game')).assertEqual(m.getAppCount() + m.getGameCount());
      expect(m.countByGroup('missing298')).assertEqual(0);
      expect(m.searchTitle('nohit298')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1400
     * @tc.name    MarketIntegrationTesting014
     * @tc.desc    Market entrance catalogue size 299 probe 299
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getEntranceCount()).assertEqual(5);
      expect(m.getEntrances().length).assertEqual(5);
      expect(m.getAppCount()).assertEqual(21);
      expect(m.countByGroup('probe299')).assertEqual(0);
      expect(m.searchTitle('nohit299')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1500
     * @tc.name    MarketIntegrationTesting015
     * @tc.desc    Market grouped counts with probe 300 probe 300
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countByGroup('app') + m.countByGroup('game')).assertEqual(m.getAppCount() + m.getGameCount());
      expect(m.countByGroup('missing300')).assertEqual(0);
      expect(m.searchTitle('nohit300')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1600
     * @tc.name    MarketIntegrationTesting016
     * @tc.desc    Market entrance catalogue size 301 probe 301
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getEntranceCount()).assertEqual(5);
      expect(m.getEntrances().length).assertEqual(5);
      expect(m.getAppCount()).assertEqual(21);
      expect(m.countByGroup('probe301')).assertEqual(0);
      expect(m.searchTitle('nohit301')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1700
     * @tc.name    MarketIntegrationTesting017
     * @tc.desc    Market grouped counts with probe 302 probe 302
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countByGroup('app') + m.countByGroup('game')).assertEqual(m.getAppCount() + m.getGameCount());
      expect(m.countByGroup('missing302')).assertEqual(0);
      expect(m.searchTitle('nohit302')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1800
     * @tc.name    MarketIntegrationTesting018
     * @tc.desc    Market entrance catalogue size 303 probe 303
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getEntranceCount()).assertEqual(5);
      expect(m.getEntrances().length).assertEqual(5);
      expect(m.getAppCount()).assertEqual(21);
      expect(m.countByGroup('probe303')).assertEqual(0);
      expect(m.searchTitle('nohit303')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1900
     * @tc.name    MarketIntegrationTesting019
     * @tc.desc    Market grouped counts with probe 304 probe 304
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countByGroup('app') + m.countByGroup('game')).assertEqual(m.getAppCount() + m.getGameCount());
      expect(m.countByGroup('missing304')).assertEqual(0);
      expect(m.searchTitle('nohit304')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_2000
     * @tc.name    MarketIntegrationTesting020
     * @tc.desc    Market entrance catalogue size 305 probe 305
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getEntranceCount()).assertEqual(5);
      expect(m.getEntrances().length).assertEqual(5);
      expect(m.getAppCount()).assertEqual(21);
      expect(m.countByGroup('probe305')).assertEqual(0);
      expect(m.searchTitle('nohit305')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_2100
     * @tc.name    MarketIntegrationTesting021
     * @tc.desc    Market grouped counts with probe 306 probe 306
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countByGroup('app') + m.countByGroup('game')).assertEqual(m.getAppCount() + m.getGameCount());
      expect(m.countByGroup('missing306')).assertEqual(0);
      expect(m.searchTitle('nohit306')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_2200
     * @tc.name    MarketIntegrationTesting022
     * @tc.desc    Market entrance catalogue size 307 probe 307
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getEntranceCount()).assertEqual(5);
      expect(m.getEntrances().length).assertEqual(5);
      expect(m.getAppCount()).assertEqual(21);
      expect(m.countByGroup('probe307')).assertEqual(0);
      expect(m.searchTitle('nohit307')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_2300
     * @tc.name    MarketIntegrationTesting023
     * @tc.desc    Market grouped counts with probe 308 probe 308
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countByGroup('app') + m.countByGroup('game')).assertEqual(m.getAppCount() + m.getGameCount());
      expect(m.countByGroup('missing308')).assertEqual(0);
      expect(m.searchTitle('nohit308')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_2400
     * @tc.name    MarketIntegrationTesting024
     * @tc.desc    Market entrance catalogue size 309 probe 309
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getEntranceCount()).assertEqual(5);
      expect(m.getEntrances().length).assertEqual(5);
      expect(m.getAppCount()).assertEqual(21);
      expect(m.countByGroup('probe309')).assertEqual(0);
      expect(m.searchTitle('nohit309')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_2500
     * @tc.name    MarketIntegrationTesting025
     * @tc.desc    Market grouped counts with probe 310 probe 310
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countByGroup('app') + m.countByGroup('game')).assertEqual(m.getAppCount() + m.getGameCount());
      expect(m.countByGroup('missing310')).assertEqual(0);
      expect(m.searchTitle('nohit310')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_2600
     * @tc.name    MarketIntegrationTesting026
     * @tc.desc    Market entrance catalogue size 311 probe 311
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getEntranceCount()).assertEqual(5);
      expect(m.getEntrances().length).assertEqual(5);
      expect(m.getAppCount()).assertEqual(21);
      expect(m.countByGroup('probe311')).assertEqual(0);
      expect(m.searchTitle('nohit311')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_2700
     * @tc.name    MarketIntegrationTesting027
     * @tc.desc    Market grouped counts with probe 312 probe 312
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countByGroup('app') + m.countByGroup('game')).assertEqual(m.getAppCount() + m.getGameCount());
      expect(m.countByGroup('missing312')).assertEqual(0);
      expect(m.searchTitle('nohit312')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_2800
     * @tc.name    MarketIntegrationTesting028
     * @tc.desc    Market entrance catalogue size 313 probe 313
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getEntranceCount()).assertEqual(5);
      expect(m.getEntrances().length).assertEqual(5);
      expect(m.getAppCount()).assertEqual(21);
      expect(m.countByGroup('probe313')).assertEqual(0);
      expect(m.searchTitle('nohit313')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_2900
     * @tc.name    MarketIntegrationTesting029
     * @tc.desc    Market grouped counts with probe 314 probe 314
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countByGroup('app') + m.countByGroup('game')).assertEqual(m.getAppCount() + m.getGameCount());
      expect(m.countByGroup('missing314')).assertEqual(0);
      expect(m.searchTitle('nohit314')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_3000
     * @tc.name    MarketIntegrationTesting030
     * @tc.desc    Market entrance catalogue size 315 probe 315
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getEntranceCount()).assertEqual(5);
      expect(m.getEntrances().length).assertEqual(5);
      expect(m.getAppCount()).assertEqual(21);
      expect(m.countByGroup('probe315')).assertEqual(0);
      expect(m.searchTitle('nohit315')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_3100
     * @tc.name    MarketIntegrationTesting031
     * @tc.desc    Market grouped counts with probe 316 probe 316
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countByGroup('app') + m.countByGroup('game')).assertEqual(m.getAppCount() + m.getGameCount());
      expect(m.countByGroup('missing316')).assertEqual(0);
      expect(m.searchTitle('nohit316')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_3200
     * @tc.name    MarketIntegrationTesting032
     * @tc.desc    Market entrance catalogue size 317 probe 317
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getEntranceCount()).assertEqual(5);
      expect(m.getEntrances().length).assertEqual(5);
      expect(m.getAppCount()).assertEqual(21);
      expect(m.countByGroup('probe317')).assertEqual(0);
      expect(m.searchTitle('nohit317')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_3300
     * @tc.name    MarketIntegrationTesting033
     * @tc.desc    Market grouped counts with probe 318 probe 318
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countByGroup('app') + m.countByGroup('game')).assertEqual(m.getAppCount() + m.getGameCount());
      expect(m.countByGroup('missing318')).assertEqual(0);
      expect(m.searchTitle('nohit318')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_3400
     * @tc.name    MarketIntegrationTesting034
     * @tc.desc    Market entrance catalogue size 319 probe 319
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getEntranceCount()).assertEqual(5);
      expect(m.getEntrances().length).assertEqual(5);
      expect(m.getAppCount()).assertEqual(21);
      expect(m.countByGroup('probe319')).assertEqual(0);
      expect(m.searchTitle('nohit319')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_3500
     * @tc.name    MarketIntegrationTesting035
     * @tc.desc    Market grouped counts with probe 320 probe 320
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countByGroup('app') + m.countByGroup('game')).assertEqual(m.getAppCount() + m.getGameCount());
      expect(m.countByGroup('missing320')).assertEqual(0);
      expect(m.searchTitle('nohit320')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_3600
     * @tc.name    MarketIntegrationTesting036
     * @tc.desc    Market entrance catalogue size 321 probe 321
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getEntranceCount()).assertEqual(5);
      expect(m.getEntrances().length).assertEqual(5);
      expect(m.getAppCount()).assertEqual(21);
      expect(m.countByGroup('probe321')).assertEqual(0);
      expect(m.searchTitle('nohit321')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_3700
     * @tc.name    MarketIntegrationTesting037
     * @tc.desc    Market grouped counts with probe 322 probe 322
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countByGroup('app') + m.countByGroup('game')).assertEqual(m.getAppCount() + m.getGameCount());
      expect(m.countByGroup('missing322')).assertEqual(0);
      expect(m.searchTitle('nohit322')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_3800
     * @tc.name    MarketIntegrationTesting038
     * @tc.desc    Market entrance catalogue size 323 probe 323
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getEntranceCount()).assertEqual(5);
      expect(m.getEntrances().length).assertEqual(5);
      expect(m.getAppCount()).assertEqual(21);
      expect(m.countByGroup('probe323')).assertEqual(0);
      expect(m.searchTitle('nohit323')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_3900
     * @tc.name    MarketIntegrationTesting039
     * @tc.desc    Market grouped counts with probe 324 probe 324
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countByGroup('app') + m.countByGroup('game')).assertEqual(m.getAppCount() + m.getGameCount());
      expect(m.countByGroup('missing324')).assertEqual(0);
      expect(m.searchTitle('nohit324')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_4000
     * @tc.name    MarketIntegrationTesting040
     * @tc.desc    Market entrance catalogue size 325 probe 325
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getEntranceCount()).assertEqual(5);
      expect(m.getEntrances().length).assertEqual(5);
      expect(m.getAppCount()).assertEqual(21);
      expect(m.countByGroup('probe325')).assertEqual(0);
      expect(m.searchTitle('nohit325')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_4100
     * @tc.name    MarketIntegrationTesting041
     * @tc.desc    Market grouped counts with probe 326 probe 326
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countByGroup('app') + m.countByGroup('game')).assertEqual(m.getAppCount() + m.getGameCount());
      expect(m.countByGroup('missing326')).assertEqual(0);
      expect(m.searchTitle('nohit326')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_4200
     * @tc.name    MarketIntegrationTesting042
     * @tc.desc    Market entrance catalogue size 327 probe 327
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getEntranceCount()).assertEqual(5);
      expect(m.getEntrances().length).assertEqual(5);
      expect(m.getAppCount()).assertEqual(21);
      expect(m.countByGroup('probe327')).assertEqual(0);
      expect(m.searchTitle('nohit327')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_4300
     * @tc.name    MarketIntegrationTesting043
     * @tc.desc    Market grouped counts with probe 328 probe 328
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countByGroup('app') + m.countByGroup('game')).assertEqual(m.getAppCount() + m.getGameCount());
      expect(m.countByGroup('missing328')).assertEqual(0);
      expect(m.searchTitle('nohit328')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_4400
     * @tc.name    MarketIntegrationTesting044
     * @tc.desc    Market entrance catalogue size 329 probe 329
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getEntranceCount()).assertEqual(5);
      expect(m.getEntrances().length).assertEqual(5);
      expect(m.getAppCount()).assertEqual(21);
      expect(m.countByGroup('probe329')).assertEqual(0);
      expect(m.searchTitle('nohit329')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_4500
     * @tc.name    MarketIntegrationTesting045
     * @tc.desc    Market grouped counts with probe 330 probe 330
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countByGroup('app') + m.countByGroup('game')).assertEqual(m.getAppCount() + m.getGameCount());
      expect(m.countByGroup('missing330')).assertEqual(0);
      expect(m.searchTitle('nohit330')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_4600
     * @tc.name    MarketIntegrationTesting046
     * @tc.desc    Market entrance catalogue size 331 probe 331
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getEntranceCount()).assertEqual(5);
      expect(m.getEntrances().length).assertEqual(5);
      expect(m.getAppCount()).assertEqual(21);
      expect(m.countByGroup('probe331')).assertEqual(0);
      expect(m.searchTitle('nohit331')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_4700
     * @tc.name    MarketIntegrationTesting047
     * @tc.desc    Market grouped counts with probe 332 probe 332
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countByGroup('app') + m.countByGroup('game')).assertEqual(m.getAppCount() + m.getGameCount());
      expect(m.countByGroup('missing332')).assertEqual(0);
      expect(m.searchTitle('nohit332')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_4800
     * @tc.name    MarketIntegrationTesting048
     * @tc.desc    Market entrance catalogue size 333 probe 333
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getEntranceCount()).assertEqual(5);
      expect(m.getEntrances().length).assertEqual(5);
      expect(m.getAppCount()).assertEqual(21);
      expect(m.countByGroup('probe333')).assertEqual(0);
      expect(m.searchTitle('nohit333')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_4900
     * @tc.name    MarketIntegrationTesting049
     * @tc.desc    Market grouped counts with probe 334 probe 334
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countByGroup('app') + m.countByGroup('game')).assertEqual(m.getAppCount() + m.getGameCount());
      expect(m.countByGroup('missing334')).assertEqual(0);
      expect(m.searchTitle('nohit334')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_5000
     * @tc.name    MarketIntegrationTesting050
     * @tc.desc    Market entrance catalogue size 335 probe 335
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getEntranceCount()).assertEqual(5);
      expect(m.getEntrances().length).assertEqual(5);
      expect(m.getAppCount()).assertEqual(21);
      expect(m.countByGroup('probe335')).assertEqual(0);
      expect(m.searchTitle('nohit335')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_5100
     * @tc.name    MarketIntegrationTesting051
     * @tc.desc    Market grouped counts with probe 336 probe 336
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting051', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countByGroup('app') + m.countByGroup('game')).assertEqual(m.getAppCount() + m.getGameCount());
      expect(m.countByGroup('missing336')).assertEqual(0);
      expect(m.searchTitle('nohit336')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_5200
     * @tc.name    MarketIntegrationTesting052
     * @tc.desc    Market entrance catalogue size 337 probe 337
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting052', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getEntranceCount()).assertEqual(5);
      expect(m.getEntrances().length).assertEqual(5);
      expect(m.getAppCount()).assertEqual(21);
      expect(m.countByGroup('probe337')).assertEqual(0);
      expect(m.searchTitle('nohit337')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_5300
     * @tc.name    MarketIntegrationTesting053
     * @tc.desc    Market grouped counts with probe 338 probe 338
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting053', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countByGroup('app') + m.countByGroup('game')).assertEqual(m.getAppCount() + m.getGameCount());
      expect(m.countByGroup('missing338')).assertEqual(0);
      expect(m.searchTitle('nohit338')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_5400
     * @tc.name    MarketIntegrationTesting054
     * @tc.desc    Market entrance catalogue size 339 probe 339
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting054', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getEntranceCount()).assertEqual(5);
      expect(m.getEntrances().length).assertEqual(5);
      expect(m.getAppCount()).assertEqual(21);
      expect(m.countByGroup('probe339')).assertEqual(0);
      expect(m.searchTitle('nohit339')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_5500
     * @tc.name    MarketIntegrationTesting055
     * @tc.desc    Market grouped counts with probe 340 probe 340
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting055', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countByGroup('app') + m.countByGroup('game')).assertEqual(m.getAppCount() + m.getGameCount());
      expect(m.countByGroup('missing340')).assertEqual(0);
      expect(m.searchTitle('nohit340')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_5600
     * @tc.name    MarketIntegrationTesting056
     * @tc.desc    Market entrance catalogue size 341 probe 341
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting056', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getEntranceCount()).assertEqual(5);
      expect(m.getEntrances().length).assertEqual(5);
      expect(m.getAppCount()).assertEqual(21);
      expect(m.countByGroup('probe341')).assertEqual(0);
      expect(m.searchTitle('nohit341')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_5700
     * @tc.name    MarketIntegrationTesting057
     * @tc.desc    Market grouped counts with probe 342 probe 342
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting057', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countByGroup('app') + m.countByGroup('game')).assertEqual(m.getAppCount() + m.getGameCount());
      expect(m.countByGroup('missing342')).assertEqual(0);
      expect(m.searchTitle('nohit342')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_5800
     * @tc.name    MarketIntegrationTesting058
     * @tc.desc    Market entrance catalogue size 343 probe 343
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting058', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getEntranceCount()).assertEqual(5);
      expect(m.getEntrances().length).assertEqual(5);
      expect(m.getAppCount()).assertEqual(21);
      expect(m.countByGroup('probe343')).assertEqual(0);
      expect(m.searchTitle('nohit343')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_5900
     * @tc.name    MarketIntegrationTesting059
     * @tc.desc    Market grouped counts with probe 344 probe 344
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting059', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countByGroup('app') + m.countByGroup('game')).assertEqual(m.getAppCount() + m.getGameCount());
      expect(m.countByGroup('missing344')).assertEqual(0);
      expect(m.searchTitle('nohit344')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_6000
     * @tc.name    MarketIntegrationTesting060
     * @tc.desc    Market entrance catalogue size 345 probe 345
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting060', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getEntranceCount()).assertEqual(5);
      expect(m.getEntrances().length).assertEqual(5);
      expect(m.getAppCount()).assertEqual(21);
      expect(m.countByGroup('probe345')).assertEqual(0);
      expect(m.searchTitle('nohit345')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_6100
     * @tc.name    MarketIntegrationTesting061
     * @tc.desc    Market grouped counts with probe 346 probe 346
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting061', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countByGroup('app') + m.countByGroup('game')).assertEqual(m.getAppCount() + m.getGameCount());
      expect(m.countByGroup('missing346')).assertEqual(0);
      expect(m.searchTitle('nohit346')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_6200
     * @tc.name    MarketIntegrationTesting062
     * @tc.desc    Market entrance catalogue size 347 probe 347
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting062', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getEntranceCount()).assertEqual(5);
      expect(m.getEntrances().length).assertEqual(5);
      expect(m.getAppCount()).assertEqual(21);
      expect(m.countByGroup('probe347')).assertEqual(0);
      expect(m.searchTitle('nohit347')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_6300
     * @tc.name    MarketIntegrationTesting063
     * @tc.desc    Market grouped counts with probe 348 probe 348
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting063', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countByGroup('app') + m.countByGroup('game')).assertEqual(m.getAppCount() + m.getGameCount());
      expect(m.countByGroup('missing348')).assertEqual(0);
      expect(m.searchTitle('nohit348')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_6400
     * @tc.name    MarketIntegrationTesting064
     * @tc.desc    Market entrance catalogue size 349 probe 349
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting064', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getEntranceCount()).assertEqual(5);
      expect(m.getEntrances().length).assertEqual(5);
      expect(m.getAppCount()).assertEqual(21);
      expect(m.countByGroup('probe349')).assertEqual(0);
      expect(m.searchTitle('nohit349')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_6500
     * @tc.name    MarketIntegrationTesting065
     * @tc.desc    Market grouped counts with probe 350 probe 350
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting065', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countByGroup('app') + m.countByGroup('game')).assertEqual(m.getAppCount() + m.getGameCount());
      expect(m.countByGroup('missing350')).assertEqual(0);
      expect(m.searchTitle('nohit350')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_6600
     * @tc.name    MarketIntegrationTesting066
     * @tc.desc    Market entrance catalogue size 351 probe 351
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting066', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getEntranceCount()).assertEqual(5);
      expect(m.getEntrances().length).assertEqual(5);
      expect(m.getAppCount()).assertEqual(21);
      expect(m.countByGroup('probe351')).assertEqual(0);
      expect(m.searchTitle('nohit351')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_6700
     * @tc.name    MarketIntegrationTesting067
     * @tc.desc    Market grouped counts with probe 352 probe 352
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting067', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countByGroup('app') + m.countByGroup('game')).assertEqual(m.getAppCount() + m.getGameCount());
      expect(m.countByGroup('missing352')).assertEqual(0);
      expect(m.searchTitle('nohit352')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_6800
     * @tc.name    MarketIntegrationTesting068
     * @tc.desc    Market entrance catalogue size 353 probe 353
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting068', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getEntranceCount()).assertEqual(5);
      expect(m.getEntrances().length).assertEqual(5);
      expect(m.getAppCount()).assertEqual(21);
      expect(m.countByGroup('probe353')).assertEqual(0);
      expect(m.searchTitle('nohit353')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_6900
     * @tc.name    MarketIntegrationTesting069
     * @tc.desc    Market grouped counts with probe 354 probe 354
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting069', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countByGroup('app') + m.countByGroup('game')).assertEqual(m.getAppCount() + m.getGameCount());
      expect(m.countByGroup('missing354')).assertEqual(0);
      expect(m.searchTitle('nohit354')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_7000
     * @tc.name    MarketIntegrationTesting070
     * @tc.desc    Market entrance catalogue size 355 probe 355
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting070', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getEntranceCount()).assertEqual(5);
      expect(m.getEntrances().length).assertEqual(5);
      expect(m.getAppCount()).assertEqual(21);
      expect(m.countByGroup('probe355')).assertEqual(0);
      expect(m.searchTitle('nohit355')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_7100
     * @tc.name    MarketIntegrationTesting071
     * @tc.desc    Market grouped counts with probe 356 probe 356
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting071', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countByGroup('app') + m.countByGroup('game')).assertEqual(m.getAppCount() + m.getGameCount());
      expect(m.countByGroup('missing356')).assertEqual(0);
      expect(m.searchTitle('nohit356')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_7200
     * @tc.name    MarketIntegrationTesting072
     * @tc.desc    Market entrance catalogue size 357 probe 357
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting072', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getEntranceCount()).assertEqual(5);
      expect(m.getEntrances().length).assertEqual(5);
      expect(m.getAppCount()).assertEqual(21);
      expect(m.countByGroup('probe357')).assertEqual(0);
      expect(m.searchTitle('nohit357')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_7300
     * @tc.name    MarketIntegrationTesting073
     * @tc.desc    Market grouped counts with probe 358 probe 358
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting073', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countByGroup('app') + m.countByGroup('game')).assertEqual(m.getAppCount() + m.getGameCount());
      expect(m.countByGroup('missing358')).assertEqual(0);
      expect(m.searchTitle('nohit358')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_7400
     * @tc.name    MarketIntegrationTesting074
     * @tc.desc    Market entrance catalogue size 359 probe 359
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting074', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getEntranceCount()).assertEqual(5);
      expect(m.getEntrances().length).assertEqual(5);
      expect(m.getAppCount()).assertEqual(21);
      expect(m.countByGroup('probe359')).assertEqual(0);
      expect(m.searchTitle('nohit359')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_7500
     * @tc.name    MarketIntegrationTesting075
     * @tc.desc    Market grouped counts with probe 360 probe 360
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting075', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countByGroup('app') + m.countByGroup('game')).assertEqual(m.getAppCount() + m.getGameCount());
      expect(m.countByGroup('missing360')).assertEqual(0);
      expect(m.searchTitle('nohit360')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_7600
     * @tc.name    MarketIntegrationTesting076
     * @tc.desc    Market entrance catalogue size 361 probe 361
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting076', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getEntranceCount()).assertEqual(5);
      expect(m.getEntrances().length).assertEqual(5);
      expect(m.getAppCount()).assertEqual(21);
      expect(m.countByGroup('probe361')).assertEqual(0);
      expect(m.searchTitle('nohit361')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_7700
     * @tc.name    MarketIntegrationTesting077
     * @tc.desc    Market grouped counts with probe 362 probe 362
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting077', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countByGroup('app') + m.countByGroup('game')).assertEqual(m.getAppCount() + m.getGameCount());
      expect(m.countByGroup('missing362')).assertEqual(0);
      expect(m.searchTitle('nohit362')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_7800
     * @tc.name    MarketIntegrationTesting078
     * @tc.desc    Market entrance catalogue size 363 probe 363
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting078', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getEntranceCount()).assertEqual(5);
      expect(m.getEntrances().length).assertEqual(5);
      expect(m.getAppCount()).assertEqual(21);
      expect(m.countByGroup('probe363')).assertEqual(0);
      expect(m.searchTitle('nohit363')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_7900
     * @tc.name    MarketIntegrationTesting079
     * @tc.desc    Market grouped counts with probe 364 probe 364
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting079', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countByGroup('app') + m.countByGroup('game')).assertEqual(m.getAppCount() + m.getGameCount());
      expect(m.countByGroup('missing364')).assertEqual(0);
      expect(m.searchTitle('nohit364')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_8000
     * @tc.name    MarketIntegrationTesting080
     * @tc.desc    Market entrance catalogue size 365 probe 365
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketIntegrationTesting080', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getEntranceCount()).assertEqual(5);
      expect(m.getEntrances().length).assertEqual(5);
      expect(m.getAppCount()).assertEqual(21);
      expect(m.countByGroup('probe365')).assertEqual(0);
      expect(m.searchTitle('nohit365')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

  });
}

