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
import { hilog } from '@kit.PerformanceAnalysisKit';

/** Log domain of the sample application. */
const DOMAIN: number = 0xF811;
/** Upper bound of one recent photo window in seconds, mirrored from the factory rule. */
const ONE_DAY_SECONDS: number = 86400;
/** Largest thirty two bit value used as an extreme window request. */
const HUGE_SECONDS: number = 2147483647;

/**
 * Registers the edge cases of both picker option factories of the shared
 * library. All methods under test build plain option objects, no ability
 * context is required and every case asserts synchronously.
 */
export default function pickerOptionFactoryEdgeTest() {
  describe('PickerOptionFactoryEdgeTest', () => {
    /**
     * @tc.number    SUB_PHOTOPICKER_POFEDGE_0100
     * @tc.name      testPofEdge0001
     * @tc.desc      Verify the sendable factory keeps every small positive
     *               window from one second up to one hour unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testPofEdge0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testPofEdge0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The smallest positive window passes through unchanged.
      expect(PickerOptionFactory.createRecentPhotoOptions(1, PhotoSource.ALL, false).period).assertEqual(1);
      // A half minute window passes through unchanged.
      expect(PickerOptionFactory.createRecentPhotoOptions(30, PhotoSource.ALL, false).period).assertEqual(30);
      // A one minute window passes through unchanged.
      expect(PickerOptionFactory.createRecentPhotoOptions(60, PhotoSource.ALL, false).period).assertEqual(60);
      // A five minute window passes through unchanged.
      expect(PickerOptionFactory.createRecentPhotoOptions(300, PhotoSource.ALL, false).period).assertEqual(300);
      // A one hour window passes through unchanged.
      expect(PickerOptionFactory.createRecentPhotoOptions(3600, PhotoSource.ALL, false).period).assertEqual(3600);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_POFEDGE_0200
     * @tc.name      testPofEdge0002
     * @tc.desc      Verify the sendable factory keeps every large window
     *               below the one day bound unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testPofEdge0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testPofEdge0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A two hour window passes through unchanged.
      expect(PickerOptionFactory.createRecentPhotoOptions(7200, PhotoSource.ALL, false).period).assertEqual(7200);
      // A twelve hour window passes through unchanged.
      expect(PickerOptionFactory.createRecentPhotoOptions(43200, PhotoSource.ALL, false).period).assertEqual(43200);
      // One second below the bound still counts as valid.
      expect(PickerOptionFactory.createRecentPhotoOptions(86399, PhotoSource.ALL, false).period)
        .assertEqual(86399);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_POFEDGE_0300
     * @tc.name      testPofEdge0003
     * @tc.desc      Verify the sendable factory keeps the inclusive one day
     *               boundary unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPofEdge0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testPofEdge0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The bound itself is inclusive and passes through unchanged.
      const options: RecentPhotoOptions =
        PickerOptionFactory.createRecentPhotoOptions(ONE_DAY_SECONDS, PhotoSource.CAMERA, true);
      // The one day window is kept exactly.
      expect(options.period).assertEqual(ONE_DAY_SECONDS);
      // The requested source and refresh switch are forwarded too.
      expect(options.photoSource).assertEqual(PhotoSource.CAMERA);
      expect(options.isAutoRefreshSupported).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_POFEDGE_0400
     * @tc.name      testPofEdge0004
     * @tc.desc      Verify the sendable factory clamps a window of one
     *               second past the bound onto the one day maximum.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPofEdge0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testPofEdge0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // One second past the bound falls back to the full day.
      const options: RecentPhotoOptions =
        PickerOptionFactory.createRecentPhotoOptions(ONE_DAY_SECONDS + 1, PhotoSource.ALL, false);
      // The clamped window equals the one day maximum.
      expect(options.period).assertEqual(ONE_DAY_SECONDS);
      // The clamped options keep the image and video mime restriction.
      expect(options.MIMEType).assertEqual(photoAccessHelper.PhotoViewMIMETypes.IMAGE_VIDEO_TYPE);
      // The clamped options keep the disabled auto refresh switch.
      expect(options.isAutoRefreshSupported).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_POFEDGE_0500
     * @tc.name      testPofEdge0005
     * @tc.desc      Verify the sendable factory clamps a zero window onto
     *               the one day maximum.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testPofEdge0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testPofEdge0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A zero window falls back to the full day.
      const options: RecentPhotoOptions =
        PickerOptionFactory.createRecentPhotoOptions(0, PhotoSource.SCREENSHOT, false);
      // The clamped window equals the one day maximum.
      expect(options.period).assertEqual(ONE_DAY_SECONDS);
      // The screenshot source reaches the clamped options unchanged.
      expect(options.photoSource).assertEqual(PhotoSource.SCREENSHOT);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_POFEDGE_0600
     * @tc.name      testPofEdge0006
     * @tc.desc      Verify the sendable factory clamps every negative window
     *               from minus one down to minus one day onto the maximum.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testPofEdge0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testPofEdge0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Minus one second falls back to the full day.
      expect(PickerOptionFactory.createRecentPhotoOptions(-1, PhotoSource.ALL, false).period)
        .assertEqual(ONE_DAY_SECONDS);
      // Minus one hour falls back to the full day.
      expect(PickerOptionFactory.createRecentPhotoOptions(-3600, PhotoSource.ALL, false).period)
        .assertEqual(ONE_DAY_SECONDS);
      // Minus one day falls back to the full day as well.
      expect(PickerOptionFactory.createRecentPhotoOptions(-ONE_DAY_SECONDS, PhotoSource.ALL, false).period)
        .assertEqual(ONE_DAY_SECONDS);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_POFEDGE_0700
     * @tc.name      testPofEdge0007
     * @tc.desc      Verify the sendable factory clamps the largest thirty
     *               two bit window request onto the one day maximum.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPofEdge0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testPofEdge0007';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A huge window falls back to the full day.
      const options: RecentPhotoOptions =
        PickerOptionFactory.createRecentPhotoOptions(HUGE_SECONDS, PhotoSource.ALL, true);
      // The clamped window equals the one day maximum.
      expect(options.period).assertEqual(ONE_DAY_SECONDS);
      // The enabled refresh switch still reaches the clamped options.
      expect(options.isAutoRefreshSupported).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_POFEDGE_0800
     * @tc.name      testPofEdge0008
     * @tc.desc      Verify the sendable factory keeps positive fractional
     *               windows unchanged because only the sign and the bound
     *               take part in the rule.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPofEdge0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testPofEdge0008';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A half second window passes through unchanged.
      expect(PickerOptionFactory.createRecentPhotoOptions(0.5, PhotoSource.ALL, false).period).assertEqual(0.5);
      // A one and a half second window passes through unchanged.
      expect(PickerOptionFactory.createRecentPhotoOptions(1.5, PhotoSource.ALL, false).period).assertEqual(1.5);
      // A fractional window just below the bound passes through unchanged.
      expect(PickerOptionFactory.createRecentPhotoOptions(86399.5, PhotoSource.ALL, false).period)
        .assertEqual(86399.5);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_POFEDGE_0900
     * @tc.name      testPofEdge0009
     * @tc.desc      Verify the sendable factory forwards each of the three
     *               album sources unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testPofEdge0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testPofEdge0009';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The camera source reaches the options unchanged.
      expect(PickerOptionFactory.createRecentPhotoOptions(60, PhotoSource.CAMERA, false).photoSource)
        .assertEqual(PhotoSource.CAMERA);
      // The screenshot source reaches the options unchanged.
      expect(PickerOptionFactory.createRecentPhotoOptions(60, PhotoSource.SCREENSHOT, false).photoSource)
        .assertEqual(PhotoSource.SCREENSHOT);
      // The all photos source reaches the options unchanged.
      expect(PickerOptionFactory.createRecentPhotoOptions(60, PhotoSource.ALL, false).photoSource)
        .assertEqual(PhotoSource.ALL);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_POFEDGE_1000
     * @tc.name      testPofEdge0010
     * @tc.desc      Verify the sendable factory forwards both states of the
     *               auto refresh switch unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testPofEdge0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testPofEdge0010';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The enabled switch reaches the options unchanged.
      expect(PickerOptionFactory.createRecentPhotoOptions(60, PhotoSource.ALL, true).isAutoRefreshSupported)
        .assertTrue();
      // The disabled switch reaches the options unchanged.
      expect(PickerOptionFactory.createRecentPhotoOptions(60, PhotoSource.ALL, false).isAutoRefreshSupported)
        .assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_POFEDGE_1100
     * @tc.name      testPofEdge0011
     * @tc.desc      Verify the sendable factory fixes the image and video
     *               mime restriction for every period form.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testPofEdge0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testPofEdge0011';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The valid window keeps the image and video restriction.
      expect(PickerOptionFactory.createRecentPhotoOptions(60, PhotoSource.ALL, false).MIMEType)
        .assertEqual(photoAccessHelper.PhotoViewMIMETypes.IMAGE_VIDEO_TYPE);
      // The clamped zero window keeps the same restriction.
      expect(PickerOptionFactory.createRecentPhotoOptions(0, PhotoSource.ALL, false).MIMEType)
        .assertEqual(photoAccessHelper.PhotoViewMIMETypes.IMAGE_VIDEO_TYPE);
      // The clamped overflow window keeps the same restriction.
      expect(PickerOptionFactory.createRecentPhotoOptions(90000, PhotoSource.ALL, false).MIMEType)
        .assertEqual(photoAccessHelper.PhotoViewMIMETypes.IMAGE_VIDEO_TYPE);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_POFEDGE_1200
     * @tc.name      testPofEdge0012
     * @tc.desc      Verify the sendable factory keeps the source and refresh
     *               switch independent so all combinations are forwarded.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPofEdge0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testPofEdge0012';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Camera with refresh enabled keeps both values.
      const cameraOn: RecentPhotoOptions =
        PickerOptionFactory.createRecentPhotoOptions(60, PhotoSource.CAMERA, true);
      expect(cameraOn.photoSource).assertEqual(PhotoSource.CAMERA);
      expect(cameraOn.isAutoRefreshSupported).assertTrue();
      // Camera with refresh disabled keeps both values.
      const cameraOff: RecentPhotoOptions =
        PickerOptionFactory.createRecentPhotoOptions(60, PhotoSource.CAMERA, false);
      expect(cameraOff.photoSource).assertEqual(PhotoSource.CAMERA);
      expect(cameraOff.isAutoRefreshSupported).assertFalse();
      // All photos with refresh enabled keeps both values.
      const allOn: RecentPhotoOptions =
        PickerOptionFactory.createRecentPhotoOptions(60, PhotoSource.ALL, true);
      expect(allOn.photoSource).assertEqual(PhotoSource.ALL);
      expect(allOn.isAutoRefreshSupported).assertTrue();
      // Screenshot with refresh disabled keeps both values.
      const shotOff: RecentPhotoOptions =
        PickerOptionFactory.createRecentPhotoOptions(60, PhotoSource.SCREENSHOT, false);
      expect(shotOff.photoSource).assertEqual(PhotoSource.SCREENSHOT);
      expect(shotOff.isAutoRefreshSupported).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_POFEDGE_1300
     * @tc.name      testPofEdge0013
     * @tc.desc      Verify two consecutive sendable factory calls produce
     *               independent option objects without shared state.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPofEdge0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testPofEdge0013';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Build the first options with a one hour window.
      const first: RecentPhotoOptions =
        PickerOptionFactory.createRecentPhotoOptions(3600, PhotoSource.CAMERA, true);
      // Build the second options with a clamped window.
      const second: RecentPhotoOptions =
        PickerOptionFactory.createRecentPhotoOptions(0, PhotoSource.ALL, false);
      // The first object keeps its own window and switch.
      expect(first.period).assertEqual(3600);
      expect(first.isAutoRefreshSupported).assertTrue();
      // The second object keeps its own window and switch.
      expect(second.period).assertEqual(ONE_DAY_SECONDS);
      expect(second.isAutoRefreshSupported).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_POFEDGE_1400
     * @tc.name      testPofEdge0014
     * @tc.desc      Verify the query factory keeps every valid window from
     *               one second up to one hour unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testPofEdge0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testPofEdge0014';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The smallest positive window passes through unchanged.
      expect(PickerOptionFactory.createRecentQueryOptions(1, PhotoSource.ALL).period).assertEqual(1);
      // A ten minute window passes through unchanged.
      expect(PickerOptionFactory.createRecentQueryOptions(600, PhotoSource.ALL).period).assertEqual(600);
      // A one hour window passes through unchanged.
      expect(PickerOptionFactory.createRecentQueryOptions(3600, PhotoSource.ALL).period).assertEqual(3600);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_POFEDGE_1500
     * @tc.name      testPofEdge0015
     * @tc.desc      Verify the query factory clamps zero, negative and
     *               overflowing windows onto the one day maximum.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testPofEdge0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testPofEdge0015';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A zero window falls back to the full day.
      expect(PickerOptionFactory.createRecentQueryOptions(0, PhotoSource.ALL).period)
        .assertEqual(ONE_DAY_SECONDS);
      // A negative window falls back to the full day.
      expect(PickerOptionFactory.createRecentQueryOptions(-1, PhotoSource.ALL).period)
        .assertEqual(ONE_DAY_SECONDS);
      // A two day window falls back to the full day.
      expect(PickerOptionFactory.createRecentQueryOptions(172800, PhotoSource.ALL).period)
        .assertEqual(ONE_DAY_SECONDS);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_POFEDGE_1600
     * @tc.name      testPofEdge0016
     * @tc.desc      Verify the query factory keeps both inclusive window
     *               boundaries and clamps the first overflow step.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPofEdge0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testPofEdge0016';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The lower inclusive bound passes through unchanged.
      expect(PickerOptionFactory.createRecentQueryOptions(1, PhotoSource.ALL).period).assertEqual(1);
      // One second below the upper bound passes through unchanged.
      expect(PickerOptionFactory.createRecentQueryOptions(86399, PhotoSource.ALL).period).assertEqual(86399);
      // The upper inclusive bound passes through unchanged.
      expect(PickerOptionFactory.createRecentQueryOptions(86400, PhotoSource.ALL).period)
        .assertEqual(ONE_DAY_SECONDS);
      // One second past the upper bound is clamped.
      expect(PickerOptionFactory.createRecentQueryOptions(86401, PhotoSource.ALL).period)
        .assertEqual(ONE_DAY_SECONDS);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_POFEDGE_1700
     * @tc.name      testPofEdge0017
     * @tc.desc      Verify the query factory forwards each of the three
     *               album sources unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testPofEdge0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testPofEdge0017';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The camera source reaches the query options unchanged.
      expect(PickerOptionFactory.createRecentQueryOptions(60, PhotoSource.CAMERA).photoSource)
        .assertEqual(PhotoSource.CAMERA);
      // The screenshot source reaches the query options unchanged.
      expect(PickerOptionFactory.createRecentQueryOptions(60, PhotoSource.SCREENSHOT).photoSource)
        .assertEqual(PhotoSource.SCREENSHOT);
      // The all photos source reaches the query options unchanged.
      expect(PickerOptionFactory.createRecentQueryOptions(60, PhotoSource.ALL).photoSource)
        .assertEqual(PhotoSource.ALL);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_POFEDGE_1800
     * @tc.name      testPofEdge0018
     * @tc.desc      Verify both factories normalise the same valid window
     *               request to exactly the same period value.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPofEdge0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testPofEdge0018';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Build both option objects from the same valid request.
      const sendable: RecentPhotoOptions =
        PickerOptionFactory.createRecentPhotoOptions(1800, PhotoSource.CAMERA, true);
      const query: photoAccessHelper.RecentPhotoOptions =
        PickerOptionFactory.createRecentQueryOptions(1800, PhotoSource.CAMERA);
      // Both factories keep the same window.
      expect(sendable.period).assertEqual(query.period);
      expect(sendable.period).assertEqual(1800);
      // Both factories forward the same album source.
      expect(sendable.photoSource).assertEqual(query.photoSource);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_POFEDGE_1900
     * @tc.name      testPofEdge0019
     * @tc.desc      Verify both factories clamp the same invalid window
     *               requests onto the identical one day maximum.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPofEdge0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testPofEdge0019';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Build both option objects from the same invalid requests.
      const sendableZero: RecentPhotoOptions =
        PickerOptionFactory.createRecentPhotoOptions(0, PhotoSource.ALL, false);
      const queryZero: photoAccessHelper.RecentPhotoOptions =
        PickerOptionFactory.createRecentQueryOptions(0, PhotoSource.ALL);
      const sendableOverflow: RecentPhotoOptions =
        PickerOptionFactory.createRecentPhotoOptions(86401, PhotoSource.ALL, false);
      const queryOverflow: photoAccessHelper.RecentPhotoOptions =
        PickerOptionFactory.createRecentQueryOptions(86401, PhotoSource.ALL);
      // Both factories clamp the zero window identically.
      expect(sendableZero.period).assertEqual(queryZero.period);
      expect(sendableZero.period).assertEqual(ONE_DAY_SECONDS);
      // Both factories clamp the overflowing window identically.
      expect(sendableOverflow.period).assertEqual(queryOverflow.period);
      expect(sendableOverflow.period).assertEqual(ONE_DAY_SECONDS);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_POFEDGE_2000
     * @tc.name      testPofEdge0020
     * @tc.desc      Verify two consecutive query factory calls produce
     *               independent option objects without shared state.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPofEdge0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testPofEdge0020';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Build the first query options with a valid window.
      const first: photoAccessHelper.RecentPhotoOptions =
        PickerOptionFactory.createRecentQueryOptions(120, PhotoSource.SCREENSHOT);
      // Build the second query options with an invalid window.
      const second: photoAccessHelper.RecentPhotoOptions =
        PickerOptionFactory.createRecentQueryOptions(-5, PhotoSource.CAMERA);
      // The first object keeps its own window and source.
      expect(first.period).assertEqual(120);
      expect(first.photoSource).assertEqual(PhotoSource.SCREENSHOT);
      // The second object keeps its own clamped window and source.
      expect(second.period).assertEqual(ONE_DAY_SECONDS);
      expect(second.photoSource).assertEqual(PhotoSource.CAMERA);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_POFEDGE_2100
     * @tc.name      testPofEdge0021
     * @tc.desc      Verify the sendable factory combines each album source
     *               with the matching auto refresh switch of the request.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPofEdge0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testPofEdge0021';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Camera with refresh enabled keeps both request values.
      const cameraOptions: RecentPhotoOptions =
        PickerOptionFactory.createRecentPhotoOptions(600, PhotoSource.CAMERA, true);
      expect(cameraOptions.photoSource).assertEqual(PhotoSource.CAMERA);
      expect(cameraOptions.isAutoRefreshSupported).assertTrue();
      // Screenshot with refresh disabled keeps both request values.
      const screenshotOptions: RecentPhotoOptions =
        PickerOptionFactory.createRecentPhotoOptions(600, PhotoSource.SCREENSHOT, false);
      expect(screenshotOptions.photoSource).assertEqual(PhotoSource.SCREENSHOT);
      expect(screenshotOptions.isAutoRefreshSupported).assertFalse();
      // All photos with refresh enabled keeps both request values.
      const allOptions: RecentPhotoOptions =
        PickerOptionFactory.createRecentPhotoOptions(600, PhotoSource.ALL, true);
      expect(allOptions.photoSource).assertEqual(PhotoSource.ALL);
      expect(allOptions.isAutoRefreshSupported).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_POFEDGE_2200
     * @tc.name      testPofEdge0022
     * @tc.desc      Verify the sendable factory keeps tiny fractional window
     *               requests because any positive value passes the rule.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPofEdge0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testPofEdge0022';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A quarter second window is positive and passes through unchanged.
      expect(PickerOptionFactory.createRecentPhotoOptions(0.25, PhotoSource.ALL, false).period)
        .assertEqual(0.25);
      // A half second window passes through unchanged.
      expect(PickerOptionFactory.createRecentPhotoOptions(0.5, PhotoSource.ALL, false).period)
        .assertEqual(0.5);
      // A tiny window far below one second still passes through.
      expect(PickerOptionFactory.createRecentPhotoOptions(0.001, PhotoSource.ALL, false).period)
        .assertEqual(0.001);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_POFEDGE_2300
     * @tc.name      testPofEdge0023
     * @tc.desc      Verify the sendable factory restricts every built option
     *               object to the image and video mime type.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testPofEdge0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testPofEdge0023';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Every album source receives the same image and video restriction.
      const cameraOptions: RecentPhotoOptions =
        PickerOptionFactory.createRecentPhotoOptions(60, PhotoSource.CAMERA, true);
      expect(cameraOptions.MIMEType).assertEqual(photoAccessHelper.PhotoViewMIMETypes.IMAGE_VIDEO_TYPE);
      const screenshotOptions: RecentPhotoOptions =
        PickerOptionFactory.createRecentPhotoOptions(60, PhotoSource.SCREENSHOT, false);
      expect(screenshotOptions.MIMEType).assertEqual(photoAccessHelper.PhotoViewMIMETypes.IMAGE_VIDEO_TYPE);
      const clampedOptions: RecentPhotoOptions =
        PickerOptionFactory.createRecentPhotoOptions(-1, PhotoSource.ALL, true);
      expect(clampedOptions.MIMEType).assertEqual(photoAccessHelper.PhotoViewMIMETypes.IMAGE_VIDEO_TYPE);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_POFEDGE_2400
     * @tc.name      testPofEdge0024
     * @tc.desc      Verify the query factory keeps tiny fractional window
     *               requests unchanged like the sendable factory does.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPofEdge0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testPofEdge0024';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A quarter second window passes the query factory unchanged.
      expect(PickerOptionFactory.createRecentQueryOptions(0.25, PhotoSource.CAMERA).period)
        .assertEqual(0.25);
      // A half second window passes the query factory unchanged.
      expect(PickerOptionFactory.createRecentQueryOptions(0.5, PhotoSource.SCREENSHOT).period)
        .assertEqual(0.5);
      // A fractional window below the bound stays untouched.
      expect(PickerOptionFactory.createRecentQueryOptions(86399.5, PhotoSource.ALL).period)
        .assertEqual(86399.5);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_POFEDGE_2500
     * @tc.name      testPofEdge0025
     * @tc.desc      Verify the sendable factory produces an independent
     *               option object for every call even with equal requests.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPofEdge0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testPofEdge0025';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Build two option objects from identical requests.
      const first: RecentPhotoOptions =
        PickerOptionFactory.createRecentPhotoOptions(300, PhotoSource.CAMERA, true);
      const second: RecentPhotoOptions =
        PickerOptionFactory.createRecentPhotoOptions(300, PhotoSource.CAMERA, true);
      // Both objects carry the same request values.
      expect(first.period).assertEqual(300);
      expect(second.period).assertEqual(300);
      expect(first.photoSource).assertEqual(second.photoSource);
      expect(first.isAutoRefreshSupported).assertTrue();
      expect(second.isAutoRefreshSupported).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}
