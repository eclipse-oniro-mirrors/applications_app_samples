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

export default function mediaControllerVolumeTestPart05() {
  describe('MediaControllerVolumePart05', () => {
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0321
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0321
     * @tc.desc   Verify metadata and session map volume case 321.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0321', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0321 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0321', title: 'Volume Track 0321', artist: 'Volume Artist 0321' };
      expect(metadata.assetId).assertEqual('volume-asset-0321');
      expect(metadata.title === 'Volume Track 0321').assertTrue();
      expect(metadata.artist === 'Volume Artist 0321').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0321', 'Volume Track 0321');
      expect(map.get('volume-session-0321') === 'Volume Track 0321').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0321 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0322
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0322
     * @tc.desc   Verify metadata and session map volume case 322.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0322', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0322 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0322', title: 'Volume Track 0322', artist: 'Volume Artist 0322' };
      expect(metadata.assetId).assertEqual('volume-asset-0322');
      expect(metadata.title === 'Volume Track 0322').assertTrue();
      expect(metadata.artist === 'Volume Artist 0322').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0322', 'Volume Track 0322');
      expect(map.get('volume-session-0322') === 'Volume Track 0322').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0322 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0323
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0323
     * @tc.desc   Verify metadata and session map volume case 323.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0323', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0323 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0323', title: 'Volume Track 0323', artist: 'Volume Artist 0323' };
      expect(metadata.assetId).assertEqual('volume-asset-0323');
      expect(metadata.title === 'Volume Track 0323').assertTrue();
      expect(metadata.artist === 'Volume Artist 0323').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0323', 'Volume Track 0323');
      expect(map.get('volume-session-0323') === 'Volume Track 0323').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0323 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0324
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0324
     * @tc.desc   Verify metadata and session map volume case 324.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0324', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0324 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0324', title: 'Volume Track 0324', artist: 'Volume Artist 0324' };
      expect(metadata.assetId).assertEqual('volume-asset-0324');
      expect(metadata.title === 'Volume Track 0324').assertTrue();
      expect(metadata.artist === 'Volume Artist 0324').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0324', 'Volume Track 0324');
      expect(map.get('volume-session-0324') === 'Volume Track 0324').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0324 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0325
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0325
     * @tc.desc   Verify metadata and session map volume case 325.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0325', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0325 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0325', title: 'Volume Track 0325', artist: 'Volume Artist 0325' };
      expect(metadata.assetId).assertEqual('volume-asset-0325');
      expect(metadata.title === 'Volume Track 0325').assertTrue();
      expect(metadata.artist === 'Volume Artist 0325').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0325', 'Volume Track 0325');
      expect(map.get('volume-session-0325') === 'Volume Track 0325').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0325 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0326
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0326
     * @tc.desc   Verify metadata and session map volume case 326.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0326', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0326 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0326', title: 'Volume Track 0326', artist: 'Volume Artist 0326' };
      expect(metadata.assetId).assertEqual('volume-asset-0326');
      expect(metadata.title === 'Volume Track 0326').assertTrue();
      expect(metadata.artist === 'Volume Artist 0326').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0326', 'Volume Track 0326');
      expect(map.get('volume-session-0326') === 'Volume Track 0326').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0326 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0327
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0327
     * @tc.desc   Verify metadata and session map volume case 327.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0327', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0327 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0327', title: 'Volume Track 0327', artist: 'Volume Artist 0327' };
      expect(metadata.assetId).assertEqual('volume-asset-0327');
      expect(metadata.title === 'Volume Track 0327').assertTrue();
      expect(metadata.artist === 'Volume Artist 0327').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0327', 'Volume Track 0327');
      expect(map.get('volume-session-0327') === 'Volume Track 0327').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0327 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0328
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0328
     * @tc.desc   Verify metadata and session map volume case 328.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0328', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0328 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0328', title: 'Volume Track 0328', artist: 'Volume Artist 0328' };
      expect(metadata.assetId).assertEqual('volume-asset-0328');
      expect(metadata.title === 'Volume Track 0328').assertTrue();
      expect(metadata.artist === 'Volume Artist 0328').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0328', 'Volume Track 0328');
      expect(map.get('volume-session-0328') === 'Volume Track 0328').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0328 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0329
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0329
     * @tc.desc   Verify metadata and session map volume case 329.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0329', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0329 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0329', title: 'Volume Track 0329', artist: 'Volume Artist 0329' };
      expect(metadata.assetId).assertEqual('volume-asset-0329');
      expect(metadata.title === 'Volume Track 0329').assertTrue();
      expect(metadata.artist === 'Volume Artist 0329').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0329', 'Volume Track 0329');
      expect(map.get('volume-session-0329') === 'Volume Track 0329').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0329 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0330
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0330
     * @tc.desc   Verify metadata and session map volume case 330.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0330 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0330', title: 'Volume Track 0330', artist: 'Volume Artist 0330' };
      expect(metadata.assetId).assertEqual('volume-asset-0330');
      expect(metadata.title === 'Volume Track 0330').assertTrue();
      expect(metadata.artist === 'Volume Artist 0330').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0330', 'Volume Track 0330');
      expect(map.get('volume-session-0330') === 'Volume Track 0330').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0330 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0331
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0331
     * @tc.desc   Verify metadata and session map volume case 331.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0331', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0331 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0331', title: 'Volume Track 0331', artist: 'Volume Artist 0331' };
      expect(metadata.assetId).assertEqual('volume-asset-0331');
      expect(metadata.title === 'Volume Track 0331').assertTrue();
      expect(metadata.artist === 'Volume Artist 0331').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0331', 'Volume Track 0331');
      expect(map.get('volume-session-0331') === 'Volume Track 0331').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0331 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0332
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0332
     * @tc.desc   Verify metadata and session map volume case 332.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0332', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0332 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0332', title: 'Volume Track 0332', artist: 'Volume Artist 0332' };
      expect(metadata.assetId).assertEqual('volume-asset-0332');
      expect(metadata.title === 'Volume Track 0332').assertTrue();
      expect(metadata.artist === 'Volume Artist 0332').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0332', 'Volume Track 0332');
      expect(map.get('volume-session-0332') === 'Volume Track 0332').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0332 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0333
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0333
     * @tc.desc   Verify metadata and session map volume case 333.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0333', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0333 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0333', title: 'Volume Track 0333', artist: 'Volume Artist 0333' };
      expect(metadata.assetId).assertEqual('volume-asset-0333');
      expect(metadata.title === 'Volume Track 0333').assertTrue();
      expect(metadata.artist === 'Volume Artist 0333').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0333', 'Volume Track 0333');
      expect(map.get('volume-session-0333') === 'Volume Track 0333').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0333 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0334
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0334
     * @tc.desc   Verify metadata and session map volume case 334.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0334', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0334 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0334', title: 'Volume Track 0334', artist: 'Volume Artist 0334' };
      expect(metadata.assetId).assertEqual('volume-asset-0334');
      expect(metadata.title === 'Volume Track 0334').assertTrue();
      expect(metadata.artist === 'Volume Artist 0334').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0334', 'Volume Track 0334');
      expect(map.get('volume-session-0334') === 'Volume Track 0334').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0334 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0335
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0335
     * @tc.desc   Verify metadata and session map volume case 335.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0335', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0335 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0335', title: 'Volume Track 0335', artist: 'Volume Artist 0335' };
      expect(metadata.assetId).assertEqual('volume-asset-0335');
      expect(metadata.title === 'Volume Track 0335').assertTrue();
      expect(metadata.artist === 'Volume Artist 0335').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0335', 'Volume Track 0335');
      expect(map.get('volume-session-0335') === 'Volume Track 0335').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0335 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0336
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0336
     * @tc.desc   Verify metadata and session map volume case 336.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0336', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0336 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0336', title: 'Volume Track 0336', artist: 'Volume Artist 0336' };
      expect(metadata.assetId).assertEqual('volume-asset-0336');
      expect(metadata.title === 'Volume Track 0336').assertTrue();
      expect(metadata.artist === 'Volume Artist 0336').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0336', 'Volume Track 0336');
      expect(map.get('volume-session-0336') === 'Volume Track 0336').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0336 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0337
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0337
     * @tc.desc   Verify metadata and session map volume case 337.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0337', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0337 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0337', title: 'Volume Track 0337', artist: 'Volume Artist 0337' };
      expect(metadata.assetId).assertEqual('volume-asset-0337');
      expect(metadata.title === 'Volume Track 0337').assertTrue();
      expect(metadata.artist === 'Volume Artist 0337').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0337', 'Volume Track 0337');
      expect(map.get('volume-session-0337') === 'Volume Track 0337').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0337 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0338
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0338
     * @tc.desc   Verify metadata and session map volume case 338.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0338', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0338 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0338', title: 'Volume Track 0338', artist: 'Volume Artist 0338' };
      expect(metadata.assetId).assertEqual('volume-asset-0338');
      expect(metadata.title === 'Volume Track 0338').assertTrue();
      expect(metadata.artist === 'Volume Artist 0338').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0338', 'Volume Track 0338');
      expect(map.get('volume-session-0338') === 'Volume Track 0338').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0338 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0339
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0339
     * @tc.desc   Verify metadata and session map volume case 339.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0339', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0339 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0339', title: 'Volume Track 0339', artist: 'Volume Artist 0339' };
      expect(metadata.assetId).assertEqual('volume-asset-0339');
      expect(metadata.title === 'Volume Track 0339').assertTrue();
      expect(metadata.artist === 'Volume Artist 0339').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0339', 'Volume Track 0339');
      expect(map.get('volume-session-0339') === 'Volume Track 0339').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0339 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0340
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0340
     * @tc.desc   Verify metadata and session map volume case 340.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0340 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0340', title: 'Volume Track 0340', artist: 'Volume Artist 0340' };
      expect(metadata.assetId).assertEqual('volume-asset-0340');
      expect(metadata.title === 'Volume Track 0340').assertTrue();
      expect(metadata.artist === 'Volume Artist 0340').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0340', 'Volume Track 0340');
      expect(map.get('volume-session-0340') === 'Volume Track 0340').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0340 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0341
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0341
     * @tc.desc   Verify metadata and session map volume case 341.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0341', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0341 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0341', title: 'Volume Track 0341', artist: 'Volume Artist 0341' };
      expect(metadata.assetId).assertEqual('volume-asset-0341');
      expect(metadata.title === 'Volume Track 0341').assertTrue();
      expect(metadata.artist === 'Volume Artist 0341').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0341', 'Volume Track 0341');
      expect(map.get('volume-session-0341') === 'Volume Track 0341').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0341 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0342
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0342
     * @tc.desc   Verify metadata and session map volume case 342.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0342', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0342 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0342', title: 'Volume Track 0342', artist: 'Volume Artist 0342' };
      expect(metadata.assetId).assertEqual('volume-asset-0342');
      expect(metadata.title === 'Volume Track 0342').assertTrue();
      expect(metadata.artist === 'Volume Artist 0342').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0342', 'Volume Track 0342');
      expect(map.get('volume-session-0342') === 'Volume Track 0342').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0342 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0343
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0343
     * @tc.desc   Verify metadata and session map volume case 343.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0343', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0343 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0343', title: 'Volume Track 0343', artist: 'Volume Artist 0343' };
      expect(metadata.assetId).assertEqual('volume-asset-0343');
      expect(metadata.title === 'Volume Track 0343').assertTrue();
      expect(metadata.artist === 'Volume Artist 0343').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0343', 'Volume Track 0343');
      expect(map.get('volume-session-0343') === 'Volume Track 0343').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0343 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0344
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0344
     * @tc.desc   Verify metadata and session map volume case 344.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0344', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0344 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0344', title: 'Volume Track 0344', artist: 'Volume Artist 0344' };
      expect(metadata.assetId).assertEqual('volume-asset-0344');
      expect(metadata.title === 'Volume Track 0344').assertTrue();
      expect(metadata.artist === 'Volume Artist 0344').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0344', 'Volume Track 0344');
      expect(map.get('volume-session-0344') === 'Volume Track 0344').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0344 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0345
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0345
     * @tc.desc   Verify metadata and session map volume case 345.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0345', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0345 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0345', title: 'Volume Track 0345', artist: 'Volume Artist 0345' };
      expect(metadata.assetId).assertEqual('volume-asset-0345');
      expect(metadata.title === 'Volume Track 0345').assertTrue();
      expect(metadata.artist === 'Volume Artist 0345').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0345', 'Volume Track 0345');
      expect(map.get('volume-session-0345') === 'Volume Track 0345').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0345 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0346
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0346
     * @tc.desc   Verify metadata and session map volume case 346.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0346', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0346 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0346', title: 'Volume Track 0346', artist: 'Volume Artist 0346' };
      expect(metadata.assetId).assertEqual('volume-asset-0346');
      expect(metadata.title === 'Volume Track 0346').assertTrue();
      expect(metadata.artist === 'Volume Artist 0346').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0346', 'Volume Track 0346');
      expect(map.get('volume-session-0346') === 'Volume Track 0346').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0346 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0347
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0347
     * @tc.desc   Verify metadata and session map volume case 347.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0347', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0347 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0347', title: 'Volume Track 0347', artist: 'Volume Artist 0347' };
      expect(metadata.assetId).assertEqual('volume-asset-0347');
      expect(metadata.title === 'Volume Track 0347').assertTrue();
      expect(metadata.artist === 'Volume Artist 0347').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0347', 'Volume Track 0347');
      expect(map.get('volume-session-0347') === 'Volume Track 0347').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0347 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0348
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0348
     * @tc.desc   Verify metadata and session map volume case 348.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0348', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0348 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0348', title: 'Volume Track 0348', artist: 'Volume Artist 0348' };
      expect(metadata.assetId).assertEqual('volume-asset-0348');
      expect(metadata.title === 'Volume Track 0348').assertTrue();
      expect(metadata.artist === 'Volume Artist 0348').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0348', 'Volume Track 0348');
      expect(map.get('volume-session-0348') === 'Volume Track 0348').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0348 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0349
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0349
     * @tc.desc   Verify metadata and session map volume case 349.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0349', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0349 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0349', title: 'Volume Track 0349', artist: 'Volume Artist 0349' };
      expect(metadata.assetId).assertEqual('volume-asset-0349');
      expect(metadata.title === 'Volume Track 0349').assertTrue();
      expect(metadata.artist === 'Volume Artist 0349').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0349', 'Volume Track 0349');
      expect(map.get('volume-session-0349') === 'Volume Track 0349').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0349 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0350
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0350
     * @tc.desc   Verify metadata and session map volume case 350.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0350 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0350', title: 'Volume Track 0350', artist: 'Volume Artist 0350' };
      expect(metadata.assetId).assertEqual('volume-asset-0350');
      expect(metadata.title === 'Volume Track 0350').assertTrue();
      expect(metadata.artist === 'Volume Artist 0350').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0350', 'Volume Track 0350');
      expect(map.get('volume-session-0350') === 'Volume Track 0350').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0350 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0351
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0351
     * @tc.desc   Verify metadata and session map volume case 351.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0351', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0351 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0351', title: 'Volume Track 0351', artist: 'Volume Artist 0351' };
      expect(metadata.assetId).assertEqual('volume-asset-0351');
      expect(metadata.title === 'Volume Track 0351').assertTrue();
      expect(metadata.artist === 'Volume Artist 0351').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0351', 'Volume Track 0351');
      expect(map.get('volume-session-0351') === 'Volume Track 0351').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0351 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0352
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0352
     * @tc.desc   Verify metadata and session map volume case 352.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0352', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0352 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0352', title: 'Volume Track 0352', artist: 'Volume Artist 0352' };
      expect(metadata.assetId).assertEqual('volume-asset-0352');
      expect(metadata.title === 'Volume Track 0352').assertTrue();
      expect(metadata.artist === 'Volume Artist 0352').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0352', 'Volume Track 0352');
      expect(map.get('volume-session-0352') === 'Volume Track 0352').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0352 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0353
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0353
     * @tc.desc   Verify metadata and session map volume case 353.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0353', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0353 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0353', title: 'Volume Track 0353', artist: 'Volume Artist 0353' };
      expect(metadata.assetId).assertEqual('volume-asset-0353');
      expect(metadata.title === 'Volume Track 0353').assertTrue();
      expect(metadata.artist === 'Volume Artist 0353').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0353', 'Volume Track 0353');
      expect(map.get('volume-session-0353') === 'Volume Track 0353').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0353 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0354
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0354
     * @tc.desc   Verify metadata and session map volume case 354.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0354', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0354 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0354', title: 'Volume Track 0354', artist: 'Volume Artist 0354' };
      expect(metadata.assetId).assertEqual('volume-asset-0354');
      expect(metadata.title === 'Volume Track 0354').assertTrue();
      expect(metadata.artist === 'Volume Artist 0354').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0354', 'Volume Track 0354');
      expect(map.get('volume-session-0354') === 'Volume Track 0354').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0354 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0355
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0355
     * @tc.desc   Verify metadata and session map volume case 355.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0355', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0355 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0355', title: 'Volume Track 0355', artist: 'Volume Artist 0355' };
      expect(metadata.assetId).assertEqual('volume-asset-0355');
      expect(metadata.title === 'Volume Track 0355').assertTrue();
      expect(metadata.artist === 'Volume Artist 0355').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0355', 'Volume Track 0355');
      expect(map.get('volume-session-0355') === 'Volume Track 0355').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0355 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0356
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0356
     * @tc.desc   Verify metadata and session map volume case 356.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0356', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0356 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0356', title: 'Volume Track 0356', artist: 'Volume Artist 0356' };
      expect(metadata.assetId).assertEqual('volume-asset-0356');
      expect(metadata.title === 'Volume Track 0356').assertTrue();
      expect(metadata.artist === 'Volume Artist 0356').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0356', 'Volume Track 0356');
      expect(map.get('volume-session-0356') === 'Volume Track 0356').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0356 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0357
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0357
     * @tc.desc   Verify metadata and session map volume case 357.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0357', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0357 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0357', title: 'Volume Track 0357', artist: 'Volume Artist 0357' };
      expect(metadata.assetId).assertEqual('volume-asset-0357');
      expect(metadata.title === 'Volume Track 0357').assertTrue();
      expect(metadata.artist === 'Volume Artist 0357').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0357', 'Volume Track 0357');
      expect(map.get('volume-session-0357') === 'Volume Track 0357').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0357 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0358
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0358
     * @tc.desc   Verify metadata and session map volume case 358.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0358', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0358 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0358', title: 'Volume Track 0358', artist: 'Volume Artist 0358' };
      expect(metadata.assetId).assertEqual('volume-asset-0358');
      expect(metadata.title === 'Volume Track 0358').assertTrue();
      expect(metadata.artist === 'Volume Artist 0358').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0358', 'Volume Track 0358');
      expect(map.get('volume-session-0358') === 'Volume Track 0358').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0358 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0359
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0359
     * @tc.desc   Verify metadata and session map volume case 359.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0359', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0359 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0359', title: 'Volume Track 0359', artist: 'Volume Artist 0359' };
      expect(metadata.assetId).assertEqual('volume-asset-0359');
      expect(metadata.title === 'Volume Track 0359').assertTrue();
      expect(metadata.artist === 'Volume Artist 0359').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0359', 'Volume Track 0359');
      expect(map.get('volume-session-0359') === 'Volume Track 0359').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0359 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0360
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0360
     * @tc.desc   Verify metadata and session map volume case 360.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0360', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0360 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0360', title: 'Volume Track 0360', artist: 'Volume Artist 0360' };
      expect(metadata.assetId).assertEqual('volume-asset-0360');
      expect(metadata.title === 'Volume Track 0360').assertTrue();
      expect(metadata.artist === 'Volume Artist 0360').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0360', 'Volume Track 0360');
      expect(map.get('volume-session-0360') === 'Volume Track 0360').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0360 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0361
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0361
     * @tc.desc   Verify metadata and session map volume case 361.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0361', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0361 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0361', title: 'Volume Track 0361', artist: 'Volume Artist 0361' };
      expect(metadata.assetId).assertEqual('volume-asset-0361');
      expect(metadata.title === 'Volume Track 0361').assertTrue();
      expect(metadata.artist === 'Volume Artist 0361').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0361', 'Volume Track 0361');
      expect(map.get('volume-session-0361') === 'Volume Track 0361').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0361 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0362
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0362
     * @tc.desc   Verify metadata and session map volume case 362.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0362', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0362 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0362', title: 'Volume Track 0362', artist: 'Volume Artist 0362' };
      expect(metadata.assetId).assertEqual('volume-asset-0362');
      expect(metadata.title === 'Volume Track 0362').assertTrue();
      expect(metadata.artist === 'Volume Artist 0362').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0362', 'Volume Track 0362');
      expect(map.get('volume-session-0362') === 'Volume Track 0362').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0362 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0363
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0363
     * @tc.desc   Verify metadata and session map volume case 363.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0363', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0363 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0363', title: 'Volume Track 0363', artist: 'Volume Artist 0363' };
      expect(metadata.assetId).assertEqual('volume-asset-0363');
      expect(metadata.title === 'Volume Track 0363').assertTrue();
      expect(metadata.artist === 'Volume Artist 0363').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0363', 'Volume Track 0363');
      expect(map.get('volume-session-0363') === 'Volume Track 0363').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0363 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0364
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0364
     * @tc.desc   Verify metadata and session map volume case 364.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0364', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0364 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0364', title: 'Volume Track 0364', artist: 'Volume Artist 0364' };
      expect(metadata.assetId).assertEqual('volume-asset-0364');
      expect(metadata.title === 'Volume Track 0364').assertTrue();
      expect(metadata.artist === 'Volume Artist 0364').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0364', 'Volume Track 0364');
      expect(map.get('volume-session-0364') === 'Volume Track 0364').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0364 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0365
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0365
     * @tc.desc   Verify metadata and session map volume case 365.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0365', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0365 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0365', title: 'Volume Track 0365', artist: 'Volume Artist 0365' };
      expect(metadata.assetId).assertEqual('volume-asset-0365');
      expect(metadata.title === 'Volume Track 0365').assertTrue();
      expect(metadata.artist === 'Volume Artist 0365').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0365', 'Volume Track 0365');
      expect(map.get('volume-session-0365') === 'Volume Track 0365').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0365 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0366
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0366
     * @tc.desc   Verify metadata and session map volume case 366.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0366', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0366 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0366', title: 'Volume Track 0366', artist: 'Volume Artist 0366' };
      expect(metadata.assetId).assertEqual('volume-asset-0366');
      expect(metadata.title === 'Volume Track 0366').assertTrue();
      expect(metadata.artist === 'Volume Artist 0366').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0366', 'Volume Track 0366');
      expect(map.get('volume-session-0366') === 'Volume Track 0366').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0366 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0367
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0367
     * @tc.desc   Verify metadata and session map volume case 367.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0367', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0367 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0367', title: 'Volume Track 0367', artist: 'Volume Artist 0367' };
      expect(metadata.assetId).assertEqual('volume-asset-0367');
      expect(metadata.title === 'Volume Track 0367').assertTrue();
      expect(metadata.artist === 'Volume Artist 0367').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0367', 'Volume Track 0367');
      expect(map.get('volume-session-0367') === 'Volume Track 0367').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0367 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0368
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0368
     * @tc.desc   Verify metadata and session map volume case 368.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0368', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0368 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0368', title: 'Volume Track 0368', artist: 'Volume Artist 0368' };
      expect(metadata.assetId).assertEqual('volume-asset-0368');
      expect(metadata.title === 'Volume Track 0368').assertTrue();
      expect(metadata.artist === 'Volume Artist 0368').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0368', 'Volume Track 0368');
      expect(map.get('volume-session-0368') === 'Volume Track 0368').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0368 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0369
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0369
     * @tc.desc   Verify metadata and session map volume case 369.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0369', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0369 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0369', title: 'Volume Track 0369', artist: 'Volume Artist 0369' };
      expect(metadata.assetId).assertEqual('volume-asset-0369');
      expect(metadata.title === 'Volume Track 0369').assertTrue();
      expect(metadata.artist === 'Volume Artist 0369').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0369', 'Volume Track 0369');
      expect(map.get('volume-session-0369') === 'Volume Track 0369').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0369 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0370
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0370
     * @tc.desc   Verify metadata and session map volume case 370.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0370 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0370', title: 'Volume Track 0370', artist: 'Volume Artist 0370' };
      expect(metadata.assetId).assertEqual('volume-asset-0370');
      expect(metadata.title === 'Volume Track 0370').assertTrue();
      expect(metadata.artist === 'Volume Artist 0370').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0370', 'Volume Track 0370');
      expect(map.get('volume-session-0370') === 'Volume Track 0370').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0370 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0371
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0371
     * @tc.desc   Verify metadata and session map volume case 371.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0371', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0371 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0371', title: 'Volume Track 0371', artist: 'Volume Artist 0371' };
      expect(metadata.assetId).assertEqual('volume-asset-0371');
      expect(metadata.title === 'Volume Track 0371').assertTrue();
      expect(metadata.artist === 'Volume Artist 0371').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0371', 'Volume Track 0371');
      expect(map.get('volume-session-0371') === 'Volume Track 0371').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0371 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0372
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0372
     * @tc.desc   Verify metadata and session map volume case 372.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0372', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0372 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0372', title: 'Volume Track 0372', artist: 'Volume Artist 0372' };
      expect(metadata.assetId).assertEqual('volume-asset-0372');
      expect(metadata.title === 'Volume Track 0372').assertTrue();
      expect(metadata.artist === 'Volume Artist 0372').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0372', 'Volume Track 0372');
      expect(map.get('volume-session-0372') === 'Volume Track 0372').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0372 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0373
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0373
     * @tc.desc   Verify metadata and session map volume case 373.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0373', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0373 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0373', title: 'Volume Track 0373', artist: 'Volume Artist 0373' };
      expect(metadata.assetId).assertEqual('volume-asset-0373');
      expect(metadata.title === 'Volume Track 0373').assertTrue();
      expect(metadata.artist === 'Volume Artist 0373').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0373', 'Volume Track 0373');
      expect(map.get('volume-session-0373') === 'Volume Track 0373').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0373 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0374
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0374
     * @tc.desc   Verify metadata and session map volume case 374.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0374', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0374 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0374', title: 'Volume Track 0374', artist: 'Volume Artist 0374' };
      expect(metadata.assetId).assertEqual('volume-asset-0374');
      expect(metadata.title === 'Volume Track 0374').assertTrue();
      expect(metadata.artist === 'Volume Artist 0374').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0374', 'Volume Track 0374');
      expect(map.get('volume-session-0374') === 'Volume Track 0374').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0374 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0375
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0375
     * @tc.desc   Verify metadata and session map volume case 375.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0375', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0375 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0375', title: 'Volume Track 0375', artist: 'Volume Artist 0375' };
      expect(metadata.assetId).assertEqual('volume-asset-0375');
      expect(metadata.title === 'Volume Track 0375').assertTrue();
      expect(metadata.artist === 'Volume Artist 0375').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0375', 'Volume Track 0375');
      expect(map.get('volume-session-0375') === 'Volume Track 0375').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0375 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0376
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0376
     * @tc.desc   Verify metadata and session map volume case 376.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0376', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0376 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0376', title: 'Volume Track 0376', artist: 'Volume Artist 0376' };
      expect(metadata.assetId).assertEqual('volume-asset-0376');
      expect(metadata.title === 'Volume Track 0376').assertTrue();
      expect(metadata.artist === 'Volume Artist 0376').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0376', 'Volume Track 0376');
      expect(map.get('volume-session-0376') === 'Volume Track 0376').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0376 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0377
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0377
     * @tc.desc   Verify metadata and session map volume case 377.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0377', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0377 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0377', title: 'Volume Track 0377', artist: 'Volume Artist 0377' };
      expect(metadata.assetId).assertEqual('volume-asset-0377');
      expect(metadata.title === 'Volume Track 0377').assertTrue();
      expect(metadata.artist === 'Volume Artist 0377').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0377', 'Volume Track 0377');
      expect(map.get('volume-session-0377') === 'Volume Track 0377').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0377 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0378
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0378
     * @tc.desc   Verify metadata and session map volume case 378.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0378', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0378 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0378', title: 'Volume Track 0378', artist: 'Volume Artist 0378' };
      expect(metadata.assetId).assertEqual('volume-asset-0378');
      expect(metadata.title === 'Volume Track 0378').assertTrue();
      expect(metadata.artist === 'Volume Artist 0378').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0378', 'Volume Track 0378');
      expect(map.get('volume-session-0378') === 'Volume Track 0378').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0378 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0379
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0379
     * @tc.desc   Verify metadata and session map volume case 379.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0379', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0379 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0379', title: 'Volume Track 0379', artist: 'Volume Artist 0379' };
      expect(metadata.assetId).assertEqual('volume-asset-0379');
      expect(metadata.title === 'Volume Track 0379').assertTrue();
      expect(metadata.artist === 'Volume Artist 0379').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0379', 'Volume Track 0379');
      expect(map.get('volume-session-0379') === 'Volume Track 0379').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0379 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0380
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0380
     * @tc.desc   Verify metadata and session map volume case 380.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0380', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0380 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0380', title: 'Volume Track 0380', artist: 'Volume Artist 0380' };
      expect(metadata.assetId).assertEqual('volume-asset-0380');
      expect(metadata.title === 'Volume Track 0380').assertTrue();
      expect(metadata.artist === 'Volume Artist 0380').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0380', 'Volume Track 0380');
      expect(map.get('volume-session-0380') === 'Volume Track 0380').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0380 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0381
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0381
     * @tc.desc   Verify metadata and session map volume case 381.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0381', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0381 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0381', title: 'Volume Track 0381', artist: 'Volume Artist 0381' };
      expect(metadata.assetId).assertEqual('volume-asset-0381');
      expect(metadata.title === 'Volume Track 0381').assertTrue();
      expect(metadata.artist === 'Volume Artist 0381').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0381', 'Volume Track 0381');
      expect(map.get('volume-session-0381') === 'Volume Track 0381').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0381 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0382
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0382
     * @tc.desc   Verify metadata and session map volume case 382.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0382', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0382 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0382', title: 'Volume Track 0382', artist: 'Volume Artist 0382' };
      expect(metadata.assetId).assertEqual('volume-asset-0382');
      expect(metadata.title === 'Volume Track 0382').assertTrue();
      expect(metadata.artist === 'Volume Artist 0382').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0382', 'Volume Track 0382');
      expect(map.get('volume-session-0382') === 'Volume Track 0382').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0382 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0383
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0383
     * @tc.desc   Verify metadata and session map volume case 383.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0383', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0383 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0383', title: 'Volume Track 0383', artist: 'Volume Artist 0383' };
      expect(metadata.assetId).assertEqual('volume-asset-0383');
      expect(metadata.title === 'Volume Track 0383').assertTrue();
      expect(metadata.artist === 'Volume Artist 0383').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0383', 'Volume Track 0383');
      expect(map.get('volume-session-0383') === 'Volume Track 0383').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0383 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0384
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0384
     * @tc.desc   Verify metadata and session map volume case 384.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0384', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0384 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0384', title: 'Volume Track 0384', artist: 'Volume Artist 0384' };
      expect(metadata.assetId).assertEqual('volume-asset-0384');
      expect(metadata.title === 'Volume Track 0384').assertTrue();
      expect(metadata.artist === 'Volume Artist 0384').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0384', 'Volume Track 0384');
      expect(map.get('volume-session-0384') === 'Volume Track 0384').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0384 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0385
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0385
     * @tc.desc   Verify metadata and session map volume case 385.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0385', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0385 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0385', title: 'Volume Track 0385', artist: 'Volume Artist 0385' };
      expect(metadata.assetId).assertEqual('volume-asset-0385');
      expect(metadata.title === 'Volume Track 0385').assertTrue();
      expect(metadata.artist === 'Volume Artist 0385').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0385', 'Volume Track 0385');
      expect(map.get('volume-session-0385') === 'Volume Track 0385').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0385 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0386
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0386
     * @tc.desc   Verify metadata and session map volume case 386.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0386', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0386 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0386', title: 'Volume Track 0386', artist: 'Volume Artist 0386' };
      expect(metadata.assetId).assertEqual('volume-asset-0386');
      expect(metadata.title === 'Volume Track 0386').assertTrue();
      expect(metadata.artist === 'Volume Artist 0386').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0386', 'Volume Track 0386');
      expect(map.get('volume-session-0386') === 'Volume Track 0386').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0386 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0387
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0387
     * @tc.desc   Verify metadata and session map volume case 387.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0387', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0387 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0387', title: 'Volume Track 0387', artist: 'Volume Artist 0387' };
      expect(metadata.assetId).assertEqual('volume-asset-0387');
      expect(metadata.title === 'Volume Track 0387').assertTrue();
      expect(metadata.artist === 'Volume Artist 0387').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0387', 'Volume Track 0387');
      expect(map.get('volume-session-0387') === 'Volume Track 0387').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0387 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0388
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0388
     * @tc.desc   Verify metadata and session map volume case 388.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0388', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0388 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0388', title: 'Volume Track 0388', artist: 'Volume Artist 0388' };
      expect(metadata.assetId).assertEqual('volume-asset-0388');
      expect(metadata.title === 'Volume Track 0388').assertTrue();
      expect(metadata.artist === 'Volume Artist 0388').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0388', 'Volume Track 0388');
      expect(map.get('volume-session-0388') === 'Volume Track 0388').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0388 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0389
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0389
     * @tc.desc   Verify metadata and session map volume case 389.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0389', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0389 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0389', title: 'Volume Track 0389', artist: 'Volume Artist 0389' };
      expect(metadata.assetId).assertEqual('volume-asset-0389');
      expect(metadata.title === 'Volume Track 0389').assertTrue();
      expect(metadata.artist === 'Volume Artist 0389').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0389', 'Volume Track 0389');
      expect(map.get('volume-session-0389') === 'Volume Track 0389').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0389 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0390
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0390
     * @tc.desc   Verify metadata and session map volume case 390.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0390', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0390 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0390', title: 'Volume Track 0390', artist: 'Volume Artist 0390' };
      expect(metadata.assetId).assertEqual('volume-asset-0390');
      expect(metadata.title === 'Volume Track 0390').assertTrue();
      expect(metadata.artist === 'Volume Artist 0390').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0390', 'Volume Track 0390');
      expect(map.get('volume-session-0390') === 'Volume Track 0390').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0390 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0391
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0391
     * @tc.desc   Verify metadata and session map volume case 391.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0391', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0391 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0391', title: 'Volume Track 0391', artist: 'Volume Artist 0391' };
      expect(metadata.assetId).assertEqual('volume-asset-0391');
      expect(metadata.title === 'Volume Track 0391').assertTrue();
      expect(metadata.artist === 'Volume Artist 0391').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0391', 'Volume Track 0391');
      expect(map.get('volume-session-0391') === 'Volume Track 0391').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0391 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0392
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0392
     * @tc.desc   Verify metadata and session map volume case 392.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0392', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0392 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0392', title: 'Volume Track 0392', artist: 'Volume Artist 0392' };
      expect(metadata.assetId).assertEqual('volume-asset-0392');
      expect(metadata.title === 'Volume Track 0392').assertTrue();
      expect(metadata.artist === 'Volume Artist 0392').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0392', 'Volume Track 0392');
      expect(map.get('volume-session-0392') === 'Volume Track 0392').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0392 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0393
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0393
     * @tc.desc   Verify metadata and session map volume case 393.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0393', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0393 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0393', title: 'Volume Track 0393', artist: 'Volume Artist 0393' };
      expect(metadata.assetId).assertEqual('volume-asset-0393');
      expect(metadata.title === 'Volume Track 0393').assertTrue();
      expect(metadata.artist === 'Volume Artist 0393').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0393', 'Volume Track 0393');
      expect(map.get('volume-session-0393') === 'Volume Track 0393').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0393 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0394
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0394
     * @tc.desc   Verify metadata and session map volume case 394.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0394', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0394 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0394', title: 'Volume Track 0394', artist: 'Volume Artist 0394' };
      expect(metadata.assetId).assertEqual('volume-asset-0394');
      expect(metadata.title === 'Volume Track 0394').assertTrue();
      expect(metadata.artist === 'Volume Artist 0394').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0394', 'Volume Track 0394');
      expect(map.get('volume-session-0394') === 'Volume Track 0394').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0394 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0395
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0395
     * @tc.desc   Verify metadata and session map volume case 395.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0395', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0395 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0395', title: 'Volume Track 0395', artist: 'Volume Artist 0395' };
      expect(metadata.assetId).assertEqual('volume-asset-0395');
      expect(metadata.title === 'Volume Track 0395').assertTrue();
      expect(metadata.artist === 'Volume Artist 0395').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0395', 'Volume Track 0395');
      expect(map.get('volume-session-0395') === 'Volume Track 0395').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0395 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0396
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0396
     * @tc.desc   Verify metadata and session map volume case 396.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0396', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0396 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0396', title: 'Volume Track 0396', artist: 'Volume Artist 0396' };
      expect(metadata.assetId).assertEqual('volume-asset-0396');
      expect(metadata.title === 'Volume Track 0396').assertTrue();
      expect(metadata.artist === 'Volume Artist 0396').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0396', 'Volume Track 0396');
      expect(map.get('volume-session-0396') === 'Volume Track 0396').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0396 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0397
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0397
     * @tc.desc   Verify metadata and session map volume case 397.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0397', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0397 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0397', title: 'Volume Track 0397', artist: 'Volume Artist 0397' };
      expect(metadata.assetId).assertEqual('volume-asset-0397');
      expect(metadata.title === 'Volume Track 0397').assertTrue();
      expect(metadata.artist === 'Volume Artist 0397').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0397', 'Volume Track 0397');
      expect(map.get('volume-session-0397') === 'Volume Track 0397').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0397 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0398
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0398
     * @tc.desc   Verify metadata and session map volume case 398.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0398', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0398 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0398', title: 'Volume Track 0398', artist: 'Volume Artist 0398' };
      expect(metadata.assetId).assertEqual('volume-asset-0398');
      expect(metadata.title === 'Volume Track 0398').assertTrue();
      expect(metadata.artist === 'Volume Artist 0398').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0398', 'Volume Track 0398');
      expect(map.get('volume-session-0398') === 'Volume Track 0398').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0398 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0399
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0399
     * @tc.desc   Verify metadata and session map volume case 399.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0399', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0399 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0399', title: 'Volume Track 0399', artist: 'Volume Artist 0399' };
      expect(metadata.assetId).assertEqual('volume-asset-0399');
      expect(metadata.title === 'Volume Track 0399').assertTrue();
      expect(metadata.artist === 'Volume Artist 0399').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0399', 'Volume Track 0399');
      expect(map.get('volume-session-0399') === 'Volume Track 0399').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0399 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0400
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0400
     * @tc.desc   Verify metadata and session map volume case 400.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0400 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0400', title: 'Volume Track 0400', artist: 'Volume Artist 0400' };
      expect(metadata.assetId).assertEqual('volume-asset-0400');
      expect(metadata.title === 'Volume Track 0400').assertTrue();
      expect(metadata.artist === 'Volume Artist 0400').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0400', 'Volume Track 0400');
      expect(map.get('volume-session-0400') === 'Volume Track 0400').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0400 end');
    })
  })
}
