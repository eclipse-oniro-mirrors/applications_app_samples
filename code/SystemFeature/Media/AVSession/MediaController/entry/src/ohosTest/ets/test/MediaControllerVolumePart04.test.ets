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

export default function mediaControllerVolumeTestPart04() {
  describe('MediaControllerVolumePart04', () => {
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0241
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0241
     * @tc.desc   Verify metadata and session map volume case 241.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0241', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0241 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0241', title: 'Volume Track 0241', artist: 'Volume Artist 0241' };
      expect(metadata.assetId).assertEqual('volume-asset-0241');
      expect(metadata.title === 'Volume Track 0241').assertTrue();
      expect(metadata.artist === 'Volume Artist 0241').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0241', 'Volume Track 0241');
      expect(map.get('volume-session-0241') === 'Volume Track 0241').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0241 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0242
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0242
     * @tc.desc   Verify metadata and session map volume case 242.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0242', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0242 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0242', title: 'Volume Track 0242', artist: 'Volume Artist 0242' };
      expect(metadata.assetId).assertEqual('volume-asset-0242');
      expect(metadata.title === 'Volume Track 0242').assertTrue();
      expect(metadata.artist === 'Volume Artist 0242').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0242', 'Volume Track 0242');
      expect(map.get('volume-session-0242') === 'Volume Track 0242').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0242 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0243
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0243
     * @tc.desc   Verify metadata and session map volume case 243.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0243', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0243 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0243', title: 'Volume Track 0243', artist: 'Volume Artist 0243' };
      expect(metadata.assetId).assertEqual('volume-asset-0243');
      expect(metadata.title === 'Volume Track 0243').assertTrue();
      expect(metadata.artist === 'Volume Artist 0243').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0243', 'Volume Track 0243');
      expect(map.get('volume-session-0243') === 'Volume Track 0243').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0243 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0244
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0244
     * @tc.desc   Verify metadata and session map volume case 244.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0244', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0244 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0244', title: 'Volume Track 0244', artist: 'Volume Artist 0244' };
      expect(metadata.assetId).assertEqual('volume-asset-0244');
      expect(metadata.title === 'Volume Track 0244').assertTrue();
      expect(metadata.artist === 'Volume Artist 0244').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0244', 'Volume Track 0244');
      expect(map.get('volume-session-0244') === 'Volume Track 0244').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0244 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0245
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0245
     * @tc.desc   Verify metadata and session map volume case 245.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0245', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0245 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0245', title: 'Volume Track 0245', artist: 'Volume Artist 0245' };
      expect(metadata.assetId).assertEqual('volume-asset-0245');
      expect(metadata.title === 'Volume Track 0245').assertTrue();
      expect(metadata.artist === 'Volume Artist 0245').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0245', 'Volume Track 0245');
      expect(map.get('volume-session-0245') === 'Volume Track 0245').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0245 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0246
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0246
     * @tc.desc   Verify metadata and session map volume case 246.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0246', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0246 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0246', title: 'Volume Track 0246', artist: 'Volume Artist 0246' };
      expect(metadata.assetId).assertEqual('volume-asset-0246');
      expect(metadata.title === 'Volume Track 0246').assertTrue();
      expect(metadata.artist === 'Volume Artist 0246').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0246', 'Volume Track 0246');
      expect(map.get('volume-session-0246') === 'Volume Track 0246').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0246 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0247
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0247
     * @tc.desc   Verify metadata and session map volume case 247.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0247', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0247 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0247', title: 'Volume Track 0247', artist: 'Volume Artist 0247' };
      expect(metadata.assetId).assertEqual('volume-asset-0247');
      expect(metadata.title === 'Volume Track 0247').assertTrue();
      expect(metadata.artist === 'Volume Artist 0247').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0247', 'Volume Track 0247');
      expect(map.get('volume-session-0247') === 'Volume Track 0247').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0247 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0248
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0248
     * @tc.desc   Verify metadata and session map volume case 248.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0248', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0248 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0248', title: 'Volume Track 0248', artist: 'Volume Artist 0248' };
      expect(metadata.assetId).assertEqual('volume-asset-0248');
      expect(metadata.title === 'Volume Track 0248').assertTrue();
      expect(metadata.artist === 'Volume Artist 0248').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0248', 'Volume Track 0248');
      expect(map.get('volume-session-0248') === 'Volume Track 0248').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0248 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0249
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0249
     * @tc.desc   Verify metadata and session map volume case 249.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0249', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0249 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0249', title: 'Volume Track 0249', artist: 'Volume Artist 0249' };
      expect(metadata.assetId).assertEqual('volume-asset-0249');
      expect(metadata.title === 'Volume Track 0249').assertTrue();
      expect(metadata.artist === 'Volume Artist 0249').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0249', 'Volume Track 0249');
      expect(map.get('volume-session-0249') === 'Volume Track 0249').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0249 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0250
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0250
     * @tc.desc   Verify metadata and session map volume case 250.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0250 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0250', title: 'Volume Track 0250', artist: 'Volume Artist 0250' };
      expect(metadata.assetId).assertEqual('volume-asset-0250');
      expect(metadata.title === 'Volume Track 0250').assertTrue();
      expect(metadata.artist === 'Volume Artist 0250').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0250', 'Volume Track 0250');
      expect(map.get('volume-session-0250') === 'Volume Track 0250').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0250 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0251
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0251
     * @tc.desc   Verify metadata and session map volume case 251.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0251', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0251 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0251', title: 'Volume Track 0251', artist: 'Volume Artist 0251' };
      expect(metadata.assetId).assertEqual('volume-asset-0251');
      expect(metadata.title === 'Volume Track 0251').assertTrue();
      expect(metadata.artist === 'Volume Artist 0251').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0251', 'Volume Track 0251');
      expect(map.get('volume-session-0251') === 'Volume Track 0251').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0251 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0252
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0252
     * @tc.desc   Verify metadata and session map volume case 252.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0252', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0252 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0252', title: 'Volume Track 0252', artist: 'Volume Artist 0252' };
      expect(metadata.assetId).assertEqual('volume-asset-0252');
      expect(metadata.title === 'Volume Track 0252').assertTrue();
      expect(metadata.artist === 'Volume Artist 0252').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0252', 'Volume Track 0252');
      expect(map.get('volume-session-0252') === 'Volume Track 0252').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0252 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0253
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0253
     * @tc.desc   Verify metadata and session map volume case 253.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0253', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0253 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0253', title: 'Volume Track 0253', artist: 'Volume Artist 0253' };
      expect(metadata.assetId).assertEqual('volume-asset-0253');
      expect(metadata.title === 'Volume Track 0253').assertTrue();
      expect(metadata.artist === 'Volume Artist 0253').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0253', 'Volume Track 0253');
      expect(map.get('volume-session-0253') === 'Volume Track 0253').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0253 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0254
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0254
     * @tc.desc   Verify metadata and session map volume case 254.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0254', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0254 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0254', title: 'Volume Track 0254', artist: 'Volume Artist 0254' };
      expect(metadata.assetId).assertEqual('volume-asset-0254');
      expect(metadata.title === 'Volume Track 0254').assertTrue();
      expect(metadata.artist === 'Volume Artist 0254').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0254', 'Volume Track 0254');
      expect(map.get('volume-session-0254') === 'Volume Track 0254').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0254 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0255
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0255
     * @tc.desc   Verify metadata and session map volume case 255.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0255', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0255 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0255', title: 'Volume Track 0255', artist: 'Volume Artist 0255' };
      expect(metadata.assetId).assertEqual('volume-asset-0255');
      expect(metadata.title === 'Volume Track 0255').assertTrue();
      expect(metadata.artist === 'Volume Artist 0255').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0255', 'Volume Track 0255');
      expect(map.get('volume-session-0255') === 'Volume Track 0255').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0255 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0256
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0256
     * @tc.desc   Verify metadata and session map volume case 256.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0256', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0256 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0256', title: 'Volume Track 0256', artist: 'Volume Artist 0256' };
      expect(metadata.assetId).assertEqual('volume-asset-0256');
      expect(metadata.title === 'Volume Track 0256').assertTrue();
      expect(metadata.artist === 'Volume Artist 0256').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0256', 'Volume Track 0256');
      expect(map.get('volume-session-0256') === 'Volume Track 0256').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0256 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0257
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0257
     * @tc.desc   Verify metadata and session map volume case 257.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0257', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0257 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0257', title: 'Volume Track 0257', artist: 'Volume Artist 0257' };
      expect(metadata.assetId).assertEqual('volume-asset-0257');
      expect(metadata.title === 'Volume Track 0257').assertTrue();
      expect(metadata.artist === 'Volume Artist 0257').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0257', 'Volume Track 0257');
      expect(map.get('volume-session-0257') === 'Volume Track 0257').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0257 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0258
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0258
     * @tc.desc   Verify metadata and session map volume case 258.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0258', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0258 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0258', title: 'Volume Track 0258', artist: 'Volume Artist 0258' };
      expect(metadata.assetId).assertEqual('volume-asset-0258');
      expect(metadata.title === 'Volume Track 0258').assertTrue();
      expect(metadata.artist === 'Volume Artist 0258').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0258', 'Volume Track 0258');
      expect(map.get('volume-session-0258') === 'Volume Track 0258').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0258 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0259
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0259
     * @tc.desc   Verify metadata and session map volume case 259.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0259', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0259 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0259', title: 'Volume Track 0259', artist: 'Volume Artist 0259' };
      expect(metadata.assetId).assertEqual('volume-asset-0259');
      expect(metadata.title === 'Volume Track 0259').assertTrue();
      expect(metadata.artist === 'Volume Artist 0259').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0259', 'Volume Track 0259');
      expect(map.get('volume-session-0259') === 'Volume Track 0259').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0259 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0260
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0260
     * @tc.desc   Verify metadata and session map volume case 260.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0260 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0260', title: 'Volume Track 0260', artist: 'Volume Artist 0260' };
      expect(metadata.assetId).assertEqual('volume-asset-0260');
      expect(metadata.title === 'Volume Track 0260').assertTrue();
      expect(metadata.artist === 'Volume Artist 0260').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0260', 'Volume Track 0260');
      expect(map.get('volume-session-0260') === 'Volume Track 0260').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0260 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0261
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0261
     * @tc.desc   Verify metadata and session map volume case 261.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0261', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0261 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0261', title: 'Volume Track 0261', artist: 'Volume Artist 0261' };
      expect(metadata.assetId).assertEqual('volume-asset-0261');
      expect(metadata.title === 'Volume Track 0261').assertTrue();
      expect(metadata.artist === 'Volume Artist 0261').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0261', 'Volume Track 0261');
      expect(map.get('volume-session-0261') === 'Volume Track 0261').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0261 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0262
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0262
     * @tc.desc   Verify metadata and session map volume case 262.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0262', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0262 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0262', title: 'Volume Track 0262', artist: 'Volume Artist 0262' };
      expect(metadata.assetId).assertEqual('volume-asset-0262');
      expect(metadata.title === 'Volume Track 0262').assertTrue();
      expect(metadata.artist === 'Volume Artist 0262').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0262', 'Volume Track 0262');
      expect(map.get('volume-session-0262') === 'Volume Track 0262').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0262 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0263
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0263
     * @tc.desc   Verify metadata and session map volume case 263.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0263', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0263 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0263', title: 'Volume Track 0263', artist: 'Volume Artist 0263' };
      expect(metadata.assetId).assertEqual('volume-asset-0263');
      expect(metadata.title === 'Volume Track 0263').assertTrue();
      expect(metadata.artist === 'Volume Artist 0263').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0263', 'Volume Track 0263');
      expect(map.get('volume-session-0263') === 'Volume Track 0263').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0263 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0264
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0264
     * @tc.desc   Verify metadata and session map volume case 264.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0264', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0264 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0264', title: 'Volume Track 0264', artist: 'Volume Artist 0264' };
      expect(metadata.assetId).assertEqual('volume-asset-0264');
      expect(metadata.title === 'Volume Track 0264').assertTrue();
      expect(metadata.artist === 'Volume Artist 0264').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0264', 'Volume Track 0264');
      expect(map.get('volume-session-0264') === 'Volume Track 0264').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0264 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0265
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0265
     * @tc.desc   Verify metadata and session map volume case 265.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0265', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0265 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0265', title: 'Volume Track 0265', artist: 'Volume Artist 0265' };
      expect(metadata.assetId).assertEqual('volume-asset-0265');
      expect(metadata.title === 'Volume Track 0265').assertTrue();
      expect(metadata.artist === 'Volume Artist 0265').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0265', 'Volume Track 0265');
      expect(map.get('volume-session-0265') === 'Volume Track 0265').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0265 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0266
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0266
     * @tc.desc   Verify metadata and session map volume case 266.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0266', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0266 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0266', title: 'Volume Track 0266', artist: 'Volume Artist 0266' };
      expect(metadata.assetId).assertEqual('volume-asset-0266');
      expect(metadata.title === 'Volume Track 0266').assertTrue();
      expect(metadata.artist === 'Volume Artist 0266').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0266', 'Volume Track 0266');
      expect(map.get('volume-session-0266') === 'Volume Track 0266').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0266 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0267
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0267
     * @tc.desc   Verify metadata and session map volume case 267.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0267', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0267 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0267', title: 'Volume Track 0267', artist: 'Volume Artist 0267' };
      expect(metadata.assetId).assertEqual('volume-asset-0267');
      expect(metadata.title === 'Volume Track 0267').assertTrue();
      expect(metadata.artist === 'Volume Artist 0267').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0267', 'Volume Track 0267');
      expect(map.get('volume-session-0267') === 'Volume Track 0267').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0267 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0268
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0268
     * @tc.desc   Verify metadata and session map volume case 268.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0268', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0268 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0268', title: 'Volume Track 0268', artist: 'Volume Artist 0268' };
      expect(metadata.assetId).assertEqual('volume-asset-0268');
      expect(metadata.title === 'Volume Track 0268').assertTrue();
      expect(metadata.artist === 'Volume Artist 0268').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0268', 'Volume Track 0268');
      expect(map.get('volume-session-0268') === 'Volume Track 0268').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0268 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0269
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0269
     * @tc.desc   Verify metadata and session map volume case 269.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0269', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0269 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0269', title: 'Volume Track 0269', artist: 'Volume Artist 0269' };
      expect(metadata.assetId).assertEqual('volume-asset-0269');
      expect(metadata.title === 'Volume Track 0269').assertTrue();
      expect(metadata.artist === 'Volume Artist 0269').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0269', 'Volume Track 0269');
      expect(map.get('volume-session-0269') === 'Volume Track 0269').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0269 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0270
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0270
     * @tc.desc   Verify metadata and session map volume case 270.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0270 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0270', title: 'Volume Track 0270', artist: 'Volume Artist 0270' };
      expect(metadata.assetId).assertEqual('volume-asset-0270');
      expect(metadata.title === 'Volume Track 0270').assertTrue();
      expect(metadata.artist === 'Volume Artist 0270').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0270', 'Volume Track 0270');
      expect(map.get('volume-session-0270') === 'Volume Track 0270').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0270 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0271
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0271
     * @tc.desc   Verify metadata and session map volume case 271.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0271', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0271 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0271', title: 'Volume Track 0271', artist: 'Volume Artist 0271' };
      expect(metadata.assetId).assertEqual('volume-asset-0271');
      expect(metadata.title === 'Volume Track 0271').assertTrue();
      expect(metadata.artist === 'Volume Artist 0271').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0271', 'Volume Track 0271');
      expect(map.get('volume-session-0271') === 'Volume Track 0271').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0271 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0272
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0272
     * @tc.desc   Verify metadata and session map volume case 272.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0272', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0272 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0272', title: 'Volume Track 0272', artist: 'Volume Artist 0272' };
      expect(metadata.assetId).assertEqual('volume-asset-0272');
      expect(metadata.title === 'Volume Track 0272').assertTrue();
      expect(metadata.artist === 'Volume Artist 0272').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0272', 'Volume Track 0272');
      expect(map.get('volume-session-0272') === 'Volume Track 0272').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0272 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0273
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0273
     * @tc.desc   Verify metadata and session map volume case 273.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0273', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0273 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0273', title: 'Volume Track 0273', artist: 'Volume Artist 0273' };
      expect(metadata.assetId).assertEqual('volume-asset-0273');
      expect(metadata.title === 'Volume Track 0273').assertTrue();
      expect(metadata.artist === 'Volume Artist 0273').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0273', 'Volume Track 0273');
      expect(map.get('volume-session-0273') === 'Volume Track 0273').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0273 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0274
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0274
     * @tc.desc   Verify metadata and session map volume case 274.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0274', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0274 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0274', title: 'Volume Track 0274', artist: 'Volume Artist 0274' };
      expect(metadata.assetId).assertEqual('volume-asset-0274');
      expect(metadata.title === 'Volume Track 0274').assertTrue();
      expect(metadata.artist === 'Volume Artist 0274').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0274', 'Volume Track 0274');
      expect(map.get('volume-session-0274') === 'Volume Track 0274').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0274 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0275
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0275
     * @tc.desc   Verify metadata and session map volume case 275.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0275', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0275 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0275', title: 'Volume Track 0275', artist: 'Volume Artist 0275' };
      expect(metadata.assetId).assertEqual('volume-asset-0275');
      expect(metadata.title === 'Volume Track 0275').assertTrue();
      expect(metadata.artist === 'Volume Artist 0275').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0275', 'Volume Track 0275');
      expect(map.get('volume-session-0275') === 'Volume Track 0275').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0275 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0276
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0276
     * @tc.desc   Verify metadata and session map volume case 276.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0276', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0276 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0276', title: 'Volume Track 0276', artist: 'Volume Artist 0276' };
      expect(metadata.assetId).assertEqual('volume-asset-0276');
      expect(metadata.title === 'Volume Track 0276').assertTrue();
      expect(metadata.artist === 'Volume Artist 0276').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0276', 'Volume Track 0276');
      expect(map.get('volume-session-0276') === 'Volume Track 0276').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0276 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0277
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0277
     * @tc.desc   Verify metadata and session map volume case 277.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0277', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0277 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0277', title: 'Volume Track 0277', artist: 'Volume Artist 0277' };
      expect(metadata.assetId).assertEqual('volume-asset-0277');
      expect(metadata.title === 'Volume Track 0277').assertTrue();
      expect(metadata.artist === 'Volume Artist 0277').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0277', 'Volume Track 0277');
      expect(map.get('volume-session-0277') === 'Volume Track 0277').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0277 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0278
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0278
     * @tc.desc   Verify metadata and session map volume case 278.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0278', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0278 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0278', title: 'Volume Track 0278', artist: 'Volume Artist 0278' };
      expect(metadata.assetId).assertEqual('volume-asset-0278');
      expect(metadata.title === 'Volume Track 0278').assertTrue();
      expect(metadata.artist === 'Volume Artist 0278').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0278', 'Volume Track 0278');
      expect(map.get('volume-session-0278') === 'Volume Track 0278').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0278 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0279
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0279
     * @tc.desc   Verify metadata and session map volume case 279.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0279', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0279 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0279', title: 'Volume Track 0279', artist: 'Volume Artist 0279' };
      expect(metadata.assetId).assertEqual('volume-asset-0279');
      expect(metadata.title === 'Volume Track 0279').assertTrue();
      expect(metadata.artist === 'Volume Artist 0279').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0279', 'Volume Track 0279');
      expect(map.get('volume-session-0279') === 'Volume Track 0279').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0279 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0280
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0280
     * @tc.desc   Verify metadata and session map volume case 280.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0280 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0280', title: 'Volume Track 0280', artist: 'Volume Artist 0280' };
      expect(metadata.assetId).assertEqual('volume-asset-0280');
      expect(metadata.title === 'Volume Track 0280').assertTrue();
      expect(metadata.artist === 'Volume Artist 0280').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0280', 'Volume Track 0280');
      expect(map.get('volume-session-0280') === 'Volume Track 0280').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0280 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0281
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0281
     * @tc.desc   Verify metadata and session map volume case 281.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0281', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0281 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0281', title: 'Volume Track 0281', artist: 'Volume Artist 0281' };
      expect(metadata.assetId).assertEqual('volume-asset-0281');
      expect(metadata.title === 'Volume Track 0281').assertTrue();
      expect(metadata.artist === 'Volume Artist 0281').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0281', 'Volume Track 0281');
      expect(map.get('volume-session-0281') === 'Volume Track 0281').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0281 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0282
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0282
     * @tc.desc   Verify metadata and session map volume case 282.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0282', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0282 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0282', title: 'Volume Track 0282', artist: 'Volume Artist 0282' };
      expect(metadata.assetId).assertEqual('volume-asset-0282');
      expect(metadata.title === 'Volume Track 0282').assertTrue();
      expect(metadata.artist === 'Volume Artist 0282').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0282', 'Volume Track 0282');
      expect(map.get('volume-session-0282') === 'Volume Track 0282').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0282 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0283
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0283
     * @tc.desc   Verify metadata and session map volume case 283.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0283', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0283 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0283', title: 'Volume Track 0283', artist: 'Volume Artist 0283' };
      expect(metadata.assetId).assertEqual('volume-asset-0283');
      expect(metadata.title === 'Volume Track 0283').assertTrue();
      expect(metadata.artist === 'Volume Artist 0283').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0283', 'Volume Track 0283');
      expect(map.get('volume-session-0283') === 'Volume Track 0283').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0283 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0284
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0284
     * @tc.desc   Verify metadata and session map volume case 284.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0284', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0284 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0284', title: 'Volume Track 0284', artist: 'Volume Artist 0284' };
      expect(metadata.assetId).assertEqual('volume-asset-0284');
      expect(metadata.title === 'Volume Track 0284').assertTrue();
      expect(metadata.artist === 'Volume Artist 0284').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0284', 'Volume Track 0284');
      expect(map.get('volume-session-0284') === 'Volume Track 0284').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0284 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0285
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0285
     * @tc.desc   Verify metadata and session map volume case 285.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0285', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0285 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0285', title: 'Volume Track 0285', artist: 'Volume Artist 0285' };
      expect(metadata.assetId).assertEqual('volume-asset-0285');
      expect(metadata.title === 'Volume Track 0285').assertTrue();
      expect(metadata.artist === 'Volume Artist 0285').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0285', 'Volume Track 0285');
      expect(map.get('volume-session-0285') === 'Volume Track 0285').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0285 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0286
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0286
     * @tc.desc   Verify metadata and session map volume case 286.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0286', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0286 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0286', title: 'Volume Track 0286', artist: 'Volume Artist 0286' };
      expect(metadata.assetId).assertEqual('volume-asset-0286');
      expect(metadata.title === 'Volume Track 0286').assertTrue();
      expect(metadata.artist === 'Volume Artist 0286').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0286', 'Volume Track 0286');
      expect(map.get('volume-session-0286') === 'Volume Track 0286').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0286 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0287
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0287
     * @tc.desc   Verify metadata and session map volume case 287.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0287', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0287 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0287', title: 'Volume Track 0287', artist: 'Volume Artist 0287' };
      expect(metadata.assetId).assertEqual('volume-asset-0287');
      expect(metadata.title === 'Volume Track 0287').assertTrue();
      expect(metadata.artist === 'Volume Artist 0287').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0287', 'Volume Track 0287');
      expect(map.get('volume-session-0287') === 'Volume Track 0287').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0287 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0288
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0288
     * @tc.desc   Verify metadata and session map volume case 288.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0288', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0288 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0288', title: 'Volume Track 0288', artist: 'Volume Artist 0288' };
      expect(metadata.assetId).assertEqual('volume-asset-0288');
      expect(metadata.title === 'Volume Track 0288').assertTrue();
      expect(metadata.artist === 'Volume Artist 0288').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0288', 'Volume Track 0288');
      expect(map.get('volume-session-0288') === 'Volume Track 0288').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0288 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0289
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0289
     * @tc.desc   Verify metadata and session map volume case 289.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0289', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0289 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0289', title: 'Volume Track 0289', artist: 'Volume Artist 0289' };
      expect(metadata.assetId).assertEqual('volume-asset-0289');
      expect(metadata.title === 'Volume Track 0289').assertTrue();
      expect(metadata.artist === 'Volume Artist 0289').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0289', 'Volume Track 0289');
      expect(map.get('volume-session-0289') === 'Volume Track 0289').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0289 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0290
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0290
     * @tc.desc   Verify metadata and session map volume case 290.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0290 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0290', title: 'Volume Track 0290', artist: 'Volume Artist 0290' };
      expect(metadata.assetId).assertEqual('volume-asset-0290');
      expect(metadata.title === 'Volume Track 0290').assertTrue();
      expect(metadata.artist === 'Volume Artist 0290').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0290', 'Volume Track 0290');
      expect(map.get('volume-session-0290') === 'Volume Track 0290').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0290 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0291
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0291
     * @tc.desc   Verify metadata and session map volume case 291.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0291', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0291 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0291', title: 'Volume Track 0291', artist: 'Volume Artist 0291' };
      expect(metadata.assetId).assertEqual('volume-asset-0291');
      expect(metadata.title === 'Volume Track 0291').assertTrue();
      expect(metadata.artist === 'Volume Artist 0291').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0291', 'Volume Track 0291');
      expect(map.get('volume-session-0291') === 'Volume Track 0291').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0291 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0292
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0292
     * @tc.desc   Verify metadata and session map volume case 292.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0292', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0292 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0292', title: 'Volume Track 0292', artist: 'Volume Artist 0292' };
      expect(metadata.assetId).assertEqual('volume-asset-0292');
      expect(metadata.title === 'Volume Track 0292').assertTrue();
      expect(metadata.artist === 'Volume Artist 0292').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0292', 'Volume Track 0292');
      expect(map.get('volume-session-0292') === 'Volume Track 0292').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0292 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0293
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0293
     * @tc.desc   Verify metadata and session map volume case 293.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0293', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0293 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0293', title: 'Volume Track 0293', artist: 'Volume Artist 0293' };
      expect(metadata.assetId).assertEqual('volume-asset-0293');
      expect(metadata.title === 'Volume Track 0293').assertTrue();
      expect(metadata.artist === 'Volume Artist 0293').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0293', 'Volume Track 0293');
      expect(map.get('volume-session-0293') === 'Volume Track 0293').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0293 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0294
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0294
     * @tc.desc   Verify metadata and session map volume case 294.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0294', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0294 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0294', title: 'Volume Track 0294', artist: 'Volume Artist 0294' };
      expect(metadata.assetId).assertEqual('volume-asset-0294');
      expect(metadata.title === 'Volume Track 0294').assertTrue();
      expect(metadata.artist === 'Volume Artist 0294').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0294', 'Volume Track 0294');
      expect(map.get('volume-session-0294') === 'Volume Track 0294').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0294 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0295
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0295
     * @tc.desc   Verify metadata and session map volume case 295.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0295', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0295 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0295', title: 'Volume Track 0295', artist: 'Volume Artist 0295' };
      expect(metadata.assetId).assertEqual('volume-asset-0295');
      expect(metadata.title === 'Volume Track 0295').assertTrue();
      expect(metadata.artist === 'Volume Artist 0295').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0295', 'Volume Track 0295');
      expect(map.get('volume-session-0295') === 'Volume Track 0295').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0295 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0296
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0296
     * @tc.desc   Verify metadata and session map volume case 296.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0296', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0296 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0296', title: 'Volume Track 0296', artist: 'Volume Artist 0296' };
      expect(metadata.assetId).assertEqual('volume-asset-0296');
      expect(metadata.title === 'Volume Track 0296').assertTrue();
      expect(metadata.artist === 'Volume Artist 0296').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0296', 'Volume Track 0296');
      expect(map.get('volume-session-0296') === 'Volume Track 0296').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0296 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0297
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0297
     * @tc.desc   Verify metadata and session map volume case 297.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0297', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0297 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0297', title: 'Volume Track 0297', artist: 'Volume Artist 0297' };
      expect(metadata.assetId).assertEqual('volume-asset-0297');
      expect(metadata.title === 'Volume Track 0297').assertTrue();
      expect(metadata.artist === 'Volume Artist 0297').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0297', 'Volume Track 0297');
      expect(map.get('volume-session-0297') === 'Volume Track 0297').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0297 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0298
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0298
     * @tc.desc   Verify metadata and session map volume case 298.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0298', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0298 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0298', title: 'Volume Track 0298', artist: 'Volume Artist 0298' };
      expect(metadata.assetId).assertEqual('volume-asset-0298');
      expect(metadata.title === 'Volume Track 0298').assertTrue();
      expect(metadata.artist === 'Volume Artist 0298').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0298', 'Volume Track 0298');
      expect(map.get('volume-session-0298') === 'Volume Track 0298').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0298 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0299
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0299
     * @tc.desc   Verify metadata and session map volume case 299.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0299', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0299 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0299', title: 'Volume Track 0299', artist: 'Volume Artist 0299' };
      expect(metadata.assetId).assertEqual('volume-asset-0299');
      expect(metadata.title === 'Volume Track 0299').assertTrue();
      expect(metadata.artist === 'Volume Artist 0299').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0299', 'Volume Track 0299');
      expect(map.get('volume-session-0299') === 'Volume Track 0299').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0299 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0300
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0300
     * @tc.desc   Verify metadata and session map volume case 300.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0300 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0300', title: 'Volume Track 0300', artist: 'Volume Artist 0300' };
      expect(metadata.assetId).assertEqual('volume-asset-0300');
      expect(metadata.title === 'Volume Track 0300').assertTrue();
      expect(metadata.artist === 'Volume Artist 0300').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0300', 'Volume Track 0300');
      expect(map.get('volume-session-0300') === 'Volume Track 0300').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0300 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0301
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0301
     * @tc.desc   Verify metadata and session map volume case 301.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0301', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0301 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0301', title: 'Volume Track 0301', artist: 'Volume Artist 0301' };
      expect(metadata.assetId).assertEqual('volume-asset-0301');
      expect(metadata.title === 'Volume Track 0301').assertTrue();
      expect(metadata.artist === 'Volume Artist 0301').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0301', 'Volume Track 0301');
      expect(map.get('volume-session-0301') === 'Volume Track 0301').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0301 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0302
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0302
     * @tc.desc   Verify metadata and session map volume case 302.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0302', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0302 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0302', title: 'Volume Track 0302', artist: 'Volume Artist 0302' };
      expect(metadata.assetId).assertEqual('volume-asset-0302');
      expect(metadata.title === 'Volume Track 0302').assertTrue();
      expect(metadata.artist === 'Volume Artist 0302').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0302', 'Volume Track 0302');
      expect(map.get('volume-session-0302') === 'Volume Track 0302').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0302 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0303
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0303
     * @tc.desc   Verify metadata and session map volume case 303.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0303', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0303 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0303', title: 'Volume Track 0303', artist: 'Volume Artist 0303' };
      expect(metadata.assetId).assertEqual('volume-asset-0303');
      expect(metadata.title === 'Volume Track 0303').assertTrue();
      expect(metadata.artist === 'Volume Artist 0303').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0303', 'Volume Track 0303');
      expect(map.get('volume-session-0303') === 'Volume Track 0303').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0303 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0304
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0304
     * @tc.desc   Verify metadata and session map volume case 304.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0304', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0304 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0304', title: 'Volume Track 0304', artist: 'Volume Artist 0304' };
      expect(metadata.assetId).assertEqual('volume-asset-0304');
      expect(metadata.title === 'Volume Track 0304').assertTrue();
      expect(metadata.artist === 'Volume Artist 0304').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0304', 'Volume Track 0304');
      expect(map.get('volume-session-0304') === 'Volume Track 0304').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0304 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0305
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0305
     * @tc.desc   Verify metadata and session map volume case 305.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0305', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0305 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0305', title: 'Volume Track 0305', artist: 'Volume Artist 0305' };
      expect(metadata.assetId).assertEqual('volume-asset-0305');
      expect(metadata.title === 'Volume Track 0305').assertTrue();
      expect(metadata.artist === 'Volume Artist 0305').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0305', 'Volume Track 0305');
      expect(map.get('volume-session-0305') === 'Volume Track 0305').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0305 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0306
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0306
     * @tc.desc   Verify metadata and session map volume case 306.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0306', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0306 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0306', title: 'Volume Track 0306', artist: 'Volume Artist 0306' };
      expect(metadata.assetId).assertEqual('volume-asset-0306');
      expect(metadata.title === 'Volume Track 0306').assertTrue();
      expect(metadata.artist === 'Volume Artist 0306').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0306', 'Volume Track 0306');
      expect(map.get('volume-session-0306') === 'Volume Track 0306').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0306 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0307
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0307
     * @tc.desc   Verify metadata and session map volume case 307.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0307', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0307 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0307', title: 'Volume Track 0307', artist: 'Volume Artist 0307' };
      expect(metadata.assetId).assertEqual('volume-asset-0307');
      expect(metadata.title === 'Volume Track 0307').assertTrue();
      expect(metadata.artist === 'Volume Artist 0307').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0307', 'Volume Track 0307');
      expect(map.get('volume-session-0307') === 'Volume Track 0307').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0307 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0308
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0308
     * @tc.desc   Verify metadata and session map volume case 308.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0308', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0308 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0308', title: 'Volume Track 0308', artist: 'Volume Artist 0308' };
      expect(metadata.assetId).assertEqual('volume-asset-0308');
      expect(metadata.title === 'Volume Track 0308').assertTrue();
      expect(metadata.artist === 'Volume Artist 0308').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0308', 'Volume Track 0308');
      expect(map.get('volume-session-0308') === 'Volume Track 0308').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0308 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0309
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0309
     * @tc.desc   Verify metadata and session map volume case 309.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0309', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0309 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0309', title: 'Volume Track 0309', artist: 'Volume Artist 0309' };
      expect(metadata.assetId).assertEqual('volume-asset-0309');
      expect(metadata.title === 'Volume Track 0309').assertTrue();
      expect(metadata.artist === 'Volume Artist 0309').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0309', 'Volume Track 0309');
      expect(map.get('volume-session-0309') === 'Volume Track 0309').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0309 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0310
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0310
     * @tc.desc   Verify metadata and session map volume case 310.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0310 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0310', title: 'Volume Track 0310', artist: 'Volume Artist 0310' };
      expect(metadata.assetId).assertEqual('volume-asset-0310');
      expect(metadata.title === 'Volume Track 0310').assertTrue();
      expect(metadata.artist === 'Volume Artist 0310').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0310', 'Volume Track 0310');
      expect(map.get('volume-session-0310') === 'Volume Track 0310').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0310 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0311
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0311
     * @tc.desc   Verify metadata and session map volume case 311.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0311', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0311 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0311', title: 'Volume Track 0311', artist: 'Volume Artist 0311' };
      expect(metadata.assetId).assertEqual('volume-asset-0311');
      expect(metadata.title === 'Volume Track 0311').assertTrue();
      expect(metadata.artist === 'Volume Artist 0311').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0311', 'Volume Track 0311');
      expect(map.get('volume-session-0311') === 'Volume Track 0311').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0311 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0312
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0312
     * @tc.desc   Verify metadata and session map volume case 312.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0312', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0312 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0312', title: 'Volume Track 0312', artist: 'Volume Artist 0312' };
      expect(metadata.assetId).assertEqual('volume-asset-0312');
      expect(metadata.title === 'Volume Track 0312').assertTrue();
      expect(metadata.artist === 'Volume Artist 0312').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0312', 'Volume Track 0312');
      expect(map.get('volume-session-0312') === 'Volume Track 0312').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0312 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0313
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0313
     * @tc.desc   Verify metadata and session map volume case 313.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0313', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0313 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0313', title: 'Volume Track 0313', artist: 'Volume Artist 0313' };
      expect(metadata.assetId).assertEqual('volume-asset-0313');
      expect(metadata.title === 'Volume Track 0313').assertTrue();
      expect(metadata.artist === 'Volume Artist 0313').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0313', 'Volume Track 0313');
      expect(map.get('volume-session-0313') === 'Volume Track 0313').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0313 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0314
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0314
     * @tc.desc   Verify metadata and session map volume case 314.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0314', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0314 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0314', title: 'Volume Track 0314', artist: 'Volume Artist 0314' };
      expect(metadata.assetId).assertEqual('volume-asset-0314');
      expect(metadata.title === 'Volume Track 0314').assertTrue();
      expect(metadata.artist === 'Volume Artist 0314').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0314', 'Volume Track 0314');
      expect(map.get('volume-session-0314') === 'Volume Track 0314').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0314 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0315
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0315
     * @tc.desc   Verify metadata and session map volume case 315.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0315', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0315 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0315', title: 'Volume Track 0315', artist: 'Volume Artist 0315' };
      expect(metadata.assetId).assertEqual('volume-asset-0315');
      expect(metadata.title === 'Volume Track 0315').assertTrue();
      expect(metadata.artist === 'Volume Artist 0315').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0315', 'Volume Track 0315');
      expect(map.get('volume-session-0315') === 'Volume Track 0315').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0315 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0316
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0316
     * @tc.desc   Verify metadata and session map volume case 316.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0316', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0316 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0316', title: 'Volume Track 0316', artist: 'Volume Artist 0316' };
      expect(metadata.assetId).assertEqual('volume-asset-0316');
      expect(metadata.title === 'Volume Track 0316').assertTrue();
      expect(metadata.artist === 'Volume Artist 0316').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0316', 'Volume Track 0316');
      expect(map.get('volume-session-0316') === 'Volume Track 0316').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0316 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0317
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0317
     * @tc.desc   Verify metadata and session map volume case 317.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0317', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0317 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0317', title: 'Volume Track 0317', artist: 'Volume Artist 0317' };
      expect(metadata.assetId).assertEqual('volume-asset-0317');
      expect(metadata.title === 'Volume Track 0317').assertTrue();
      expect(metadata.artist === 'Volume Artist 0317').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0317', 'Volume Track 0317');
      expect(map.get('volume-session-0317') === 'Volume Track 0317').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0317 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0318
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0318
     * @tc.desc   Verify metadata and session map volume case 318.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0318', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0318 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0318', title: 'Volume Track 0318', artist: 'Volume Artist 0318' };
      expect(metadata.assetId).assertEqual('volume-asset-0318');
      expect(metadata.title === 'Volume Track 0318').assertTrue();
      expect(metadata.artist === 'Volume Artist 0318').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0318', 'Volume Track 0318');
      expect(map.get('volume-session-0318') === 'Volume Track 0318').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0318 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0319
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0319
     * @tc.desc   Verify metadata and session map volume case 319.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0319', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0319 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0319', title: 'Volume Track 0319', artist: 'Volume Artist 0319' };
      expect(metadata.assetId).assertEqual('volume-asset-0319');
      expect(metadata.title === 'Volume Track 0319').assertTrue();
      expect(metadata.artist === 'Volume Artist 0319').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0319', 'Volume Track 0319');
      expect(map.get('volume-session-0319') === 'Volume Track 0319').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0319 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0320
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0320
     * @tc.desc   Verify metadata and session map volume case 320.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0320 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0320', title: 'Volume Track 0320', artist: 'Volume Artist 0320' };
      expect(metadata.assetId).assertEqual('volume-asset-0320');
      expect(metadata.title === 'Volume Track 0320').assertTrue();
      expect(metadata.artist === 'Volume Artist 0320').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0320', 'Volume Track 0320');
      expect(map.get('volume-session-0320') === 'Volume Track 0320').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0320 end');
    })
  })
}
