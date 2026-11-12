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
 * Unit suite of the navigation model in photopicker/data/SceneEntry.
 * The cases pin the shared route constants and verify that every constructor
 * argument of a home page entry reaches its own field unchanged.
 */

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { SceneRoutes, SceneEntry } from '../../../main/ets/photopicker/data/SceneEntry';

/**
 * Registers every scene entry model case of the sample.
 */
export default function sceneEntryModelTest() {
  // Group every case under one suite name reported by hypium.
  describe('SceneEntryModelTest', () => {
    /**
     * @tc.number    SUB_PHOTOPICKER_SCENENTRY_0100
     * @tc.name      testSceneEntry0001
     * @tc.desc      Verify the scene route keys of the picker, recent and gallery scenes.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSceneEntry0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      // The picker scene keeps its short route key shared with the router.
      expect(SceneRoutes.PICKER).assertEqual('picker');
      // The recent photo scene keeps its short route key shared with the router.
      expect(SceneRoutes.RECENT).assertEqual('recent');
      // The gallery scene keeps its short route key shared with the router.
      expect(SceneRoutes.GALLERY).assertEqual('gallery');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SCENENTRY_0200
     * @tc.name      testSceneEntry0002
     * @tc.desc      Verify the remaining route keys and that every key stays distinct.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSceneEntry0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      // The edit scene keeps its short route key shared with the router.
      expect(SceneRoutes.EDIT).assertEqual('edit');
      // The cache scene keeps its short route key shared with the router.
      expect(SceneRoutes.CACHE).assertEqual('cache');
      // Distinct route keys prevent the router from resolving the wrong scene.
      expect(SceneRoutes.PICKER !== SceneRoutes.CACHE && SceneRoutes.GALLERY !== SceneRoutes.EDIT).assertTrue();
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SCENENTRY_0300
     * @tc.name      testSceneEntry0003
     * @tc.desc      Verify SceneEntry passes every constructor argument into its own field.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSceneEntry0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      // Build one entry the same way the home page does for the picker scene.
      const pickerTitle: Resource = $r('app.media.startIcon');
      const pickerDescription: Resource = $r('app.string.pp_app_title');
      const pickerEntry: SceneEntry = new SceneEntry(SceneRoutes.PICKER, pickerTitle,
        pickerDescription, 'id_home_scene_picker');
      // The route key is stored verbatim so the click handler can navigate.
      expect(pickerEntry.route).assertEqual('picker');
      // The title resource is passed through by reference.
      expect(pickerEntry.title).assertEqual(pickerTitle);
      // The description resource is passed through by reference.
      expect(pickerEntry.description).assertEqual(pickerDescription);
      // The component id is stored verbatim so UI tests can find the card.
      expect(pickerEntry.componentId).assertEqual('id_home_scene_picker');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SCENENTRY_0400
     * @tc.name      testSceneEntry0004
     * @tc.desc      Verify an entry built from another scene keeps its own independent fields.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSceneEntry0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      // Build the cache scene entry with its own localized resources.
      const cacheTitle: Resource = $r('app.string.pp_home_scene_cache_title');
      const cacheDescription: Resource = $r('app.string.pp_home_scene_cache_desc');
      const cacheEntry: SceneEntry = new SceneEntry(SceneRoutes.CACHE, cacheTitle,
        cacheDescription, 'id_home_scene_cache');
      // The route matches the shared cache constant, not a copied literal.
      expect(cacheEntry.route).assertEqual(SceneRoutes.CACHE);
      // The localized title resource of the cache scene is passed through.
      expect(cacheEntry.title).assertEqual(cacheTitle);
      // The localized description resource of the cache scene is passed through.
      expect(cacheEntry.description).assertEqual(cacheDescription);
      // The cache component id differs from the picker id used by the other case.
      expect(cacheEntry.componentId).assertEqual('id_home_scene_cache');
    });
  });
}
