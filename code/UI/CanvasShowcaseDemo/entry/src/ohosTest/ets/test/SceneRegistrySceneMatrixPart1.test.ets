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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { delayTick } from './shared/AsyncYield';
import { SceneRegistry } from '../../../main/ets/model/utils/SceneRegistry';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF817;
const TAG: string = '[Sample_Canvas]';

export default function SceneRegistrySceneMatrixPart1Test(): void {
  describe('SceneRegistrySceneMatrixPart1', () => {

    /**
     * @tc.number    SUB_CANVAS_SRSP1_0100
     * @tc.name      testSceneMetadata0001
     * @tc.desc      Verify scene 1 exposes complete metadata.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSceneMetadata0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSceneMetadata0001 begin');
      await delayTick();
      const scene = SceneRegistry.getById(1);
      expect(scene !== null).assertTrue();
      if (scene !== null) {
        expect(scene.id).assertEqual(1);
        expect(scene.button.length > 0).assertTrue();
        expect(scene.title.length > 0).assertTrue();
        expect(scene.buttonRes !== undefined).assertTrue();
        expect(scene.titleRes !== undefined).assertTrue();
        expect(scene.draw !== undefined).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSceneMetadata0001 end');
    })

    /**
     * @tc.number    SUB_CANVAS_SRSP1_0200
     * @tc.name      testSceneMetadata0002
     * @tc.desc      Verify scene 2 exposes complete metadata.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSceneMetadata0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSceneMetadata0002 begin');
      await delayTick();
      const scene = SceneRegistry.getById(2);
      expect(scene !== null).assertTrue();
      if (scene !== null) {
        expect(scene.id).assertEqual(2);
        expect(scene.button.length > 0).assertTrue();
        expect(scene.title.length > 0).assertTrue();
        expect(scene.buttonRes !== undefined).assertTrue();
        expect(scene.titleRes !== undefined).assertTrue();
        expect(scene.draw !== undefined).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSceneMetadata0002 end');
    })

    /**
     * @tc.number    SUB_CANVAS_SRSP1_0300
     * @tc.name      testSceneMetadata0003
     * @tc.desc      Verify scene 3 exposes complete metadata.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSceneMetadata0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSceneMetadata0003 begin');
      await delayTick();
      const scene = SceneRegistry.getById(3);
      expect(scene !== null).assertTrue();
      if (scene !== null) {
        expect(scene.id).assertEqual(3);
        expect(scene.button.length > 0).assertTrue();
        expect(scene.title.length > 0).assertTrue();
        expect(scene.buttonRes !== undefined).assertTrue();
        expect(scene.titleRes !== undefined).assertTrue();
        expect(scene.draw !== undefined).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSceneMetadata0003 end');
    })

    /**
     * @tc.number    SUB_CANVAS_SRSP1_0400
     * @tc.name      testSceneMetadata0004
     * @tc.desc      Verify scene 4 exposes complete metadata.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSceneMetadata0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSceneMetadata0004 begin');
      await delayTick();
      const scene = SceneRegistry.getById(4);
      expect(scene !== null).assertTrue();
      if (scene !== null) {
        expect(scene.id).assertEqual(4);
        expect(scene.button.length > 0).assertTrue();
        expect(scene.title.length > 0).assertTrue();
        expect(scene.buttonRes !== undefined).assertTrue();
        expect(scene.titleRes !== undefined).assertTrue();
        expect(scene.draw !== undefined).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSceneMetadata0004 end');
    })

    /**
     * @tc.number    SUB_CANVAS_SRSP1_0500
     * @tc.name      testSceneMetadata0005
     * @tc.desc      Verify scene 5 exposes complete metadata.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSceneMetadata0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSceneMetadata0005 begin');
      await delayTick();
      const scene = SceneRegistry.getById(5);
      expect(scene !== null).assertTrue();
      if (scene !== null) {
        expect(scene.id).assertEqual(5);
        expect(scene.button.length > 0).assertTrue();
        expect(scene.title.length > 0).assertTrue();
        expect(scene.buttonRes !== undefined).assertTrue();
        expect(scene.titleRes !== undefined).assertTrue();
        expect(scene.draw !== undefined).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSceneMetadata0005 end');
    })

    /**
     * @tc.number    SUB_CANVAS_SRSP1_0600
     * @tc.name      testSceneMetadata0006
     * @tc.desc      Verify scene 6 exposes complete metadata.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSceneMetadata0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSceneMetadata0006 begin');
      await delayTick();
      const scene = SceneRegistry.getById(6);
      expect(scene !== null).assertTrue();
      if (scene !== null) {
        expect(scene.id).assertEqual(6);
        expect(scene.button.length > 0).assertTrue();
        expect(scene.title.length > 0).assertTrue();
        expect(scene.buttonRes !== undefined).assertTrue();
        expect(scene.titleRes !== undefined).assertTrue();
        expect(scene.draw !== undefined).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSceneMetadata0006 end');
    })

    /**
     * @tc.number    SUB_CANVAS_SRSP1_0700
     * @tc.name      testSceneMetadata0007
     * @tc.desc      Verify scene 7 exposes complete metadata.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSceneMetadata0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSceneMetadata0007 begin');
      await delayTick();
      const scene = SceneRegistry.getById(7);
      expect(scene !== null).assertTrue();
      if (scene !== null) {
        expect(scene.id).assertEqual(7);
        expect(scene.button.length > 0).assertTrue();
        expect(scene.title.length > 0).assertTrue();
        expect(scene.buttonRes !== undefined).assertTrue();
        expect(scene.titleRes !== undefined).assertTrue();
        expect(scene.draw !== undefined).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSceneMetadata0007 end');
    })

    /**
     * @tc.number    SUB_CANVAS_SRSP1_0800
     * @tc.name      testSceneMetadata0008
     * @tc.desc      Verify scene 8 exposes complete metadata.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSceneMetadata0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSceneMetadata0008 begin');
      await delayTick();
      const scene = SceneRegistry.getById(8);
      expect(scene !== null).assertTrue();
      if (scene !== null) {
        expect(scene.id).assertEqual(8);
        expect(scene.button.length > 0).assertTrue();
        expect(scene.title.length > 0).assertTrue();
        expect(scene.buttonRes !== undefined).assertTrue();
        expect(scene.titleRes !== undefined).assertTrue();
        expect(scene.draw !== undefined).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSceneMetadata0008 end');
    })

    /**
     * @tc.number    SUB_CANVAS_SRSP1_0900
     * @tc.name      testSceneMetadata0009
     * @tc.desc      Verify scene 9 exposes complete metadata.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSceneMetadata0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSceneMetadata0009 begin');
      await delayTick();
      const scene = SceneRegistry.getById(9);
      expect(scene !== null).assertTrue();
      if (scene !== null) {
        expect(scene.id).assertEqual(9);
        expect(scene.button.length > 0).assertTrue();
        expect(scene.title.length > 0).assertTrue();
        expect(scene.buttonRes !== undefined).assertTrue();
        expect(scene.titleRes !== undefined).assertTrue();
        expect(scene.draw !== undefined).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSceneMetadata0009 end');
    })

    /**
     * @tc.number    SUB_CANVAS_SRSP1_1000
     * @tc.name      testSceneMetadata0010
     * @tc.desc      Verify scene 10 exposes complete metadata.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSceneMetadata0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSceneMetadata0010 begin');
      await delayTick();
      const scene = SceneRegistry.getById(10);
      expect(scene !== null).assertTrue();
      if (scene !== null) {
        expect(scene.id).assertEqual(10);
        expect(scene.button.length > 0).assertTrue();
        expect(scene.title.length > 0).assertTrue();
        expect(scene.buttonRes !== undefined).assertTrue();
        expect(scene.titleRes !== undefined).assertTrue();
        expect(scene.draw !== undefined).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSceneMetadata0010 end');
    })

    /**
     * @tc.number    SUB_CANVAS_SRSP1_1100
     * @tc.name      testSceneMetadata0011
     * @tc.desc      Verify scene 11 exposes complete metadata.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSceneMetadata0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSceneMetadata0011 begin');
      await delayTick();
      const scene = SceneRegistry.getById(11);
      expect(scene !== null).assertTrue();
      if (scene !== null) {
        expect(scene.id).assertEqual(11);
        expect(scene.button.length > 0).assertTrue();
        expect(scene.title.length > 0).assertTrue();
        expect(scene.buttonRes !== undefined).assertTrue();
        expect(scene.titleRes !== undefined).assertTrue();
        expect(scene.draw !== undefined).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSceneMetadata0011 end');
    })

    /**
     * @tc.number    SUB_CANVAS_SRSP1_1200
     * @tc.name      testSceneMetadata0012
     * @tc.desc      Verify scene 12 exposes complete metadata.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSceneMetadata0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSceneMetadata0012 begin');
      await delayTick();
      const scene = SceneRegistry.getById(12);
      expect(scene !== null).assertTrue();
      if (scene !== null) {
        expect(scene.id).assertEqual(12);
        expect(scene.button.length > 0).assertTrue();
        expect(scene.title.length > 0).assertTrue();
        expect(scene.buttonRes !== undefined).assertTrue();
        expect(scene.titleRes !== undefined).assertTrue();
        expect(scene.draw !== undefined).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSceneMetadata0012 end');
    })

    /**
     * @tc.number    SUB_CANVAS_SRSP1_1300
     * @tc.name      testSceneMetadata0013
     * @tc.desc      Verify scene 13 exposes complete metadata.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSceneMetadata0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSceneMetadata0013 begin');
      await delayTick();
      const scene = SceneRegistry.getById(13);
      expect(scene !== null).assertTrue();
      if (scene !== null) {
        expect(scene.id).assertEqual(13);
        expect(scene.button.length > 0).assertTrue();
        expect(scene.title.length > 0).assertTrue();
        expect(scene.buttonRes !== undefined).assertTrue();
        expect(scene.titleRes !== undefined).assertTrue();
        expect(scene.draw !== undefined).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSceneMetadata0013 end');
    })

    /**
     * @tc.number    SUB_CANVAS_SRSP1_1400
     * @tc.name      testSceneMetadata0014
     * @tc.desc      Verify scene 14 exposes complete metadata.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSceneMetadata0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSceneMetadata0014 begin');
      await delayTick();
      const scene = SceneRegistry.getById(14);
      expect(scene !== null).assertTrue();
      if (scene !== null) {
        expect(scene.id).assertEqual(14);
        expect(scene.button.length > 0).assertTrue();
        expect(scene.title.length > 0).assertTrue();
        expect(scene.buttonRes !== undefined).assertTrue();
        expect(scene.titleRes !== undefined).assertTrue();
        expect(scene.draw !== undefined).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSceneMetadata0014 end');
    })

    /**
     * @tc.number    SUB_CANVAS_SRSP1_1500
     * @tc.name      testSceneMetadata0015
     * @tc.desc      Verify scene 15 exposes complete metadata.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSceneMetadata0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSceneMetadata0015 begin');
      await delayTick();
      const scene = SceneRegistry.getById(15);
      expect(scene !== null).assertTrue();
      if (scene !== null) {
        expect(scene.id).assertEqual(15);
        expect(scene.button.length > 0).assertTrue();
        expect(scene.title.length > 0).assertTrue();
        expect(scene.buttonRes !== undefined).assertTrue();
        expect(scene.titleRes !== undefined).assertTrue();
        expect(scene.draw !== undefined).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSceneMetadata0015 end');
    })

    /**
     * @tc.number    SUB_CANVAS_SRSP1_1600
     * @tc.name      testSceneMetadata0016
     * @tc.desc      Verify scene 16 exposes complete metadata.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSceneMetadata0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSceneMetadata0016 begin');
      await delayTick();
      const scene = SceneRegistry.getById(16);
      expect(scene !== null).assertTrue();
      if (scene !== null) {
        expect(scene.id).assertEqual(16);
        expect(scene.button.length > 0).assertTrue();
        expect(scene.title.length > 0).assertTrue();
        expect(scene.buttonRes !== undefined).assertTrue();
        expect(scene.titleRes !== undefined).assertTrue();
        expect(scene.draw !== undefined).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSceneMetadata0016 end');
    })

    /**
     * @tc.number    SUB_CANVAS_SRSP1_1700
     * @tc.name      testSceneMetadata0017
     * @tc.desc      Verify scene 17 exposes complete metadata.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSceneMetadata0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSceneMetadata0017 begin');
      await delayTick();
      const scene = SceneRegistry.getById(17);
      expect(scene !== null).assertTrue();
      if (scene !== null) {
        expect(scene.id).assertEqual(17);
        expect(scene.button.length > 0).assertTrue();
        expect(scene.title.length > 0).assertTrue();
        expect(scene.buttonRes !== undefined).assertTrue();
        expect(scene.titleRes !== undefined).assertTrue();
        expect(scene.draw !== undefined).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSceneMetadata0017 end');
    })

    /**
     * @tc.number    SUB_CANVAS_SRSP1_1800
     * @tc.name      testSceneMetadata0018
     * @tc.desc      Verify scene 18 exposes complete metadata.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSceneMetadata0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSceneMetadata0018 begin');
      await delayTick();
      const scene = SceneRegistry.getById(18);
      expect(scene !== null).assertTrue();
      if (scene !== null) {
        expect(scene.id).assertEqual(18);
        expect(scene.button.length > 0).assertTrue();
        expect(scene.title.length > 0).assertTrue();
        expect(scene.buttonRes !== undefined).assertTrue();
        expect(scene.titleRes !== undefined).assertTrue();
        expect(scene.draw !== undefined).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSceneMetadata0018 end');
    })

    /**
     * @tc.number    SUB_CANVAS_SRSP1_1900
     * @tc.name      testSceneMetadata0019
     * @tc.desc      Verify scene 19 exposes complete metadata.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSceneMetadata0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSceneMetadata0019 begin');
      await delayTick();
      const scene = SceneRegistry.getById(19);
      expect(scene !== null).assertTrue();
      if (scene !== null) {
        expect(scene.id).assertEqual(19);
        expect(scene.button.length > 0).assertTrue();
        expect(scene.title.length > 0).assertTrue();
        expect(scene.buttonRes !== undefined).assertTrue();
        expect(scene.titleRes !== undefined).assertTrue();
        expect(scene.draw !== undefined).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSceneMetadata0019 end');
    })

    /**
     * @tc.number    SUB_CANVAS_SRSP1_2000
     * @tc.name      testSceneMetadata0020
     * @tc.desc      Verify scene 20 exposes complete metadata.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSceneMetadata0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSceneMetadata0020 begin');
      await delayTick();
      const scene = SceneRegistry.getById(20);
      expect(scene !== null).assertTrue();
      if (scene !== null) {
        expect(scene.id).assertEqual(20);
        expect(scene.button.length > 0).assertTrue();
        expect(scene.title.length > 0).assertTrue();
        expect(scene.buttonRes !== undefined).assertTrue();
        expect(scene.titleRes !== undefined).assertTrue();
        expect(scene.draw !== undefined).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSceneMetadata0020 end');
    })

    /**
     * @tc.number    SUB_CANVAS_SRSP1_2100
     * @tc.name      testSceneMetadata0021
     * @tc.desc      Verify scene 21 exposes complete metadata.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSceneMetadata0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSceneMetadata0021 begin');
      await delayTick();
      const scene = SceneRegistry.getById(21);
      expect(scene !== null).assertTrue();
      if (scene !== null) {
        expect(scene.id).assertEqual(21);
        expect(scene.button.length > 0).assertTrue();
        expect(scene.title.length > 0).assertTrue();
        expect(scene.buttonRes !== undefined).assertTrue();
        expect(scene.titleRes !== undefined).assertTrue();
        expect(scene.draw !== undefined).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSceneMetadata0021 end');
    })

    /**
     * @tc.number    SUB_CANVAS_SRSP1_2200
     * @tc.name      testSceneMetadata0022
     * @tc.desc      Verify scene 22 exposes complete metadata.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSceneMetadata0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSceneMetadata0022 begin');
      await delayTick();
      const scene = SceneRegistry.getById(22);
      expect(scene !== null).assertTrue();
      if (scene !== null) {
        expect(scene.id).assertEqual(22);
        expect(scene.button.length > 0).assertTrue();
        expect(scene.title.length > 0).assertTrue();
        expect(scene.buttonRes !== undefined).assertTrue();
        expect(scene.titleRes !== undefined).assertTrue();
        expect(scene.draw !== undefined).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSceneMetadata0022 end');
    })

    /**
     * @tc.number    SUB_CANVAS_SRSP1_2300
     * @tc.name      testSceneMetadata0023
     * @tc.desc      Verify scene 23 exposes complete metadata.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSceneMetadata0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSceneMetadata0023 begin');
      await delayTick();
      const scene = SceneRegistry.getById(23);
      expect(scene !== null).assertTrue();
      if (scene !== null) {
        expect(scene.id).assertEqual(23);
        expect(scene.button.length > 0).assertTrue();
        expect(scene.title.length > 0).assertTrue();
        expect(scene.buttonRes !== undefined).assertTrue();
        expect(scene.titleRes !== undefined).assertTrue();
        expect(scene.draw !== undefined).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSceneMetadata0023 end');
    })

  })
}
