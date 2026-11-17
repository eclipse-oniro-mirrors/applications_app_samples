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
import AVSessionManager from '@ohos.multimedia.avsession';
import { hilog } from '@kit.PerformanceAnalysisKit';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function mediaControllerVolumeTestPart06() {
  describe('MediaControllerVolumePart06', () => {
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0401
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0401
     * @tc.desc   Verify metadata and session map volume case 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0401 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0401', title: 'Volume Track 0401', artist: 'Volume Artist 0401' };
      expect(metadata.assetId).assertEqual('volume-asset-0401');
      expect(metadata.title === 'Volume Track 0401').assertTrue();
      expect(metadata.artist === 'Volume Artist 0401').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0401', 'Volume Track 0401');
      expect(map.get('volume-session-0401') === 'Volume Track 0401').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0401 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0402
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0402
     * @tc.desc   Verify metadata and session map volume case 402.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0402', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0402 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0402', title: 'Volume Track 0402', artist: 'Volume Artist 0402' };
      expect(metadata.assetId).assertEqual('volume-asset-0402');
      expect(metadata.title === 'Volume Track 0402').assertTrue();
      expect(metadata.artist === 'Volume Artist 0402').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0402', 'Volume Track 0402');
      expect(map.get('volume-session-0402') === 'Volume Track 0402').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0402 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0403
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0403
     * @tc.desc   Verify metadata and session map volume case 403.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0403', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0403 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0403', title: 'Volume Track 0403', artist: 'Volume Artist 0403' };
      expect(metadata.assetId).assertEqual('volume-asset-0403');
      expect(metadata.title === 'Volume Track 0403').assertTrue();
      expect(metadata.artist === 'Volume Artist 0403').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0403', 'Volume Track 0403');
      expect(map.get('volume-session-0403') === 'Volume Track 0403').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0403 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0404
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0404
     * @tc.desc   Verify metadata and session map volume case 404.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0404', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0404 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0404', title: 'Volume Track 0404', artist: 'Volume Artist 0404' };
      expect(metadata.assetId).assertEqual('volume-asset-0404');
      expect(metadata.title === 'Volume Track 0404').assertTrue();
      expect(metadata.artist === 'Volume Artist 0404').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0404', 'Volume Track 0404');
      expect(map.get('volume-session-0404') === 'Volume Track 0404').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0404 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0405
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0405
     * @tc.desc   Verify metadata and session map volume case 405.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0405', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0405 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0405', title: 'Volume Track 0405', artist: 'Volume Artist 0405' };
      expect(metadata.assetId).assertEqual('volume-asset-0405');
      expect(metadata.title === 'Volume Track 0405').assertTrue();
      expect(metadata.artist === 'Volume Artist 0405').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0405', 'Volume Track 0405');
      expect(map.get('volume-session-0405') === 'Volume Track 0405').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0405 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0406
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0406
     * @tc.desc   Verify metadata and session map volume case 406.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0406', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0406 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0406', title: 'Volume Track 0406', artist: 'Volume Artist 0406' };
      expect(metadata.assetId).assertEqual('volume-asset-0406');
      expect(metadata.title === 'Volume Track 0406').assertTrue();
      expect(metadata.artist === 'Volume Artist 0406').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0406', 'Volume Track 0406');
      expect(map.get('volume-session-0406') === 'Volume Track 0406').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0406 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0407
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0407
     * @tc.desc   Verify metadata and session map volume case 407.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0407', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0407 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0407', title: 'Volume Track 0407', artist: 'Volume Artist 0407' };
      expect(metadata.assetId).assertEqual('volume-asset-0407');
      expect(metadata.title === 'Volume Track 0407').assertTrue();
      expect(metadata.artist === 'Volume Artist 0407').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0407', 'Volume Track 0407');
      expect(map.get('volume-session-0407') === 'Volume Track 0407').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0407 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0408
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0408
     * @tc.desc   Verify metadata and session map volume case 408.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0408', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0408 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0408', title: 'Volume Track 0408', artist: 'Volume Artist 0408' };
      expect(metadata.assetId).assertEqual('volume-asset-0408');
      expect(metadata.title === 'Volume Track 0408').assertTrue();
      expect(metadata.artist === 'Volume Artist 0408').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0408', 'Volume Track 0408');
      expect(map.get('volume-session-0408') === 'Volume Track 0408').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0408 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0409
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0409
     * @tc.desc   Verify metadata and session map volume case 409.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0409', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0409 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0409', title: 'Volume Track 0409', artist: 'Volume Artist 0409' };
      expect(metadata.assetId).assertEqual('volume-asset-0409');
      expect(metadata.title === 'Volume Track 0409').assertTrue();
      expect(metadata.artist === 'Volume Artist 0409').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0409', 'Volume Track 0409');
      expect(map.get('volume-session-0409') === 'Volume Track 0409').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0409 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0410
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0410
     * @tc.desc   Verify metadata and session map volume case 410.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0410 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0410', title: 'Volume Track 0410', artist: 'Volume Artist 0410' };
      expect(metadata.assetId).assertEqual('volume-asset-0410');
      expect(metadata.title === 'Volume Track 0410').assertTrue();
      expect(metadata.artist === 'Volume Artist 0410').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0410', 'Volume Track 0410');
      expect(map.get('volume-session-0410') === 'Volume Track 0410').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0410 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0411
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0411
     * @tc.desc   Verify metadata and session map volume case 411.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0411', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0411 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0411', title: 'Volume Track 0411', artist: 'Volume Artist 0411' };
      expect(metadata.assetId).assertEqual('volume-asset-0411');
      expect(metadata.title === 'Volume Track 0411').assertTrue();
      expect(metadata.artist === 'Volume Artist 0411').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0411', 'Volume Track 0411');
      expect(map.get('volume-session-0411') === 'Volume Track 0411').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0411 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0412
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0412
     * @tc.desc   Verify metadata and session map volume case 412.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0412', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0412 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0412', title: 'Volume Track 0412', artist: 'Volume Artist 0412' };
      expect(metadata.assetId).assertEqual('volume-asset-0412');
      expect(metadata.title === 'Volume Track 0412').assertTrue();
      expect(metadata.artist === 'Volume Artist 0412').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0412', 'Volume Track 0412');
      expect(map.get('volume-session-0412') === 'Volume Track 0412').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0412 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0413
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0413
     * @tc.desc   Verify metadata and session map volume case 413.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0413', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0413 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0413', title: 'Volume Track 0413', artist: 'Volume Artist 0413' };
      expect(metadata.assetId).assertEqual('volume-asset-0413');
      expect(metadata.title === 'Volume Track 0413').assertTrue();
      expect(metadata.artist === 'Volume Artist 0413').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0413', 'Volume Track 0413');
      expect(map.get('volume-session-0413') === 'Volume Track 0413').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0413 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0414
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0414
     * @tc.desc   Verify metadata and session map volume case 414.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0414', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0414 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0414', title: 'Volume Track 0414', artist: 'Volume Artist 0414' };
      expect(metadata.assetId).assertEqual('volume-asset-0414');
      expect(metadata.title === 'Volume Track 0414').assertTrue();
      expect(metadata.artist === 'Volume Artist 0414').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0414', 'Volume Track 0414');
      expect(map.get('volume-session-0414') === 'Volume Track 0414').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0414 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0415
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0415
     * @tc.desc   Verify metadata and session map volume case 415.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0415', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0415 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0415', title: 'Volume Track 0415', artist: 'Volume Artist 0415' };
      expect(metadata.assetId).assertEqual('volume-asset-0415');
      expect(metadata.title === 'Volume Track 0415').assertTrue();
      expect(metadata.artist === 'Volume Artist 0415').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0415', 'Volume Track 0415');
      expect(map.get('volume-session-0415') === 'Volume Track 0415').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0415 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0416
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0416
     * @tc.desc   Verify metadata and session map volume case 416.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0416', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0416 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0416', title: 'Volume Track 0416', artist: 'Volume Artist 0416' };
      expect(metadata.assetId).assertEqual('volume-asset-0416');
      expect(metadata.title === 'Volume Track 0416').assertTrue();
      expect(metadata.artist === 'Volume Artist 0416').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0416', 'Volume Track 0416');
      expect(map.get('volume-session-0416') === 'Volume Track 0416').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0416 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0417
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0417
     * @tc.desc   Verify metadata and session map volume case 417.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0417', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0417 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0417', title: 'Volume Track 0417', artist: 'Volume Artist 0417' };
      expect(metadata.assetId).assertEqual('volume-asset-0417');
      expect(metadata.title === 'Volume Track 0417').assertTrue();
      expect(metadata.artist === 'Volume Artist 0417').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0417', 'Volume Track 0417');
      expect(map.get('volume-session-0417') === 'Volume Track 0417').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0417 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0418
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0418
     * @tc.desc   Verify metadata and session map volume case 418.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0418', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0418 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0418', title: 'Volume Track 0418', artist: 'Volume Artist 0418' };
      expect(metadata.assetId).assertEqual('volume-asset-0418');
      expect(metadata.title === 'Volume Track 0418').assertTrue();
      expect(metadata.artist === 'Volume Artist 0418').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0418', 'Volume Track 0418');
      expect(map.get('volume-session-0418') === 'Volume Track 0418').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0418 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0419
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0419
     * @tc.desc   Verify metadata and session map volume case 419.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0419', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0419 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0419', title: 'Volume Track 0419', artist: 'Volume Artist 0419' };
      expect(metadata.assetId).assertEqual('volume-asset-0419');
      expect(metadata.title === 'Volume Track 0419').assertTrue();
      expect(metadata.artist === 'Volume Artist 0419').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0419', 'Volume Track 0419');
      expect(map.get('volume-session-0419') === 'Volume Track 0419').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0419 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0420
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0420
     * @tc.desc   Verify metadata and session map volume case 420.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0420', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0420 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0420', title: 'Volume Track 0420', artist: 'Volume Artist 0420' };
      expect(metadata.assetId).assertEqual('volume-asset-0420');
      expect(metadata.title === 'Volume Track 0420').assertTrue();
      expect(metadata.artist === 'Volume Artist 0420').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0420', 'Volume Track 0420');
      expect(map.get('volume-session-0420') === 'Volume Track 0420').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0420 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0421
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0421
     * @tc.desc   Verify metadata and session map volume case 421.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0421', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0421 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0421', title: 'Volume Track 0421', artist: 'Volume Artist 0421' };
      expect(metadata.assetId).assertEqual('volume-asset-0421');
      expect(metadata.title === 'Volume Track 0421').assertTrue();
      expect(metadata.artist === 'Volume Artist 0421').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0421', 'Volume Track 0421');
      expect(map.get('volume-session-0421') === 'Volume Track 0421').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0421 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0422
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0422
     * @tc.desc   Verify metadata and session map volume case 422.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0422', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0422 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0422', title: 'Volume Track 0422', artist: 'Volume Artist 0422' };
      expect(metadata.assetId).assertEqual('volume-asset-0422');
      expect(metadata.title === 'Volume Track 0422').assertTrue();
      expect(metadata.artist === 'Volume Artist 0422').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0422', 'Volume Track 0422');
      expect(map.get('volume-session-0422') === 'Volume Track 0422').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0422 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0423
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0423
     * @tc.desc   Verify metadata and session map volume case 423.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0423', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0423 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0423', title: 'Volume Track 0423', artist: 'Volume Artist 0423' };
      expect(metadata.assetId).assertEqual('volume-asset-0423');
      expect(metadata.title === 'Volume Track 0423').assertTrue();
      expect(metadata.artist === 'Volume Artist 0423').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0423', 'Volume Track 0423');
      expect(map.get('volume-session-0423') === 'Volume Track 0423').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0423 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0424
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0424
     * @tc.desc   Verify metadata and session map volume case 424.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0424', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0424 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0424', title: 'Volume Track 0424', artist: 'Volume Artist 0424' };
      expect(metadata.assetId).assertEqual('volume-asset-0424');
      expect(metadata.title === 'Volume Track 0424').assertTrue();
      expect(metadata.artist === 'Volume Artist 0424').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0424', 'Volume Track 0424');
      expect(map.get('volume-session-0424') === 'Volume Track 0424').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0424 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0425
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0425
     * @tc.desc   Verify metadata and session map volume case 425.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0425', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0425 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0425', title: 'Volume Track 0425', artist: 'Volume Artist 0425' };
      expect(metadata.assetId).assertEqual('volume-asset-0425');
      expect(metadata.title === 'Volume Track 0425').assertTrue();
      expect(metadata.artist === 'Volume Artist 0425').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0425', 'Volume Track 0425');
      expect(map.get('volume-session-0425') === 'Volume Track 0425').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0425 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0426
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0426
     * @tc.desc   Verify metadata and session map volume case 426.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0426', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0426 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0426', title: 'Volume Track 0426', artist: 'Volume Artist 0426' };
      expect(metadata.assetId).assertEqual('volume-asset-0426');
      expect(metadata.title === 'Volume Track 0426').assertTrue();
      expect(metadata.artist === 'Volume Artist 0426').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0426', 'Volume Track 0426');
      expect(map.get('volume-session-0426') === 'Volume Track 0426').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0426 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0427
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0427
     * @tc.desc   Verify metadata and session map volume case 427.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0427', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0427 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0427', title: 'Volume Track 0427', artist: 'Volume Artist 0427' };
      expect(metadata.assetId).assertEqual('volume-asset-0427');
      expect(metadata.title === 'Volume Track 0427').assertTrue();
      expect(metadata.artist === 'Volume Artist 0427').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0427', 'Volume Track 0427');
      expect(map.get('volume-session-0427') === 'Volume Track 0427').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0427 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0428
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0428
     * @tc.desc   Verify metadata and session map volume case 428.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0428', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0428 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0428', title: 'Volume Track 0428', artist: 'Volume Artist 0428' };
      expect(metadata.assetId).assertEqual('volume-asset-0428');
      expect(metadata.title === 'Volume Track 0428').assertTrue();
      expect(metadata.artist === 'Volume Artist 0428').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0428', 'Volume Track 0428');
      expect(map.get('volume-session-0428') === 'Volume Track 0428').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0428 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0429
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0429
     * @tc.desc   Verify metadata and session map volume case 429.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0429', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0429 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0429', title: 'Volume Track 0429', artist: 'Volume Artist 0429' };
      expect(metadata.assetId).assertEqual('volume-asset-0429');
      expect(metadata.title === 'Volume Track 0429').assertTrue();
      expect(metadata.artist === 'Volume Artist 0429').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0429', 'Volume Track 0429');
      expect(map.get('volume-session-0429') === 'Volume Track 0429').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0429 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0430
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0430
     * @tc.desc   Verify metadata and session map volume case 430.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0430', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0430 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0430', title: 'Volume Track 0430', artist: 'Volume Artist 0430' };
      expect(metadata.assetId).assertEqual('volume-asset-0430');
      expect(metadata.title === 'Volume Track 0430').assertTrue();
      expect(metadata.artist === 'Volume Artist 0430').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0430', 'Volume Track 0430');
      expect(map.get('volume-session-0430') === 'Volume Track 0430').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0430 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0431
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0431
     * @tc.desc   Verify metadata and session map volume case 431.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0431', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0431 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0431', title: 'Volume Track 0431', artist: 'Volume Artist 0431' };
      expect(metadata.assetId).assertEqual('volume-asset-0431');
      expect(metadata.title === 'Volume Track 0431').assertTrue();
      expect(metadata.artist === 'Volume Artist 0431').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0431', 'Volume Track 0431');
      expect(map.get('volume-session-0431') === 'Volume Track 0431').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0431 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0432
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0432
     * @tc.desc   Verify metadata and session map volume case 432.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0432', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0432 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0432', title: 'Volume Track 0432', artist: 'Volume Artist 0432' };
      expect(metadata.assetId).assertEqual('volume-asset-0432');
      expect(metadata.title === 'Volume Track 0432').assertTrue();
      expect(metadata.artist === 'Volume Artist 0432').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0432', 'Volume Track 0432');
      expect(map.get('volume-session-0432') === 'Volume Track 0432').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0432 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0433
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0433
     * @tc.desc   Verify metadata and session map volume case 433.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0433', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0433 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0433', title: 'Volume Track 0433', artist: 'Volume Artist 0433' };
      expect(metadata.assetId).assertEqual('volume-asset-0433');
      expect(metadata.title === 'Volume Track 0433').assertTrue();
      expect(metadata.artist === 'Volume Artist 0433').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0433', 'Volume Track 0433');
      expect(map.get('volume-session-0433') === 'Volume Track 0433').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0433 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0434
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0434
     * @tc.desc   Verify metadata and session map volume case 434.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0434', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0434 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0434', title: 'Volume Track 0434', artist: 'Volume Artist 0434' };
      expect(metadata.assetId).assertEqual('volume-asset-0434');
      expect(metadata.title === 'Volume Track 0434').assertTrue();
      expect(metadata.artist === 'Volume Artist 0434').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0434', 'Volume Track 0434');
      expect(map.get('volume-session-0434') === 'Volume Track 0434').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0434 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0435
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0435
     * @tc.desc   Verify metadata and session map volume case 435.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0435', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0435 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0435', title: 'Volume Track 0435', artist: 'Volume Artist 0435' };
      expect(metadata.assetId).assertEqual('volume-asset-0435');
      expect(metadata.title === 'Volume Track 0435').assertTrue();
      expect(metadata.artist === 'Volume Artist 0435').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0435', 'Volume Track 0435');
      expect(map.get('volume-session-0435') === 'Volume Track 0435').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0435 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0436
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0436
     * @tc.desc   Verify metadata and session map volume case 436.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0436', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0436 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0436', title: 'Volume Track 0436', artist: 'Volume Artist 0436' };
      expect(metadata.assetId).assertEqual('volume-asset-0436');
      expect(metadata.title === 'Volume Track 0436').assertTrue();
      expect(metadata.artist === 'Volume Artist 0436').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0436', 'Volume Track 0436');
      expect(map.get('volume-session-0436') === 'Volume Track 0436').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0436 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0437
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0437
     * @tc.desc   Verify metadata and session map volume case 437.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0437', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0437 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0437', title: 'Volume Track 0437', artist: 'Volume Artist 0437' };
      expect(metadata.assetId).assertEqual('volume-asset-0437');
      expect(metadata.title === 'Volume Track 0437').assertTrue();
      expect(metadata.artist === 'Volume Artist 0437').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0437', 'Volume Track 0437');
      expect(map.get('volume-session-0437') === 'Volume Track 0437').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0437 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0438
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0438
     * @tc.desc   Verify metadata and session map volume case 438.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0438', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0438 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0438', title: 'Volume Track 0438', artist: 'Volume Artist 0438' };
      expect(metadata.assetId).assertEqual('volume-asset-0438');
      expect(metadata.title === 'Volume Track 0438').assertTrue();
      expect(metadata.artist === 'Volume Artist 0438').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0438', 'Volume Track 0438');
      expect(map.get('volume-session-0438') === 'Volume Track 0438').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0438 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0439
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0439
     * @tc.desc   Verify metadata and session map volume case 439.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0439', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0439 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0439', title: 'Volume Track 0439', artist: 'Volume Artist 0439' };
      expect(metadata.assetId).assertEqual('volume-asset-0439');
      expect(metadata.title === 'Volume Track 0439').assertTrue();
      expect(metadata.artist === 'Volume Artist 0439').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0439', 'Volume Track 0439');
      expect(map.get('volume-session-0439') === 'Volume Track 0439').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0439 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0440
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0440
     * @tc.desc   Verify metadata and session map volume case 440.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0440', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0440 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0440', title: 'Volume Track 0440', artist: 'Volume Artist 0440' };
      expect(metadata.assetId).assertEqual('volume-asset-0440');
      expect(metadata.title === 'Volume Track 0440').assertTrue();
      expect(metadata.artist === 'Volume Artist 0440').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0440', 'Volume Track 0440');
      expect(map.get('volume-session-0440') === 'Volume Track 0440').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0440 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0441
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0441
     * @tc.desc   Verify metadata and session map volume case 441.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0441', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0441 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0441', title: 'Volume Track 0441', artist: 'Volume Artist 0441' };
      expect(metadata.assetId).assertEqual('volume-asset-0441');
      expect(metadata.title === 'Volume Track 0441').assertTrue();
      expect(metadata.artist === 'Volume Artist 0441').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0441', 'Volume Track 0441');
      expect(map.get('volume-session-0441') === 'Volume Track 0441').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0441 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0442
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0442
     * @tc.desc   Verify metadata and session map volume case 442.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0442', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0442 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0442', title: 'Volume Track 0442', artist: 'Volume Artist 0442' };
      expect(metadata.assetId).assertEqual('volume-asset-0442');
      expect(metadata.title === 'Volume Track 0442').assertTrue();
      expect(metadata.artist === 'Volume Artist 0442').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0442', 'Volume Track 0442');
      expect(map.get('volume-session-0442') === 'Volume Track 0442').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0442 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0443
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0443
     * @tc.desc   Verify metadata and session map volume case 443.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0443', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0443 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0443', title: 'Volume Track 0443', artist: 'Volume Artist 0443' };
      expect(metadata.assetId).assertEqual('volume-asset-0443');
      expect(metadata.title === 'Volume Track 0443').assertTrue();
      expect(metadata.artist === 'Volume Artist 0443').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0443', 'Volume Track 0443');
      expect(map.get('volume-session-0443') === 'Volume Track 0443').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0443 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0444
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0444
     * @tc.desc   Verify metadata and session map volume case 444.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0444', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0444 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0444', title: 'Volume Track 0444', artist: 'Volume Artist 0444' };
      expect(metadata.assetId).assertEqual('volume-asset-0444');
      expect(metadata.title === 'Volume Track 0444').assertTrue();
      expect(metadata.artist === 'Volume Artist 0444').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0444', 'Volume Track 0444');
      expect(map.get('volume-session-0444') === 'Volume Track 0444').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0444 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0445
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0445
     * @tc.desc   Verify metadata and session map volume case 445.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0445', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0445 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0445', title: 'Volume Track 0445', artist: 'Volume Artist 0445' };
      expect(metadata.assetId).assertEqual('volume-asset-0445');
      expect(metadata.title === 'Volume Track 0445').assertTrue();
      expect(metadata.artist === 'Volume Artist 0445').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0445', 'Volume Track 0445');
      expect(map.get('volume-session-0445') === 'Volume Track 0445').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0445 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0446
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0446
     * @tc.desc   Verify metadata and session map volume case 446.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0446', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0446 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0446', title: 'Volume Track 0446', artist: 'Volume Artist 0446' };
      expect(metadata.assetId).assertEqual('volume-asset-0446');
      expect(metadata.title === 'Volume Track 0446').assertTrue();
      expect(metadata.artist === 'Volume Artist 0446').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0446', 'Volume Track 0446');
      expect(map.get('volume-session-0446') === 'Volume Track 0446').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0446 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0447
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0447
     * @tc.desc   Verify metadata and session map volume case 447.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0447', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0447 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0447', title: 'Volume Track 0447', artist: 'Volume Artist 0447' };
      expect(metadata.assetId).assertEqual('volume-asset-0447');
      expect(metadata.title === 'Volume Track 0447').assertTrue();
      expect(metadata.artist === 'Volume Artist 0447').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0447', 'Volume Track 0447');
      expect(map.get('volume-session-0447') === 'Volume Track 0447').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0447 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0448
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0448
     * @tc.desc   Verify metadata and session map volume case 448.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0448', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0448 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0448', title: 'Volume Track 0448', artist: 'Volume Artist 0448' };
      expect(metadata.assetId).assertEqual('volume-asset-0448');
      expect(metadata.title === 'Volume Track 0448').assertTrue();
      expect(metadata.artist === 'Volume Artist 0448').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0448', 'Volume Track 0448');
      expect(map.get('volume-session-0448') === 'Volume Track 0448').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0448 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0449
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0449
     * @tc.desc   Verify metadata and session map volume case 449.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0449', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0449 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0449', title: 'Volume Track 0449', artist: 'Volume Artist 0449' };
      expect(metadata.assetId).assertEqual('volume-asset-0449');
      expect(metadata.title === 'Volume Track 0449').assertTrue();
      expect(metadata.artist === 'Volume Artist 0449').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0449', 'Volume Track 0449');
      expect(map.get('volume-session-0449') === 'Volume Track 0449').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0449 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0450
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0450
     * @tc.desc   Verify metadata and session map volume case 450.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0450 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0450', title: 'Volume Track 0450', artist: 'Volume Artist 0450' };
      expect(metadata.assetId).assertEqual('volume-asset-0450');
      expect(metadata.title === 'Volume Track 0450').assertTrue();
      expect(metadata.artist === 'Volume Artist 0450').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0450', 'Volume Track 0450');
      expect(map.get('volume-session-0450') === 'Volume Track 0450').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0450 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0451
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0451
     * @tc.desc   Verify metadata and session map volume case 451.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0451', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0451 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0451', title: 'Volume Track 0451', artist: 'Volume Artist 0451' };
      expect(metadata.assetId).assertEqual('volume-asset-0451');
      expect(metadata.title === 'Volume Track 0451').assertTrue();
      expect(metadata.artist === 'Volume Artist 0451').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0451', 'Volume Track 0451');
      expect(map.get('volume-session-0451') === 'Volume Track 0451').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0451 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0452
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0452
     * @tc.desc   Verify metadata and session map volume case 452.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0452', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0452 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0452', title: 'Volume Track 0452', artist: 'Volume Artist 0452' };
      expect(metadata.assetId).assertEqual('volume-asset-0452');
      expect(metadata.title === 'Volume Track 0452').assertTrue();
      expect(metadata.artist === 'Volume Artist 0452').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0452', 'Volume Track 0452');
      expect(map.get('volume-session-0452') === 'Volume Track 0452').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0452 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0453
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0453
     * @tc.desc   Verify metadata and session map volume case 453.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0453', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0453 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0453', title: 'Volume Track 0453', artist: 'Volume Artist 0453' };
      expect(metadata.assetId).assertEqual('volume-asset-0453');
      expect(metadata.title === 'Volume Track 0453').assertTrue();
      expect(metadata.artist === 'Volume Artist 0453').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0453', 'Volume Track 0453');
      expect(map.get('volume-session-0453') === 'Volume Track 0453').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0453 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0454
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0454
     * @tc.desc   Verify metadata and session map volume case 454.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0454', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0454 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0454', title: 'Volume Track 0454', artist: 'Volume Artist 0454' };
      expect(metadata.assetId).assertEqual('volume-asset-0454');
      expect(metadata.title === 'Volume Track 0454').assertTrue();
      expect(metadata.artist === 'Volume Artist 0454').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0454', 'Volume Track 0454');
      expect(map.get('volume-session-0454') === 'Volume Track 0454').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0454 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0455
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0455
     * @tc.desc   Verify metadata and session map volume case 455.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0455', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0455 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0455', title: 'Volume Track 0455', artist: 'Volume Artist 0455' };
      expect(metadata.assetId).assertEqual('volume-asset-0455');
      expect(metadata.title === 'Volume Track 0455').assertTrue();
      expect(metadata.artist === 'Volume Artist 0455').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0455', 'Volume Track 0455');
      expect(map.get('volume-session-0455') === 'Volume Track 0455').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0455 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0456
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0456
     * @tc.desc   Verify metadata and session map volume case 456.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0456', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0456 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0456', title: 'Volume Track 0456', artist: 'Volume Artist 0456' };
      expect(metadata.assetId).assertEqual('volume-asset-0456');
      expect(metadata.title === 'Volume Track 0456').assertTrue();
      expect(metadata.artist === 'Volume Artist 0456').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0456', 'Volume Track 0456');
      expect(map.get('volume-session-0456') === 'Volume Track 0456').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0456 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0457
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0457
     * @tc.desc   Verify metadata and session map volume case 457.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0457', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0457 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0457', title: 'Volume Track 0457', artist: 'Volume Artist 0457' };
      expect(metadata.assetId).assertEqual('volume-asset-0457');
      expect(metadata.title === 'Volume Track 0457').assertTrue();
      expect(metadata.artist === 'Volume Artist 0457').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0457', 'Volume Track 0457');
      expect(map.get('volume-session-0457') === 'Volume Track 0457').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0457 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0458
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0458
     * @tc.desc   Verify metadata and session map volume case 458.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0458', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0458 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0458', title: 'Volume Track 0458', artist: 'Volume Artist 0458' };
      expect(metadata.assetId).assertEqual('volume-asset-0458');
      expect(metadata.title === 'Volume Track 0458').assertTrue();
      expect(metadata.artist === 'Volume Artist 0458').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0458', 'Volume Track 0458');
      expect(map.get('volume-session-0458') === 'Volume Track 0458').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0458 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0459
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0459
     * @tc.desc   Verify metadata and session map volume case 459.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0459', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0459 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0459', title: 'Volume Track 0459', artist: 'Volume Artist 0459' };
      expect(metadata.assetId).assertEqual('volume-asset-0459');
      expect(metadata.title === 'Volume Track 0459').assertTrue();
      expect(metadata.artist === 'Volume Artist 0459').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0459', 'Volume Track 0459');
      expect(map.get('volume-session-0459') === 'Volume Track 0459').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0459 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0460
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0460
     * @tc.desc   Verify metadata and session map volume case 460.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0460', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0460 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0460', title: 'Volume Track 0460', artist: 'Volume Artist 0460' };
      expect(metadata.assetId).assertEqual('volume-asset-0460');
      expect(metadata.title === 'Volume Track 0460').assertTrue();
      expect(metadata.artist === 'Volume Artist 0460').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0460', 'Volume Track 0460');
      expect(map.get('volume-session-0460') === 'Volume Track 0460').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0460 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0461
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0461
     * @tc.desc   Verify metadata and session map volume case 461.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0461', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0461 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0461', title: 'Volume Track 0461', artist: 'Volume Artist 0461' };
      expect(metadata.assetId).assertEqual('volume-asset-0461');
      expect(metadata.title === 'Volume Track 0461').assertTrue();
      expect(metadata.artist === 'Volume Artist 0461').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0461', 'Volume Track 0461');
      expect(map.get('volume-session-0461') === 'Volume Track 0461').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0461 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0462
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0462
     * @tc.desc   Verify metadata and session map volume case 462.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0462', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0462 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0462', title: 'Volume Track 0462', artist: 'Volume Artist 0462' };
      expect(metadata.assetId).assertEqual('volume-asset-0462');
      expect(metadata.title === 'Volume Track 0462').assertTrue();
      expect(metadata.artist === 'Volume Artist 0462').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0462', 'Volume Track 0462');
      expect(map.get('volume-session-0462') === 'Volume Track 0462').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0462 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0463
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0463
     * @tc.desc   Verify metadata and session map volume case 463.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0463', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0463 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0463', title: 'Volume Track 0463', artist: 'Volume Artist 0463' };
      expect(metadata.assetId).assertEqual('volume-asset-0463');
      expect(metadata.title === 'Volume Track 0463').assertTrue();
      expect(metadata.artist === 'Volume Artist 0463').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0463', 'Volume Track 0463');
      expect(map.get('volume-session-0463') === 'Volume Track 0463').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0463 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0464
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0464
     * @tc.desc   Verify metadata and session map volume case 464.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0464', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0464 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0464', title: 'Volume Track 0464', artist: 'Volume Artist 0464' };
      expect(metadata.assetId).assertEqual('volume-asset-0464');
      expect(metadata.title === 'Volume Track 0464').assertTrue();
      expect(metadata.artist === 'Volume Artist 0464').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0464', 'Volume Track 0464');
      expect(map.get('volume-session-0464') === 'Volume Track 0464').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0464 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0465
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0465
     * @tc.desc   Verify metadata and session map volume case 465.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0465', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0465 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0465', title: 'Volume Track 0465', artist: 'Volume Artist 0465' };
      expect(metadata.assetId).assertEqual('volume-asset-0465');
      expect(metadata.title === 'Volume Track 0465').assertTrue();
      expect(metadata.artist === 'Volume Artist 0465').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0465', 'Volume Track 0465');
      expect(map.get('volume-session-0465') === 'Volume Track 0465').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0465 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0466
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0466
     * @tc.desc   Verify metadata and session map volume case 466.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0466', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0466 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0466', title: 'Volume Track 0466', artist: 'Volume Artist 0466' };
      expect(metadata.assetId).assertEqual('volume-asset-0466');
      expect(metadata.title === 'Volume Track 0466').assertTrue();
      expect(metadata.artist === 'Volume Artist 0466').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0466', 'Volume Track 0466');
      expect(map.get('volume-session-0466') === 'Volume Track 0466').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0466 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0467
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0467
     * @tc.desc   Verify metadata and session map volume case 467.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0467', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0467 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0467', title: 'Volume Track 0467', artist: 'Volume Artist 0467' };
      expect(metadata.assetId).assertEqual('volume-asset-0467');
      expect(metadata.title === 'Volume Track 0467').assertTrue();
      expect(metadata.artist === 'Volume Artist 0467').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0467', 'Volume Track 0467');
      expect(map.get('volume-session-0467') === 'Volume Track 0467').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0467 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0468
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0468
     * @tc.desc   Verify metadata and session map volume case 468.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0468', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0468 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0468', title: 'Volume Track 0468', artist: 'Volume Artist 0468' };
      expect(metadata.assetId).assertEqual('volume-asset-0468');
      expect(metadata.title === 'Volume Track 0468').assertTrue();
      expect(metadata.artist === 'Volume Artist 0468').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0468', 'Volume Track 0468');
      expect(map.get('volume-session-0468') === 'Volume Track 0468').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0468 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0469
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0469
     * @tc.desc   Verify metadata and session map volume case 469.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0469', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0469 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0469', title: 'Volume Track 0469', artist: 'Volume Artist 0469' };
      expect(metadata.assetId).assertEqual('volume-asset-0469');
      expect(metadata.title === 'Volume Track 0469').assertTrue();
      expect(metadata.artist === 'Volume Artist 0469').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0469', 'Volume Track 0469');
      expect(map.get('volume-session-0469') === 'Volume Track 0469').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0469 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0470
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0470
     * @tc.desc   Verify metadata and session map volume case 470.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0470', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0470 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0470', title: 'Volume Track 0470', artist: 'Volume Artist 0470' };
      expect(metadata.assetId).assertEqual('volume-asset-0470');
      expect(metadata.title === 'Volume Track 0470').assertTrue();
      expect(metadata.artist === 'Volume Artist 0470').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0470', 'Volume Track 0470');
      expect(map.get('volume-session-0470') === 'Volume Track 0470').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0470 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0471
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0471
     * @tc.desc   Verify metadata and session map volume case 471.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0471', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0471 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0471', title: 'Volume Track 0471', artist: 'Volume Artist 0471' };
      expect(metadata.assetId).assertEqual('volume-asset-0471');
      expect(metadata.title === 'Volume Track 0471').assertTrue();
      expect(metadata.artist === 'Volume Artist 0471').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0471', 'Volume Track 0471');
      expect(map.get('volume-session-0471') === 'Volume Track 0471').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0471 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0472
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0472
     * @tc.desc   Verify metadata and session map volume case 472.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0472', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0472 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0472', title: 'Volume Track 0472', artist: 'Volume Artist 0472' };
      expect(metadata.assetId).assertEqual('volume-asset-0472');
      expect(metadata.title === 'Volume Track 0472').assertTrue();
      expect(metadata.artist === 'Volume Artist 0472').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0472', 'Volume Track 0472');
      expect(map.get('volume-session-0472') === 'Volume Track 0472').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0472 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0473
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0473
     * @tc.desc   Verify metadata and session map volume case 473.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0473', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0473 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0473', title: 'Volume Track 0473', artist: 'Volume Artist 0473' };
      expect(metadata.assetId).assertEqual('volume-asset-0473');
      expect(metadata.title === 'Volume Track 0473').assertTrue();
      expect(metadata.artist === 'Volume Artist 0473').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0473', 'Volume Track 0473');
      expect(map.get('volume-session-0473') === 'Volume Track 0473').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0473 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0474
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0474
     * @tc.desc   Verify metadata and session map volume case 474.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0474', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0474 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0474', title: 'Volume Track 0474', artist: 'Volume Artist 0474' };
      expect(metadata.assetId).assertEqual('volume-asset-0474');
      expect(metadata.title === 'Volume Track 0474').assertTrue();
      expect(metadata.artist === 'Volume Artist 0474').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0474', 'Volume Track 0474');
      expect(map.get('volume-session-0474') === 'Volume Track 0474').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0474 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0475
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0475
     * @tc.desc   Verify metadata and session map volume case 475.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0475', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0475 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0475', title: 'Volume Track 0475', artist: 'Volume Artist 0475' };
      expect(metadata.assetId).assertEqual('volume-asset-0475');
      expect(metadata.title === 'Volume Track 0475').assertTrue();
      expect(metadata.artist === 'Volume Artist 0475').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0475', 'Volume Track 0475');
      expect(map.get('volume-session-0475') === 'Volume Track 0475').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0475 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0476
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0476
     * @tc.desc   Verify metadata and session map volume case 476.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0476', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0476 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0476', title: 'Volume Track 0476', artist: 'Volume Artist 0476' };
      expect(metadata.assetId).assertEqual('volume-asset-0476');
      expect(metadata.title === 'Volume Track 0476').assertTrue();
      expect(metadata.artist === 'Volume Artist 0476').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0476', 'Volume Track 0476');
      expect(map.get('volume-session-0476') === 'Volume Track 0476').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0476 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0477
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0477
     * @tc.desc   Verify metadata and session map volume case 477.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0477', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0477 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0477', title: 'Volume Track 0477', artist: 'Volume Artist 0477' };
      expect(metadata.assetId).assertEqual('volume-asset-0477');
      expect(metadata.title === 'Volume Track 0477').assertTrue();
      expect(metadata.artist === 'Volume Artist 0477').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0477', 'Volume Track 0477');
      expect(map.get('volume-session-0477') === 'Volume Track 0477').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0477 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0478
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0478
     * @tc.desc   Verify metadata and session map volume case 478.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0478', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0478 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0478', title: 'Volume Track 0478', artist: 'Volume Artist 0478' };
      expect(metadata.assetId).assertEqual('volume-asset-0478');
      expect(metadata.title === 'Volume Track 0478').assertTrue();
      expect(metadata.artist === 'Volume Artist 0478').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0478', 'Volume Track 0478');
      expect(map.get('volume-session-0478') === 'Volume Track 0478').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0478 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0479
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0479
     * @tc.desc   Verify metadata and session map volume case 479.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0479', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0479 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0479', title: 'Volume Track 0479', artist: 'Volume Artist 0479' };
      expect(metadata.assetId).assertEqual('volume-asset-0479');
      expect(metadata.title === 'Volume Track 0479').assertTrue();
      expect(metadata.artist === 'Volume Artist 0479').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0479', 'Volume Track 0479');
      expect(map.get('volume-session-0479') === 'Volume Track 0479').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0479 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0480
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0480
     * @tc.desc   Verify metadata and session map volume case 480.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0480', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0480 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0480', title: 'Volume Track 0480', artist: 'Volume Artist 0480' };
      expect(metadata.assetId).assertEqual('volume-asset-0480');
      expect(metadata.title === 'Volume Track 0480').assertTrue();
      expect(metadata.artist === 'Volume Artist 0480').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0480', 'Volume Track 0480');
      expect(map.get('volume-session-0480') === 'Volume Track 0480').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0480 end');
    })
  })
}
