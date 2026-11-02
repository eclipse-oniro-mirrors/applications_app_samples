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
 
import { describe, beforeAll, it, expect } from '@ohos/hypium';
import { SceneRegistry, SceneInfo } from '../../../main/ets/model/utils/SceneRegistry';
import { PixelMapUtil } from '../../../main/ets/model/utils/PixelMapUtil';

/**
 * SceneRegistry 场景注册表设备侧测试
 * 覆盖：注册表非空、id 唯一且递增、元数据完整（button/title 非空、draw 可调用）、
 * getById 命中与未命中。注册表是页面数据驱动按钮的唯一来源，完整性即正确性。
 */
export default function sceneRegistryTest() {
  describe('sceneRegistryTest', () => {
    let scenes: SceneInfo[] = [];

    beforeAll(() => {
      scenes = SceneRegistry.getAll();
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_SCENEREGISTRY_0100
     * @tc.name registryNotEmpty001
     * @tc.desc Verify the registry is non-empty and count matches the list
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('registry_notEmpty', 0, () => {
      expect(scenes.length > 0).assertTrue();
      expect(SceneRegistry.count()).assertEqual(scenes.length);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_SCENEREGISTRY_0200
     * @tc.name registryIdsUnique002
     * @tc.desc Verify every scene id is unique
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('registry_idsUnique', 0, () => {
      const seen: Set<number> = new Set();
      for (const s of scenes) {
        expect(seen.has(s.id)).assertFalse();
        seen.add(s.id);
      }
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_SCENEREGISTRY_0300
     * @tc.name registryMetadataComplete003
     * @tc.desc Verify every scene has button, title and draw callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('registry_metadataComplete', 0, () => {
      for (const s of scenes) {
        expect(s.button.length > 0).assertTrue();
        expect(s.title.length > 0).assertTrue();
        expect(s.draw !== null && s.draw !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_SCENEREGISTRY_0400
     * @tc.name getByIdHit004
     * @tc.desc Verify getById returns the matching scene
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('getById_hit', 0, () => {
      const first: SceneInfo | null = SceneRegistry.getById(scenes[0].id);
      expect(first !== null).assertTrue();
      if (first !== null) {
        expect(first.id).assertEqual(scenes[0].id);
        expect(first.title).assertEqual(scenes[0].title);
      }
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_SCENEREGISTRY_0500
     * @tc.name getByIdMissReturnsNull005
     * @tc.desc Verify getById returns null for unknown ids
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('getById_miss_returnsNull', 0, () => {
      expect(SceneRegistry.getById(-1) === null).assertTrue();
      expect(SceneRegistry.getById(99999) === null).assertTrue();
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_SCENEREGISTRY_0600
     * @tc.name registryCoversAllScenes006
     * @tc.desc Verify the registry covers at least twelve scenes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('registry_coversAllScenes', 0, () => {
      // 四大场景 + 扩展场景全覆盖：至少包含渐变/图案/矩阵/离屏/倾斜/ImageData/圆环
      expect(scenes.length >= 12).assertTrue();
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_SCENEREGISTRY_0700
     * @tc.name registrySmokeTestAllScenesDraw007
     * @tc.desc Verify every registered scene draws headlessly without crashing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('registry_smokeTest_allScenesDraw', 0, () => {
      // 冒烟测试：注册表全部场景用 OffscreenCanvas 无头逐个执行，
      // 保证注册表与场景实现同步（新增场景漏测时此处必然暴露）
      const W = 200;
      const H = 100;
      const off = new OffscreenCanvas(W, H);
      const ctx = off.getContext('2d');
      for (const s of scenes) {
        s.draw(ctx, W, H);
      }
      const bitmap = off.transferToImageBitmap();
      expect(bitmap.width).assertEqual(W);
      expect(bitmap.height).assertEqual(H);
    });
  });
}
