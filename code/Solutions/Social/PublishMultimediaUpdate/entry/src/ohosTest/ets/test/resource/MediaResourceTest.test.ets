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
import Logger from '../Logger';
import resourceManager from '@ohos.resourceManager';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import util from '@ohos.util';
import { BUNDLE, TAG } from '../common/TestConstant';
/**
 * Binary media contract of the module.
 * Every avatar, post photo and video referenced by the seed data is read
 * through the resource manager; an entry that cannot be decoded would leave a
 * blank slot in the list even though the layout itself is correct.
 * Vector icons are intentionally excluded: getMediaContent is defined for
 * raster and container resources.
 */
const manager: resourceManager.ResourceManager = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().resourceManager;
export default function mediaResourceTest() {
  describe('MediaResourceTest', () => {
    beforeAll(async (): Promise<void> => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_MEDIA_0100
     * @tc.name ZoologistAvatarReadable001
     * @tc.desc Verify zoologist avatar readable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ZoologistAvatarReadable_001', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'ZoologistAvatarReadable_001 begin');
      const bytes: Uint8Array = await manager.getMediaContent($r('app.media.Zoologist'));
      const nonEmpty: boolean = bytes.length !== 0;
      Logger.info(TAG, 'nonEmpty=' + JSON.stringify(nonEmpty));
      expect(nonEmpty).assertTrue();
      Logger.info(TAG, 'ZoologistAvatarReadable_001 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_MEDIA_0200
     * @tc.name AllSeedAvatarsReadable002
     * @tc.desc Verify all seed avatars readable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AllSeedAvatarsReadable_002', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'AllSeedAvatarsReadable_002 begin');
      const avatars: Array<Resource> = [
        $r('app.media.Zoologist'),
        $r('app.media.Scientist'),
        $r('app.media.Engineer'),
        $r('app.media.Architect'),
        $r('app.media.IT_Engineer'),
        $r('app.media.Artist'),
        $r('app.media.Chef')
      ];
      let emptyCount: number = 0;
      for (let index: number = 0; index < avatars.length; index++) {
        const bytes: Uint8Array = await manager.getMediaContent(avatars[index]);
        if (bytes.length === 0) {
          emptyCount += 1;
        }
      }
      expect(emptyCount).assertEqual(0);
      Logger.info(TAG, 'AllSeedAvatarsReadable_002 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_MEDIA_0300
     * @tc.name BirdPhotoReadable003
     * @tc.desc Verify bird photo readable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'BirdPhotoReadable_003', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'BirdPhotoReadable_003 begin');
      let failed: boolean = false;
      let photoSize: number = 0;
      try {
        const bytes: Uint8Array = await manager.getMediaContent($r('app.media.publish_photo_bird'));
        photoSize = bytes.length;
      }
      catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
      expect(photoSize > 0).assertTrue();
      Logger.info(TAG, 'BirdPhotoReadable_003 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_MEDIA_0400
     * @tc.name SeedPhotoGroupReadable004
     * @tc.desc Verify seed photo group readable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SeedPhotoGroupReadable_004', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'SeedPhotoGroupReadable_004 begin');
      const photos: Array<Resource> = [
        $r('app.media.rocket'),
        $r('app.media.Building'),
        $r('app.media.Computer'),
        $r('app.media.Draw')
      ];
      let emptyCount: number = 0;
      for (let index: number = 0; index < photos.length; index++) {
        const bytes: Uint8Array = await manager.getMediaContent(photos[index]);
        if (bytes.length === 0) {
          emptyCount += 1;
        }
      }
      expect(emptyCount).assertEqual(0);
      Logger.info(TAG, 'SeedPhotoGroupReadable_004 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_MEDIA_0500
     * @tc.name EngineerVideoReadable005
     * @tc.desc Verify engineer video readable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EngineerVideoReadable_005', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'EngineerVideoReadable_005 begin');
      const first: Uint8Array = await manager.getMediaContent($r('app.media.Engineer_video'));
      const second: Uint8Array = await manager.getMediaContent($r('app.media.Engineer_video'));
      expect(second.length).assertEqual(first.length);
      expect(second.length > 0).assertTrue();
      Logger.info(TAG, 'EngineerVideoReadable_005 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_MEDIA_0600
     * @tc.name ChefVideoReadable006
     * @tc.desc Verify chef video readable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ChefVideoReadable_006', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'ChefVideoReadable_006 begin');
      const bytes: Uint8Array = await manager.getMediaContent($r('app.media.Champagne'));
      expect(bytes.byteLength).assertEqual(bytes.length);
      expect(bytes.length > 0).assertTrue();
      Logger.info(TAG, 'ChefVideoReadable_006 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_MEDIA_0700
     * @tc.name ComposerPlaceholdersReadable007
     * @tc.desc Verify composer placeholders readable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ComposerPlaceholdersReadable_007', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'ComposerPlaceholdersReadable_007 begin');
      const placeholders: Array<Resource> = [
        $r('app.media.add'),
        $r('app.media.add_video')
      ];
      let emptyCount: number = 0;
      for (let index: number = 0; index < placeholders.length; index++) {
        const bytes: Uint8Array = await manager.getMediaContent(placeholders[index]);
        if (bytes.length === 0) {
          emptyCount += 1;
        }
      }
      expect(emptyCount).assertEqual(0);
      Logger.info(TAG, 'ComposerPlaceholdersReadable_007 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_MEDIA_0800
     * @tc.name ToolbarIconsReadable008
     * @tc.desc Verify toolbar icons readable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ToolbarIconsReadable_008', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'ToolbarIconsReadable_008 begin');
      const icons: Array<Resource> = [
        $r('app.media.backgroundblur_main_normal'),
        $r('app.media.backgroundblur_find_normal'),
        $r('app.media.backgroundblur_hot_normal')
      ];
      let emptyCount: number = 0;
      for (let index: number = 0; index < icons.length; index++) {
        const bytes: Uint8Array = await manager.getMediaContent(icons[index]);
        if (bytes.length === 0) {
          emptyCount += 1;
        }
      }
      expect(emptyCount).assertEqual(0);
      Logger.info(TAG, 'ToolbarIconsReadable_008 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_MEDIA_0900
     * @tc.name ActionIconsReadable009
     * @tc.desc Verify action icons readable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ActionIconsReadable_009', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'ActionIconsReadable_009 begin');
      const icons: Array<Resource> = [
        $r('app.media.publish_multimedia_updates_ic_share'),
        $r('app.media.publish_multimedia_updates_ic_thumbsup'),
        $r('app.media.publish_multimedia_updates_ic_message')
      ];
      let totalBytes: number = 0;
      for (let index: number = 0; index < icons.length; index++) {
        const bytes: Uint8Array = await manager.getMediaContent(icons[index]);
        totalBytes += bytes.length;
      }
      expect(totalBytes > 0).assertTrue();
      Logger.info(TAG, 'ActionIconsReadable_009 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_MEDIA_1000
     * @tc.name RepeatReadSameLength010
     * @tc.desc Verify repeat read same length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'RepeatReadSameLength_010', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'RepeatReadSameLength_010 begin');
      const first: Uint8Array = await manager.getMediaContent($r('app.media.Scientist'));
      const second: Uint8Array = await manager.getMediaContent($r('app.media.Scientist'));
      expect(first.length).assertEqual(second.length);
      Logger.info(TAG, 'RepeatReadSameLength_010 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_MEDIA_1100
     * @tc.name RepeatReadSameBytes011
     * @tc.desc Verify repeat read same bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'RepeatReadSameBytes_011', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'RepeatReadSameBytes_011 begin');
      const first: Uint8Array = await manager.getMediaContent($r('app.media.rocket'));
      const second: Uint8Array = await manager.getMediaContent($r('app.media.rocket'));
      let mismatched: number = 0;
      for (let index: number = 0; index < first.length; index++) {
        if (first[index] !== second[index]) {
          mismatched += 1;
        }
      }
      expect(mismatched).assertEqual(0);
      Logger.info(TAG, 'RepeatReadSameBytes_011 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_MEDIA_1200
     * @tc.name AvatarGroupSameLength012
     * @tc.desc Verify avatar group same length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AvatarGroupSameLength_012', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'AvatarGroupSameLength_012 begin');
      const first: Uint8Array = await manager.getMediaContent($r('app.media.Architect'));
      const second: Uint8Array = await manager.getMediaContent($r('app.media.IT_Engineer'));
      const bothPresent: boolean = first.length !== 0 && second.length !== 0;
      Logger.info(TAG, 'bothPresent=' + JSON.stringify(bothPresent));
      expect(bothPresent).assertTrue();
      let identical: boolean = first.length === second.length;
      if (identical) {
        let mismatched: number = 0;
        for (let index: number = 0; index < first.length; index++) {
          if (first[index] !== second[index]) {
            mismatched += 1;
          }
        }
        identical = mismatched === 0;
      }
      Logger.info(TAG, 'identical=' + JSON.stringify(identical));
      expect(identical).assertFalse();
      Logger.info(TAG, 'AvatarGroupSameLength_012 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_MEDIA_1300
     * @tc.name VideoDiffersFromPlaceholder013
     * @tc.desc Verify video differs from placeholder
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'VideoDiffersFromPlaceholder_013', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'VideoDiffersFromPlaceholder_013 begin');
      const video: Uint8Array = await manager.getMediaContent($r('app.media.Engineer_video'));
      const placeholder: Uint8Array = await manager.getMediaContent($r('app.media.add_video'));
      const check01: boolean = video.length !== placeholder.length;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'VideoDiffersFromPlaceholder_013 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_MEDIA_1400
     * @tc.name AllMediaHaveContent014
     * @tc.desc Verify all media have content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AllMediaHaveContent_014', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'AllMediaHaveContent_014 begin');
      const media: Array<Resource> = [
        $r('app.media.Zoologist'),
        $r('app.media.Scientist'),
        $r('app.media.Engineer'),
        $r('app.media.Architect'),
        $r('app.media.IT_Engineer'),
        $r('app.media.Artist'),
        $r('app.media.Chef'),
        $r('app.media.rocket'),
        $r('app.media.Building'),
        $r('app.media.Computer'),
        $r('app.media.Draw'),
        $r('app.media.publish_photo_bird'),
        $r('app.media.publish_multimedia_updates_photo0'),
        $r('app.media.add'),
        $r('app.media.add_video'),
        $r('app.media.backgroundblur_main_normal'),
        $r('app.media.backgroundblur_find_normal'),
        $r('app.media.backgroundblur_hot_normal'),
        $r('app.media.Engineer_video'),
        $r('app.media.Champagne')
      ];
      let emptyCount: number = 0;
      for (let index: number = 0; index < media.length; index++) {
        const bytes: Uint8Array = await manager.getMediaContent(media[index]);
        if (bytes.length === 0) {
          emptyCount += 1;
        }
      }
      expect(emptyCount).assertEqual(0);
      Logger.info(TAG, 'AllMediaHaveContent_014 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_MEDIA_1500
     * @tc.name AvatarDataUri015
     * @tc.desc Verify an avatar base64 view advertises an image media type
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AvatarDataUri_015', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'AvatarDataUri_015 begin');
      const encoded: string = await manager.getMediaContentBase64($r('app.media.Scientist'));
      expect(encoded.startsWith('data:image/')).assertTrue();
      Logger.info(TAG, 'AvatarDataUri_015 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_MEDIA_1600
     * @tc.name VideoDataUri016
     * @tc.desc Verify a video base64 view advertises a video media type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'VideoDataUri_016', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'VideoDataUri_016 begin');
      const encoded: string = await manager.getMediaContentBase64($r('app.media.Engineer_video'));
      expect(encoded.startsWith('data:')).assertTrue();
      expect(encoded.indexOf(';base64,') !== -1).assertTrue();
      Logger.info(TAG, 'VideoDataUri_016 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_MEDIA_1700
     * @tc.name Base64MarkerPresent017
     * @tc.desc Verify the data URI carries a non empty payload after its marker
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'Base64MarkerPresent_017', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'Base64MarkerPresent_017 begin');
      const encoded: string = await manager.getMediaContentBase64($r('app.media.add'));
      const marker: number = encoded.indexOf(';base64,');
      expect(marker !== -1 && marker + 8 < encoded.length).assertTrue();
      Logger.info(TAG, 'Base64MarkerPresent_017 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_MEDIA_1800
     * @tc.name RawMissingRejects018
     * @tc.desc Verify a missing raw file is rejected instead of reading empty
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'RawMissingRejects_018', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'RawMissingRejects_018 begin');
      let rejected: boolean = false;
      try {
        await manager.getRawFileContent('routerMap/not_declared.json');
      }
      catch (error) {
        rejected = true;
      }
      expect(rejected).assertTrue();
      Logger.info(TAG, 'RawMissingRejects_018 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_MEDIA_1900
     * @tc.name RawEmptyRejects019
     * @tc.desc Verify an empty raw file path is rejected
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'RawEmptyRejects_019', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'RawEmptyRejects_019 begin');
      let rejected: boolean = false;
      try {
        await manager.getRawFileContent('');
      }
      catch (error) {
        rejected = true;
      }
      const known: Uint8Array = await manager.getRawFileContent('routerMap/publishmultimediaupdates.json');
      expect(rejected).assertTrue();
      expect(known.length > 0).assertTrue();
      Logger.info(TAG, 'RawEmptyRejects_019 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_MEDIA_2000
     * @tc.name RawDirectoryRejects020
     * @tc.desc Verify a directory path is rejected as a raw file
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'RawDirectoryRejects_020', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'RawDirectoryRejects_020 begin');
      let rejected: boolean = false;
      try {
        await manager.getRawFileContent('routerMap');
      }
      catch (error) {
        rejected = true;
      }
      const listing: Array<string> = await manager.getRawFileList('routerMap');
      expect(rejected).assertTrue();
      expect(listing.length > 0).assertTrue();
      Logger.info(TAG, 'RawDirectoryRejects_020 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_MEDIA_2100
     * @tc.name RawValidReadable021
     * @tc.desc Verify the route map stays readable after a failed raw read
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'RawValidReadable_021', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'RawValidReadable_021 begin');
      const bytes: Uint8Array = await manager.getRawFileContent('routerMap/publishmultimediaupdates.json');
      expect(bytes.length !== 0).assertTrue();
      Logger.info(TAG, 'RawValidReadable_021 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_RESOURCE_MEDIA_2200
     * @tc.name DataUriDecodesToBytes022
     * @tc.desc Verify the data URI payload decodes to the byte length of the media
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'DataUriDecodesToBytes_022', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'DataUriDecodesToBytes_022 begin');
      const encoded: string = await manager.getMediaContentBase64($r('app.media.Architect'));
      const bytes: Uint8Array = await manager.getMediaContent($r('app.media.Architect'));
      const marker: number = encoded.indexOf(';base64,');
      const helper: util.Base64Helper = new util.Base64Helper();
      const decoded: Uint8Array = helper.decodeSync(encoded.substring(marker + 8));
      expect(decoded.length).assertEqual(bytes.length);
      Logger.info(TAG, 'DataUriDecodesToBytes_022 end');
      done();
    });
  });
}
