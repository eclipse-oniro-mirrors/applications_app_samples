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

import { describe, it, expect, beforeAll } from '@ohos/hypium';
import resourceManager from '@ohos.resourceManager';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Logger from '../Logger';
import { BUNDLE, TAG } from '../common/TestConstant';
import { yieldToEventLoop } from '../common/TestYield';
/**
 * Media reads at an explicit density.
 * The manager exposes an overload that decodes an image for a requested screen
 * density. The module ships a single density bucket, so every request has to
 * fall back to that bucket instead of failing. The cases read the same images
 * at low, medium and high densities and confirm the fallback stays usable.
 */
const manager: resourceManager.ResourceManager = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().resourceManager;
const LOW_DENSITY: number = 120;
const MEDIUM_DENSITY: number = 320;
const HIGH_DENSITY: number = 480;
export default function mediaDensityVariantTest() {
  describe('MediaDensityVariantTest', () => {
    beforeAll(async (): Promise<void> => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_DENSITY_0100
     * @tc.name AvatarAtLowDensity001
     * @tc.desc Verify avatar at low density
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AvatarAtLowDensity_001', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'AvatarAtLowDensity_001 begin');
      const bytes: Uint8Array = await manager.getMediaContent($r('app.media.Zoologist'), LOW_DENSITY);
      const nonEmpty: boolean = bytes.length !== 0;
      Logger.info(TAG, 'nonEmpty=' + JSON.stringify(nonEmpty));
      expect(nonEmpty).assertTrue();
      Logger.info(TAG, 'AvatarAtLowDensity_001 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_DENSITY_0200
     * @tc.name AvatarAtHighDensity002
     * @tc.desc Verify avatar at high density
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AvatarAtHighDensity_002', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'AvatarAtHighDensity_002 begin');
      const bytes: Uint8Array = await manager.getMediaContent($r('app.media.Scientist'), HIGH_DENSITY);
      const nonEmpty: boolean = bytes.length !== 0;
      Logger.info(TAG, 'nonEmpty=' + JSON.stringify(nonEmpty));
      expect(nonEmpty).assertTrue();
      Logger.info(TAG, 'AvatarAtHighDensity_002 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_DENSITY_0300
     * @tc.name SameDensityStable003
     * @tc.desc Verify same density stable
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SameDensityStable_003', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'SameDensityStable_003 begin');
      const first: Uint8Array = await manager.getMediaContent($r('app.media.Architect'), MEDIUM_DENSITY);
      const second: Uint8Array = await manager.getMediaContent($r('app.media.Architect'), MEDIUM_DENSITY);
      expect(first.length).assertEqual(second.length);
      Logger.info(TAG, 'SameDensityStable_003 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_DENSITY_0400
     * @tc.name AllDensitiesReadable004
     * @tc.desc Verify all densities readable
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AllDensitiesReadable_004', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'AllDensitiesReadable_004 begin');
      const densities: Array<number> = [LOW_DENSITY, MEDIUM_DENSITY, HIGH_DENSITY];
      let empty: number = 0;
      for (let index: number = 0; index < densities.length; index++) {
        const bytes: Uint8Array = await manager.getMediaContent($r('app.media.Chef'), densities[index]);
        if (bytes.length === 0) {
          empty += 1;
        }
      }
      expect(empty).assertEqual(0);
      Logger.info(TAG, 'AllDensitiesReadable_004 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_DENSITY_0500
     * @tc.name PlaceholderAtDensity005
     * @tc.desc Verify placeholder at density
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'PlaceholderAtDensity_005', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'PlaceholderAtDensity_005 begin');
      const bytes: Uint8Array = await manager.getMediaContent($r('app.media.add'), MEDIUM_DENSITY);
      const nonEmpty: boolean = bytes.length !== 0;
      Logger.info(TAG, 'nonEmpty=' + JSON.stringify(nonEmpty));
      expect(nonEmpty).assertTrue();
      Logger.info(TAG, 'PlaceholderAtDensity_005 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_DENSITY_0600
     * @tc.name DefaultReadAfterDensity006
     * @tc.desc Verify default read after density
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'DefaultReadAfterDensity_006', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'DefaultReadAfterDensity_006 begin');
      await manager.getMediaContent($r('app.media.Artist'), HIGH_DENSITY);
      const bytes: Uint8Array = await manager.getMediaContent($r('app.media.Artist'));
      const nonEmpty: boolean = bytes.length !== 0;
      Logger.info(TAG, 'nonEmpty=' + JSON.stringify(nonEmpty));
      expect(nonEmpty).assertTrue();
      Logger.info(TAG, 'DefaultReadAfterDensity_006 end');
      done();
    });
  });
}
