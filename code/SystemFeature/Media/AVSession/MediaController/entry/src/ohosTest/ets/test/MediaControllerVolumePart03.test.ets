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
import { avSession as AVSessionManager } from '@kit.AVSessionKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function mediaControllerVolumeTestPart03() {
  describe('MediaControllerVolumePart03', () => {
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0161
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0161
     * @tc.desc   Verify metadata and session map volume case 161.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0161 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0161', title: 'Volume Track 0161', artist: 'Volume Artist 0161' };
      expect(metadata.assetId).assertEqual('volume-asset-0161');
      expect(metadata.title === 'Volume Track 0161').assertTrue();
      expect(metadata.artist === 'Volume Artist 0161').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0161', 'Volume Track 0161');
      expect(map.get('volume-session-0161') === 'Volume Track 0161').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0161 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0162
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0162
     * @tc.desc   Verify metadata and session map volume case 162.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0162 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0162', title: 'Volume Track 0162', artist: 'Volume Artist 0162' };
      expect(metadata.assetId).assertEqual('volume-asset-0162');
      expect(metadata.title === 'Volume Track 0162').assertTrue();
      expect(metadata.artist === 'Volume Artist 0162').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0162', 'Volume Track 0162');
      expect(map.get('volume-session-0162') === 'Volume Track 0162').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0162 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0163
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0163
     * @tc.desc   Verify metadata and session map volume case 163.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0163 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0163', title: 'Volume Track 0163', artist: 'Volume Artist 0163' };
      expect(metadata.assetId).assertEqual('volume-asset-0163');
      expect(metadata.title === 'Volume Track 0163').assertTrue();
      expect(metadata.artist === 'Volume Artist 0163').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0163', 'Volume Track 0163');
      expect(map.get('volume-session-0163') === 'Volume Track 0163').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0163 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0164
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0164
     * @tc.desc   Verify metadata and session map volume case 164.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0164 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0164', title: 'Volume Track 0164', artist: 'Volume Artist 0164' };
      expect(metadata.assetId).assertEqual('volume-asset-0164');
      expect(metadata.title === 'Volume Track 0164').assertTrue();
      expect(metadata.artist === 'Volume Artist 0164').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0164', 'Volume Track 0164');
      expect(map.get('volume-session-0164') === 'Volume Track 0164').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0164 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0165
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0165
     * @tc.desc   Verify metadata and session map volume case 165.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0165 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0165', title: 'Volume Track 0165', artist: 'Volume Artist 0165' };
      expect(metadata.assetId).assertEqual('volume-asset-0165');
      expect(metadata.title === 'Volume Track 0165').assertTrue();
      expect(metadata.artist === 'Volume Artist 0165').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0165', 'Volume Track 0165');
      expect(map.get('volume-session-0165') === 'Volume Track 0165').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0165 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0166
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0166
     * @tc.desc   Verify metadata and session map volume case 166.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0166 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0166', title: 'Volume Track 0166', artist: 'Volume Artist 0166' };
      expect(metadata.assetId).assertEqual('volume-asset-0166');
      expect(metadata.title === 'Volume Track 0166').assertTrue();
      expect(metadata.artist === 'Volume Artist 0166').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0166', 'Volume Track 0166');
      expect(map.get('volume-session-0166') === 'Volume Track 0166').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0166 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0167
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0167
     * @tc.desc   Verify metadata and session map volume case 167.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0167 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0167', title: 'Volume Track 0167', artist: 'Volume Artist 0167' };
      expect(metadata.assetId).assertEqual('volume-asset-0167');
      expect(metadata.title === 'Volume Track 0167').assertTrue();
      expect(metadata.artist === 'Volume Artist 0167').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0167', 'Volume Track 0167');
      expect(map.get('volume-session-0167') === 'Volume Track 0167').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0167 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0168
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0168
     * @tc.desc   Verify metadata and session map volume case 168.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0168 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0168', title: 'Volume Track 0168', artist: 'Volume Artist 0168' };
      expect(metadata.assetId).assertEqual('volume-asset-0168');
      expect(metadata.title === 'Volume Track 0168').assertTrue();
      expect(metadata.artist === 'Volume Artist 0168').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0168', 'Volume Track 0168');
      expect(map.get('volume-session-0168') === 'Volume Track 0168').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0168 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0169
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0169
     * @tc.desc   Verify metadata and session map volume case 169.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0169 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0169', title: 'Volume Track 0169', artist: 'Volume Artist 0169' };
      expect(metadata.assetId).assertEqual('volume-asset-0169');
      expect(metadata.title === 'Volume Track 0169').assertTrue();
      expect(metadata.artist === 'Volume Artist 0169').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0169', 'Volume Track 0169');
      expect(map.get('volume-session-0169') === 'Volume Track 0169').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0169 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0170
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0170
     * @tc.desc   Verify metadata and session map volume case 170.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0170 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0170', title: 'Volume Track 0170', artist: 'Volume Artist 0170' };
      expect(metadata.assetId).assertEqual('volume-asset-0170');
      expect(metadata.title === 'Volume Track 0170').assertTrue();
      expect(metadata.artist === 'Volume Artist 0170').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0170', 'Volume Track 0170');
      expect(map.get('volume-session-0170') === 'Volume Track 0170').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0170 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0171
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0171
     * @tc.desc   Verify metadata and session map volume case 171.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0171 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0171', title: 'Volume Track 0171', artist: 'Volume Artist 0171' };
      expect(metadata.assetId).assertEqual('volume-asset-0171');
      expect(metadata.title === 'Volume Track 0171').assertTrue();
      expect(metadata.artist === 'Volume Artist 0171').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0171', 'Volume Track 0171');
      expect(map.get('volume-session-0171') === 'Volume Track 0171').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0171 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0172
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0172
     * @tc.desc   Verify metadata and session map volume case 172.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0172 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0172', title: 'Volume Track 0172', artist: 'Volume Artist 0172' };
      expect(metadata.assetId).assertEqual('volume-asset-0172');
      expect(metadata.title === 'Volume Track 0172').assertTrue();
      expect(metadata.artist === 'Volume Artist 0172').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0172', 'Volume Track 0172');
      expect(map.get('volume-session-0172') === 'Volume Track 0172').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0172 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0173
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0173
     * @tc.desc   Verify metadata and session map volume case 173.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0173 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0173', title: 'Volume Track 0173', artist: 'Volume Artist 0173' };
      expect(metadata.assetId).assertEqual('volume-asset-0173');
      expect(metadata.title === 'Volume Track 0173').assertTrue();
      expect(metadata.artist === 'Volume Artist 0173').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0173', 'Volume Track 0173');
      expect(map.get('volume-session-0173') === 'Volume Track 0173').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0173 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0174
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0174
     * @tc.desc   Verify metadata and session map volume case 174.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0174 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0174', title: 'Volume Track 0174', artist: 'Volume Artist 0174' };
      expect(metadata.assetId).assertEqual('volume-asset-0174');
      expect(metadata.title === 'Volume Track 0174').assertTrue();
      expect(metadata.artist === 'Volume Artist 0174').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0174', 'Volume Track 0174');
      expect(map.get('volume-session-0174') === 'Volume Track 0174').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0174 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0175
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0175
     * @tc.desc   Verify metadata and session map volume case 175.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0175 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0175', title: 'Volume Track 0175', artist: 'Volume Artist 0175' };
      expect(metadata.assetId).assertEqual('volume-asset-0175');
      expect(metadata.title === 'Volume Track 0175').assertTrue();
      expect(metadata.artist === 'Volume Artist 0175').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0175', 'Volume Track 0175');
      expect(map.get('volume-session-0175') === 'Volume Track 0175').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0175 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0176
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0176
     * @tc.desc   Verify metadata and session map volume case 176.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0176 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0176', title: 'Volume Track 0176', artist: 'Volume Artist 0176' };
      expect(metadata.assetId).assertEqual('volume-asset-0176');
      expect(metadata.title === 'Volume Track 0176').assertTrue();
      expect(metadata.artist === 'Volume Artist 0176').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0176', 'Volume Track 0176');
      expect(map.get('volume-session-0176') === 'Volume Track 0176').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0176 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0177
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0177
     * @tc.desc   Verify metadata and session map volume case 177.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0177 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0177', title: 'Volume Track 0177', artist: 'Volume Artist 0177' };
      expect(metadata.assetId).assertEqual('volume-asset-0177');
      expect(metadata.title === 'Volume Track 0177').assertTrue();
      expect(metadata.artist === 'Volume Artist 0177').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0177', 'Volume Track 0177');
      expect(map.get('volume-session-0177') === 'Volume Track 0177').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0177 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0178
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0178
     * @tc.desc   Verify metadata and session map volume case 178.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0178 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0178', title: 'Volume Track 0178', artist: 'Volume Artist 0178' };
      expect(metadata.assetId).assertEqual('volume-asset-0178');
      expect(metadata.title === 'Volume Track 0178').assertTrue();
      expect(metadata.artist === 'Volume Artist 0178').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0178', 'Volume Track 0178');
      expect(map.get('volume-session-0178') === 'Volume Track 0178').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0178 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0179
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0179
     * @tc.desc   Verify metadata and session map volume case 179.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0179 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0179', title: 'Volume Track 0179', artist: 'Volume Artist 0179' };
      expect(metadata.assetId).assertEqual('volume-asset-0179');
      expect(metadata.title === 'Volume Track 0179').assertTrue();
      expect(metadata.artist === 'Volume Artist 0179').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0179', 'Volume Track 0179');
      expect(map.get('volume-session-0179') === 'Volume Track 0179').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0179 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0180
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0180
     * @tc.desc   Verify metadata and session map volume case 180.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0180 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0180', title: 'Volume Track 0180', artist: 'Volume Artist 0180' };
      expect(metadata.assetId).assertEqual('volume-asset-0180');
      expect(metadata.title === 'Volume Track 0180').assertTrue();
      expect(metadata.artist === 'Volume Artist 0180').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0180', 'Volume Track 0180');
      expect(map.get('volume-session-0180') === 'Volume Track 0180').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0180 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0181
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0181
     * @tc.desc   Verify metadata and session map volume case 181.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0181 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0181', title: 'Volume Track 0181', artist: 'Volume Artist 0181' };
      expect(metadata.assetId).assertEqual('volume-asset-0181');
      expect(metadata.title === 'Volume Track 0181').assertTrue();
      expect(metadata.artist === 'Volume Artist 0181').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0181', 'Volume Track 0181');
      expect(map.get('volume-session-0181') === 'Volume Track 0181').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0181 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0182
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0182
     * @tc.desc   Verify metadata and session map volume case 182.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0182 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0182', title: 'Volume Track 0182', artist: 'Volume Artist 0182' };
      expect(metadata.assetId).assertEqual('volume-asset-0182');
      expect(metadata.title === 'Volume Track 0182').assertTrue();
      expect(metadata.artist === 'Volume Artist 0182').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0182', 'Volume Track 0182');
      expect(map.get('volume-session-0182') === 'Volume Track 0182').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0182 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0183
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0183
     * @tc.desc   Verify metadata and session map volume case 183.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0183 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0183', title: 'Volume Track 0183', artist: 'Volume Artist 0183' };
      expect(metadata.assetId).assertEqual('volume-asset-0183');
      expect(metadata.title === 'Volume Track 0183').assertTrue();
      expect(metadata.artist === 'Volume Artist 0183').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0183', 'Volume Track 0183');
      expect(map.get('volume-session-0183') === 'Volume Track 0183').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0183 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0184
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0184
     * @tc.desc   Verify metadata and session map volume case 184.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0184 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0184', title: 'Volume Track 0184', artist: 'Volume Artist 0184' };
      expect(metadata.assetId).assertEqual('volume-asset-0184');
      expect(metadata.title === 'Volume Track 0184').assertTrue();
      expect(metadata.artist === 'Volume Artist 0184').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0184', 'Volume Track 0184');
      expect(map.get('volume-session-0184') === 'Volume Track 0184').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0184 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0185
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0185
     * @tc.desc   Verify metadata and session map volume case 185.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0185 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0185', title: 'Volume Track 0185', artist: 'Volume Artist 0185' };
      expect(metadata.assetId).assertEqual('volume-asset-0185');
      expect(metadata.title === 'Volume Track 0185').assertTrue();
      expect(metadata.artist === 'Volume Artist 0185').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0185', 'Volume Track 0185');
      expect(map.get('volume-session-0185') === 'Volume Track 0185').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0185 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0186
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0186
     * @tc.desc   Verify metadata and session map volume case 186.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0186 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0186', title: 'Volume Track 0186', artist: 'Volume Artist 0186' };
      expect(metadata.assetId).assertEqual('volume-asset-0186');
      expect(metadata.title === 'Volume Track 0186').assertTrue();
      expect(metadata.artist === 'Volume Artist 0186').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0186', 'Volume Track 0186');
      expect(map.get('volume-session-0186') === 'Volume Track 0186').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0186 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0187
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0187
     * @tc.desc   Verify metadata and session map volume case 187.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0187 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0187', title: 'Volume Track 0187', artist: 'Volume Artist 0187' };
      expect(metadata.assetId).assertEqual('volume-asset-0187');
      expect(metadata.title === 'Volume Track 0187').assertTrue();
      expect(metadata.artist === 'Volume Artist 0187').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0187', 'Volume Track 0187');
      expect(map.get('volume-session-0187') === 'Volume Track 0187').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0187 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0188
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0188
     * @tc.desc   Verify metadata and session map volume case 188.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0188 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0188', title: 'Volume Track 0188', artist: 'Volume Artist 0188' };
      expect(metadata.assetId).assertEqual('volume-asset-0188');
      expect(metadata.title === 'Volume Track 0188').assertTrue();
      expect(metadata.artist === 'Volume Artist 0188').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0188', 'Volume Track 0188');
      expect(map.get('volume-session-0188') === 'Volume Track 0188').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0188 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0189
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0189
     * @tc.desc   Verify metadata and session map volume case 189.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0189 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0189', title: 'Volume Track 0189', artist: 'Volume Artist 0189' };
      expect(metadata.assetId).assertEqual('volume-asset-0189');
      expect(metadata.title === 'Volume Track 0189').assertTrue();
      expect(metadata.artist === 'Volume Artist 0189').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0189', 'Volume Track 0189');
      expect(map.get('volume-session-0189') === 'Volume Track 0189').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0189 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0190
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0190
     * @tc.desc   Verify metadata and session map volume case 190.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0190 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0190', title: 'Volume Track 0190', artist: 'Volume Artist 0190' };
      expect(metadata.assetId).assertEqual('volume-asset-0190');
      expect(metadata.title === 'Volume Track 0190').assertTrue();
      expect(metadata.artist === 'Volume Artist 0190').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0190', 'Volume Track 0190');
      expect(map.get('volume-session-0190') === 'Volume Track 0190').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0190 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0191
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0191
     * @tc.desc   Verify metadata and session map volume case 191.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0191 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0191', title: 'Volume Track 0191', artist: 'Volume Artist 0191' };
      expect(metadata.assetId).assertEqual('volume-asset-0191');
      expect(metadata.title === 'Volume Track 0191').assertTrue();
      expect(metadata.artist === 'Volume Artist 0191').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0191', 'Volume Track 0191');
      expect(map.get('volume-session-0191') === 'Volume Track 0191').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0191 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0192
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0192
     * @tc.desc   Verify metadata and session map volume case 192.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0192 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0192', title: 'Volume Track 0192', artist: 'Volume Artist 0192' };
      expect(metadata.assetId).assertEqual('volume-asset-0192');
      expect(metadata.title === 'Volume Track 0192').assertTrue();
      expect(metadata.artist === 'Volume Artist 0192').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0192', 'Volume Track 0192');
      expect(map.get('volume-session-0192') === 'Volume Track 0192').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0192 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0193
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0193
     * @tc.desc   Verify metadata and session map volume case 193.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0193 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0193', title: 'Volume Track 0193', artist: 'Volume Artist 0193' };
      expect(metadata.assetId).assertEqual('volume-asset-0193');
      expect(metadata.title === 'Volume Track 0193').assertTrue();
      expect(metadata.artist === 'Volume Artist 0193').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0193', 'Volume Track 0193');
      expect(map.get('volume-session-0193') === 'Volume Track 0193').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0193 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0194
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0194
     * @tc.desc   Verify metadata and session map volume case 194.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0194 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0194', title: 'Volume Track 0194', artist: 'Volume Artist 0194' };
      expect(metadata.assetId).assertEqual('volume-asset-0194');
      expect(metadata.title === 'Volume Track 0194').assertTrue();
      expect(metadata.artist === 'Volume Artist 0194').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0194', 'Volume Track 0194');
      expect(map.get('volume-session-0194') === 'Volume Track 0194').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0194 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0195
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0195
     * @tc.desc   Verify metadata and session map volume case 195.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0195 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0195', title: 'Volume Track 0195', artist: 'Volume Artist 0195' };
      expect(metadata.assetId).assertEqual('volume-asset-0195');
      expect(metadata.title === 'Volume Track 0195').assertTrue();
      expect(metadata.artist === 'Volume Artist 0195').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0195', 'Volume Track 0195');
      expect(map.get('volume-session-0195') === 'Volume Track 0195').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0195 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0196
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0196
     * @tc.desc   Verify metadata and session map volume case 196.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0196 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0196', title: 'Volume Track 0196', artist: 'Volume Artist 0196' };
      expect(metadata.assetId).assertEqual('volume-asset-0196');
      expect(metadata.title === 'Volume Track 0196').assertTrue();
      expect(metadata.artist === 'Volume Artist 0196').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0196', 'Volume Track 0196');
      expect(map.get('volume-session-0196') === 'Volume Track 0196').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0196 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0197
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0197
     * @tc.desc   Verify metadata and session map volume case 197.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0197 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0197', title: 'Volume Track 0197', artist: 'Volume Artist 0197' };
      expect(metadata.assetId).assertEqual('volume-asset-0197');
      expect(metadata.title === 'Volume Track 0197').assertTrue();
      expect(metadata.artist === 'Volume Artist 0197').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0197', 'Volume Track 0197');
      expect(map.get('volume-session-0197') === 'Volume Track 0197').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0197 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0198
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0198
     * @tc.desc   Verify metadata and session map volume case 198.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0198 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0198', title: 'Volume Track 0198', artist: 'Volume Artist 0198' };
      expect(metadata.assetId).assertEqual('volume-asset-0198');
      expect(metadata.title === 'Volume Track 0198').assertTrue();
      expect(metadata.artist === 'Volume Artist 0198').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0198', 'Volume Track 0198');
      expect(map.get('volume-session-0198') === 'Volume Track 0198').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0198 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0199
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0199
     * @tc.desc   Verify metadata and session map volume case 199.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0199 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0199', title: 'Volume Track 0199', artist: 'Volume Artist 0199' };
      expect(metadata.assetId).assertEqual('volume-asset-0199');
      expect(metadata.title === 'Volume Track 0199').assertTrue();
      expect(metadata.artist === 'Volume Artist 0199').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0199', 'Volume Track 0199');
      expect(map.get('volume-session-0199') === 'Volume Track 0199').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0199 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0200
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0200
     * @tc.desc   Verify metadata and session map volume case 200.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0200 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0200', title: 'Volume Track 0200', artist: 'Volume Artist 0200' };
      expect(metadata.assetId).assertEqual('volume-asset-0200');
      expect(metadata.title === 'Volume Track 0200').assertTrue();
      expect(metadata.artist === 'Volume Artist 0200').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0200', 'Volume Track 0200');
      expect(map.get('volume-session-0200') === 'Volume Track 0200').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0200 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0201
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0201
     * @tc.desc   Verify metadata and session map volume case 201.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0201 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0201', title: 'Volume Track 0201', artist: 'Volume Artist 0201' };
      expect(metadata.assetId).assertEqual('volume-asset-0201');
      expect(metadata.title === 'Volume Track 0201').assertTrue();
      expect(metadata.artist === 'Volume Artist 0201').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0201', 'Volume Track 0201');
      expect(map.get('volume-session-0201') === 'Volume Track 0201').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0201 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0202
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0202
     * @tc.desc   Verify metadata and session map volume case 202.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0202 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0202', title: 'Volume Track 0202', artist: 'Volume Artist 0202' };
      expect(metadata.assetId).assertEqual('volume-asset-0202');
      expect(metadata.title === 'Volume Track 0202').assertTrue();
      expect(metadata.artist === 'Volume Artist 0202').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0202', 'Volume Track 0202');
      expect(map.get('volume-session-0202') === 'Volume Track 0202').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0202 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0203
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0203
     * @tc.desc   Verify metadata and session map volume case 203.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0203 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0203', title: 'Volume Track 0203', artist: 'Volume Artist 0203' };
      expect(metadata.assetId).assertEqual('volume-asset-0203');
      expect(metadata.title === 'Volume Track 0203').assertTrue();
      expect(metadata.artist === 'Volume Artist 0203').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0203', 'Volume Track 0203');
      expect(map.get('volume-session-0203') === 'Volume Track 0203').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0203 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0204
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0204
     * @tc.desc   Verify metadata and session map volume case 204.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0204 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0204', title: 'Volume Track 0204', artist: 'Volume Artist 0204' };
      expect(metadata.assetId).assertEqual('volume-asset-0204');
      expect(metadata.title === 'Volume Track 0204').assertTrue();
      expect(metadata.artist === 'Volume Artist 0204').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0204', 'Volume Track 0204');
      expect(map.get('volume-session-0204') === 'Volume Track 0204').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0204 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0205
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0205
     * @tc.desc   Verify metadata and session map volume case 205.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0205 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0205', title: 'Volume Track 0205', artist: 'Volume Artist 0205' };
      expect(metadata.assetId).assertEqual('volume-asset-0205');
      expect(metadata.title === 'Volume Track 0205').assertTrue();
      expect(metadata.artist === 'Volume Artist 0205').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0205', 'Volume Track 0205');
      expect(map.get('volume-session-0205') === 'Volume Track 0205').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0205 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0206
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0206
     * @tc.desc   Verify metadata and session map volume case 206.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0206 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0206', title: 'Volume Track 0206', artist: 'Volume Artist 0206' };
      expect(metadata.assetId).assertEqual('volume-asset-0206');
      expect(metadata.title === 'Volume Track 0206').assertTrue();
      expect(metadata.artist === 'Volume Artist 0206').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0206', 'Volume Track 0206');
      expect(map.get('volume-session-0206') === 'Volume Track 0206').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0206 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0207
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0207
     * @tc.desc   Verify metadata and session map volume case 207.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0207 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0207', title: 'Volume Track 0207', artist: 'Volume Artist 0207' };
      expect(metadata.assetId).assertEqual('volume-asset-0207');
      expect(metadata.title === 'Volume Track 0207').assertTrue();
      expect(metadata.artist === 'Volume Artist 0207').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0207', 'Volume Track 0207');
      expect(map.get('volume-session-0207') === 'Volume Track 0207').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0207 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0208
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0208
     * @tc.desc   Verify metadata and session map volume case 208.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0208 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0208', title: 'Volume Track 0208', artist: 'Volume Artist 0208' };
      expect(metadata.assetId).assertEqual('volume-asset-0208');
      expect(metadata.title === 'Volume Track 0208').assertTrue();
      expect(metadata.artist === 'Volume Artist 0208').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0208', 'Volume Track 0208');
      expect(map.get('volume-session-0208') === 'Volume Track 0208').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0208 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0209
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0209
     * @tc.desc   Verify metadata and session map volume case 209.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0209 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0209', title: 'Volume Track 0209', artist: 'Volume Artist 0209' };
      expect(metadata.assetId).assertEqual('volume-asset-0209');
      expect(metadata.title === 'Volume Track 0209').assertTrue();
      expect(metadata.artist === 'Volume Artist 0209').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0209', 'Volume Track 0209');
      expect(map.get('volume-session-0209') === 'Volume Track 0209').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0209 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0210
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0210
     * @tc.desc   Verify metadata and session map volume case 210.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0210 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0210', title: 'Volume Track 0210', artist: 'Volume Artist 0210' };
      expect(metadata.assetId).assertEqual('volume-asset-0210');
      expect(metadata.title === 'Volume Track 0210').assertTrue();
      expect(metadata.artist === 'Volume Artist 0210').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0210', 'Volume Track 0210');
      expect(map.get('volume-session-0210') === 'Volume Track 0210').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0210 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0211
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0211
     * @tc.desc   Verify metadata and session map volume case 211.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0211 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0211', title: 'Volume Track 0211', artist: 'Volume Artist 0211' };
      expect(metadata.assetId).assertEqual('volume-asset-0211');
      expect(metadata.title === 'Volume Track 0211').assertTrue();
      expect(metadata.artist === 'Volume Artist 0211').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0211', 'Volume Track 0211');
      expect(map.get('volume-session-0211') === 'Volume Track 0211').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0211 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0212
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0212
     * @tc.desc   Verify metadata and session map volume case 212.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0212 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0212', title: 'Volume Track 0212', artist: 'Volume Artist 0212' };
      expect(metadata.assetId).assertEqual('volume-asset-0212');
      expect(metadata.title === 'Volume Track 0212').assertTrue();
      expect(metadata.artist === 'Volume Artist 0212').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0212', 'Volume Track 0212');
      expect(map.get('volume-session-0212') === 'Volume Track 0212').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0212 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0213
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0213
     * @tc.desc   Verify metadata and session map volume case 213.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0213 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0213', title: 'Volume Track 0213', artist: 'Volume Artist 0213' };
      expect(metadata.assetId).assertEqual('volume-asset-0213');
      expect(metadata.title === 'Volume Track 0213').assertTrue();
      expect(metadata.artist === 'Volume Artist 0213').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0213', 'Volume Track 0213');
      expect(map.get('volume-session-0213') === 'Volume Track 0213').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0213 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0214
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0214
     * @tc.desc   Verify metadata and session map volume case 214.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0214 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0214', title: 'Volume Track 0214', artist: 'Volume Artist 0214' };
      expect(metadata.assetId).assertEqual('volume-asset-0214');
      expect(metadata.title === 'Volume Track 0214').assertTrue();
      expect(metadata.artist === 'Volume Artist 0214').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0214', 'Volume Track 0214');
      expect(map.get('volume-session-0214') === 'Volume Track 0214').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0214 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0215
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0215
     * @tc.desc   Verify metadata and session map volume case 215.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0215 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0215', title: 'Volume Track 0215', artist: 'Volume Artist 0215' };
      expect(metadata.assetId).assertEqual('volume-asset-0215');
      expect(metadata.title === 'Volume Track 0215').assertTrue();
      expect(metadata.artist === 'Volume Artist 0215').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0215', 'Volume Track 0215');
      expect(map.get('volume-session-0215') === 'Volume Track 0215').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0215 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0216
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0216
     * @tc.desc   Verify metadata and session map volume case 216.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0216 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0216', title: 'Volume Track 0216', artist: 'Volume Artist 0216' };
      expect(metadata.assetId).assertEqual('volume-asset-0216');
      expect(metadata.title === 'Volume Track 0216').assertTrue();
      expect(metadata.artist === 'Volume Artist 0216').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0216', 'Volume Track 0216');
      expect(map.get('volume-session-0216') === 'Volume Track 0216').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0216 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0217
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0217
     * @tc.desc   Verify metadata and session map volume case 217.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0217 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0217', title: 'Volume Track 0217', artist: 'Volume Artist 0217' };
      expect(metadata.assetId).assertEqual('volume-asset-0217');
      expect(metadata.title === 'Volume Track 0217').assertTrue();
      expect(metadata.artist === 'Volume Artist 0217').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0217', 'Volume Track 0217');
      expect(map.get('volume-session-0217') === 'Volume Track 0217').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0217 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0218
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0218
     * @tc.desc   Verify metadata and session map volume case 218.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0218 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0218', title: 'Volume Track 0218', artist: 'Volume Artist 0218' };
      expect(metadata.assetId).assertEqual('volume-asset-0218');
      expect(metadata.title === 'Volume Track 0218').assertTrue();
      expect(metadata.artist === 'Volume Artist 0218').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0218', 'Volume Track 0218');
      expect(map.get('volume-session-0218') === 'Volume Track 0218').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0218 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0219
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0219
     * @tc.desc   Verify metadata and session map volume case 219.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0219 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0219', title: 'Volume Track 0219', artist: 'Volume Artist 0219' };
      expect(metadata.assetId).assertEqual('volume-asset-0219');
      expect(metadata.title === 'Volume Track 0219').assertTrue();
      expect(metadata.artist === 'Volume Artist 0219').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0219', 'Volume Track 0219');
      expect(map.get('volume-session-0219') === 'Volume Track 0219').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0219 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0220
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0220
     * @tc.desc   Verify metadata and session map volume case 220.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0220 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0220', title: 'Volume Track 0220', artist: 'Volume Artist 0220' };
      expect(metadata.assetId).assertEqual('volume-asset-0220');
      expect(metadata.title === 'Volume Track 0220').assertTrue();
      expect(metadata.artist === 'Volume Artist 0220').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0220', 'Volume Track 0220');
      expect(map.get('volume-session-0220') === 'Volume Track 0220').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0220 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0221
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0221
     * @tc.desc   Verify metadata and session map volume case 221.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0221', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0221 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0221', title: 'Volume Track 0221', artist: 'Volume Artist 0221' };
      expect(metadata.assetId).assertEqual('volume-asset-0221');
      expect(metadata.title === 'Volume Track 0221').assertTrue();
      expect(metadata.artist === 'Volume Artist 0221').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0221', 'Volume Track 0221');
      expect(map.get('volume-session-0221') === 'Volume Track 0221').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0221 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0222
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0222
     * @tc.desc   Verify metadata and session map volume case 222.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0222', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0222 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0222', title: 'Volume Track 0222', artist: 'Volume Artist 0222' };
      expect(metadata.assetId).assertEqual('volume-asset-0222');
      expect(metadata.title === 'Volume Track 0222').assertTrue();
      expect(metadata.artist === 'Volume Artist 0222').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0222', 'Volume Track 0222');
      expect(map.get('volume-session-0222') === 'Volume Track 0222').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0222 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0223
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0223
     * @tc.desc   Verify metadata and session map volume case 223.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0223', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0223 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0223', title: 'Volume Track 0223', artist: 'Volume Artist 0223' };
      expect(metadata.assetId).assertEqual('volume-asset-0223');
      expect(metadata.title === 'Volume Track 0223').assertTrue();
      expect(metadata.artist === 'Volume Artist 0223').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0223', 'Volume Track 0223');
      expect(map.get('volume-session-0223') === 'Volume Track 0223').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0223 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0224
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0224
     * @tc.desc   Verify metadata and session map volume case 224.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0224', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0224 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0224', title: 'Volume Track 0224', artist: 'Volume Artist 0224' };
      expect(metadata.assetId).assertEqual('volume-asset-0224');
      expect(metadata.title === 'Volume Track 0224').assertTrue();
      expect(metadata.artist === 'Volume Artist 0224').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0224', 'Volume Track 0224');
      expect(map.get('volume-session-0224') === 'Volume Track 0224').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0224 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0225
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0225
     * @tc.desc   Verify metadata and session map volume case 225.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0225', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0225 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0225', title: 'Volume Track 0225', artist: 'Volume Artist 0225' };
      expect(metadata.assetId).assertEqual('volume-asset-0225');
      expect(metadata.title === 'Volume Track 0225').assertTrue();
      expect(metadata.artist === 'Volume Artist 0225').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0225', 'Volume Track 0225');
      expect(map.get('volume-session-0225') === 'Volume Track 0225').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0225 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0226
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0226
     * @tc.desc   Verify metadata and session map volume case 226.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0226', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0226 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0226', title: 'Volume Track 0226', artist: 'Volume Artist 0226' };
      expect(metadata.assetId).assertEqual('volume-asset-0226');
      expect(metadata.title === 'Volume Track 0226').assertTrue();
      expect(metadata.artist === 'Volume Artist 0226').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0226', 'Volume Track 0226');
      expect(map.get('volume-session-0226') === 'Volume Track 0226').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0226 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0227
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0227
     * @tc.desc   Verify metadata and session map volume case 227.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0227', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0227 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0227', title: 'Volume Track 0227', artist: 'Volume Artist 0227' };
      expect(metadata.assetId).assertEqual('volume-asset-0227');
      expect(metadata.title === 'Volume Track 0227').assertTrue();
      expect(metadata.artist === 'Volume Artist 0227').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0227', 'Volume Track 0227');
      expect(map.get('volume-session-0227') === 'Volume Track 0227').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0227 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0228
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0228
     * @tc.desc   Verify metadata and session map volume case 228.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0228', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0228 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0228', title: 'Volume Track 0228', artist: 'Volume Artist 0228' };
      expect(metadata.assetId).assertEqual('volume-asset-0228');
      expect(metadata.title === 'Volume Track 0228').assertTrue();
      expect(metadata.artist === 'Volume Artist 0228').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0228', 'Volume Track 0228');
      expect(map.get('volume-session-0228') === 'Volume Track 0228').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0228 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0229
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0229
     * @tc.desc   Verify metadata and session map volume case 229.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0229', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0229 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0229', title: 'Volume Track 0229', artist: 'Volume Artist 0229' };
      expect(metadata.assetId).assertEqual('volume-asset-0229');
      expect(metadata.title === 'Volume Track 0229').assertTrue();
      expect(metadata.artist === 'Volume Artist 0229').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0229', 'Volume Track 0229');
      expect(map.get('volume-session-0229') === 'Volume Track 0229').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0229 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0230
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0230
     * @tc.desc   Verify metadata and session map volume case 230.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0230 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0230', title: 'Volume Track 0230', artist: 'Volume Artist 0230' };
      expect(metadata.assetId).assertEqual('volume-asset-0230');
      expect(metadata.title === 'Volume Track 0230').assertTrue();
      expect(metadata.artist === 'Volume Artist 0230').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0230', 'Volume Track 0230');
      expect(map.get('volume-session-0230') === 'Volume Track 0230').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0230 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0231
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0231
     * @tc.desc   Verify metadata and session map volume case 231.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0231', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0231 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0231', title: 'Volume Track 0231', artist: 'Volume Artist 0231' };
      expect(metadata.assetId).assertEqual('volume-asset-0231');
      expect(metadata.title === 'Volume Track 0231').assertTrue();
      expect(metadata.artist === 'Volume Artist 0231').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0231', 'Volume Track 0231');
      expect(map.get('volume-session-0231') === 'Volume Track 0231').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0231 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0232
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0232
     * @tc.desc   Verify metadata and session map volume case 232.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0232', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0232 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0232', title: 'Volume Track 0232', artist: 'Volume Artist 0232' };
      expect(metadata.assetId).assertEqual('volume-asset-0232');
      expect(metadata.title === 'Volume Track 0232').assertTrue();
      expect(metadata.artist === 'Volume Artist 0232').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0232', 'Volume Track 0232');
      expect(map.get('volume-session-0232') === 'Volume Track 0232').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0232 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0233
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0233
     * @tc.desc   Verify metadata and session map volume case 233.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0233', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0233 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0233', title: 'Volume Track 0233', artist: 'Volume Artist 0233' };
      expect(metadata.assetId).assertEqual('volume-asset-0233');
      expect(metadata.title === 'Volume Track 0233').assertTrue();
      expect(metadata.artist === 'Volume Artist 0233').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0233', 'Volume Track 0233');
      expect(map.get('volume-session-0233') === 'Volume Track 0233').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0233 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0234
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0234
     * @tc.desc   Verify metadata and session map volume case 234.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0234', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0234 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0234', title: 'Volume Track 0234', artist: 'Volume Artist 0234' };
      expect(metadata.assetId).assertEqual('volume-asset-0234');
      expect(metadata.title === 'Volume Track 0234').assertTrue();
      expect(metadata.artist === 'Volume Artist 0234').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0234', 'Volume Track 0234');
      expect(map.get('volume-session-0234') === 'Volume Track 0234').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0234 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0235
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0235
     * @tc.desc   Verify metadata and session map volume case 235.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0235', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0235 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0235', title: 'Volume Track 0235', artist: 'Volume Artist 0235' };
      expect(metadata.assetId).assertEqual('volume-asset-0235');
      expect(metadata.title === 'Volume Track 0235').assertTrue();
      expect(metadata.artist === 'Volume Artist 0235').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0235', 'Volume Track 0235');
      expect(map.get('volume-session-0235') === 'Volume Track 0235').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0235 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0236
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0236
     * @tc.desc   Verify metadata and session map volume case 236.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0236', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0236 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0236', title: 'Volume Track 0236', artist: 'Volume Artist 0236' };
      expect(metadata.assetId).assertEqual('volume-asset-0236');
      expect(metadata.title === 'Volume Track 0236').assertTrue();
      expect(metadata.artist === 'Volume Artist 0236').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0236', 'Volume Track 0236');
      expect(map.get('volume-session-0236') === 'Volume Track 0236').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0236 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0237
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0237
     * @tc.desc   Verify metadata and session map volume case 237.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0237', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0237 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0237', title: 'Volume Track 0237', artist: 'Volume Artist 0237' };
      expect(metadata.assetId).assertEqual('volume-asset-0237');
      expect(metadata.title === 'Volume Track 0237').assertTrue();
      expect(metadata.artist === 'Volume Artist 0237').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0237', 'Volume Track 0237');
      expect(map.get('volume-session-0237') === 'Volume Track 0237').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0237 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0238
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0238
     * @tc.desc   Verify metadata and session map volume case 238.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0238', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0238 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0238', title: 'Volume Track 0238', artist: 'Volume Artist 0238' };
      expect(metadata.assetId).assertEqual('volume-asset-0238');
      expect(metadata.title === 'Volume Track 0238').assertTrue();
      expect(metadata.artist === 'Volume Artist 0238').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0238', 'Volume Track 0238');
      expect(map.get('volume-session-0238') === 'Volume Track 0238').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0238 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0239
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0239
     * @tc.desc   Verify metadata and session map volume case 239.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0239', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0239 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0239', title: 'Volume Track 0239', artist: 'Volume Artist 0239' };
      expect(metadata.assetId).assertEqual('volume-asset-0239');
      expect(metadata.title === 'Volume Track 0239').assertTrue();
      expect(metadata.artist === 'Volume Artist 0239').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0239', 'Volume Track 0239');
      expect(map.get('volume-session-0239') === 'Volume Track 0239').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0239 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Volume_0240
     * @tc.number SUB_MEDIA_CONTROLLER_VOLUME_0240
     * @tc.desc   Verify metadata and session map volume case 240.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Volume_0240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0240 begin');
      const metadata: AVSessionManager.AVMetadata = { assetId: 'volume-asset-0240', title: 'Volume Track 0240', artist: 'Volume Artist 0240' };
      expect(metadata.assetId).assertEqual('volume-asset-0240');
      expect(metadata.title === 'Volume Track 0240').assertTrue();
      expect(metadata.artist === 'Volume Artist 0240').assertTrue();
      expect(JSON.stringify(metadata).length > 0).assertTrue();
      const map: Map<string, string> = new Map();
      map.set('volume-session-0240', 'Volume Track 0240');
      expect(map.get('volume-session-0240') === 'Volume Track 0240').assertTrue();
      expect(map.size).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Volume_0240 end');
    })
  })
}
