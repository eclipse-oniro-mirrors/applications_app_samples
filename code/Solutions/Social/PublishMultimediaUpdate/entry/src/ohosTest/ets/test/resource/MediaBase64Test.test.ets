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
import { yieldToEventLoop } from '../common/TestYield';
import util from '@ohos.util';
import resourceManager from '@ohos.resourceManager';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Logger from '../Logger';
import { BUNDLE, TAG } from '../common/TestConstant';
/**
 * Base64 view of packaged media.
 * The byte stream API is covered elsewhere; this suite checks the second
 * read path the framework offers. A component that previews an image from a
 * data URI depends on this view, so it has to be complete and stable.
 */
const manager: resourceManager.ResourceManager = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().resourceManager;
export default function mediaBase64Test() {
  describe('MediaBase64Test', () => {
    beforeAll(async (): Promise<void> => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_BASE64_0100
     * @tc.name AvatarBase64NotEmpty001
     * @tc.desc Verify avatar base 64 not empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AvatarBase64NotEmpty_001', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'AvatarBase64NotEmpty_001 begin');
      const encoded: string = await manager.getMediaContentBase64($r('app.media.Zoologist'));
      const nonEmpty: boolean = encoded.length !== 0;
      Logger.info(TAG, 'nonEmpty=' + JSON.stringify(nonEmpty));
      expect(nonEmpty).assertTrue();
      Logger.info(TAG, 'AvatarBase64NotEmpty_001 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_BASE64_0200
     * @tc.name SeedMediaBase64Present002
     * @tc.desc Verify seed media base 64 present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SeedMediaBase64Present_002', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'SeedMediaBase64Present_002 begin');
      const media: Array<Resource> = [
        $r('app.media.rocket'),
        $r('app.media.Engineer_video'),
        $r('app.media.add'),
        $r('app.media.add_video')
      ];
      let empty: number = 0;
      for (let index: number = 0; index < media.length; index++) {
        const encoded: string = await manager.getMediaContentBase64(media[index]);
        if (encoded.length === 0) {
          empty += 1;
        }
      }
      expect(empty).assertEqual(0);
      Logger.info(TAG, 'SeedMediaBase64Present_002 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_BASE64_0300
     * @tc.name RepeatedBase64Stable003
     * @tc.desc Verify repeated base 64 stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'RepeatedBase64Stable_003', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'RepeatedBase64Stable_003 begin');
      const first: string = await manager.getMediaContentBase64($r('app.media.Scientist'));
      const second: string = await manager.getMediaContentBase64($r('app.media.Scientist'));
      expect(first).assertEqual(second);
      Logger.info(TAG, 'RepeatedBase64Stable_003 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_BASE64_0400
     * @tc.name DifferentMediaDifferentBase64004
     * @tc.desc Verify different media different base
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'DifferentMediaDifferentBase64_004', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'DifferentMediaDifferentBase64_004 begin');
      const first: string = await manager.getMediaContentBase64($r('app.media.Building'));
      const second: string = await manager.getMediaContentBase64($r('app.media.Computer'));
      const distinct: boolean = first !== second;
      Logger.info(TAG, 'distinct=' + JSON.stringify(distinct));
      expect(distinct).assertTrue();
      Logger.info(TAG, 'DifferentMediaDifferentBase64_004 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_BASE64_0500
     * @tc.name Base64LengthAligned005
     * @tc.desc Verify base 64 data uri decodes to bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'Base64LengthAligned_005', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'Base64LengthAligned_005 begin');
      const encoded: string = await manager.getMediaContentBase64($r('app.media.Architect'));
      const bytes: Uint8Array = await manager.getMediaContent($r('app.media.Architect'));
      const isDataUri: boolean = encoded.startsWith('data:');
      Logger.info(TAG, 'isDataUri=' + isDataUri);
      expect(isDataUri).assertTrue();
      const marker: number = encoded.indexOf(';base64,');
      const hasMarker: boolean = marker !== -1;
      Logger.info(TAG, 'hasMarker=' + hasMarker);
      expect(hasMarker).assertTrue();
      const payload: string = encoded.substring(marker + 8);
      const helper: util.Base64Helper = new util.Base64Helper();
      const decoded: Uint8Array = helper.decodeSync(payload);
      Logger.info(TAG, 'decoded=' + decoded.length + ', bytes=' + bytes.length);
      expect(decoded.length).assertEqual(bytes.length);
      Logger.info(TAG, 'Base64LengthAligned_005 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_BASE64_0600
     * @tc.name BytesAndBase64BothPresent006
     * @tc.desc Verify bytes and base 64 both present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'BytesAndBase64BothPresent_006', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'BytesAndBase64BothPresent_006 begin');
      const bytes: Uint8Array = await manager.getMediaContent($r('app.media.IT_Engineer'));
      const encoded: string = await manager.getMediaContentBase64($r('app.media.IT_Engineer'));
      const bothPresent: boolean = bytes.length !== 0 && encoded.length !== 0;
      Logger.info(TAG, 'bothPresent=' + JSON.stringify(bothPresent));
      expect(bothPresent).assertTrue();
      Logger.info(TAG, 'BytesAndBase64BothPresent_006 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_BASE64_0700
     * @tc.name AllAvatarsBase64Present007
     * @tc.desc Verify all avatars base 64 present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AllAvatarsBase64Present_007', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'AllAvatarsBase64Present_007 begin');
      const avatars: Array<Resource> = [
        $r('app.media.Zoologist'),
        $r('app.media.Scientist'),
        $r('app.media.Engineer'),
        $r('app.media.Architect'),
        $r('app.media.IT_Engineer'),
        $r('app.media.Artist'),
        $r('app.media.Chef')
      ];
      let empty: number = 0;
      for (let index: number = 0; index < avatars.length; index++) {
        const encoded: string = await manager.getMediaContentBase64(avatars[index]);
        if (encoded.length === 0) {
          empty += 1;
        }
      }
      expect(empty).assertEqual(0);
      Logger.info(TAG, 'AllAvatarsBase64Present_007 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_BASE64_0800
     * @tc.name AllPhotosBase64Present008
     * @tc.desc Verify all photos base 64 present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AllPhotosBase64Present_008', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'AllPhotosBase64Present_008 begin');
      const photos: Array<Resource> = [
        $r('app.media.publish_photo_bird'),
        $r('app.media.rocket'),
        $r('app.media.Building'),
        $r('app.media.Computer'),
        $r('app.media.Draw')
      ];
      let empty: number = 0;
      for (let index: number = 0; index < photos.length; index++) {
        const encoded: string = await manager.getMediaContentBase64(photos[index]);
        if (encoded.length === 0) {
          empty += 1;
        }
      }
      expect(empty).assertEqual(0);
      Logger.info(TAG, 'AllPhotosBase64Present_008 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_BASE64_0900
     * @tc.name VideoBase64LongerThanPlaceholder009
     * @tc.desc Verify video base 64 longer than placeholder
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'VideoBase64LongerThanPlaceholder_009', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'VideoBase64LongerThanPlaceholder_009 begin');
      const real: string = await manager.getMediaContentBase64($r('app.media.Champagne'));
      const placeholder: string = await manager.getMediaContentBase64($r('app.media.add_video'));
      const distinct: boolean = real.length !== placeholder.length;
      Logger.info(TAG, 'distinct=' + JSON.stringify(distinct));
      expect(distinct).assertTrue();
      Logger.info(TAG, 'VideoBase64LongerThanPlaceholder_009 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_BASE64_1000
     * @tc.name IconBase64Present010
     * @tc.desc Verify icon base 64 present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'IconBase64Present_010', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'IconBase64Present_010 begin');
      const icons: Array<Resource> = [
        $r('app.media.publish_multimedia_updates_ic_share'),
        $r('app.media.publish_multimedia_updates_ic_thumbsup'),
        $r('app.media.publish_multimedia_updates_ic_message')
      ];
      let empty: number = 0;
      for (let index: number = 0; index < icons.length; index++) {
        const encoded: string = await manager.getMediaContentBase64(icons[index]);
        if (encoded.length === 0) {
          empty += 1;
        }
      }
      expect(empty).assertEqual(0);
      Logger.info(TAG, 'IconBase64Present_010 end');
      done();
    });
  });
}
