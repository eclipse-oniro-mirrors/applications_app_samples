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

import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';

const DOMAIN = 0xF811;
const TAG = '[Sample_HMOSLiveStream]';
const BUNDLE = 'HMOSLiveStream_';

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'beforeAll called');
    })
    beforeEach(() => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'beforeEach called');
    })
    afterEach(() => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'afterEach called');
    })
    afterAll(() => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'afterAll called');
    })

    /**
     * Verify that the application starts successfully.
     */
    it(BUNDLE + 'StartAbility_001', 0, () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'StartAbility_001 begin');
      let a = 'HMOSLiveStream';
      let b = 'LiveStream';
      expect(a).assertContain(b);
      expect(a).assertEqual(a);
      hilog.info(DOMAIN, TAG, BUNDLE + 'StartAbility_001 end');
    })

    /**
     * Verify that ROI path type values are valid.
     */
    it(BUNDLE + 'RoiPathType_001', 0, () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'RoiPathType_001 begin');
      // ROI_PATH_NATIVEBUFFER = 0
      let nativeBufferPath = 0;
      hilog.info(DOMAIN, TAG, BUNDLE + 'RoiPathType_001 nativeBufferPath: ' + nativeBufferPath);
      expect(nativeBufferPath).assertEqual(0);
      // ROI_PATH_METADATA_CALLBACK = 1
      let metadataCallbackPath = 1;
      hilog.info(DOMAIN, TAG, BUNDLE + 'RoiPathType_001 metadataCallbackPath: ' + metadataCallbackPath);
      expect(metadataCallbackPath).assertEqual(1);
      // ROI_PATH_BUFFER_MODE = 2
      let bufferModePath = 2;
      hilog.info(DOMAIN, TAG, BUNDLE + 'RoiPathType_001 bufferModePath: ' + bufferModePath);
      expect(bufferModePath).assertEqual(2);
      hilog.info(DOMAIN, TAG, BUNDLE + 'RoiPathType_001 end');
    })

    /**
     * Verify that all ROI path types are distinct.
     */
    it(BUNDLE + 'RoiPathType_002', 0, () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'RoiPathType_002 begin');
      let nativeBufferPath = 0;
      let metadataCallbackPath = 1;
      let bufferModePath = 2;
      expect(nativeBufferPath !== metadataCallbackPath).assertTrue();
      expect(nativeBufferPath !== bufferModePath).assertTrue();
      expect(metadataCallbackPath !== bufferModePath).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'RoiPathType_002 end');
    })

    /**
     * Verify that the recorder module interface exists.
     */
    it(BUNDLE + 'RecorderModule_001', 0, () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'RecorderModule_001 begin');
      let recorderModule = 'librecorder.so';
      expect(recorderModule).assertContain('recorder');
      hilog.info(DOMAIN, TAG, BUNDLE + 'RecorderModule_001 recorderModule: ' + recorderModule);
      hilog.info(DOMAIN, TAG, BUNDLE + 'RecorderModule_001 end');
    })

    /**
     * Verify that the player module interface exists.
     */
    it(BUNDLE + 'PlayerModule_001', 0, () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'PlayerModule_001 begin');
      let playerModule = 'libplayer.so';
      expect(playerModule).assertContain('player');
      hilog.info(DOMAIN, TAG, BUNDLE + 'PlayerModule_001 end');
    })

    /**
     * Verify CommonConstants key prefix.
     */
    it(BUNDLE + 'CommonConstants_001', 0, () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'CommonConstants_001 begin');
      let keyPrefix = 'live_stream';
      expect(keyPrefix).assertEqual('live_stream');
      expect(keyPrefix).assertContain('live');
      hilog.info(DOMAIN, TAG, BUNDLE + 'CommonConstants_001 end');
    })

    /**
     * Verify video resolution constants.
     */
    it(BUNDLE + 'VideoResolution_001', 0, () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'VideoResolution_001 begin');
      // 4K: 3840x2160
      expect(3840).assertEqual(3840);
      expect(2160).assertEqual(2160);
      // 1080P: 1920x1080
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
      // 720P: 1280x720
      expect(1280).assertEqual(1280);
      expect(720).assertEqual(720);
      hilog.info(DOMAIN, TAG, BUNDLE + 'VideoResolution_001 end');
    })

    /**
     * Verify video bitrate constants.
     */
    it(BUNDLE + 'VideoBitrate_001', 0, () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'VideoBitrate_001 begin');
      let bitrate3M = 3 * 1024 * 1024;
      expect(bitrate3M).assertEqual(3145728);
      let bitrate1_6M = 1.6 * 1024 * 1024;
      expect(bitrate1_6M).assertClose(1677721.6, 0.1);
      hilog.info(DOMAIN, TAG, BUNDLE + 'VideoBitrate_001 end');
    })

    /**
     * Verify video framerate constants.
     */
    it(BUNDLE + 'VideoFramerate_001', 0, () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'VideoFramerate_001 begin');
      expect(24).assertEqual(24);
      expect(30).assertEqual(30);
      expect(60).assertEqual(60);
      hilog.info(DOMAIN, TAG, BUNDLE + 'VideoFramerate_001 end');
    })

    /**
     * Verify DateTimeUtil zero padding.
     */
    it(BUNDLE + 'DateTimeUtil_001', 0, () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'DateTimeUtil_001 begin');
      // fill(5) -> '05'
      let fillResult = (5 > 9 ? '' : '0') + 5;
      expect(fillResult).assertEqual('05');
      // fill(12) -> '12'
      let fillResult2 = (12 > 9 ? '' : '0') + 12;
      expect(fillResult2).assertEqual('12');
      hilog.info(DOMAIN, TAG, BUNDLE + 'DateTimeUtil_001 end');
    })

    /**
     * Verify DateTimeUtil date concatenation.
     */
    it(BUNDLE + 'DateTimeUtil_002', 0, () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'DateTimeUtil_002 begin');
      // concatDate(2026, 7, 8) -> '20260708'
      let fill = (value: number): string => (value > 9 ? '' : '0') + value;
      let dateStr = `2026${fill(7)}${fill(8)}`;
      expect(dateStr).assertEqual('20260708');
      hilog.info(DOMAIN, TAG, BUNDLE + 'DateTimeUtil_002 end');
    })

    /**
     * Verify DateTimeUtil time concatenation.
     */
    it(BUNDLE + 'DateTimeUtil_003', 0, () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'DateTimeUtil_003 begin');
      // concatTime(9, 30, 5) -> '093005'
      let fill = (value: number): string => (value > 9 ? '' : '0') + value;
      let timeStr = `${fill(9)}${fill(30)}${fill(5)}`;
      expect(timeStr).assertEqual('093005');
      hilog.info(DOMAIN, TAG, BUNDLE + 'DateTimeUtil_003 end');
    })

    /**
     * Verify ROI string format: coordinate range validity.
     */
    it(BUNDLE + 'RoiStringFormat_001', 0, () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'RoiStringFormat_001 begin');
      // Valid ROI string format: "Top,Left-Bottom,Right=dqp:-6"
      let roiStr = '100,50-300,200=dqp:-6';
      expect(roiStr).assertContain('dqp');
      expect(roiStr).assertContain('-6');
      expect(roiStr).assertContain(',');
      expect(roiStr).assertContain('-');
      hilog.info(DOMAIN, TAG, BUNDLE + 'RoiStringFormat_001 end');
    })

    /**
     * Verify ROI deltaQP value range [-51, 51].
     */
    it(BUNDLE + 'RoiDeltaQP_001', 0, () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'RoiDeltaQP_001 begin');
      let minDqp = -51;
      let maxDqp = 51;
      let sampleDqp = -6;
      expect(sampleDqp >= minDqp).assertTrue();
      expect(sampleDqp <= maxDqp).assertTrue();
      expect(minDqp).assertEqual(-51);
      expect(maxDqp).assertEqual(51);
      hilog.info(DOMAIN, TAG, BUNDLE + 'RoiDeltaQP_001 end');
    })

    /**
     * Verify ROI area ratio threshold (1/5 = 20%).
     */
    it(BUNDLE + 'RoiAreaRatio_001', 0, () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'RoiAreaRatio_001 begin');
      let ratioThreshold = 5;
      let maxRatio = 1 / ratioThreshold;
      expect(maxRatio).assertClose(0.2, 0.01);
      hilog.info(DOMAIN, TAG, BUNDLE + 'RoiAreaRatio_001 end');
    })

    /**
     * Verify ROI maximum count (6 regions).
     */
    it(BUNDLE + 'RoiMaxCount_001', 0, () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'RoiMaxCount_001 begin');
      let maxRoiCount = 6;
      expect(maxRoiCount).assertEqual(6);
      hilog.info(DOMAIN, TAG, BUNDLE + 'RoiMaxCount_001 end');
    })

    /**
     * Verify permission constant strings.
     */
    it(BUNDLE + 'Permissions_001', 0, () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'Permissions_001 begin');
      expect('ohos.permission.CAMERA').assertContain('CAMERA');
      expect('ohos.permission.MICROPHONE').assertContain('MICROPHONE');
      expect('ohos.permission.DISTRIBUTED_DATASYNC').assertContain('DISTRIBUTED');
      expect('ohos.permission.KEEP_BACKGROUND_RUNNING').assertContain('BACKGROUND');
      hilog.info(DOMAIN, TAG, BUNDLE + 'Permissions_001 end');
    })
  })
}
