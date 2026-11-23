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
import { AlbumModel } from '../Shared/AlbumModel';

const DOMAIN: number = 0xF811;
const TAG: string = '[AlbumTests]';

export default function albumErrorRecoverySuite() {
  describe('AlbumErrorRecoverySuite', () => {
    let m: AlbumModel = new AlbumModel();

    beforeEach(() => {
      m = new AlbumModel();
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0550
     * @tc.name    AlbumErrorRecovery550
     * @tc.desc    Album tracks and options 550 probe 550
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery550', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 6).length <= 1 + 6).assertEqual(true);
      expect(m.getTrackById(1000 + 550) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0551
     * @tc.name    AlbumErrorRecovery551
     * @tc.desc    Album tracks and options 551 probe 551
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery551', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 7).length <= 1 + 7).assertEqual(true);
      expect(m.getTrackById(1000 + 551) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0552
     * @tc.name    AlbumErrorRecovery552
     * @tc.desc    Album tracks and options 552 probe 552
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery552', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 0).length <= 1 + 0).assertEqual(true);
      expect(m.getTrackById(1000 + 552) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0553
     * @tc.name    AlbumErrorRecovery553
     * @tc.desc    Album tracks and options 553 probe 553
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery553', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 1).length <= 1 + 1).assertEqual(true);
      expect(m.getTrackById(1000 + 553) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0554
     * @tc.name    AlbumErrorRecovery554
     * @tc.desc    Album tracks and options 554 probe 554
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery554', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 2).length <= 1 + 2).assertEqual(true);
      expect(m.getTrackById(1000 + 554) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0555
     * @tc.name    AlbumErrorRecovery555
     * @tc.desc    Album tracks and options 555 probe 555
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery555', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 3).length <= 1 + 3).assertEqual(true);
      expect(m.getTrackById(1000 + 555) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0556
     * @tc.name    AlbumErrorRecovery556
     * @tc.desc    Album tracks and options 556 probe 556
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery556', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 4).length <= 1 + 4).assertEqual(true);
      expect(m.getTrackById(1000 + 556) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0557
     * @tc.name    AlbumErrorRecovery557
     * @tc.desc    Album tracks and options 557 probe 557
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery557', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 5).length <= 1 + 5).assertEqual(true);
      expect(m.getTrackById(1000 + 557) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0558
     * @tc.name    AlbumErrorRecovery558
     * @tc.desc    Album tracks and options 558 probe 558
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery558', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 6).length <= 1 + 6).assertEqual(true);
      expect(m.getTrackById(1000 + 558) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0559
     * @tc.name    AlbumErrorRecovery559
     * @tc.desc    Album tracks and options 559 probe 559
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery559', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 7).length <= 1 + 7).assertEqual(true);
      expect(m.getTrackById(1000 + 559) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0560
     * @tc.name    AlbumErrorRecovery560
     * @tc.desc    Album tracks and options 560 probe 560
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery560', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 0).length <= 1 + 0).assertEqual(true);
      expect(m.getTrackById(1000 + 560) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0561
     * @tc.name    AlbumErrorRecovery561
     * @tc.desc    Album tracks and options 561 probe 561
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery561', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 1).length <= 1 + 1).assertEqual(true);
      expect(m.getTrackById(1000 + 561) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0562
     * @tc.name    AlbumErrorRecovery562
     * @tc.desc    Album tracks and options 562 probe 562
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery562', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 2).length <= 1 + 2).assertEqual(true);
      expect(m.getTrackById(1000 + 562) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0563
     * @tc.name    AlbumErrorRecovery563
     * @tc.desc    Album tracks and options 563 probe 563
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery563', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 3).length <= 1 + 3).assertEqual(true);
      expect(m.getTrackById(1000 + 563) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0564
     * @tc.name    AlbumErrorRecovery564
     * @tc.desc    Album tracks and options 564 probe 564
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery564', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 4).length <= 1 + 4).assertEqual(true);
      expect(m.getTrackById(1000 + 564) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0565
     * @tc.name    AlbumErrorRecovery565
     * @tc.desc    Album tracks and options 565 probe 565
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery565', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 5).length <= 1 + 5).assertEqual(true);
      expect(m.getTrackById(1000 + 565) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0566
     * @tc.name    AlbumErrorRecovery566
     * @tc.desc    Album tracks and options 566 probe 566
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery566', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 6).length <= 1 + 6).assertEqual(true);
      expect(m.getTrackById(1000 + 566) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0567
     * @tc.name    AlbumErrorRecovery567
     * @tc.desc    Album tracks and options 567 probe 567
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery567', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 7).length <= 1 + 7).assertEqual(true);
      expect(m.getTrackById(1000 + 567) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0568
     * @tc.name    AlbumErrorRecovery568
     * @tc.desc    Album tracks and options 568 probe 568
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery568', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 0).length <= 1 + 0).assertEqual(true);
      expect(m.getTrackById(1000 + 568) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0569
     * @tc.name    AlbumErrorRecovery569
     * @tc.desc    Album tracks and options 569 probe 569
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery569', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 1).length <= 1 + 1).assertEqual(true);
      expect(m.getTrackById(1000 + 569) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0570
     * @tc.name    AlbumErrorRecovery570
     * @tc.desc    Album tracks and options 570 probe 570
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery570', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 2).length <= 1 + 2).assertEqual(true);
      expect(m.getTrackById(1000 + 570) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0571
     * @tc.name    AlbumErrorRecovery571
     * @tc.desc    Album tracks and options 571 probe 571
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery571', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 3).length <= 1 + 3).assertEqual(true);
      expect(m.getTrackById(1000 + 571) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0572
     * @tc.name    AlbumErrorRecovery572
     * @tc.desc    Album tracks and options 572 probe 572
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery572', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 4).length <= 1 + 4).assertEqual(true);
      expect(m.getTrackById(1000 + 572) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0573
     * @tc.name    AlbumErrorRecovery573
     * @tc.desc    Album tracks and options 573 probe 573
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery573', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 5).length <= 1 + 5).assertEqual(true);
      expect(m.getTrackById(1000 + 573) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0574
     * @tc.name    AlbumErrorRecovery574
     * @tc.desc    Album tracks and options 574 probe 574
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery574', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 6).length <= 1 + 6).assertEqual(true);
      expect(m.getTrackById(1000 + 574) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0575
     * @tc.name    AlbumErrorRecovery575
     * @tc.desc    Album tracks and options 575 probe 575
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery575', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 7).length <= 1 + 7).assertEqual(true);
      expect(m.getTrackById(1000 + 575) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0576
     * @tc.name    AlbumErrorRecovery576
     * @tc.desc    Album tracks and options 576 probe 576
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery576', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 0).length <= 1 + 0).assertEqual(true);
      expect(m.getTrackById(1000 + 576) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0577
     * @tc.name    AlbumErrorRecovery577
     * @tc.desc    Album tracks and options 577 probe 577
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery577', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 1).length <= 1 + 1).assertEqual(true);
      expect(m.getTrackById(1000 + 577) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0578
     * @tc.name    AlbumErrorRecovery578
     * @tc.desc    Album tracks and options 578 probe 578
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery578', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 2).length <= 1 + 2).assertEqual(true);
      expect(m.getTrackById(1000 + 578) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0579
     * @tc.name    AlbumErrorRecovery579
     * @tc.desc    Album tracks and options 579 probe 579
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery579', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 3).length <= 1 + 3).assertEqual(true);
      expect(m.getTrackById(1000 + 579) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0580
     * @tc.name    AlbumErrorRecovery580
     * @tc.desc    Album tracks and options 580 probe 580
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery580', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 4).length <= 1 + 4).assertEqual(true);
      expect(m.getTrackById(1000 + 580) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0581
     * @tc.name    AlbumErrorRecovery581
     * @tc.desc    Album tracks and options 581 probe 581
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery581', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 5).length <= 1 + 5).assertEqual(true);
      expect(m.getTrackById(1000 + 581) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0582
     * @tc.name    AlbumErrorRecovery582
     * @tc.desc    Album tracks and options 582 probe 582
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery582', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 6).length <= 1 + 6).assertEqual(true);
      expect(m.getTrackById(1000 + 582) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0583
     * @tc.name    AlbumErrorRecovery583
     * @tc.desc    Album tracks and options 583 probe 583
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery583', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 7).length <= 1 + 7).assertEqual(true);
      expect(m.getTrackById(1000 + 583) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0584
     * @tc.name    AlbumErrorRecovery584
     * @tc.desc    Album tracks and options 584 probe 584
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery584', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 0).length <= 1 + 0).assertEqual(true);
      expect(m.getTrackById(1000 + 584) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0585
     * @tc.name    AlbumErrorRecovery585
     * @tc.desc    Album tracks and options 585 probe 585
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery585', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 1).length <= 1 + 1).assertEqual(true);
      expect(m.getTrackById(1000 + 585) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0586
     * @tc.name    AlbumErrorRecovery586
     * @tc.desc    Album tracks and options 586 probe 586
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery586', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 2).length <= 1 + 2).assertEqual(true);
      expect(m.getTrackById(1000 + 586) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0587
     * @tc.name    AlbumErrorRecovery587
     * @tc.desc    Album tracks and options 587 probe 587
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery587', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 3).length <= 1 + 3).assertEqual(true);
      expect(m.getTrackById(1000 + 587) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0588
     * @tc.name    AlbumErrorRecovery588
     * @tc.desc    Album tracks and options 588 probe 588
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery588', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 4).length <= 1 + 4).assertEqual(true);
      expect(m.getTrackById(1000 + 588) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0589
     * @tc.name    AlbumErrorRecovery589
     * @tc.desc    Album tracks and options 589 probe 589
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery589', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 5).length <= 1 + 5).assertEqual(true);
      expect(m.getTrackById(1000 + 589) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0590
     * @tc.name    AlbumErrorRecovery590
     * @tc.desc    Album tracks and options 590 probe 590
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery590', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 6).length <= 1 + 6).assertEqual(true);
      expect(m.getTrackById(1000 + 590) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0591
     * @tc.name    AlbumErrorRecovery591
     * @tc.desc    Album tracks and options 591 probe 591
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery591', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 7).length <= 1 + 7).assertEqual(true);
      expect(m.getTrackById(1000 + 591) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0592
     * @tc.name    AlbumErrorRecovery592
     * @tc.desc    Album tracks and options 592 probe 592
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery592', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 0).length <= 1 + 0).assertEqual(true);
      expect(m.getTrackById(1000 + 592) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0593
     * @tc.name    AlbumErrorRecovery593
     * @tc.desc    Album tracks and options 593 probe 593
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery593', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 1).length <= 1 + 1).assertEqual(true);
      expect(m.getTrackById(1000 + 593) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0594
     * @tc.name    AlbumErrorRecovery594
     * @tc.desc    Album tracks and options 594 probe 594
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery594', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 2).length <= 1 + 2).assertEqual(true);
      expect(m.getTrackById(1000 + 594) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0595
     * @tc.name    AlbumErrorRecovery595
     * @tc.desc    Album tracks and options 595 probe 595
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery595', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 3).length <= 1 + 3).assertEqual(true);
      expect(m.getTrackById(1000 + 595) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0596
     * @tc.name    AlbumErrorRecovery596
     * @tc.desc    Album tracks and options 596 probe 596
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery596', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 4).length <= 1 + 4).assertEqual(true);
      expect(m.getTrackById(1000 + 596) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0597
     * @tc.name    AlbumErrorRecovery597
     * @tc.desc    Album tracks and options 597 probe 597
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery597', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 5).length <= 1 + 5).assertEqual(true);
      expect(m.getTrackById(1000 + 597) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0598
     * @tc.name    AlbumErrorRecovery598
     * @tc.desc    Album tracks and options 598 probe 598
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery598', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 6).length <= 1 + 6).assertEqual(true);
      expect(m.getTrackById(1000 + 598) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0599
     * @tc.name    AlbumErrorRecovery599
     * @tc.desc    Album tracks and options 599 probe 599
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery599', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 7).length <= 1 + 7).assertEqual(true);
      expect(m.getTrackById(1000 + 599) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0600
     * @tc.name    AlbumErrorRecovery600
     * @tc.desc    Album tracks and options 600 probe 600
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery600', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 0).length <= 1 + 0).assertEqual(true);
      expect(m.getTrackById(1000 + 600) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0601
     * @tc.name    AlbumErrorRecovery601
     * @tc.desc    Album tracks and options 601 probe 601
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery601', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 1).length <= 1 + 1).assertEqual(true);
      expect(m.getTrackById(1000 + 601) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0602
     * @tc.name    AlbumErrorRecovery602
     * @tc.desc    Album tracks and options 602 probe 602
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery602', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 2).length <= 1 + 2).assertEqual(true);
      expect(m.getTrackById(1000 + 602) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0603
     * @tc.name    AlbumErrorRecovery603
     * @tc.desc    Album tracks and options 603 probe 603
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery603', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 3).length <= 1 + 3).assertEqual(true);
      expect(m.getTrackById(1000 + 603) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0604
     * @tc.name    AlbumErrorRecovery604
     * @tc.desc    Album tracks and options 604 probe 604
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery604', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 4).length <= 1 + 4).assertEqual(true);
      expect(m.getTrackById(1000 + 604) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0605
     * @tc.name    AlbumErrorRecovery605
     * @tc.desc    Album tracks and options 605 probe 605
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery605', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 5).length <= 1 + 5).assertEqual(true);
      expect(m.getTrackById(1000 + 605) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0606
     * @tc.name    AlbumErrorRecovery606
     * @tc.desc    Album tracks and options 606 probe 606
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery606', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 6).length <= 1 + 6).assertEqual(true);
      expect(m.getTrackById(1000 + 606) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0607
     * @tc.name    AlbumErrorRecovery607
     * @tc.desc    Album tracks and options 607 probe 607
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery607', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 7).length <= 1 + 7).assertEqual(true);
      expect(m.getTrackById(1000 + 607) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0608
     * @tc.name    AlbumErrorRecovery608
     * @tc.desc    Album tracks and options 608 probe 608
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery608', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 0).length <= 1 + 0).assertEqual(true);
      expect(m.getTrackById(1000 + 608) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0609
     * @tc.name    AlbumErrorRecovery609
     * @tc.desc    Album tracks and options 609 probe 609
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery609', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 1).length <= 1 + 1).assertEqual(true);
      expect(m.getTrackById(1000 + 609) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0610
     * @tc.name    AlbumErrorRecovery610
     * @tc.desc    Album tracks and options 610 probe 610
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery610', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 2).length <= 1 + 2).assertEqual(true);
      expect(m.getTrackById(1000 + 610) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0611
     * @tc.name    AlbumErrorRecovery611
     * @tc.desc    Album tracks and options 611 probe 611
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery611', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 3).length <= 1 + 3).assertEqual(true);
      expect(m.getTrackById(1000 + 611) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0612
     * @tc.name    AlbumErrorRecovery612
     * @tc.desc    Album tracks and options 612 probe 612
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery612', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 4).length <= 1 + 4).assertEqual(true);
      expect(m.getTrackById(1000 + 612) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0613
     * @tc.name    AlbumErrorRecovery613
     * @tc.desc    Album tracks and options 613 probe 613
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery613', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 5).length <= 1 + 5).assertEqual(true);
      expect(m.getTrackById(1000 + 613) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0614
     * @tc.name    AlbumErrorRecovery614
     * @tc.desc    Album tracks and options 614 probe 614
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery614', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 6).length <= 1 + 6).assertEqual(true);
      expect(m.getTrackById(1000 + 614) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0615
     * @tc.name    AlbumErrorRecovery615
     * @tc.desc    Album tracks and options 615 probe 615
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery615', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 7).length <= 1 + 7).assertEqual(true);
      expect(m.getTrackById(1000 + 615) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0616
     * @tc.name    AlbumErrorRecovery616
     * @tc.desc    Album tracks and options 616 probe 616
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery616', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 0).length <= 1 + 0).assertEqual(true);
      expect(m.getTrackById(1000 + 616) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0617
     * @tc.name    AlbumErrorRecovery617
     * @tc.desc    Album tracks and options 617 probe 617
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery617', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 1).length <= 1 + 1).assertEqual(true);
      expect(m.getTrackById(1000 + 617) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0618
     * @tc.name    AlbumErrorRecovery618
     * @tc.desc    Album tracks and options 618 probe 618
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery618', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 2).length <= 1 + 2).assertEqual(true);
      expect(m.getTrackById(1000 + 618) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0619
     * @tc.name    AlbumErrorRecovery619
     * @tc.desc    Album tracks and options 619 probe 619
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery619', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 3).length <= 1 + 3).assertEqual(true);
      expect(m.getTrackById(1000 + 619) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0620
     * @tc.name    AlbumErrorRecovery620
     * @tc.desc    Album tracks and options 620 probe 620
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery620', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 4).length <= 1 + 4).assertEqual(true);
      expect(m.getTrackById(1000 + 620) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0621
     * @tc.name    AlbumErrorRecovery621
     * @tc.desc    Album tracks and options 621 probe 621
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery621', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 5).length <= 1 + 5).assertEqual(true);
      expect(m.getTrackById(1000 + 621) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0622
     * @tc.name    AlbumErrorRecovery622
     * @tc.desc    Album tracks and options 622 probe 622
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery622', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 6).length <= 1 + 6).assertEqual(true);
      expect(m.getTrackById(1000 + 622) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0623
     * @tc.name    AlbumErrorRecovery623
     * @tc.desc    Album tracks and options 623 probe 623
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery623', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 7).length <= 1 + 7).assertEqual(true);
      expect(m.getTrackById(1000 + 623) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0624
     * @tc.name    AlbumErrorRecovery624
     * @tc.desc    Album tracks and options 624 probe 624
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery624', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 0).length <= 1 + 0).assertEqual(true);
      expect(m.getTrackById(1000 + 624) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0625
     * @tc.name    AlbumErrorRecovery625
     * @tc.desc    Album tracks and options 625 probe 625
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery625', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 1).length <= 1 + 1).assertEqual(true);
      expect(m.getTrackById(1000 + 625) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0626
     * @tc.name    AlbumErrorRecovery626
     * @tc.desc    Album tracks and options 626 probe 626
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery626', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 2).length <= 1 + 2).assertEqual(true);
      expect(m.getTrackById(1000 + 626) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0627
     * @tc.name    AlbumErrorRecovery627
     * @tc.desc    Album tracks and options 627 probe 627
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery627', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 3).length <= 1 + 3).assertEqual(true);
      expect(m.getTrackById(1000 + 627) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0628
     * @tc.name    AlbumErrorRecovery628
     * @tc.desc    Album tracks and options 628 probe 628
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery628', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 4).length <= 1 + 4).assertEqual(true);
      expect(m.getTrackById(1000 + 628) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0629
     * @tc.name    AlbumErrorRecovery629
     * @tc.desc    Album tracks and options 629 probe 629
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery629', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 5).length <= 1 + 5).assertEqual(true);
      expect(m.getTrackById(1000 + 629) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0630
     * @tc.name    AlbumErrorRecovery630
     * @tc.desc    Album tracks and options 630 probe 630
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery630', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 6).length <= 1 + 6).assertEqual(true);
      expect(m.getTrackById(1000 + 630) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0631
     * @tc.name    AlbumErrorRecovery631
     * @tc.desc    Album tracks and options 631 probe 631
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery631', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 7).length <= 1 + 7).assertEqual(true);
      expect(m.getTrackById(1000 + 631) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0632
     * @tc.name    AlbumErrorRecovery632
     * @tc.desc    Album tracks and options 632 probe 632
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery632', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 0).length <= 1 + 0).assertEqual(true);
      expect(m.getTrackById(1000 + 632) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0633
     * @tc.name    AlbumErrorRecovery633
     * @tc.desc    Album tracks and options 633 probe 633
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery633', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 1).length <= 1 + 1).assertEqual(true);
      expect(m.getTrackById(1000 + 633) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0634
     * @tc.name    AlbumErrorRecovery634
     * @tc.desc    Album tracks and options 634 probe 634
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery634', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 2).length <= 1 + 2).assertEqual(true);
      expect(m.getTrackById(1000 + 634) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0635
     * @tc.name    AlbumErrorRecovery635
     * @tc.desc    Album tracks and options 635 probe 635
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery635', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 3).length <= 1 + 3).assertEqual(true);
      expect(m.getTrackById(1000 + 635) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0636
     * @tc.name    AlbumErrorRecovery636
     * @tc.desc    Album tracks and options 636 probe 636
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery636', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 4).length <= 1 + 4).assertEqual(true);
      expect(m.getTrackById(1000 + 636) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0637
     * @tc.name    AlbumErrorRecovery637
     * @tc.desc    Album tracks and options 637 probe 637
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery637', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 5).length <= 1 + 5).assertEqual(true);
      expect(m.getTrackById(1000 + 637) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0638
     * @tc.name    AlbumErrorRecovery638
     * @tc.desc    Album tracks and options 638 probe 638
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery638', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 6).length <= 1 + 6).assertEqual(true);
      expect(m.getTrackById(1000 + 638) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0639
     * @tc.name    AlbumErrorRecovery639
     * @tc.desc    Album tracks and options 639 probe 639
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery639', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 7).length <= 1 + 7).assertEqual(true);
      expect(m.getTrackById(1000 + 639) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0640
     * @tc.name    AlbumErrorRecovery640
     * @tc.desc    Album tracks and options 640 probe 640
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery640', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 0).length <= 1 + 0).assertEqual(true);
      expect(m.getTrackById(1000 + 640) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0641
     * @tc.name    AlbumErrorRecovery641
     * @tc.desc    Album tracks and options 641 probe 641
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery641', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 1).length <= 1 + 1).assertEqual(true);
      expect(m.getTrackById(1000 + 641) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0642
     * @tc.name    AlbumErrorRecovery642
     * @tc.desc    Album tracks and options 642 probe 642
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery642', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 2).length <= 1 + 2).assertEqual(true);
      expect(m.getTrackById(1000 + 642) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0643
     * @tc.name    AlbumErrorRecovery643
     * @tc.desc    Album tracks and options 643 probe 643
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery643', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 3).length <= 1 + 3).assertEqual(true);
      expect(m.getTrackById(1000 + 643) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0644
     * @tc.name    AlbumErrorRecovery644
     * @tc.desc    Album tracks and options 644 probe 644
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery644', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 4).length <= 1 + 4).assertEqual(true);
      expect(m.getTrackById(1000 + 644) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0645
     * @tc.name    AlbumErrorRecovery645
     * @tc.desc    Album tracks and options 645 probe 645
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery645', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 5).length <= 1 + 5).assertEqual(true);
      expect(m.getTrackById(1000 + 645) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0646
     * @tc.name    AlbumErrorRecovery646
     * @tc.desc    Album tracks and options 646 probe 646
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery646', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 6).length <= 1 + 6).assertEqual(true);
      expect(m.getTrackById(1000 + 646) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0647
     * @tc.name    AlbumErrorRecovery647
     * @tc.desc    Album tracks and options 647 probe 647
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery647', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 7).length <= 1 + 7).assertEqual(true);
      expect(m.getTrackById(1000 + 647) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0648
     * @tc.name    AlbumErrorRecovery648
     * @tc.desc    Album tracks and options 648 probe 648
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery648', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 0).length <= 1 + 0).assertEqual(true);
      expect(m.getTrackById(1000 + 648) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0649
     * @tc.name    AlbumErrorRecovery649
     * @tc.desc    Album tracks and options 649 probe 649
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery649', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 1).length <= 1 + 1).assertEqual(true);
      expect(m.getTrackById(1000 + 649) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0650
     * @tc.name    AlbumErrorRecovery650
     * @tc.desc    Album tracks and options 650 probe 650
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery650', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 2).length <= 1 + 2).assertEqual(true);
      expect(m.getTrackById(1000 + 650) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0651
     * @tc.name    AlbumErrorRecovery651
     * @tc.desc    Album tracks and options 651 probe 651
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery651', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 3).length <= 1 + 3).assertEqual(true);
      expect(m.getTrackById(1000 + 651) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0652
     * @tc.name    AlbumErrorRecovery652
     * @tc.desc    Album tracks and options 652 probe 652
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery652', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 4).length <= 1 + 4).assertEqual(true);
      expect(m.getTrackById(1000 + 652) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0653
     * @tc.name    AlbumErrorRecovery653
     * @tc.desc    Album tracks and options 653 probe 653
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery653', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 5).length <= 1 + 5).assertEqual(true);
      expect(m.getTrackById(1000 + 653) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0654
     * @tc.name    AlbumErrorRecovery654
     * @tc.desc    Album tracks and options 654 probe 654
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery654', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 6).length <= 1 + 6).assertEqual(true);
      expect(m.getTrackById(1000 + 654) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0655
     * @tc.name    AlbumErrorRecovery655
     * @tc.desc    Album tracks and options 655 probe 655
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery655', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 7).length <= 1 + 7).assertEqual(true);
      expect(m.getTrackById(1000 + 655) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0656
     * @tc.name    AlbumErrorRecovery656
     * @tc.desc    Album tracks and options 656 probe 656
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery656', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 0).length <= 1 + 0).assertEqual(true);
      expect(m.getTrackById(1000 + 656) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0657
     * @tc.name    AlbumErrorRecovery657
     * @tc.desc    Album tracks and options 657 probe 657
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery657', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 1).length <= 1 + 1).assertEqual(true);
      expect(m.getTrackById(1000 + 657) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0658
     * @tc.name    AlbumErrorRecovery658
     * @tc.desc    Album tracks and options 658 probe 658
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery658', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 2).length <= 1 + 2).assertEqual(true);
      expect(m.getTrackById(1000 + 658) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0659
     * @tc.name    AlbumErrorRecovery659
     * @tc.desc    Album tracks and options 659 probe 659
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery659', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 3).length <= 1 + 3).assertEqual(true);
      expect(m.getTrackById(1000 + 659) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0660
     * @tc.name    AlbumErrorRecovery660
     * @tc.desc    Album tracks and options 660 probe 660
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery660', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 4).length <= 1 + 4).assertEqual(true);
      expect(m.getTrackById(1000 + 660) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0661
     * @tc.name    AlbumErrorRecovery661
     * @tc.desc    Album tracks and options 661 probe 661
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery661', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 5).length <= 1 + 5).assertEqual(true);
      expect(m.getTrackById(1000 + 661) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0662
     * @tc.name    AlbumErrorRecovery662
     * @tc.desc    Album tracks and options 662 probe 662
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery662', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 6).length <= 1 + 6).assertEqual(true);
      expect(m.getTrackById(1000 + 662) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0663
     * @tc.name    AlbumErrorRecovery663
     * @tc.desc    Album tracks and options 663 probe 663
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery663', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 7).length <= 1 + 7).assertEqual(true);
      expect(m.getTrackById(1000 + 663) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0664
     * @tc.name    AlbumErrorRecovery664
     * @tc.desc    Album tracks and options 664 probe 664
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery664', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 0).length <= 1 + 0).assertEqual(true);
      expect(m.getTrackById(1000 + 664) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0665
     * @tc.name    AlbumErrorRecovery665
     * @tc.desc    Album tracks and options 665 probe 665
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery665', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 1).length <= 1 + 1).assertEqual(true);
      expect(m.getTrackById(1000 + 665) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0666
     * @tc.name    AlbumErrorRecovery666
     * @tc.desc    Album tracks and options 666 probe 666
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery666', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 2).length <= 1 + 2).assertEqual(true);
      expect(m.getTrackById(1000 + 666) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0667
     * @tc.name    AlbumErrorRecovery667
     * @tc.desc    Album tracks and options 667 probe 667
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery667', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 3).length <= 1 + 3).assertEqual(true);
      expect(m.getTrackById(1000 + 667) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0668
     * @tc.name    AlbumErrorRecovery668
     * @tc.desc    Album tracks and options 668 probe 668
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery668', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 4).length <= 1 + 4).assertEqual(true);
      expect(m.getTrackById(1000 + 668) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0669
     * @tc.name    AlbumErrorRecovery669
     * @tc.desc    Album tracks and options 669 probe 669
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery669', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 5).length <= 1 + 5).assertEqual(true);
      expect(m.getTrackById(1000 + 669) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0670
     * @tc.name    AlbumErrorRecovery670
     * @tc.desc    Album tracks and options 670 probe 670
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery670', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 6).length <= 1 + 6).assertEqual(true);
      expect(m.getTrackById(1000 + 670) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0671
     * @tc.name    AlbumErrorRecovery671
     * @tc.desc    Album tracks and options 671 probe 671
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery671', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 7).length <= 1 + 7).assertEqual(true);
      expect(m.getTrackById(1000 + 671) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0672
     * @tc.name    AlbumErrorRecovery672
     * @tc.desc    Album tracks and options 672 probe 672
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery672', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 0).length <= 1 + 0).assertEqual(true);
      expect(m.getTrackById(1000 + 672) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0673
     * @tc.name    AlbumErrorRecovery673
     * @tc.desc    Album tracks and options 673 probe 673
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery673', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 1).length <= 1 + 1).assertEqual(true);
      expect(m.getTrackById(1000 + 673) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0674
     * @tc.name    AlbumErrorRecovery674
     * @tc.desc    Album tracks and options 674 probe 674
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery674', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 2).length <= 1 + 2).assertEqual(true);
      expect(m.getTrackById(1000 + 674) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0675
     * @tc.name    AlbumErrorRecovery675
     * @tc.desc    Album tracks and options 675 probe 675
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery675', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 3).length <= 1 + 3).assertEqual(true);
      expect(m.getTrackById(1000 + 675) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0676
     * @tc.name    AlbumErrorRecovery676
     * @tc.desc    Album tracks and options 676 probe 676
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery676', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 4).length <= 1 + 4).assertEqual(true);
      expect(m.getTrackById(1000 + 676) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0677
     * @tc.name    AlbumErrorRecovery677
     * @tc.desc    Album tracks and options 677 probe 677
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery677', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 5).length <= 1 + 5).assertEqual(true);
      expect(m.getTrackById(1000 + 677) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0678
     * @tc.name    AlbumErrorRecovery678
     * @tc.desc    Album tracks and options 678 probe 678
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery678', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 6).length <= 1 + 6).assertEqual(true);
      expect(m.getTrackById(1000 + 678) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0679
     * @tc.name    AlbumErrorRecovery679
     * @tc.desc    Album tracks and options 679 probe 679
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery679', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 7).length <= 1 + 7).assertEqual(true);
      expect(m.getTrackById(1000 + 679) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0680
     * @tc.name    AlbumErrorRecovery680
     * @tc.desc    Album tracks and options 680 probe 680
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery680', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 0).length <= 1 + 0).assertEqual(true);
      expect(m.getTrackById(1000 + 680) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0681
     * @tc.name    AlbumErrorRecovery681
     * @tc.desc    Album tracks and options 681 probe 681
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery681', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 1).length <= 1 + 1).assertEqual(true);
      expect(m.getTrackById(1000 + 681) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0682
     * @tc.name    AlbumErrorRecovery682
     * @tc.desc    Album tracks and options 682 probe 682
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery682', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 2).length <= 1 + 2).assertEqual(true);
      expect(m.getTrackById(1000 + 682) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0683
     * @tc.name    AlbumErrorRecovery683
     * @tc.desc    Album tracks and options 683 probe 683
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery683', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 3).length <= 1 + 3).assertEqual(true);
      expect(m.getTrackById(1000 + 683) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0684
     * @tc.name    AlbumErrorRecovery684
     * @tc.desc    Album tracks and options 684 probe 684
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery684', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 4).length <= 1 + 4).assertEqual(true);
      expect(m.getTrackById(1000 + 684) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0685
     * @tc.name    AlbumErrorRecovery685
     * @tc.desc    Album tracks and options 685 probe 685
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery685', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 5).length <= 1 + 5).assertEqual(true);
      expect(m.getTrackById(1000 + 685) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0686
     * @tc.name    AlbumErrorRecovery686
     * @tc.desc    Album tracks and options 686 probe 686
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery686', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 6).length <= 1 + 6).assertEqual(true);
      expect(m.getTrackById(1000 + 686) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0687
     * @tc.name    AlbumErrorRecovery687
     * @tc.desc    Album tracks and options 687 probe 687
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery687', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 7).length <= 1 + 7).assertEqual(true);
      expect(m.getTrackById(1000 + 687) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0688
     * @tc.name    AlbumErrorRecovery688
     * @tc.desc    Album tracks and options 688 probe 688
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery688', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 0).length <= 1 + 0).assertEqual(true);
      expect(m.getTrackById(1000 + 688) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0689
     * @tc.name    AlbumErrorRecovery689
     * @tc.desc    Album tracks and options 689 probe 689
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery689', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 1).length <= 1 + 1).assertEqual(true);
      expect(m.getTrackById(1000 + 689) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0690
     * @tc.name    AlbumErrorRecovery690
     * @tc.desc    Album tracks and options 690 probe 690
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery690', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 2).length <= 1 + 2).assertEqual(true);
      expect(m.getTrackById(1000 + 690) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0691
     * @tc.name    AlbumErrorRecovery691
     * @tc.desc    Album tracks and options 691 probe 691
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery691', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 3).length <= 1 + 3).assertEqual(true);
      expect(m.getTrackById(1000 + 691) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0692
     * @tc.name    AlbumErrorRecovery692
     * @tc.desc    Album tracks and options 692 probe 692
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery692', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 4).length <= 1 + 4).assertEqual(true);
      expect(m.getTrackById(1000 + 692) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0693
     * @tc.name    AlbumErrorRecovery693
     * @tc.desc    Album tracks and options 693 probe 693
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery693', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 5).length <= 1 + 5).assertEqual(true);
      expect(m.getTrackById(1000 + 693) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0694
     * @tc.name    AlbumErrorRecovery694
     * @tc.desc    Album tracks and options 694 probe 694
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery694', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 6).length <= 1 + 6).assertEqual(true);
      expect(m.getTrackById(1000 + 694) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0695
     * @tc.name    AlbumErrorRecovery695
     * @tc.desc    Album tracks and options 695 probe 695
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery695', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 7).length <= 1 + 7).assertEqual(true);
      expect(m.getTrackById(1000 + 695) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0696
     * @tc.name    AlbumErrorRecovery696
     * @tc.desc    Album tracks and options 696 probe 696
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery696', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 0).length <= 1 + 0).assertEqual(true);
      expect(m.getTrackById(1000 + 696) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0697
     * @tc.name    AlbumErrorRecovery697
     * @tc.desc    Album tracks and options 697 probe 697
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery697', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 1).length <= 1 + 1).assertEqual(true);
      expect(m.getTrackById(1000 + 697) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0698
     * @tc.name    AlbumErrorRecovery698
     * @tc.desc    Album tracks and options 698 probe 698
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery698', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 2).length <= 1 + 2).assertEqual(true);
      expect(m.getTrackById(1000 + 698) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0699
     * @tc.name    AlbumErrorRecovery699
     * @tc.desc    Album tracks and options 699 probe 699
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery699', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 3).length <= 1 + 3).assertEqual(true);
      expect(m.getTrackById(1000 + 699) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0700
     * @tc.name    AlbumErrorRecovery700
     * @tc.desc    Album tracks and options 700 probe 700
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery700', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 4).length <= 1 + 4).assertEqual(true);
      expect(m.getTrackById(1000 + 700) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0701
     * @tc.name    AlbumErrorRecovery701
     * @tc.desc    Album tracks and options 701 probe 701
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery701', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 5).length <= 1 + 5).assertEqual(true);
      expect(m.getTrackById(1000 + 701) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0702
     * @tc.name    AlbumErrorRecovery702
     * @tc.desc    Album tracks and options 702 probe 702
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery702', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 6).length <= 1 + 6).assertEqual(true);
      expect(m.getTrackById(1000 + 702) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0703
     * @tc.name    AlbumErrorRecovery703
     * @tc.desc    Album tracks and options 703 probe 703
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery703', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 7).length <= 1 + 7).assertEqual(true);
      expect(m.getTrackById(1000 + 703) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0704
     * @tc.name    AlbumErrorRecovery704
     * @tc.desc    Album tracks and options 704 probe 704
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery704', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 0).length <= 1 + 0).assertEqual(true);
      expect(m.getTrackById(1000 + 704) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0705
     * @tc.name    AlbumErrorRecovery705
     * @tc.desc    Album tracks and options 705 probe 705
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery705', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 1).length <= 1 + 1).assertEqual(true);
      expect(m.getTrackById(1000 + 705) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0706
     * @tc.name    AlbumErrorRecovery706
     * @tc.desc    Album tracks and options 706 probe 706
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery706', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 2).length <= 1 + 2).assertEqual(true);
      expect(m.getTrackById(1000 + 706) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0707
     * @tc.name    AlbumErrorRecovery707
     * @tc.desc    Album tracks and options 707 probe 707
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery707', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 3).length <= 1 + 3).assertEqual(true);
      expect(m.getTrackById(1000 + 707) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0708
     * @tc.name    AlbumErrorRecovery708
     * @tc.desc    Album tracks and options 708 probe 708
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery708', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 4).length <= 1 + 4).assertEqual(true);
      expect(m.getTrackById(1000 + 708) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0709
     * @tc.name    AlbumErrorRecovery709
     * @tc.desc    Album tracks and options 709 probe 709
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery709', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 5).length <= 1 + 5).assertEqual(true);
      expect(m.getTrackById(1000 + 709) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0710
     * @tc.name    AlbumErrorRecovery710
     * @tc.desc    Album tracks and options 710 probe 710
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery710', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 6).length <= 1 + 6).assertEqual(true);
      expect(m.getTrackById(1000 + 710) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0711
     * @tc.name    AlbumErrorRecovery711
     * @tc.desc    Album tracks and options 711 probe 711
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery711', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 7).length <= 1 + 7).assertEqual(true);
      expect(m.getTrackById(1000 + 711) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0712
     * @tc.name    AlbumErrorRecovery712
     * @tc.desc    Album tracks and options 712 probe 712
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery712', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 0).length <= 1 + 0).assertEqual(true);
      expect(m.getTrackById(1000 + 712) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0713
     * @tc.name    AlbumErrorRecovery713
     * @tc.desc    Album tracks and options 713 probe 713
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery713', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 1).length <= 1 + 1).assertEqual(true);
      expect(m.getTrackById(1000 + 713) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0714
     * @tc.name    AlbumErrorRecovery714
     * @tc.desc    Album tracks and options 714 probe 714
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery714', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 2).length <= 1 + 2).assertEqual(true);
      expect(m.getTrackById(1000 + 714) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0715
     * @tc.name    AlbumErrorRecovery715
     * @tc.desc    Album tracks and options 715 probe 715
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery715', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 3).length <= 1 + 3).assertEqual(true);
      expect(m.getTrackById(1000 + 715) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0716
     * @tc.name    AlbumErrorRecovery716
     * @tc.desc    Album tracks and options 716 probe 716
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery716', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 4).length <= 1 + 4).assertEqual(true);
      expect(m.getTrackById(1000 + 716) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0717
     * @tc.name    AlbumErrorRecovery717
     * @tc.desc    Album tracks and options 717 probe 717
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery717', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 5).length <= 1 + 5).assertEqual(true);
      expect(m.getTrackById(1000 + 717) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0718
     * @tc.name    AlbumErrorRecovery718
     * @tc.desc    Album tracks and options 718 probe 718
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery718', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 6).length <= 1 + 6).assertEqual(true);
      expect(m.getTrackById(1000 + 718) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0719
     * @tc.name    AlbumErrorRecovery719
     * @tc.desc    Album tracks and options 719 probe 719
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery719', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 7).length <= 1 + 7).assertEqual(true);
      expect(m.getTrackById(1000 + 719) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0720
     * @tc.name    AlbumErrorRecovery720
     * @tc.desc    Album tracks and options 720 probe 720
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery720', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 0).length <= 1 + 0).assertEqual(true);
      expect(m.getTrackById(1000 + 720) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0721
     * @tc.name    AlbumErrorRecovery721
     * @tc.desc    Album tracks and options 721 probe 721
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery721', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 1).length <= 1 + 1).assertEqual(true);
      expect(m.getTrackById(1000 + 721) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0722
     * @tc.name    AlbumErrorRecovery722
     * @tc.desc    Album tracks and options 722 probe 722
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery722', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 2).length <= 1 + 2).assertEqual(true);
      expect(m.getTrackById(1000 + 722) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0723
     * @tc.name    AlbumErrorRecovery723
     * @tc.desc    Album tracks and options 723 probe 723
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery723', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 3).length <= 1 + 3).assertEqual(true);
      expect(m.getTrackById(1000 + 723) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0724
     * @tc.name    AlbumErrorRecovery724
     * @tc.desc    Album tracks and options 724 probe 724
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery724', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 4).length <= 1 + 4).assertEqual(true);
      expect(m.getTrackById(1000 + 724) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0725
     * @tc.name    AlbumErrorRecovery725
     * @tc.desc    Album tracks and options 725 probe 725
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery725', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 5).length <= 1 + 5).assertEqual(true);
      expect(m.getTrackById(1000 + 725) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0726
     * @tc.name    AlbumErrorRecovery726
     * @tc.desc    Album tracks and options 726 probe 726
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery726', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 6).length <= 1 + 6).assertEqual(true);
      expect(m.getTrackById(1000 + 726) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0727
     * @tc.name    AlbumErrorRecovery727
     * @tc.desc    Album tracks and options 727 probe 727
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery727', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 7).length <= 1 + 7).assertEqual(true);
      expect(m.getTrackById(1000 + 727) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0728
     * @tc.name    AlbumErrorRecovery728
     * @tc.desc    Album tracks and options 728 probe 728
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery728', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 0).length <= 1 + 0).assertEqual(true);
      expect(m.getTrackById(1000 + 728) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0729
     * @tc.name    AlbumErrorRecovery729
     * @tc.desc    Album tracks and options 729 probe 729
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery729', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 1).length <= 1 + 1).assertEqual(true);
      expect(m.getTrackById(1000 + 729) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0730
     * @tc.name    AlbumErrorRecovery730
     * @tc.desc    Album tracks and options 730 probe 730
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery730', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 2).length <= 1 + 2).assertEqual(true);
      expect(m.getTrackById(1000 + 730) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0731
     * @tc.name    AlbumErrorRecovery731
     * @tc.desc    Album tracks and options 731 probe 731
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery731', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 3).length <= 1 + 3).assertEqual(true);
      expect(m.getTrackById(1000 + 731) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0732
     * @tc.name    AlbumErrorRecovery732
     * @tc.desc    Album tracks and options 732 probe 732
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery732', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 4).length <= 1 + 4).assertEqual(true);
      expect(m.getTrackById(1000 + 732) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0733
     * @tc.name    AlbumErrorRecovery733
     * @tc.desc    Album tracks and options 733 probe 733
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery733', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 5).length <= 1 + 5).assertEqual(true);
      expect(m.getTrackById(1000 + 733) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0734
     * @tc.name    AlbumErrorRecovery734
     * @tc.desc    Album tracks and options 734 probe 734
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery734', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 6).length <= 1 + 6).assertEqual(true);
      expect(m.getTrackById(1000 + 734) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0735
     * @tc.name    AlbumErrorRecovery735
     * @tc.desc    Album tracks and options 735 probe 735
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery735', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 7).length <= 1 + 7).assertEqual(true);
      expect(m.getTrackById(1000 + 735) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0736
     * @tc.name    AlbumErrorRecovery736
     * @tc.desc    Album tracks and options 736 probe 736
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery736', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 0).length <= 1 + 0).assertEqual(true);
      expect(m.getTrackById(1000 + 736) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0737
     * @tc.name    AlbumErrorRecovery737
     * @tc.desc    Album tracks and options 737 probe 737
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery737', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 1).length <= 1 + 1).assertEqual(true);
      expect(m.getTrackById(1000 + 737) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0738
     * @tc.name    AlbumErrorRecovery738
     * @tc.desc    Album tracks and options 738 probe 738
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery738', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 2).length <= 1 + 2).assertEqual(true);
      expect(m.getTrackById(1000 + 738) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0739
     * @tc.name    AlbumErrorRecovery739
     * @tc.desc    Album tracks and options 739 probe 739
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery739', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 3).length <= 1 + 3).assertEqual(true);
      expect(m.getTrackById(1000 + 739) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0740
     * @tc.name    AlbumErrorRecovery740
     * @tc.desc    Album tracks and options 740 probe 740
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery740', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 4).length <= 1 + 4).assertEqual(true);
      expect(m.getTrackById(1000 + 740) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0741
     * @tc.name    AlbumErrorRecovery741
     * @tc.desc    Album tracks and options 741 probe 741
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery741', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 5).length <= 1 + 5).assertEqual(true);
      expect(m.getTrackById(1000 + 741) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0742
     * @tc.name    AlbumErrorRecovery742
     * @tc.desc    Album tracks and options 742 probe 742
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery742', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 6).length <= 1 + 6).assertEqual(true);
      expect(m.getTrackById(1000 + 742) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0743
     * @tc.name    AlbumErrorRecovery743
     * @tc.desc    Album tracks and options 743 probe 743
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery743', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 7).length <= 1 + 7).assertEqual(true);
      expect(m.getTrackById(1000 + 743) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0744
     * @tc.name    AlbumErrorRecovery744
     * @tc.desc    Album tracks and options 744 probe 744
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery744', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 0).length <= 1 + 0).assertEqual(true);
      expect(m.getTrackById(1000 + 744) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0745
     * @tc.name    AlbumErrorRecovery745
     * @tc.desc    Album tracks and options 745 probe 745
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery745', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 1).length <= 1 + 1).assertEqual(true);
      expect(m.getTrackById(1000 + 745) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0746
     * @tc.name    AlbumErrorRecovery746
     * @tc.desc    Album tracks and options 746 probe 746
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery746', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 2).length <= 1 + 2).assertEqual(true);
      expect(m.getTrackById(1000 + 746) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0747
     * @tc.name    AlbumErrorRecovery747
     * @tc.desc    Album tracks and options 747 probe 747
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery747', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 3).length <= 1 + 3).assertEqual(true);
      expect(m.getTrackById(1000 + 747) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0748
     * @tc.name    AlbumErrorRecovery748
     * @tc.desc    Album tracks and options 748 probe 748
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery748', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 4).length <= 1 + 4).assertEqual(true);
      expect(m.getTrackById(1000 + 748) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0749
     * @tc.name    AlbumErrorRecovery749
     * @tc.desc    Album tracks and options 749 probe 749
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery749', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 5).length <= 1 + 5).assertEqual(true);
      expect(m.getTrackById(1000 + 749) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0750
     * @tc.name    AlbumErrorRecovery750
     * @tc.desc    Album tracks and options 750 probe 750
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery750', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 6).length <= 1 + 6).assertEqual(true);
      expect(m.getTrackById(1000 + 750) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0751
     * @tc.name    AlbumErrorRecovery751
     * @tc.desc    Album tracks and options 751 probe 751
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery751', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 7).length <= 1 + 7).assertEqual(true);
      expect(m.getTrackById(1000 + 751) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0752
     * @tc.name    AlbumErrorRecovery752
     * @tc.desc    Album tracks and options 752 probe 752
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery752', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 0).length <= 1 + 0).assertEqual(true);
      expect(m.getTrackById(1000 + 752) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0753
     * @tc.name    AlbumErrorRecovery753
     * @tc.desc    Album tracks and options 753 probe 753
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery753', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 1).length <= 1 + 1).assertEqual(true);
      expect(m.getTrackById(1000 + 753) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0754
     * @tc.name    AlbumErrorRecovery754
     * @tc.desc    Album tracks and options 754 probe 754
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery754', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 2).length <= 1 + 2).assertEqual(true);
      expect(m.getTrackById(1000 + 754) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0755
     * @tc.name    AlbumErrorRecovery755
     * @tc.desc    Album tracks and options 755 probe 755
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery755', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 3).length <= 1 + 3).assertEqual(true);
      expect(m.getTrackById(1000 + 755) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0756
     * @tc.name    AlbumErrorRecovery756
     * @tc.desc    Album tracks and options 756 probe 756
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery756', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 4).length <= 1 + 4).assertEqual(true);
      expect(m.getTrackById(1000 + 756) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0757
     * @tc.name    AlbumErrorRecovery757
     * @tc.desc    Album tracks and options 757 probe 757
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery757', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 5).length <= 1 + 5).assertEqual(true);
      expect(m.getTrackById(1000 + 757) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0758
     * @tc.name    AlbumErrorRecovery758
     * @tc.desc    Album tracks and options 758 probe 758
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery758', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 6).length <= 1 + 6).assertEqual(true);
      expect(m.getTrackById(1000 + 758) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0759
     * @tc.name    AlbumErrorRecovery759
     * @tc.desc    Album tracks and options 759 probe 759
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery759', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 7).length <= 1 + 7).assertEqual(true);
      expect(m.getTrackById(1000 + 759) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0760
     * @tc.name    AlbumErrorRecovery760
     * @tc.desc    Album tracks and options 760 probe 760
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery760', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 0).length <= 1 + 0).assertEqual(true);
      expect(m.getTrackById(1000 + 760) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0761
     * @tc.name    AlbumErrorRecovery761
     * @tc.desc    Album tracks and options 761 probe 761
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery761', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 1).length <= 1 + 1).assertEqual(true);
      expect(m.getTrackById(1000 + 761) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0762
     * @tc.name    AlbumErrorRecovery762
     * @tc.desc    Album tracks and options 762 probe 762
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery762', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 2).length <= 1 + 2).assertEqual(true);
      expect(m.getTrackById(1000 + 762) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0763
     * @tc.name    AlbumErrorRecovery763
     * @tc.desc    Album tracks and options 763 probe 763
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery763', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 3).length <= 1 + 3).assertEqual(true);
      expect(m.getTrackById(1000 + 763) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0764
     * @tc.name    AlbumErrorRecovery764
     * @tc.desc    Album tracks and options 764 probe 764
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery764', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 4).length <= 1 + 4).assertEqual(true);
      expect(m.getTrackById(1000 + 764) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0765
     * @tc.name    AlbumErrorRecovery765
     * @tc.desc    Album tracks and options 765 probe 765
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery765', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 5).length <= 1 + 5).assertEqual(true);
      expect(m.getTrackById(1000 + 765) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0766
     * @tc.name    AlbumErrorRecovery766
     * @tc.desc    Album tracks and options 766 probe 766
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery766', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 6).length <= 1 + 6).assertEqual(true);
      expect(m.getTrackById(1000 + 766) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0767
     * @tc.name    AlbumErrorRecovery767
     * @tc.desc    Album tracks and options 767 probe 767
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery767', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 7).length <= 1 + 7).assertEqual(true);
      expect(m.getTrackById(1000 + 767) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0768
     * @tc.name    AlbumErrorRecovery768
     * @tc.desc    Album tracks and options 768 probe 768
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery768', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 0).length <= 1 + 0).assertEqual(true);
      expect(m.getTrackById(1000 + 768) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0769
     * @tc.name    AlbumErrorRecovery769
     * @tc.desc    Album tracks and options 769 probe 769
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery769', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 1).length <= 1 + 1).assertEqual(true);
      expect(m.getTrackById(1000 + 769) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0770
     * @tc.name    AlbumErrorRecovery770
     * @tc.desc    Album tracks and options 770 probe 770
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery770', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 2).length <= 1 + 2).assertEqual(true);
      expect(m.getTrackById(1000 + 770) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0771
     * @tc.name    AlbumErrorRecovery771
     * @tc.desc    Album tracks and options 771 probe 771
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery771', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 3).length <= 1 + 3).assertEqual(true);
      expect(m.getTrackById(1000 + 771) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0772
     * @tc.name    AlbumErrorRecovery772
     * @tc.desc    Album tracks and options 772 probe 772
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery772', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 4).length <= 1 + 4).assertEqual(true);
      expect(m.getTrackById(1000 + 772) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0773
     * @tc.name    AlbumErrorRecovery773
     * @tc.desc    Album tracks and options 773 probe 773
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery773', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 5).length <= 1 + 5).assertEqual(true);
      expect(m.getTrackById(1000 + 773) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0774
     * @tc.name    AlbumErrorRecovery774
     * @tc.desc    Album tracks and options 774 probe 774
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery774', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 6).length <= 1 + 6).assertEqual(true);
      expect(m.getTrackById(1000 + 774) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0775
     * @tc.name    AlbumErrorRecovery775
     * @tc.desc    Album tracks and options 775 probe 775
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery775', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 7).length <= 1 + 7).assertEqual(true);
      expect(m.getTrackById(1000 + 775) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0776
     * @tc.name    AlbumErrorRecovery776
     * @tc.desc    Album tracks and options 776 probe 776
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery776', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 0).length <= 1 + 0).assertEqual(true);
      expect(m.getTrackById(1000 + 776) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0777
     * @tc.name    AlbumErrorRecovery777
     * @tc.desc    Album tracks and options 777 probe 777
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery777', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 1).length <= 1 + 1).assertEqual(true);
      expect(m.getTrackById(1000 + 777) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0778
     * @tc.name    AlbumErrorRecovery778
     * @tc.desc    Album tracks and options 778 probe 778
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery778', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 2).length <= 1 + 2).assertEqual(true);
      expect(m.getTrackById(1000 + 778) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0779
     * @tc.name    AlbumErrorRecovery779
     * @tc.desc    Album tracks and options 779 probe 779
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery779', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 3).length <= 1 + 3).assertEqual(true);
      expect(m.getTrackById(1000 + 779) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0780
     * @tc.name    AlbumErrorRecovery780
     * @tc.desc    Album tracks and options 780 probe 780
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery780', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 4).length <= 1 + 4).assertEqual(true);
      expect(m.getTrackById(1000 + 780) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0781
     * @tc.name    AlbumErrorRecovery781
     * @tc.desc    Album tracks and options 781 probe 781
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery781', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 5).length <= 1 + 5).assertEqual(true);
      expect(m.getTrackById(1000 + 781) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0782
     * @tc.name    AlbumErrorRecovery782
     * @tc.desc    Album tracks and options 782 probe 782
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery782', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 6).length <= 1 + 6).assertEqual(true);
      expect(m.getTrackById(1000 + 782) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0783
     * @tc.name    AlbumErrorRecovery783
     * @tc.desc    Album tracks and options 783 probe 783
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery783', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 7).length <= 1 + 7).assertEqual(true);
      expect(m.getTrackById(1000 + 783) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0784
     * @tc.name    AlbumErrorRecovery784
     * @tc.desc    Album tracks and options 784 probe 784
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery784', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 0).length <= 1 + 0).assertEqual(true);
      expect(m.getTrackById(1000 + 784) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0785
     * @tc.name    AlbumErrorRecovery785
     * @tc.desc    Album tracks and options 785 probe 785
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery785', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 1).length <= 1 + 1).assertEqual(true);
      expect(m.getTrackById(1000 + 785) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0786
     * @tc.name    AlbumErrorRecovery786
     * @tc.desc    Album tracks and options 786 probe 786
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery786', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 2).length <= 1 + 2).assertEqual(true);
      expect(m.getTrackById(1000 + 786) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0787
     * @tc.name    AlbumErrorRecovery787
     * @tc.desc    Album tracks and options 787 probe 787
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery787', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 3).length <= 1 + 3).assertEqual(true);
      expect(m.getTrackById(1000 + 787) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0788
     * @tc.name    AlbumErrorRecovery788
     * @tc.desc    Album tracks and options 788 probe 788
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery788', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 4).length <= 1 + 4).assertEqual(true);
      expect(m.getTrackById(1000 + 788) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0789
     * @tc.name    AlbumErrorRecovery789
     * @tc.desc    Album tracks and options 789 probe 789
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery789', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 5).length <= 1 + 5).assertEqual(true);
      expect(m.getTrackById(1000 + 789) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0790
     * @tc.name    AlbumErrorRecovery790
     * @tc.desc    Album tracks and options 790 probe 790
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery790', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 6).length <= 1 + 6).assertEqual(true);
      expect(m.getTrackById(1000 + 790) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0791
     * @tc.name    AlbumErrorRecovery791
     * @tc.desc    Album tracks and options 791 probe 791
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery791', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 7).length <= 1 + 7).assertEqual(true);
      expect(m.getTrackById(1000 + 791) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0792
     * @tc.name    AlbumErrorRecovery792
     * @tc.desc    Album tracks and options 792 probe 792
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery792', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 0).length <= 1 + 0).assertEqual(true);
      expect(m.getTrackById(1000 + 792) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0793
     * @tc.name    AlbumErrorRecovery793
     * @tc.desc    Album tracks and options 793 probe 793
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery793', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 1).length <= 1 + 1).assertEqual(true);
      expect(m.getTrackById(1000 + 793) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0794
     * @tc.name    AlbumErrorRecovery794
     * @tc.desc    Album tracks and options 794 probe 794
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery794', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 2).length <= 1 + 2).assertEqual(true);
      expect(m.getTrackById(1000 + 794) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0795
     * @tc.name    AlbumErrorRecovery795
     * @tc.desc    Album tracks and options 795 probe 795
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery795', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 3).length <= 1 + 3).assertEqual(true);
      expect(m.getTrackById(1000 + 795) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0796
     * @tc.name    AlbumErrorRecovery796
     * @tc.desc    Album tracks and options 796 probe 796
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery796', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 4).length <= 1 + 4).assertEqual(true);
      expect(m.getTrackById(1000 + 796) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0797
     * @tc.name    AlbumErrorRecovery797
     * @tc.desc    Album tracks and options 797 probe 797
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery797', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 5).length <= 1 + 5).assertEqual(true);
      expect(m.getTrackById(1000 + 797) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0798
     * @tc.name    AlbumErrorRecovery798
     * @tc.desc    Album tracks and options 798 probe 798
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery798', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 6).length <= 1 + 6).assertEqual(true);
      expect(m.getTrackById(1000 + 798) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0799
     * @tc.name    AlbumErrorRecovery799
     * @tc.desc    Album tracks and options 799 probe 799
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery799', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 7).length <= 1 + 7).assertEqual(true);
      expect(m.getTrackById(1000 + 799) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0800
     * @tc.name    AlbumErrorRecovery800
     * @tc.desc    Album tracks and options 800 probe 800
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery800', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 0).length <= 1 + 0).assertEqual(true);
      expect(m.getTrackById(1000 + 800) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0801
     * @tc.name    AlbumErrorRecovery801
     * @tc.desc    Album tracks and options 801 probe 801
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery801', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 1).length <= 1 + 1).assertEqual(true);
      expect(m.getTrackById(1000 + 801) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0802
     * @tc.name    AlbumErrorRecovery802
     * @tc.desc    Album tracks and options 802 probe 802
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery802', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 2).length <= 1 + 2).assertEqual(true);
      expect(m.getTrackById(1000 + 802) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0803
     * @tc.name    AlbumErrorRecovery803
     * @tc.desc    Album tracks and options 803 probe 803
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery803', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 3).length <= 1 + 3).assertEqual(true);
      expect(m.getTrackById(1000 + 803) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0804
     * @tc.name    AlbumErrorRecovery804
     * @tc.desc    Album tracks and options 804 probe 804
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery804', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 4).length <= 1 + 4).assertEqual(true);
      expect(m.getTrackById(1000 + 804) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0805
     * @tc.name    AlbumErrorRecovery805
     * @tc.desc    Album tracks and options 805 probe 805
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery805', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 5).length <= 1 + 5).assertEqual(true);
      expect(m.getTrackById(1000 + 805) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0806
     * @tc.name    AlbumErrorRecovery806
     * @tc.desc    Album tracks and options 806 probe 806
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery806', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 6).length <= 1 + 6).assertEqual(true);
      expect(m.getTrackById(1000 + 806) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0807
     * @tc.name    AlbumErrorRecovery807
     * @tc.desc    Album tracks and options 807 probe 807
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery807', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 7).length <= 1 + 7).assertEqual(true);
      expect(m.getTrackById(1000 + 807) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0808
     * @tc.name    AlbumErrorRecovery808
     * @tc.desc    Album tracks and options 808 probe 808
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery808', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 0).length <= 1 + 0).assertEqual(true);
      expect(m.getTrackById(1000 + 808) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0809
     * @tc.name    AlbumErrorRecovery809
     * @tc.desc    Album tracks and options 809 probe 809
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery809', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 1).length <= 1 + 1).assertEqual(true);
      expect(m.getTrackById(1000 + 809) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0810
     * @tc.name    AlbumErrorRecovery810
     * @tc.desc    Album tracks and options 810 probe 810
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery810', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 2).length <= 1 + 2).assertEqual(true);
      expect(m.getTrackById(1000 + 810) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0811
     * @tc.name    AlbumErrorRecovery811
     * @tc.desc    Album tracks and options 811 probe 811
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery811', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 3).length <= 1 + 3).assertEqual(true);
      expect(m.getTrackById(1000 + 811) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0812
     * @tc.name    AlbumErrorRecovery812
     * @tc.desc    Album tracks and options 812 probe 812
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery812', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 4).length <= 1 + 4).assertEqual(true);
      expect(m.getTrackById(1000 + 812) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0813
     * @tc.name    AlbumErrorRecovery813
     * @tc.desc    Album tracks and options 813 probe 813
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery813', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 5).length <= 1 + 5).assertEqual(true);
      expect(m.getTrackById(1000 + 813) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0814
     * @tc.name    AlbumErrorRecovery814
     * @tc.desc    Album tracks and options 814 probe 814
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery814', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 6).length <= 1 + 6).assertEqual(true);
      expect(m.getTrackById(1000 + 814) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0815
     * @tc.name    AlbumErrorRecovery815
     * @tc.desc    Album tracks and options 815 probe 815
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery815', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 7).length <= 1 + 7).assertEqual(true);
      expect(m.getTrackById(1000 + 815) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_0816
     * @tc.name    AlbumErrorRecovery816
     * @tc.desc    Album tracks and options 816 probe 816
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('AlbumErrorRecovery816', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getTracks().length).assertEqual(m.getTrackCount());
      expect(m.getOptionCount()).assertEqual(4);
      expect(m.getOptions().length).assertEqual(4);
      expect(m.slicePage(0, 1 + 0).length <= 1 + 0).assertEqual(true);
      expect(m.getTrackById(1000 + 816) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

  });
}

