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
import { PickerOptionFactory } from 'photopickersendable';
import { photoAccessHelper, PhotoSource, RecentPhotoOptions } from '@kit.MediaLibraryKit';

/** Upper bound of one recent photo window in seconds, mirrored from the factory rule. */
const ONE_DAY_SECONDS: number = 86400;

/**
 * Registers every picker option factory case of the shared library.
 * All methods under test build plain option objects, no ability context is required.
 */
export default function pickerOptionFactorySuiteTest() {
  describe('PickerOptionFactorySuiteTest', () => {
    /**
     * @tc.number    SUB_PHOTOPICKER_PICKEROPT_0100
     * @tc.name      testPickerOption0001
     * @tc.desc      Verify the sendable recent photo options keep a valid
     *               window, forward the album source and the auto refresh switch.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testPickerOption0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const options: RecentPhotoOptions =
        PickerOptionFactory.createRecentPhotoOptions(3600, PhotoSource.CAMERA, true);
      // A positive window inside one day passes through unchanged.
      expect(options.period).assertEqual(3600);
      // The sample restricts the recent window to images and videos only.
      expect(options.MIMEType).assertEqual(photoAccessHelper.PhotoViewMIMETypes.IMAGE_VIDEO_TYPE);
      // The album source chosen in the UI reaches the options object.
      expect(options.photoSource).assertEqual(PhotoSource.CAMERA);
      // The auto refresh switch is forwarded exactly as requested.
      expect(options.isAutoRefreshSupported).assertTrue();
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_PICKEROPT_0200
     * @tc.name      testPickerOption0002
     * @tc.desc      Verify the sendable recent photo options clamp zero,
     *               negative and overflowing windows onto the one day bound.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testPickerOption0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const zeroPeriod: RecentPhotoOptions =
        PickerOptionFactory.createRecentPhotoOptions(0, PhotoSource.SCREENSHOT, false);
      // A zero window is replaced by the full one day period.
      expect(zeroPeriod.period).assertEqual(ONE_DAY_SECONDS);
      const negativePeriod: RecentPhotoOptions =
        PickerOptionFactory.createRecentPhotoOptions(-3600, PhotoSource.SCREENSHOT, false);
      // A negative window is replaced by the full one day period too.
      expect(negativePeriod.period).assertEqual(ONE_DAY_SECONDS);
      const overflowPeriod: RecentPhotoOptions =
        PickerOptionFactory.createRecentPhotoOptions(90000, PhotoSource.SCREENSHOT, false);
      // A window longer than one day is clamped back onto the bound.
      expect(overflowPeriod.period).assertEqual(ONE_DAY_SECONDS);
      // The clamped options keep the album source and the disabled auto refresh.
      expect(overflowPeriod.photoSource).assertEqual(PhotoSource.SCREENSHOT);
      expect(overflowPeriod.isAutoRefreshSupported).assertFalse();
      // The clamped options keep the image and video mime restriction.
      expect(overflowPeriod.MIMEType).assertEqual(photoAccessHelper.PhotoViewMIMETypes.IMAGE_VIDEO_TYPE);
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_PICKEROPT_0300
     * @tc.name      testPickerOption0003
     * @tc.desc      Verify the sendable recent photo options keep the window
     *               boundaries at one second and exactly one day unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPickerOption0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const oneSecond: RecentPhotoOptions =
        PickerOptionFactory.createRecentPhotoOptions(1, PhotoSource.ALL, false);
      // The smallest positive window passes through unchanged.
      expect(oneSecond.period).assertEqual(1);
      const justBelow: RecentPhotoOptions =
        PickerOptionFactory.createRecentPhotoOptions(86399, PhotoSource.ALL, false);
      // One second below the bound still counts as valid.
      expect(justBelow.period).assertEqual(86399);
      const exactDay: RecentPhotoOptions =
        PickerOptionFactory.createRecentPhotoOptions(ONE_DAY_SECONDS, PhotoSource.ALL, true);
      // The one day bound itself is inclusive and passes through unchanged.
      expect(exactDay.period).assertEqual(ONE_DAY_SECONDS);
      // The all photos source and the enabled auto refresh reach the options object.
      expect(exactDay.photoSource).assertEqual(PhotoSource.ALL);
      expect(exactDay.isAutoRefreshSupported).assertTrue();
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_PICKEROPT_0400
     * @tc.name      testPickerOption0004
     * @tc.desc      Verify the non sendable query options keep a valid window,
     *               the image and video mime type and the album source.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testPickerOption0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const query: photoAccessHelper.RecentPhotoOptions =
        PickerOptionFactory.createRecentQueryOptions(600, PhotoSource.SCREENSHOT);
      // A positive window inside one day passes through unchanged.
      expect(query.period).assertEqual(600);
      // The query options restrict the result to images and videos as well.
      expect(query.MIMEType).assertEqual(photoAccessHelper.PhotoViewMIMETypes.IMAGE_VIDEO_TYPE);
      // The album source chosen in the UI reaches the query options object.
      expect(query.photoSource).assertEqual(PhotoSource.SCREENSHOT);
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_PICKEROPT_0500
     * @tc.name      testPickerOption0005
     * @tc.desc      Verify the non sendable query options clamp invalid windows
     *               onto the one day bound and keep valid windows untouched.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPickerOption0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const zeroPeriod: photoAccessHelper.RecentPhotoOptions =
        PickerOptionFactory.createRecentQueryOptions(0, PhotoSource.ALL);
      // A zero window is replaced by the full one day period.
      expect(zeroPeriod.period).assertEqual(ONE_DAY_SECONDS);
      const negativePeriod: photoAccessHelper.RecentPhotoOptions =
        PickerOptionFactory.createRecentQueryOptions(-5, PhotoSource.ALL);
      // A negative window is replaced by the full one day period too.
      expect(negativePeriod.period).assertEqual(ONE_DAY_SECONDS);
      const overflowPeriod: photoAccessHelper.RecentPhotoOptions =
        PickerOptionFactory.createRecentQueryOptions(172800, PhotoSource.CAMERA);
      // A window of two days is clamped back onto the one day bound.
      expect(overflowPeriod.period).assertEqual(ONE_DAY_SECONDS);
      // The clamped options keep the camera source forwarded by the caller.
      expect(overflowPeriod.photoSource).assertEqual(PhotoSource.CAMERA);
      const validPeriod: photoAccessHelper.RecentPhotoOptions =
        PickerOptionFactory.createRecentQueryOptions(7200, PhotoSource.CAMERA);
      // A valid window inside the bound passes through unchanged.
      expect(validPeriod.period).assertEqual(7200);
    });
  });
}
