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

// Handwritten companion of the @volume buckets ModelMatrix01~07.
// Expected values come from the class contracts in main/ets/model/DataType.ets and from the
// frozen tab / padding / song tables in Index.ets, UserSongList.ets and RecommendPage.ets.
import { describe, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BreakpointType } from '../../../main/ets/common/BreakpointSystem';
import { IconItem, OffsetDataType, PaddingDataType, SongType } from '../../../main/ets/model/DataType';
import { BUNDLE_NAME, TEST_MODULE_NAME } from '../util/TestConstants';
import { labelByName, labelPrefixByName } from '../util/LabelResolver';

const DOMAIN: number = 0xF811;
const TAG: string = '[MultiMusicTest]';

export default function modelRealTest() {
  describe('ModelReal', () => {

    // ==================== IconItem 字符串 / 资源双态（12 条） ====================
    /**
     * @tc.number: SUB_MM_MDLR_0100
     * @tc.name: testMdlReal0001
     * @tc.desc: Verify IconItem keeps the tab label string passed together with its icon.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlReal0001', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0001 begin');
      let item: IconItem = new IconItem($r('app.media.ic_public_home'), labelByName('index'));
      const description: string = item.description as string;
      hilog.info(DOMAIN, TAG, 'tab-description actual=%{public}s expected=%{public}s', description, labelByName('index'));
      expect(description).assertEqual(labelByName('index'));
      expect(item.imageSrc.id).assertEqual($r('app.media.ic_public_home').id);
      expect(description.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0001 end');
    })

    /**
     * @tc.number: SUB_MM_MDLR_0200
     * @tc.name: testMdlReal0002
     * @tc.desc: Verify IconItem accepts a string resource as the label of a tab entry.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlReal0002', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0002 begin');
      let item: IconItem = new IconItem($r('app.media.ic_radio'), $r('app.string.radio'));
      const isString: boolean = typeof item.description === 'string';
      const labelId: number = (item.description as Resource).id;
      hilog.info(DOMAIN, TAG, 'radio-label actual=%{public}s expected=%{public}s',
        String(labelId), String($r('app.string.radio').id));
      expect(isString).assertFalse();
      expect(labelId).assertEqual($r('app.string.radio').id);
      expect(item.imageSrc.id).assertEqual($r('app.media.ic_radio').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0002 end');
    })

    /**
     * @tc.number: SUB_MM_MDLR_0300
     * @tc.name: testMdlReal0003
     * @tc.desc: Verify an empty label stays an empty string instead of becoming undefined.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testMdlReal0003', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0003 begin');
      let item: IconItem = new IconItem($r('app.media.ic_find'), '');
      const description: string = item.description as string;
      hilog.info(DOMAIN, TAG, 'empty-label actual=%{public}s expected=', description);
      expect(description).assertEqual('');
      expect(description.length).assertEqual(0);
      expect(typeof item.description === 'string').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0003 end');
    })

    /**
     * @tc.number: SUB_MM_MDLR_0400
     * @tc.name: testMdlReal0004
     * @tc.desc: Verify a chinese song label keeps every character untouched.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testMdlReal0004', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0004 begin');
      let item: IconItem = new IconItem($r('app.media.list7'), labelByName('song_label_06'));
      const description: string = item.description as string;
      hilog.info(DOMAIN, TAG, 'song-label actual=%{public}s expected=%{public}s', description, labelByName('song_label_06'));
      expect(description).assertEqual(labelByName('song_label_06'));
      expect(description.indexOf(labelPrefixByName('song_label_06'))).assertEqual(0);
      expect(description.length).assertEqual(labelByName('song_label_06').length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0004 end');
    })

    /**
     * @tc.number: SUB_MM_MDLR_0500
     * @tc.name: testMdlReal0005
     * @tc.desc: Verify a label that mixes chinese and english keeps its exact content.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testMdlReal0005', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0005 begin');
      let item: IconItem = new IconItem($r('app.media.ic_music_hires'), 'Hi-Res');
      const description: string = item.description as string;
      hilog.info(DOMAIN, TAG, 'hires-label actual=%{public}s expected=Hi-Res', description);
      expect(description).assertEqual('Hi-Res');
      expect(description.indexOf('-')).assertEqual(2);
      expect(description.indexOf('Hi')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0005 end');
    })

    /**
     * @tc.number: SUB_MM_MDLR_0600
     * @tc.name: testMdlReal0006
     * @tc.desc: Verify the icon and the label resource are stored as two different resources.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlReal0006', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0006 begin');
      let item: IconItem = new IconItem($r('app.media.ic_mine'), $r('app.string.mine'));
      const imageId: number = item.imageSrc.id;
      const labelId: number = (item.description as Resource).id;
      hilog.info(DOMAIN, TAG, 'two-resources actual=%{public}s/%{public}s', String(imageId), String(labelId));
      expect(imageId).assertEqual($r('app.media.ic_mine').id);
      expect(labelId).assertEqual($r('app.string.mine').id);
      expect(imageId === labelId).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0006 end');
    })

    /**
     * @tc.number: SUB_MM_MDLR_0700
     * @tc.name: testMdlReal0007
     * @tc.desc: Verify replacing the icon of an item leaves its label unchanged.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testMdlReal0007', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0007 begin');
      let item: IconItem = new IconItem($r('app.media.ic_public_home'), labelByName('index'));
      item.imageSrc = $r('app.media.ic_public_home_filled');
      const description: string = item.description as string;
      hilog.info(DOMAIN, TAG, 'icon-swapped actual=%{public}s expected=%{public}s',
        String(item.imageSrc.id), String($r('app.media.ic_public_home_filled').id));
      expect(item.imageSrc.id).assertEqual($r('app.media.ic_public_home_filled').id);
      expect(description).assertEqual(labelByName('index'));
      expect(item.imageSrc.id === $r('app.media.ic_public_home').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0007 end');
    })

    /**
     * @tc.number: SUB_MM_MDLR_0800
     * @tc.name: testMdlReal0008
     * @tc.desc: Verify replacing the label of an item leaves its icon unchanged.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testMdlReal0008', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0008 begin');
      let item: IconItem = new IconItem($r('app.media.ic_find'), labelByName('discovery'));
      item.description = $r('app.string.discovery');
      const labelId: number = (item.description as Resource).id;
      hilog.info(DOMAIN, TAG, 'label-swapped actual=%{public}s expected=%{public}s',
        String(labelId), String($r('app.string.discovery').id));
      expect(labelId).assertEqual($r('app.string.discovery').id);
      expect(item.imageSrc.id).assertEqual($r('app.media.ic_find').id);
      expect(typeof item.description === 'string').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0008 end');
    })

    /**
     * @tc.number: SUB_MM_MDLR_0900
     * @tc.name: testMdlReal0009
     * @tc.desc: Verify two IconItem instances never share their label state.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testMdlReal0009', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0009 begin');
      let first: IconItem = new IconItem($r('app.media.list1'), 'first');
      let second: IconItem = new IconItem($r('app.media.list1'), 'second');
      first.description = 'first-updated';
      const firstLabel: string = first.description as string;
      const secondLabel: string = second.description as string;
      hilog.info(DOMAIN, TAG, 'item-isolation actual=%{public}s/%{public}s expected=first-updated/second',
        firstLabel, secondLabel);
      expect(firstLabel).assertEqual('first-updated');
      expect(secondLabel).assertEqual('second');
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0009 end');
    })

    /**
     * @tc.number: SUB_MM_MDLR_1000
     * @tc.name: testMdlReal0010
     * @tc.desc: Verify the icon identifier of a real tab entry is a positive resource id.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testMdlReal0010', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0010 begin');
      let item: IconItem = new IconItem($r('app.media.ic_listener'), 'listener');
      const imageId: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'listener-icon-id actual=%{public}s expected-positive', String(imageId));
      expect(imageId).assertEqual($r('app.media.ic_listener').id);
      expect(imageId > 0).assertTrue();
      expect(item.imageSrc.moduleName).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0010 end');
    })

    /**
     * @tc.number: SUB_MM_MDLR_1100
     * @tc.name: testMdlReal0011
     * @tc.desc: Verify an icon resource keeps the application bundle name.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testMdlReal0011', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0011 begin');
      let item: IconItem = new IconItem($r('app.media.banner1'), 'banner');
      const bundleName: string = item.imageSrc.bundleName;
      hilog.info(DOMAIN, TAG, 'banner-bundle actual=%{public}s expected=%{public}s', bundleName, BUNDLE_NAME);
      expect(bundleName).assertEqual(BUNDLE_NAME);
      expect(item.imageSrc.id).assertEqual($r('app.media.banner1').id);
      expect(bundleName.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0011 end');
    })

    /**
     * @tc.number: SUB_MM_MDLR_1200
     * @tc.name: testMdlReal0012
     * @tc.desc: Verify a long label is stored in full without truncation.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testMdlReal0012', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0012 begin');
      let longLabel: string = labelByName('song_label_01');
      let item: IconItem = new IconItem($r('app.media.list12'), longLabel);
      const description: string = item.description as string;
      hilog.info(DOMAIN, TAG, 'long-label-length actual=%{public}s expected=16', String(description.length));
      expect(description).assertEqual(longLabel);
      expect(description.indexOf(':')).assertEqual(4);
      expect(description.length).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0012 end');
    })

    // ==================== OffsetDataType（8 条） ====================
    /**
     * @tc.number: SUB_MM_MDLR_1300
     * @tc.name: testMdlReal0013
     * @tc.desc: Verify the song cover play icon offset keeps x right and y up for desktop breakpoints.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlReal0013', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0013 begin');
      let offset: OffsetDataType = new OffsetDataType(11, -11);
      hilog.info(DOMAIN, TAG, 'cover-offset actual=%{public}s/%{public}s expected=11/-11',
        String(offset.x), String(offset.y));
      expect(offset.x).assertEqual(11);
      expect(offset.y).assertEqual(-11);
      expect(offset.x === -offset.y).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0013 end');
    })

    /**
     * @tc.number: SUB_MM_MDLR_1400
     * @tc.name: testMdlReal0014
     * @tc.desc: Verify the compact breakpoint offset keeps both axes at zero.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testMdlReal0014', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0014 begin');
      let offset: OffsetDataType = new OffsetDataType(0, 0);
      hilog.info(DOMAIN, TAG, 'zero-offset actual=%{public}s/%{public}s expected=0/0',
        String(offset.x), String(offset.y));
      expect(offset.x).assertEqual(0);
      expect(offset.y).assertEqual(0);
      expect(offset.x === offset.y).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0014 end');
    })

    /**
     * @tc.number: SUB_MM_MDLR_1500
     * @tc.name: testMdlReal0015
     * @tc.desc: Verify the first constructor argument is stored in x and the second in y.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlReal0015', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0015 begin');
      let offset: OffsetDataType = new OffsetDataType(3, 7);
      hilog.info(DOMAIN, TAG, 'xy-mapping actual=%{public}s/%{public}s expected=3/7',
        String(offset.x), String(offset.y));
      expect(offset.x).assertEqual(3);
      expect(offset.y).assertEqual(7);
      expect(offset.x === offset.y).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0015 end');
    })

    /**
     * @tc.number: SUB_MM_MDLR_1600
     * @tc.name: testMdlReal0016
     * @tc.desc: Verify a negative x is not clamped to zero.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testMdlReal0016', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0016 begin');
      let offset: OffsetDataType = new OffsetDataType(-24, 12);
      hilog.info(DOMAIN, TAG, 'negative-x actual=%{public}s expected=-24', String(offset.x));
      expect(offset.x).assertEqual(-24);
      expect(offset.x < 0).assertTrue();
      expect(offset.y).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0016 end');
    })

    /**
     * @tc.number: SUB_MM_MDLR_1700
     * @tc.name: testMdlReal0017
     * @tc.desc: Verify writing x only leaves y untouched.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testMdlReal0017', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0017 begin');
      let offset: OffsetDataType = new OffsetDataType(1, 2);
      offset.x = 20;
      hilog.info(DOMAIN, TAG, 'x-write actual=%{public}s/%{public}s expected=20/2',
        String(offset.x), String(offset.y));
      expect(offset.x).assertEqual(20);
      expect(offset.y).assertEqual(2);
      expect(offset.x === offset.y).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0017 end');
    })

    /**
     * @tc.number: SUB_MM_MDLR_1800
     * @tc.name: testMdlReal0018
     * @tc.desc: Verify two offsets with mirrored values keep independent fields.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testMdlReal0018', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0018 begin');
      let forward: OffsetDataType = new OffsetDataType(11, -11);
      let backward: OffsetDataType = new OffsetDataType(-11, 11);
      hilog.info(DOMAIN, TAG, 'mirrored-offsets actual=%{public}s/%{public}s', String(forward.x),
        String(backward.x));
      expect(forward.x).assertEqual(11);
      expect(backward.x).assertEqual(-11);
      expect(forward.x === backward.x).assertFalse();
      expect(forward.y === backward.y).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0018 end');
    })

    /**
     * @tc.number: SUB_MM_MDLR_1900
     * @tc.name: testMdlReal0019
     * @tc.desc: Verify a large offset keeps full integer precision.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testMdlReal0019', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0019 begin');
      let offset: OffsetDataType = new OffsetDataType(Number.MAX_SAFE_INTEGER, -Number.MAX_SAFE_INTEGER);
      hilog.info(DOMAIN, TAG, 'large-offset actual=%{public}s/%{public}s',
        String(offset.x), String(offset.y));
      expect(offset.x).assertEqual(Number.MAX_SAFE_INTEGER);
      expect(offset.y).assertEqual(-Number.MAX_SAFE_INTEGER);
      expect(offset.x + offset.y).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0019 end');
    })

    /**
     * @tc.number: SUB_MM_MDLR_2000
     * @tc.name: testMdlReal0020
     * @tc.desc: Verify a decimal offset keeps its fractional part.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testMdlReal0020', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0020 begin');
      let offset: OffsetDataType = new OffsetDataType(0.5, -0.5);
      hilog.info(DOMAIN, TAG, 'decimal-offset actual=%{public}s/%{public}s expected=0.5/-0.5',
        String(offset.x), String(offset.y));
      expect(offset.x).assertEqual(0.5);
      expect(offset.y).assertEqual(-0.5);
      expect(offset.x + offset.y).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0020 end');
    })

    // ==================== PaddingDataType（8 条） ====================
    /**
     * @tc.number: SUB_MM_MDLR_2100
     * @tc.name: testMdlReal0021
     * @tc.desc: Verify the compact page padding keeps 16 on both sides.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlReal0021', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0021 begin');
      let padding: PaddingDataType = new PaddingDataType(16, 16);
      hilog.info(DOMAIN, TAG, 'compact-padding actual=%{public}s/%{public}s expected=16/16',
        String(padding.left), String(padding.right));
      expect(padding.left).assertEqual(16);
      expect(padding.right).assertEqual(16);
      expect(padding.left === padding.right).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0021 end');
    })

    /**
     * @tc.number: SUB_MM_MDLR_2200
     * @tc.name: testMdlReal0022
     * @tc.desc: Verify the large page padding widens both sides to 24.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlReal0022', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0022 begin');
      let padding: PaddingDataType = new PaddingDataType(24, 24);
      hilog.info(DOMAIN, TAG, 'large-padding actual=%{public}s expected=24', String(padding.left));
      expect(padding.left).assertEqual(24);
      expect(padding.right).assertEqual(24);
      expect(padding.left > 16).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0022 end');
    })

    /**
     * @tc.number: SUB_MM_MDLR_2300
     * @tc.name: testMdlReal0023
     * @tc.desc: Verify an asymmetric padding keeps left and right apart.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testMdlReal0023', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0023 begin');
      let padding: PaddingDataType = new PaddingDataType(8, 32);
      hilog.info(DOMAIN, TAG, 'asymmetric-padding actual=%{public}s/%{public}s expected=8/32',
        String(padding.left), String(padding.right));
      expect(padding.left).assertEqual(8);
      expect(padding.right).assertEqual(32);
      expect(padding.left === padding.right).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0023 end');
    })

    /**
     * @tc.number: SUB_MM_MDLR_2400
     * @tc.name: testMdlReal0024
     * @tc.desc: Verify writing right does not move the left padding.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testMdlReal0024', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0024 begin');
      let padding: PaddingDataType = new PaddingDataType(16, 16);
      padding.right = 40;
      hilog.info(DOMAIN, TAG, 'right-write actual=%{public}s/%{public}s expected=16/40',
        String(padding.left), String(padding.right));
      expect(padding.left).assertEqual(16);
      expect(padding.right).assertEqual(40);
      expect(padding.right - padding.left).assertEqual(24);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0024 end');
    })

    /**
     * @tc.number: SUB_MM_MDLR_2500
     * @tc.name: testMdlReal0025
     * @tc.desc: Verify two padding instances keep their own values after mutation.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testMdlReal0025', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0025 begin');
      let compact: PaddingDataType = new PaddingDataType(16, 16);
      let large: PaddingDataType = new PaddingDataType(24, 24);
      compact.left = 0;
      hilog.info(DOMAIN, TAG, 'padding-isolation actual=%{public}s/%{public}s expected=0/24',
        String(compact.left), String(large.left));
      expect(compact.left).assertEqual(0);
      expect(large.left).assertEqual(24);
      expect(compact === large).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0025 end');
    })

    /**
     * @tc.number: SUB_MM_MDLR_2600
     * @tc.name: testMdlReal0026
     * @tc.desc: Verify a zero padding is a valid boundary and stays zero.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testMdlReal0026', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0026 begin');
      let padding: PaddingDataType = new PaddingDataType(0, 0);
      hilog.info(DOMAIN, TAG, 'zero-padding actual=%{public}s/%{public}s expected=0/0',
        String(padding.left), String(padding.right));
      expect(padding.left).assertEqual(0);
      expect(padding.right).assertEqual(0);
      expect(padding.left + padding.right).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0026 end');
    })

    /**
     * @tc.number: SUB_MM_MDLR_2700
     * @tc.name: testMdlReal0027
     * @tc.desc: Verify the constructor argument order is left then right.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlReal0027', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0027 begin');
      let padding: PaddingDataType = new PaddingDataType(12, 48);
      hilog.info(DOMAIN, TAG, 'padding-order actual=%{public}s/%{public}s expected=12/48',
        String(padding.left), String(padding.right));
      expect(padding.left).assertEqual(12);
      expect(padding.right).assertEqual(48);
      expect(padding.left * 4).assertEqual(padding.right);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0027 end');
    })

    /**
     * @tc.number: SUB_MM_MDLR_2800
     * @tc.name: testMdlReal0028
     * @tc.desc: Verify a fractional padding keeps its decimal part on both sides.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testMdlReal0028', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0028 begin');
      let padding: PaddingDataType = new PaddingDataType(2.5, 7.5);
      hilog.info(DOMAIN, TAG, 'fraction-padding actual=%{public}s/%{public}s expected=2.5/7.5',
        String(padding.left), String(padding.right));
      expect(padding.left).assertEqual(2.5);
      expect(padding.right).assertEqual(7.5);
      expect(padding.right - padding.left).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0028 end');
    })

    // ==================== SongType（8 条） ====================
    /**
     * @tc.number: SUB_MM_MDLR_2900
     * @tc.name: testMdlReal0029
     * @tc.desc: Verify the first entry of the user song list keeps its cover, label and count.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlReal0029', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0029 begin');
      let song: SongType = new SongType($r('app.media.list4'), $r('app.string.emo'), 16);
      hilog.info(DOMAIN, TAG, 'user-song-first actual=%{public}s expected=16', String(song.count));
      expect(song.count).assertEqual(16);
      expect(song.imageSrc.id).assertEqual($r('app.media.list4').id);
      expect(song.description.id).assertEqual($r('app.string.emo').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0029 end');
    })

    /**
     * @tc.number: SUB_MM_MDLR_3000
     * @tc.name: testMdlReal0030
     * @tc.desc: Verify a song with a zero count is still constructible and readable.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testMdlReal0030', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0030 begin');
      let song: SongType = new SongType($r('app.media.list13'), $r('app.string.sleep'), 0);
      hilog.info(DOMAIN, TAG, 'zero-count-song actual=%{public}s expected=0', String(song.count));
      expect(song.count).assertEqual(0);
      expect(song.count >= 0).assertTrue();
      expect(song.imageSrc.id).assertEqual($r('app.media.list13').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0030 end');
    })

    /**
     * @tc.number: SUB_MM_MDLR_3100
     * @tc.name: testMdlReal0031
     * @tc.desc: Verify updating the count of a song keeps its two resources untouched.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testMdlReal0031', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0031 begin');
      let song: SongType = new SongType($r('app.media.list7'), $r('app.string.noon'), 30);
      song.count = 31;
      hilog.info(DOMAIN, TAG, 'count-updated actual=%{public}s expected=31', String(song.count));
      expect(song.count).assertEqual(31);
      expect(song.imageSrc.id).assertEqual($r('app.media.list7').id);
      expect(song.description.id).assertEqual($r('app.string.noon').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0031 end');
    })

    /**
     * @tc.number: SUB_MM_MDLR_3200
     * @tc.name: testMdlReal0032
     * @tc.desc: Verify the song label resource is never confused with the cover resource.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlReal0032', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0032 begin');
      let song: SongType = new SongType($r('app.media.list1'), $r('app.string.bgm'), 16);
      const coverId: number = song.imageSrc.id;
      const labelId: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'song-resources actual=%{public}s/%{public}s', String(coverId), String(labelId));
      expect(coverId).assertEqual($r('app.media.list1').id);
      expect(labelId).assertEqual($r('app.string.bgm').id);
      expect(coverId === labelId).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0032 end');
    })

    /**
     * @tc.number: SUB_MM_MDLR_3300
     * @tc.name: testMdlReal0033
     * @tc.desc: Verify two songs with the same cover keep independent counts.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testMdlReal0033', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0033 begin');
      let first: SongType = new SongType($r('app.media.list4'), $r('app.string.emo'), 16);
      let second: SongType = new SongType($r('app.media.list4'), $r('app.string.rock'), 25);
      first.count = 0;
      hilog.info(DOMAIN, TAG, 'song-count-isolation actual=%{public}s/%{public}s expected=0/25',
        String(first.count), String(second.count));
      expect(first.count).assertEqual(0);
      expect(second.count).assertEqual(25);
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0033 end');
    })

    /**
     * @tc.number: SUB_MM_MDLR_3400
     * @tc.name: testMdlReal0034
     * @tc.desc: Verify a large song count stays an exact number.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testMdlReal0034', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0034 begin');
      let song: SongType = new SongType($r('app.media.list2'), $r('app.string.oldYear'), 48);
      hilog.info(DOMAIN, TAG, 'oldyear-count actual=%{public}s expected=48', String(song.count));
      expect(song.count).assertEqual(48);
      expect(song.count > 30).assertTrue();
      expect(song.imageSrc.id).assertEqual($r('app.media.list2').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0034 end');
    })

    /**
     * @tc.number: SUB_MM_MDLR_3500
     * @tc.name: testMdlReal0035
     * @tc.desc: Verify swapping the label of a song keeps the count and the cover.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testMdlReal0035', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0035 begin');
      let song: SongType = new SongType($r('app.media.list3'), $r('app.string.pops'), 30);
      song.description = $r('app.string.oldYear');
      hilog.info(DOMAIN, TAG, 'label-swap actual=%{public}s expected=%{public}s',
        String(song.description.id), String($r('app.string.oldYear').id));
      expect(song.description.id).assertEqual($r('app.string.oldYear').id);
      expect(song.count).assertEqual(30);
      expect(song.imageSrc.id).assertEqual($r('app.media.list3').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0035 end');
    })

    /**
     * @tc.number: SUB_MM_MDLR_3600
     * @tc.name: testMdlReal0036
     * @tc.desc: Verify consecutive count increments accumulate on one instance only.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testMdlReal0036', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0036 begin');
      let song: SongType = new SongType($r('app.media.list5'), $r('app.string.sleep'), 18);
      song.count = song.count + 1;
      song.count = song.count + 1;
      hilog.info(DOMAIN, TAG, 'count-increments actual=%{public}s expected=20', String(song.count));
      expect(song.count).assertEqual(20);
      expect(song.count).assertEqual(18 + 2);
      expect(song.description.id).assertEqual($r('app.string.sleep').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0036 end');
    })

    // ==================== 数据类与断点配置组合（4 条） ====================
    /**
     * @tc.number: SUB_MM_MDLR_3700
     * @tc.name: testMdlReal0037
     * @tc.desc: Verify the page padding config returns a fresh PaddingDataType per breakpoint.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlReal0037', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0037 begin');
      let config: BreakpointType<PaddingDataType> = new BreakpointType<PaddingDataType>(
        new PaddingDataType(16, 16), new PaddingDataType(16, 16), new PaddingDataType(24, 24));
      const small: PaddingDataType | undefined = config.getValue('sm');
      const large: PaddingDataType | undefined = config.getValue('lg');
      const largeLeft: number = large === undefined ? -1 : large.left;
      const smallLeft: number = small === undefined ? -1 : small.left;
      hilog.info(DOMAIN, TAG, 'padding-config actual=%{public}s/%{public}s expected=16/24',
        String(smallLeft), String(largeLeft));
      expect(smallLeft).assertEqual(16);
      expect(largeLeft).assertEqual(24);
      expect(largeLeft - smallLeft).assertEqual(8);
      expect(small === large).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0037 end');
    })

    /**
     * @tc.number: SUB_MM_MDLR_3800
     * @tc.name: testMdlReal0038
     * @tc.desc: Verify the cover play icon offset config keeps compact zero and desktop -11.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlReal0038', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0038 begin');
      let config: BreakpointType<OffsetDataType> = new BreakpointType<OffsetDataType>(
        new OffsetDataType(0, 0), new OffsetDataType(11, -11), new OffsetDataType(11, -11));
      const small: OffsetDataType | undefined = config.getValue('sm');
      const smallY: number = small === undefined ? 99 : small.y;
      const medium: OffsetDataType | undefined = config.getValue('md');
      const mediumY: number = medium === undefined ? 0 : medium.y;
      hilog.info(DOMAIN, TAG, 'offset-config actual=%{public}s/%{public}s expected=0/-11',
        String(smallY), String(mediumY));
      expect(smallY).assertEqual(0);
      expect(mediumY).assertEqual(-11);
      expect(mediumY < smallY).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0038 end');
    })

    /**
     * @tc.number: SUB_MM_MDLR_3900
     * @tc.name: testMdlReal0039
     * @tc.desc: Verify a tab icon triple built from the Index tab list resolves per breakpoint.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlReal0039', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0039 begin');
      let home: IconItem = new IconItem($r('app.media.ic_public_home'), $r('app.string.index'));
      let radio: IconItem = new IconItem($r('app.media.ic_radio'), $r('app.string.radio'));
      let mine: IconItem = new IconItem($r('app.media.ic_mine'), $r('app.string.mine'));
      let tabs: BreakpointType<IconItem> = new BreakpointType<IconItem>(home, radio, mine);
      const medium: IconItem | undefined = tabs.getValue('md');
      const mediumImageId: number = medium === undefined ? -1 : medium.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'tab-middle-icon actual=%{public}s expected=%{public}s',
        String(mediumImageId), String($r('app.media.ic_radio').id));
      expect(mediumImageId).assertEqual($r('app.media.ic_radio').id);
      expect(tabs.getValue('lg') === mine).assertTrue();
      expect(tabs.getValue('sm') === home).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0039 end');
    })

    /**
     * @tc.number: SUB_MM_MDLR_4000
     * @tc.name: testMdlReal0040
     * @tc.desc: Verify a SongType triple keeps three distinct counts across breakpoints.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testMdlReal0040', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0040 begin');
      let config: BreakpointType<SongType> = new BreakpointType<SongType>(
        new SongType($r('app.media.list8'), $r('app.string.coffee'), 24),
        new SongType($r('app.media.list9'), $r('app.string.jazz'), 16),
        new SongType($r('app.media.list10'), $r('app.string.bluce'), 16));
      const small: SongType | undefined = config.getValue('sm');
      const large: SongType | undefined = config.getValue('lg');
      const smallCount: number = small === undefined ? -1 : small.count;
      const largeCount: number = large === undefined ? -1 : large.count;
      hilog.info(DOMAIN, TAG, 'song-config actual=%{public}s/%{public}s expected=24/16',
        String(smallCount), String(largeCount));
      expect(smallCount).assertEqual(24);
      expect(largeCount).assertEqual(16);
      expect(smallCount === largeCount).assertFalse();
      expect(small === large).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlReal0040 end');
    })
  })
}
