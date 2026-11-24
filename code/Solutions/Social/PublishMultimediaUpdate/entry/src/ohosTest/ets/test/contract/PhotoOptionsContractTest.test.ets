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
import photoAccessHelper from '@ohos.file.photoAccessHelper';
import Logger from '../Logger';
import { BUNDLE, TAG } from '../common/TestConstant';
/**
 * Picker option contract used by the composer.
 * CommentInputDialog builds a PhotoSelectOptions for each media kind and caps
 * the selection at one item. These cases pin the option object and the MIME
 * enumerations the dialog relies on, without opening the system picker.
 */
export default function photoOptionsContractTest() {
  describe('PhotoOptionsContractTest', () => {
    beforeAll(async (): Promise<void> => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_PHOTO_0100
     * @tc.name ImageOptionsAcceptImageType001
     * @tc.desc Verify image options accept image type
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ImageOptionsAcceptImageType_001', 0, (): void => {
      Logger.info(TAG, 'ImageOptionsAcceptImageType_001 begin');
      const options: photoAccessHelper.PhotoSelectOptions = new photoAccessHelper.PhotoSelectOptions();
      options.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_TYPE;
      expect(options.MIMEType).assertEqual(photoAccessHelper.PhotoViewMIMETypes.IMAGE_TYPE);
      Logger.info(TAG, 'ImageOptionsAcceptImageType_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_PHOTO_0200
     * @tc.name VideoOptionsAcceptVideoType002
     * @tc.desc Verify video options accept video type
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'VideoOptionsAcceptVideoType_002', 0, (): void => {
      Logger.info(TAG, 'VideoOptionsAcceptVideoType_002 begin');
      const options: photoAccessHelper.PhotoSelectOptions = new photoAccessHelper.PhotoSelectOptions();
      options.MIMEType = photoAccessHelper.PhotoViewMIMETypes.VIDEO_TYPE;
      expect(options.MIMEType).assertEqual(photoAccessHelper.PhotoViewMIMETypes.VIDEO_TYPE);
      Logger.info(TAG, 'VideoOptionsAcceptVideoType_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_PHOTO_0300
     * @tc.name ImageAndVideoTypesDiffer003
     * @tc.desc Verify image and video types differ
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ImageAndVideoTypesDiffer_003', 0, (): void => {
      Logger.info(TAG, 'ImageAndVideoTypesDiffer_003 begin');
      const image: string = photoAccessHelper.PhotoViewMIMETypes.IMAGE_TYPE;
      const video: string = photoAccessHelper.PhotoViewMIMETypes.VIDEO_TYPE;
      const distinct: boolean = image !== video;
      Logger.info(TAG, 'distinct=' + JSON.stringify(distinct));
      expect(distinct).assertTrue();
      Logger.info(TAG, 'ImageAndVideoTypesDiffer_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_PHOTO_0400
     * @tc.name MaxSelectOneCarried004
     * @tc.desc Verify max select one carried
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'MaxSelectOneCarried_004', 0, (): void => {
      Logger.info(TAG, 'MaxSelectOneCarried_004 begin');
      const options: photoAccessHelper.PhotoSelectOptions = new photoAccessHelper.PhotoSelectOptions();
      options.maxSelectNumber = 1;
      expect(options.maxSelectNumber).assertEqual(1);
      Logger.info(TAG, 'MaxSelectOneCarried_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_PHOTO_0500
     * @tc.name TwoOptionObjectsIndependent005
     * @tc.desc Verify two option objects independent
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'TwoOptionObjectsIndependent_005', 0, (): void => {
      Logger.info(TAG, 'TwoOptionObjectsIndependent_005 begin');
      const imageOptions: photoAccessHelper.PhotoSelectOptions = new photoAccessHelper.PhotoSelectOptions();
      imageOptions.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_TYPE;
      imageOptions.maxSelectNumber = 1;
      const videoOptions: photoAccessHelper.PhotoSelectOptions = new photoAccessHelper.PhotoSelectOptions();
      videoOptions.MIMEType = photoAccessHelper.PhotoViewMIMETypes.VIDEO_TYPE;
      videoOptions.maxSelectNumber = 2;
      expect(imageOptions.maxSelectNumber).assertEqual(1);
      expect(videoOptions.maxSelectNumber).assertEqual(2);
      expect(imageOptions.MIMEType).assertEqual(photoAccessHelper.PhotoViewMIMETypes.IMAGE_TYPE);
      Logger.info(TAG, 'TwoOptionObjectsIndependent_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_PHOTO_0600
     * @tc.name PickerInstanceBuildable006
     * @tc.desc Verify picker instance buildable
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'PickerInstanceBuildable_006', 0, (): void => {
      Logger.info(TAG, 'PickerInstanceBuildable_006 begin');
      const picker: photoAccessHelper.PhotoViewPicker = new photoAccessHelper.PhotoViewPicker();
      const present: boolean = picker !== null && picker !== undefined;
      Logger.info(TAG, 'present=' + JSON.stringify(present));
      expect(present).assertTrue();
      Logger.info(TAG, 'PickerInstanceBuildable_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_PHOTO_0700
     * @tc.name EveryMimeTypeAccepted007
     * @tc.desc Verify every mime type accepted
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EveryMimeTypeAccepted_007', 0, (): void => {
      Logger.info(TAG, 'EveryMimeTypeAccepted_007 begin');
      const kinds: Array<photoAccessHelper.PhotoViewMIMETypes> = [
        photoAccessHelper.PhotoViewMIMETypes.IMAGE_TYPE,
        photoAccessHelper.PhotoViewMIMETypes.VIDEO_TYPE
      ];
      const options: photoAccessHelper.PhotoSelectOptions = new photoAccessHelper.PhotoSelectOptions();
      let mismatched: number = 0;
      for (let index: number = 0; index < kinds.length; index++) {
        options.MIMEType = kinds[index];
        if (options.MIMEType !== kinds[index]) {
          mismatched += 1;
        }
      }
      expect(mismatched).assertEqual(0);
      Logger.info(TAG, 'EveryMimeTypeAccepted_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_PHOTO_0800
     * @tc.name OptionsReusableAcrossBuilds008
     * @tc.desc Verify options reusable across builds
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'OptionsReusableAcrossBuilds_008', 0, (): void => {
      Logger.info(TAG, 'OptionsReusableAcrossBuilds_008 begin');
      const options: photoAccessHelper.PhotoSelectOptions = new photoAccessHelper.PhotoSelectOptions();
      options.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_TYPE;
      options.MIMEType = photoAccessHelper.PhotoViewMIMETypes.VIDEO_TYPE;
      expect(options.MIMEType).assertEqual(photoAccessHelper.PhotoViewMIMETypes.VIDEO_TYPE);
      Logger.info(TAG, 'OptionsReusableAcrossBuilds_008 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_PHOTO_0900
     * @tc.name TypeEnumHasImageAndVideo009
     * @tc.desc Verify type enum has image and video
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'TypeEnumHasImageAndVideo_009', 0, (): void => {
      Logger.info(TAG, 'TypeEnumHasImageAndVideo_009 begin');
      const image: photoAccessHelper.PhotoViewMIMETypes = photoAccessHelper.PhotoViewMIMETypes.IMAGE_TYPE;
      const video: photoAccessHelper.PhotoViewMIMETypes = photoAccessHelper.PhotoViewMIMETypes.VIDEO_TYPE;
      const defined: boolean = image !== undefined && video !== undefined;
      Logger.info(TAG, 'defined=' + JSON.stringify(defined));
      expect(defined).assertTrue();
      Logger.info(TAG, 'TypeEnumHasImageAndVideo_009 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_PHOTO_1000
     * @tc.name OptionInstancesDistinct010
     * @tc.desc Verify option instances distinct
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'OptionInstancesDistinct_010', 0, (): void => {
      Logger.info(TAG, 'OptionInstancesDistinct_010 begin');
      const first: photoAccessHelper.PhotoSelectOptions = new photoAccessHelper.PhotoSelectOptions();
      const second: photoAccessHelper.PhotoSelectOptions = new photoAccessHelper.PhotoSelectOptions();
      const distinct: boolean = first !== second;
      Logger.info(TAG, 'distinct=' + JSON.stringify(distinct));
      expect(distinct).assertTrue();
      Logger.info(TAG, 'OptionInstancesDistinct_010 end');
    });
  });
}
