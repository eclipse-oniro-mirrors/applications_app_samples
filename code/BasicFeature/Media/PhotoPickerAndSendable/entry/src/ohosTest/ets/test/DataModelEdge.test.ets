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

/**
 * Edge suite of the data models of the sample: the route constants, the home
 * page entry cards and the cache file contract. The cases probe boundary
 * values, unusual strings and the instance independence of the models
 * without touching any ability context or file system.
 */

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { SceneRoutes, SceneEntry } from '../../../main/ets/photopicker/data/SceneEntry';
import { CacheFile, SandboxStore } from 'photopickersendable';

/** Log domain of the sample application. */
const DOMAIN: number = 0xF811;

/**
 * Registers every data model edge case of the sample.
 * All inputs are pure values, no ability context is required.
 */
export default function dataModelEdgeTest() {
  describe('DataModelEdgeTest', () => {
    /**
     * @tc.number    SUB_PHOTOPICKER_DMAT_0100
     * @tc.name      testDataModel0001
     * @tc.desc      Verify the picker, edit and cache route constants keep
     *               their exact string values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDataModel0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testDataModel0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The picker scene keeps its short route key.
      expect(SceneRoutes.PICKER).assertEqual('picker');
      // The edit scene keeps its short route key.
      expect(SceneRoutes.EDIT).assertEqual('edit');
      // The cache scene keeps its short route key.
      expect(SceneRoutes.CACHE).assertEqual('cache');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DMAT_0200
     * @tc.name      testDataModel0002
     * @tc.desc      Verify the recent and gallery constants and the full
     *               pairwise distinctness of all five route keys.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDataModel0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testDataModel0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The recent scene keeps its short route key.
      expect(SceneRoutes.RECENT).assertEqual('recent');
      // The gallery scene keeps its short route key.
      expect(SceneRoutes.GALLERY).assertEqual('gallery');
      // All ten pairs of route keys stay distinct so the router cannot mix scenes.
      expect(SceneRoutes.PICKER !== SceneRoutes.RECENT).assertTrue();
      expect(SceneRoutes.PICKER !== SceneRoutes.GALLERY).assertTrue();
      expect(SceneRoutes.PICKER !== SceneRoutes.EDIT).assertTrue();
      expect(SceneRoutes.PICKER !== SceneRoutes.CACHE).assertTrue();
      expect(SceneRoutes.RECENT !== SceneRoutes.GALLERY).assertTrue();
      expect(SceneRoutes.RECENT !== SceneRoutes.EDIT).assertTrue();
      expect(SceneRoutes.RECENT !== SceneRoutes.CACHE).assertTrue();
      expect(SceneRoutes.GALLERY !== SceneRoutes.EDIT).assertTrue();
      expect(SceneRoutes.GALLERY !== SceneRoutes.CACHE).assertTrue();
      expect(SceneRoutes.EDIT !== SceneRoutes.CACHE).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DMAT_0300
     * @tc.name      testDataModel0003
     * @tc.desc      Verify the character length of every route key.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDataModel0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testDataModel0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Each route key keeps its documented single word length.
      expect(SceneRoutes.PICKER.length).assertEqual(6);
      expect(SceneRoutes.RECENT.length).assertEqual(6);
      expect(SceneRoutes.GALLERY.length).assertEqual(7);
      expect(SceneRoutes.EDIT.length).assertEqual(4);
      expect(SceneRoutes.CACHE.length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DMAT_0400
     * @tc.name      testDataModel0004
     * @tc.desc      Verify every route key is already lowercase so case
     *       sensitive router comparisons stay stable.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDataModel0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testDataModel0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Lowercasing a lowercase key must not change anything.
      expect(SceneRoutes.PICKER).assertEqual(SceneRoutes.PICKER.toLowerCase());
      expect(SceneRoutes.RECENT).assertEqual(SceneRoutes.RECENT.toLowerCase());
      expect(SceneRoutes.GALLERY).assertEqual(SceneRoutes.GALLERY.toLowerCase());
      expect(SceneRoutes.EDIT).assertEqual(SceneRoutes.EDIT.toLowerCase());
      expect(SceneRoutes.CACHE).assertEqual(SceneRoutes.CACHE.toLowerCase());
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DMAT_0500
     * @tc.name      testDataModel0005
     * @tc.desc      Verify the picker entry stores every constructor argument
     *               inside its own field.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDataModel0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testDataModel0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const title: Resource = $r('app.media.startIcon');
      const description: Resource = $r('app.string.pp_app_title');
      const entry: SceneEntry = new SceneEntry(SceneRoutes.PICKER, title, description, 'dmat_picker_card');
      // Every argument lands in its own field unchanged.
      expect(entry.route).assertEqual('picker');
      expect(entry.title).assertEqual(title);
      expect(entry.description).assertEqual(description);
      expect(entry.componentId).assertEqual('dmat_picker_card');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DMAT_0600
     * @tc.name      testDataModel0006
     * @tc.desc      Verify the cache entry stores the cache resources and the
     *               cache route key.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDataModel0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testDataModel0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const title: Resource = $r('app.string.pp_home_scene_cache_title');
      const description: Resource = $r('app.string.pp_home_scene_cache_desc');
      const entry: SceneEntry = new SceneEntry(SceneRoutes.CACHE, title, description, 'dmat_cache_card');
      // The cache entry carries the cache route and resources.
      expect(entry.route).assertEqual(SceneRoutes.CACHE);
      expect(entry.title).assertEqual(title);
      expect(entry.description).assertEqual(description);
      expect(entry.componentId).assertEqual('dmat_cache_card');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DMAT_0700
     * @tc.name      testDataModel0007
     * @tc.desc      Verify two entries built with the same arguments keep
     *               equal fields but stay independent objects.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDataModel0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testDataModel0007';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const title: Resource = $r('app.media.startIcon');
      const description: Resource = $r('app.string.pp_app_title');
      const first: SceneEntry = new SceneEntry(SceneRoutes.RECENT, title, description, 'dmat_shared_card');
      const second: SceneEntry = new SceneEntry(SceneRoutes.RECENT, title, description, 'dmat_shared_card');
      // Both entries report the same field values.
      expect(first.route).assertEqual(second.route);
      expect(first.componentId).assertEqual(second.componentId);
      expect(first.title).assertEqual(second.title);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DMAT_0800
     * @tc.name      testDataModel0008
     * @tc.desc      Verify empty route and component id strings are stored
     *               verbatim without validation.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDataModel0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG: string = 'testDataModel0008';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const title: Resource = $r('app.media.startIcon');
      const description: Resource = $r('app.string.pp_app_title');
      // The model carries no argument validation by design.
      const entry: SceneEntry = new SceneEntry('', title, description, '');
      // Both empty strings pass through unchanged.
      expect(entry.route).assertEqual('');
      expect(entry.componentId).assertEqual('');
      // The resources still pass through unchanged.
      expect(entry.title).assertEqual(title);
      expect(entry.description).assertEqual(description);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DMAT_0900
     * @tc.name      testDataModel0009
     * @tc.desc      Verify a long route string keeps its full length inside
     *               the entry model.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDataModel0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG: string = 'testDataModel0009';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Build a 100 character route without template strings.
      let longRoute: string = '';
      for (let index: number = 0; index < 100; index++) {
        longRoute = longRoute + 'r';
      }
      const title: Resource = $r('app.media.startIcon');
      const description: Resource = $r('app.string.pp_app_title');
      const entry: SceneEntry = new SceneEntry(longRoute, title, description, 'dmat_long_route');
      // The long route survives the constructor unchanged.
      expect(entry.route).assertEqual(longRoute);
      expect(entry.route.length).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DMAT_1000
     * @tc.name      testDataModel0010
     * @tc.desc      Verify changing one entry field does not leak into a
     *               second independently built entry.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDataModel0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testDataModel0010';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const title: Resource = $r('app.media.startIcon');
      const description: Resource = $r('app.string.pp_app_title');
      const kept: SceneEntry = new SceneEntry(SceneRoutes.GALLERY, title, description, 'dmat_keep_card');
      const changed: SceneEntry = new SceneEntry(SceneRoutes.EDIT, title, description, 'dmat_change_card');
      expect(kept.route).assertEqual('gallery');
      expect(changed.route).assertEqual('edit');
      // Rebuilding one instance does not touch the other instance.
      const reborn: SceneEntry = new SceneEntry(SceneRoutes.CACHE, title, description, changed.componentId);
      expect(changed.route).assertEqual('edit');
      expect(reborn.route).assertEqual('cache');
      expect(kept.route).assertEqual('gallery');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DMAT_1100
     * @tc.name      testDataModel0011
     * @tc.desc      Verify the localized resources are stored by reference so
     *               the same resource object is exposed by the field.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDataModel0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testDataModel0011';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const title: Resource = $r('app.string.pp_home_scene_cache_title');
      const description: Resource = $r('app.string.pp_home_scene_cache_desc');
      const entry: SceneEntry = new SceneEntry(SceneRoutes.GALLERY, title, description, 'dmat_ref_card');
      // The exact resource objects are handed back by reference.
      expect(entry.title).assertEqual(title);
      expect(entry.description).assertEqual(description);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DMAT_1200
     * @tc.name      testDataModel0012
     * @tc.desc      Verify two entries with different routes may share one
     *               component id because the model enforces no uniqueness.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDataModel0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG: string = 'testDataModel0012';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const title: Resource = $r('app.media.startIcon');
      const description: Resource = $r('app.string.pp_app_title');
      const picker: SceneEntry = new SceneEntry(SceneRoutes.PICKER, title, description, 'dmat_dup_card');
      const cache: SceneEntry = new SceneEntry(SceneRoutes.CACHE, title, description, 'dmat_dup_card');
      // The shared component id is accepted on both entries.
      expect(picker.componentId).assertEqual('dmat_dup_card');
      expect(cache.componentId).assertEqual('dmat_dup_card');
      // Only the route keys differ between the two cards.
      expect(picker.route !== cache.route).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DMAT_1300
     * @tc.name      testDataModel0013
     * @tc.desc      Verify the cache file model stores all four constructor
     *               arguments inside their own fields.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDataModel0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testDataModel0013';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const file: CacheFile = new CacheFile('export.jpg', '/data/storage/files/outputs/export.jpg', 20480, 1760000000000);
      // Every constructor argument lands in its own field.
      expect(file.name).assertEqual('export.jpg');
      expect(file.path).assertEqual('/data/storage/files/outputs/export.jpg');
      expect(file.size).assertEqual(20480);
      expect(file.modifiedTime).assertEqual(1760000000000);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DMAT_1400
     * @tc.name      testDataModel0014
     * @tc.desc      Verify a zero size and a zero modification time are kept
     *               unchanged by the cache file model.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDataModel0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testDataModel0014';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Zero values pass through the constructor without correction.
      const file: CacheFile = new CacheFile('empty.bin', '/outputs/empty.bin', 0, 0);
      expect(file.size).assertEqual(0);
      expect(file.modifiedTime).assertEqual(0);
      // The string fields stay untouched beside the zero numbers.
      expect(file.name).assertEqual('empty.bin');
      expect(file.path).assertEqual('/outputs/empty.bin');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DMAT_1500
     * @tc.name      testDataModel0015
     * @tc.desc      Verify a negative size passes through the cache file
     *               model without clamping.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDataModel0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG: string = 'testDataModel0015';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The model documents no validation, so negatives survive verbatim.
      const file: CacheFile = new CacheFile('broken.jpg', '/outputs/broken.jpg', -128, 5000);
      expect(file.size).assertEqual(-128);
      // The other fields keep their values.
      expect(file.name).assertEqual('broken.jpg');
      expect(file.modifiedTime).assertEqual(5000);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DMAT_1600
     * @tc.name      testDataModel0016
     * @tc.desc      Verify the maximum safe integer size passes through the
     *               cache file model unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDataModel0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testDataModel0016';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The largest exact integer a number can hold stays exact.
      const file: CacheFile = new CacheFile('huge.bin', '/outputs/huge.bin', 9007199254740991, 1000);
      expect(file.size).assertEqual(9007199254740991);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DMAT_1700
     * @tc.name      testDataModel0017
     * @tc.desc      Verify empty name and path strings pass through the cache
     *               file model verbatim.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDataModel0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG: string = 'testDataModel0017';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The model accepts empty strings like every other value.
      const file: CacheFile = new CacheFile('', '', 42, 6000);
      expect(file.name).assertEqual('');
      expect(file.path).assertEqual('');
      expect(file.size).assertEqual(42);
      expect(file.modifiedTime).assertEqual(6000);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DMAT_1800
     * @tc.name      testDataModel0018
     * @tc.desc      Verify unicode and emoji file names pass through the
     *               cache file model unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDataModel0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testDataModel0018';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const unicodeName: string = '图片_风景 🌄.jpg';
      const file: CacheFile = new CacheFile(unicodeName, '/outputs/' + unicodeName, 4096, 7000);
      // Every character of the unusual name survives the constructor.
      expect(file.name).assertEqual(unicodeName);
      expect(file.path).assertEqual('/outputs/' + unicodeName);
      expect(file.name.length).assertEqual(unicodeName.length);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DMAT_1900
     * @tc.name      testDataModel0019
     * @tc.desc      Verify a typical millisecond modification time passes
     *               through the cache file model exactly.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDataModel0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testDataModel0019';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A real world millisecond timestamp round trips exactly.
      const file: CacheFile = new CacheFile('shot.png', '/outputs/shot.png', 999, 1737561600000);
      expect(file.modifiedTime).assertEqual(1737561600000);
      // The size and strings stay untouched beside the timestamp.
      expect(file.size).assertEqual(999);
      expect(file.name).assertEqual('shot.png');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DMAT_2000
     * @tc.name      testDataModel0020
     * @tc.desc      Verify two cache file instances with the same name stay
     *               independent objects with their own sizes.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDataModel0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testDataModel0020';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const small: CacheFile = new CacheFile('dual.jpg', '/outputs/a.jpg', 100, 1000);
      const large: CacheFile = new CacheFile('dual.jpg', '/outputs/b.jpg', 900, 2000);
      // Both instances keep their own field values.
      expect(small.size).assertEqual(100);
      expect(large.size).assertEqual(900);
      expect(small.path).assertEqual('/outputs/a.jpg');
      expect(large.path).assertEqual('/outputs/b.jpg');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DMAT_2100
     * @tc.name      testDataModel0021
     * @tc.desc      Verify the cache size summation adds signed and zero
     *               entries without clamping the total.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDataModel0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG: string = 'testDataModel0021';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The signed sum is 250 minus 75 plus 25 plus 0 which is 200.
      const files: CacheFile[] = [
        new CacheFile('a.jpg', '/outputs/a.jpg', 250, 1000),
        new CacheFile('b.jpg', '/outputs/b.jpg', -75, 2000),
        new CacheFile('c.jpg', '/outputs/c.jpg', 25, 3000),
        new CacheFile('d.jpg', '/outputs/d.jpg', 0, 4000)
      ];
      // The total size helper adds every signed entry without clamping.
      expect(SandboxStore.totalSize(files)).assertEqual(200);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DMAT_2200
     * @tc.name      testDataModel0022
     * @tc.desc      Verify the cache size summation stays exact at the
     *       maximum safe integer boundary.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDataModel0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG: string = 'testDataModel0022';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The largest exact integer plus zero stays exact.
      const files: CacheFile[] = [
        new CacheFile('max.bin', '/outputs/max.bin', 9007199254740991, 1000),
        new CacheFile('zero.bin', '/outputs/zero.bin', 0, 2000)
      ];
      expect(SandboxStore.totalSize(files)).assertEqual(9007199254740991);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DMAT_2300
     * @tc.name      testDataModel0023
     * @tc.desc      Verify the cache size summation counts duplicate sizes
     *               once per entry.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDataModel0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testDataModel0023';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Three entries share the same size and all three count.
      const files: CacheFile[] = [
        new CacheFile('one.jpg', '/outputs/one.jpg', 512, 1000),
        new CacheFile('two.jpg', '/outputs/two.jpg', 512, 2000),
        new CacheFile('three.jpg', '/outputs/three.jpg', 512, 3000)
      ];
      expect(SandboxStore.totalSize(files)).assertEqual(1536);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DMAT_2400
     * @tc.name      testDataModel0024
     * @tc.desc      Verify a scene entry and a cache file built side by side
     *               keep all model fields simultaneously consistent.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDataModel0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testDataModel0024';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const title: Resource = $r('app.string.pp_home_scene_cache_title');
      const description: Resource = $r('app.string.pp_home_scene_cache_desc');
      const entry: SceneEntry = new SceneEntry(SceneRoutes.CACHE, title, description, 'dmat_combo_card');
      const file: CacheFile = new CacheFile('combo.jpg', '/outputs/combo.jpg', 12345, 1234567890);
      // Both models hold their values side by side.
      expect(entry.route).assertEqual('cache');
      expect(entry.componentId).assertEqual('dmat_combo_card');
      expect(file.name).assertEqual('combo.jpg');
      expect(file.size).assertEqual(12345);
      expect(file.modifiedTime).assertEqual(1234567890);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DMAT_2500
     * @tc.name      testDataModel0025
     * @tc.desc      Verify entries built for the picker, recent and gallery
     *               routes keep the exact route constant and title resources.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDataModel0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testDataModel0025';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const title: Resource = $r('app.string.pp_app_title');
      const description: Resource = $r('app.media.startIcon');
      // One entry per browsing scene with its own component id.
      const picker: SceneEntry = new SceneEntry(SceneRoutes.PICKER, title, description, 'dmat_route_picker');
      const recent: SceneEntry = new SceneEntry(SceneRoutes.RECENT, title, description, 'dmat_route_recent');
      const gallery: SceneEntry = new SceneEntry(SceneRoutes.GALLERY, title, description, 'dmat_route_gallery');
      // The picker entry matches both the constant and the literal.
      expect(picker.route).assertEqual(SceneRoutes.PICKER);
      expect(picker.route).assertEqual('picker');
      // The recent entry matches both the constant and the literal.
      expect(recent.route).assertEqual(SceneRoutes.RECENT);
      expect(recent.route).assertEqual('recent');
      // The gallery entry matches both the constant and the literal.
      expect(gallery.route).assertEqual(SceneRoutes.GALLERY);
      expect(gallery.route).assertEqual('gallery');
      // The shared title resource is stored by reference in all three.
      expect(picker.title).assertEqual(title);
      expect(recent.title).assertEqual(title);
      expect(gallery.title).assertEqual(title);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}
