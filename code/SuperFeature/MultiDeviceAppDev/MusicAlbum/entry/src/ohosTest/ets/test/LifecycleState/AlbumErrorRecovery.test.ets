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
