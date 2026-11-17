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

export default function mediaControllerPlaybackTestPart03() {
  describe('MediaControllerPlaybackPart03', () => {
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0150
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0150
     * @tc.desc   Verify playback queue variant 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0150 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 30, description: { assetId: 'playback-030', title: 'Quote "title" 30' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 30);
      expect(item.itemId).assertEqual(30);
      expect(item.description?.title).assertEqual('Quote "title" 30');
      expect(item.description?.assetId).assertEqual('playback-030');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0150 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0151
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0151
     * @tc.desc   Verify playback queue variant 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0151 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 100031, description: { assetId: 'playback-031', title: 'Playback Queue 031' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 100031);
      expect(item.itemId).assertEqual(100031);
      expect(item.description?.title).assertEqual('Playback Queue 031');
      expect(item.description?.assetId).assertEqual('playback-031');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0151 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0152
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0152
     * @tc.desc   Verify playback queue variant 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0152 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 0, description: { assetId: 'playback-032', title: '' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 0);
      expect(item.itemId).assertEqual(0);
      expect(item.description?.title).assertEqual('');
      expect(item.description?.assetId).assertEqual('playback-032');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0152 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0153
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0153
     * @tc.desc   Verify playback queue variant 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0153 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: -1, description: { assetId: 'playback-033', title: 'Long LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, -1);
      expect(item.itemId).assertEqual(-1);
      expect(item.description?.title).assertEqual('Long LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL');
      expect(item.description?.assetId).assertEqual('playback-033');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0153 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0154
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0154
     * @tc.desc   Verify playback queue variant 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0154 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 34, description: { assetId: 'playback-034', title: 'Quote "title" 34' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 34);
      expect(item.itemId).assertEqual(34);
      expect(item.description?.title).assertEqual('Quote "title" 34');
      expect(item.description?.assetId).assertEqual('playback-034');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0154 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0155
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0155
     * @tc.desc   Verify playback queue variant 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0155 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 100035, description: { assetId: 'playback-035', title: 'Playback Queue 035' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 100035);
      expect(item.itemId).assertEqual(100035);
      expect(item.description?.title).assertEqual('Playback Queue 035');
      expect(item.description?.assetId).assertEqual('playback-035');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0155 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0156
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0156
     * @tc.desc   Verify playback queue variant 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0156 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 0, description: { assetId: 'playback-036', title: '' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 0);
      expect(item.itemId).assertEqual(0);
      expect(item.description?.title).assertEqual('');
      expect(item.description?.assetId).assertEqual('playback-036');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0156 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0157
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0157
     * @tc.desc   Verify playback queue variant 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0157 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: -1, description: { assetId: 'playback-037', title: 'Long LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, -1);
      expect(item.itemId).assertEqual(-1);
      expect(item.description?.title).assertEqual('Long LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL');
      expect(item.description?.assetId).assertEqual('playback-037');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0157 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0158
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0158
     * @tc.desc   Verify playback queue variant 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0158 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 38, description: { assetId: 'playback-038', title: 'Quote "title" 38' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 38);
      expect(item.itemId).assertEqual(38);
      expect(item.description?.title).assertEqual('Quote "title" 38');
      expect(item.description?.assetId).assertEqual('playback-038');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0158 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0159
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0159
     * @tc.desc   Verify playback queue variant 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0159 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 100039, description: { assetId: 'playback-039', title: 'Playback Queue 039' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 100039);
      expect(item.itemId).assertEqual(100039);
      expect(item.description?.title).assertEqual('Playback Queue 039');
      expect(item.description?.assetId).assertEqual('playback-039');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0159 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0160
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0160
     * @tc.desc   Verify playback queue variant 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0160 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 0, description: { assetId: 'playback-040', title: '' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 0);
      expect(item.itemId).assertEqual(0);
      expect(item.description?.title).assertEqual('');
      expect(item.description?.assetId).assertEqual('playback-040');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0160 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0161
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0161
     * @tc.desc   Verify playback queue variant 41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0161 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: -1, description: { assetId: 'playback-041', title: 'Long LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, -1);
      expect(item.itemId).assertEqual(-1);
      expect(item.description?.title).assertEqual('Long LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL');
      expect(item.description?.assetId).assertEqual('playback-041');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0161 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0162
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0162
     * @tc.desc   Verify playback queue variant 42.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0162 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 42, description: { assetId: 'playback-042', title: 'Quote "title" 42' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 42);
      expect(item.itemId).assertEqual(42);
      expect(item.description?.title).assertEqual('Quote "title" 42');
      expect(item.description?.assetId).assertEqual('playback-042');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0162 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0163
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0163
     * @tc.desc   Verify playback queue variant 43.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0163 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 100043, description: { assetId: 'playback-043', title: 'Playback Queue 043' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 100043);
      expect(item.itemId).assertEqual(100043);
      expect(item.description?.title).assertEqual('Playback Queue 043');
      expect(item.description?.assetId).assertEqual('playback-043');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0163 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0164
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0164
     * @tc.desc   Verify playback queue variant 44.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0164 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 0, description: { assetId: 'playback-044', title: '' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 0);
      expect(item.itemId).assertEqual(0);
      expect(item.description?.title).assertEqual('');
      expect(item.description?.assetId).assertEqual('playback-044');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0164 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0165
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0165
     * @tc.desc   Verify playback queue variant 45.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0165 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: -1, description: { assetId: 'playback-045', title: 'Long LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, -1);
      expect(item.itemId).assertEqual(-1);
      expect(item.description?.title).assertEqual('Long LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL');
      expect(item.description?.assetId).assertEqual('playback-045');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0165 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0166
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0166
     * @tc.desc   Verify playback queue variant 46.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0166 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 46, description: { assetId: 'playback-046', title: 'Quote "title" 46' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 46);
      expect(item.itemId).assertEqual(46);
      expect(item.description?.title).assertEqual('Quote "title" 46');
      expect(item.description?.assetId).assertEqual('playback-046');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0166 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0167
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0167
     * @tc.desc   Verify playback queue variant 47.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0167 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 100047, description: { assetId: 'playback-047', title: 'Playback Queue 047' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 100047);
      expect(item.itemId).assertEqual(100047);
      expect(item.description?.title).assertEqual('Playback Queue 047');
      expect(item.description?.assetId).assertEqual('playback-047');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0167 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0168
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0168
     * @tc.desc   Verify playback queue variant 48.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0168 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 0, description: { assetId: 'playback-048', title: '' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 0);
      expect(item.itemId).assertEqual(0);
      expect(item.description?.title).assertEqual('');
      expect(item.description?.assetId).assertEqual('playback-048');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0168 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0169
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0169
     * @tc.desc   Verify playback queue variant 49.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0169 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: -1, description: { assetId: 'playback-049', title: 'Long LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, -1);
      expect(item.itemId).assertEqual(-1);
      expect(item.description?.title).assertEqual('Long LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL');
      expect(item.description?.assetId).assertEqual('playback-049');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0169 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0170
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0170
     * @tc.desc   Verify playback queue variant 50.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0170 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 50, description: { assetId: 'playback-050', title: 'Quote "title" 50' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 50);
      expect(item.itemId).assertEqual(50);
      expect(item.description?.title).assertEqual('Quote "title" 50');
      expect(item.description?.assetId).assertEqual('playback-050');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0170 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0171
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0171
     * @tc.desc   Verify playback queue variant 51.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0171 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 100051, description: { assetId: 'playback-051', title: 'Playback Queue 051' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 100051);
      expect(item.itemId).assertEqual(100051);
      expect(item.description?.title).assertEqual('Playback Queue 051');
      expect(item.description?.assetId).assertEqual('playback-051');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0171 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0172
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0172
     * @tc.desc   Verify playback queue variant 52.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0172 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 0, description: { assetId: 'playback-052', title: '' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 0);
      expect(item.itemId).assertEqual(0);
      expect(item.description?.title).assertEqual('');
      expect(item.description?.assetId).assertEqual('playback-052');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0172 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0173
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0173
     * @tc.desc   Verify playback queue variant 53.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0173 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: -1, description: { assetId: 'playback-053', title: 'Long LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, -1);
      expect(item.itemId).assertEqual(-1);
      expect(item.description?.title).assertEqual('Long LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL');
      expect(item.description?.assetId).assertEqual('playback-053');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0173 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0174
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0174
     * @tc.desc   Verify playback queue variant 54.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0174 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 54, description: { assetId: 'playback-054', title: 'Quote "title" 54' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 54);
      expect(item.itemId).assertEqual(54);
      expect(item.description?.title).assertEqual('Quote "title" 54');
      expect(item.description?.assetId).assertEqual('playback-054');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0174 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0175
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0175
     * @tc.desc   Verify playback queue variant 55.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0175 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 100055, description: { assetId: 'playback-055', title: 'Playback Queue 055' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 100055);
      expect(item.itemId).assertEqual(100055);
      expect(item.description?.title).assertEqual('Playback Queue 055');
      expect(item.description?.assetId).assertEqual('playback-055');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0175 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0176
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0176
     * @tc.desc   Verify playback queue variant 56.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0176 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 0, description: { assetId: 'playback-056', title: '' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 0);
      expect(item.itemId).assertEqual(0);
      expect(item.description?.title).assertEqual('');
      expect(item.description?.assetId).assertEqual('playback-056');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0176 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0177
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0177
     * @tc.desc   Verify playback queue variant 57.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0177 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: -1, description: { assetId: 'playback-057', title: 'Long LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, -1);
      expect(item.itemId).assertEqual(-1);
      expect(item.description?.title).assertEqual('Long LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL');
      expect(item.description?.assetId).assertEqual('playback-057');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0177 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0178
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0178
     * @tc.desc   Verify playback queue variant 58.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0178 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 58, description: { assetId: 'playback-058', title: 'Quote "title" 58' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 58);
      expect(item.itemId).assertEqual(58);
      expect(item.description?.title).assertEqual('Quote "title" 58');
      expect(item.description?.assetId).assertEqual('playback-058');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0178 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0179
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0179
     * @tc.desc   Verify playback queue variant 59.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0179 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 100059, description: { assetId: 'playback-059', title: 'Playback Queue 059' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 100059);
      expect(item.itemId).assertEqual(100059);
      expect(item.description?.title).assertEqual('Playback Queue 059');
      expect(item.description?.assetId).assertEqual('playback-059');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0179 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0180
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0180
     * @tc.desc   Verify playback queue variant 60.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0180 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 0, description: { assetId: 'playback-060', title: '' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 0);
      expect(item.itemId).assertEqual(0);
      expect(item.description?.title).assertEqual('');
      expect(item.description?.assetId).assertEqual('playback-060');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0180 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0181
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0181
     * @tc.desc   Verify playback queue variant 61.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0181 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: -1, description: { assetId: 'playback-061', title: 'Long LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, -1);
      expect(item.itemId).assertEqual(-1);
      expect(item.description?.title).assertEqual('Long LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL');
      expect(item.description?.assetId).assertEqual('playback-061');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0181 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0182
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0182
     * @tc.desc   Verify playback queue variant 62.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0182 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 62, description: { assetId: 'playback-062', title: 'Quote "title" 62' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 62);
      expect(item.itemId).assertEqual(62);
      expect(item.description?.title).assertEqual('Quote "title" 62');
      expect(item.description?.assetId).assertEqual('playback-062');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0182 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0183
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0183
     * @tc.desc   Verify playback queue variant 63.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0183 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 100063, description: { assetId: 'playback-063', title: 'Playback Queue 063' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 100063);
      expect(item.itemId).assertEqual(100063);
      expect(item.description?.title).assertEqual('Playback Queue 063');
      expect(item.description?.assetId).assertEqual('playback-063');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0183 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0184
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0184
     * @tc.desc   Verify playback queue variant 64.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0184 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 0, description: { assetId: 'playback-064', title: '' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 0);
      expect(item.itemId).assertEqual(0);
      expect(item.description?.title).assertEqual('');
      expect(item.description?.assetId).assertEqual('playback-064');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0184 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0185
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0185
     * @tc.desc   Verify playback queue variant 65.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0185 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: -1, description: { assetId: 'playback-065', title: 'Long LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, -1);
      expect(item.itemId).assertEqual(-1);
      expect(item.description?.title).assertEqual('Long LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL');
      expect(item.description?.assetId).assertEqual('playback-065');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0185 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0186
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0186
     * @tc.desc   Verify playback queue variant 66.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0186 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 66, description: { assetId: 'playback-066', title: 'Quote "title" 66' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 66);
      expect(item.itemId).assertEqual(66);
      expect(item.description?.title).assertEqual('Quote "title" 66');
      expect(item.description?.assetId).assertEqual('playback-066');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0186 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0187
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0187
     * @tc.desc   Verify playback queue variant 67.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0187 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 100067, description: { assetId: 'playback-067', title: 'Playback Queue 067' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 100067);
      expect(item.itemId).assertEqual(100067);
      expect(item.description?.title).assertEqual('Playback Queue 067');
      expect(item.description?.assetId).assertEqual('playback-067');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0187 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0188
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0188
     * @tc.desc   Verify playback queue variant 68.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0188 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 0, description: { assetId: 'playback-068', title: '' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 0);
      expect(item.itemId).assertEqual(0);
      expect(item.description?.title).assertEqual('');
      expect(item.description?.assetId).assertEqual('playback-068');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0188 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0189
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0189
     * @tc.desc   Verify playback queue variant 69.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0189 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: -1, description: { assetId: 'playback-069', title: 'Long LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, -1);
      expect(item.itemId).assertEqual(-1);
      expect(item.description?.title).assertEqual('Long LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL');
      expect(item.description?.assetId).assertEqual('playback-069');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0189 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0190
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0190
     * @tc.desc   Verify playback queue variant 70.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0190 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 70, description: { assetId: 'playback-070', title: 'Quote "title" 70' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 70);
      expect(item.itemId).assertEqual(70);
      expect(item.description?.title).assertEqual('Quote "title" 70');
      expect(item.description?.assetId).assertEqual('playback-070');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0190 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0191
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0191
     * @tc.desc   Verify playback queue variant 71.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0191 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 100071, description: { assetId: 'playback-071', title: 'Playback Queue 071' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 100071);
      expect(item.itemId).assertEqual(100071);
      expect(item.description?.title).assertEqual('Playback Queue 071');
      expect(item.description?.assetId).assertEqual('playback-071');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0191 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0192
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0192
     * @tc.desc   Verify playback queue variant 72.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0192 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 0, description: { assetId: 'playback-072', title: '' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 0);
      expect(item.itemId).assertEqual(0);
      expect(item.description?.title).assertEqual('');
      expect(item.description?.assetId).assertEqual('playback-072');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0192 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0193
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0193
     * @tc.desc   Verify playback queue variant 73.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0193 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: -1, description: { assetId: 'playback-073', title: 'Long LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, -1);
      expect(item.itemId).assertEqual(-1);
      expect(item.description?.title).assertEqual('Long LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL');
      expect(item.description?.assetId).assertEqual('playback-073');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0193 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0194
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0194
     * @tc.desc   Verify playback queue variant 74.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0194 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 74, description: { assetId: 'playback-074', title: 'Quote "title" 74' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 74);
      expect(item.itemId).assertEqual(74);
      expect(item.description?.title).assertEqual('Quote "title" 74');
      expect(item.description?.assetId).assertEqual('playback-074');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0194 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0195
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0195
     * @tc.desc   Verify playback queue variant 75.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0195 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 100075, description: { assetId: 'playback-075', title: 'Playback Queue 075' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 100075);
      expect(item.itemId).assertEqual(100075);
      expect(item.description?.title).assertEqual('Playback Queue 075');
      expect(item.description?.assetId).assertEqual('playback-075');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0195 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0196
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0196
     * @tc.desc   Verify playback queue variant 76.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0196 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 0, description: { assetId: 'playback-076', title: '' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 0);
      expect(item.itemId).assertEqual(0);
      expect(item.description?.title).assertEqual('');
      expect(item.description?.assetId).assertEqual('playback-076');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0196 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0197
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0197
     * @tc.desc   Verify playback queue variant 77.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0197 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: -1, description: { assetId: 'playback-077', title: 'Long LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, -1);
      expect(item.itemId).assertEqual(-1);
      expect(item.description?.title).assertEqual('Long LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL');
      expect(item.description?.assetId).assertEqual('playback-077');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0197 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0198
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0198
     * @tc.desc   Verify playback queue variant 78.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0198 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 78, description: { assetId: 'playback-078', title: 'Quote "title" 78' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 78);
      expect(item.itemId).assertEqual(78);
      expect(item.description?.title).assertEqual('Quote "title" 78');
      expect(item.description?.assetId).assertEqual('playback-078');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0198 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0199
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0199
     * @tc.desc   Verify playback queue variant 79.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0199 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 100079, description: { assetId: 'playback-079', title: 'Playback Queue 079' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 100079);
      expect(item.itemId).assertEqual(100079);
      expect(item.description?.title).assertEqual('Playback Queue 079');
      expect(item.description?.assetId).assertEqual('playback-079');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0199 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0200
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0200
     * @tc.desc   Verify playback queue variant 80.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0200 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 0, description: { assetId: 'playback-080', title: '' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 0);
      expect(item.itemId).assertEqual(0);
      expect(item.description?.title).assertEqual('');
      expect(item.description?.assetId).assertEqual('playback-080');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0200 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0201
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0201
     * @tc.desc   Verify playback map bulk variant 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0201 begin');
      const map: Map<string, number> = new Map();
      map.set('playback-001-01', 11);
      map.set('playback-001-02', 12);
      map.set('playback-001-03', 13);
      map.set('playback-001-04', 14);
      map.set('playback-001-05', 15);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=5', map.size);
      expect(map.size).assertEqual(5);
      expect(map.get('playback-001-05')).assertEqual(15);
      map.delete('playback-001-01');
      expect(map.size).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0201 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0202
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0202
     * @tc.desc   Verify playback map bulk variant 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0202 begin');
      const map: Map<string, number> = new Map();
      map.set('playback-002-01', 21);
      map.set('playback-002-02', 22);
      map.set('playback-002-03', 23);
      map.set('playback-002-04', 24);
      map.set('playback-002-05', 25);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=5', map.size);
      expect(map.size).assertEqual(5);
      expect(map.get('playback-002-05')).assertEqual(25);
      map.delete('playback-002-01');
      expect(map.size).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0202 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0203
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0203
     * @tc.desc   Verify playback map bulk variant 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0203 begin');
      const map: Map<string, number> = new Map();
      map.set('playback-003-01', 31);
      map.set('playback-003-02', 32);
      map.set('playback-003-03', 33);
      map.set('playback-003-04', 34);
      map.set('playback-003-05', 35);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=5', map.size);
      expect(map.size).assertEqual(5);
      expect(map.get('playback-003-05')).assertEqual(35);
      map.delete('playback-003-01');
      expect(map.size).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0203 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0204
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0204
     * @tc.desc   Verify playback map bulk variant 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0204 begin');
      const map: Map<string, number> = new Map();
      map.set('playback-004-01', 41);
      map.set('playback-004-02', 42);
      map.set('playback-004-03', 43);
      map.set('playback-004-04', 44);
      map.set('playback-004-05', 45);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=5', map.size);
      expect(map.size).assertEqual(5);
      expect(map.get('playback-004-05')).assertEqual(45);
      map.delete('playback-004-01');
      expect(map.size).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0204 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0205
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0205
     * @tc.desc   Verify playback map bulk variant 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0205 begin');
      const map: Map<string, number> = new Map();
      map.set('playback-005-01', 51);
      map.set('playback-005-02', 52);
      map.set('playback-005-03', 53);
      map.set('playback-005-04', 54);
      map.set('playback-005-05', 55);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=5', map.size);
      expect(map.size).assertEqual(5);
      expect(map.get('playback-005-05')).assertEqual(55);
      map.delete('playback-005-01');
      expect(map.size).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0205 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0206
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0206
     * @tc.desc   Verify playback map bulk variant 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0206 begin');
      const map: Map<string, number> = new Map();
      map.set('playback-006-01', 61);
      map.set('playback-006-02', 62);
      map.set('playback-006-03', 63);
      map.set('playback-006-04', 64);
      map.set('playback-006-05', 65);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=5', map.size);
      expect(map.size).assertEqual(5);
      expect(map.get('playback-006-05')).assertEqual(65);
      map.delete('playback-006-01');
      expect(map.size).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0206 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0207
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0207
     * @tc.desc   Verify playback map bulk variant 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0207 begin');
      const map: Map<string, number> = new Map();
      map.set('playback-007-01', 71);
      map.set('playback-007-02', 72);
      map.set('playback-007-03', 73);
      map.set('playback-007-04', 74);
      map.set('playback-007-05', 75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=5', map.size);
      expect(map.size).assertEqual(5);
      expect(map.get('playback-007-05')).assertEqual(75);
      map.delete('playback-007-01');
      expect(map.size).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0207 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0208
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0208
     * @tc.desc   Verify playback map bulk variant 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0208 begin');
      const map: Map<string, number> = new Map();
      map.set('playback-008-01', 81);
      map.set('playback-008-02', 82);
      map.set('playback-008-03', 83);
      map.set('playback-008-04', 84);
      map.set('playback-008-05', 85);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=5', map.size);
      expect(map.size).assertEqual(5);
      expect(map.get('playback-008-05')).assertEqual(85);
      map.delete('playback-008-01');
      expect(map.size).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0208 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0209
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0209
     * @tc.desc   Verify playback map bulk variant 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0209 begin');
      const map: Map<string, number> = new Map();
      map.set('playback-009-01', 91);
      map.set('playback-009-02', 92);
      map.set('playback-009-03', 93);
      map.set('playback-009-04', 94);
      map.set('playback-009-05', 95);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=5', map.size);
      expect(map.size).assertEqual(5);
      expect(map.get('playback-009-05')).assertEqual(95);
      map.delete('playback-009-01');
      expect(map.size).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0209 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0210
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0210
     * @tc.desc   Verify playback map bulk variant 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0210 begin');
      const map: Map<string, number> = new Map();
      map.set('playback-010-01', 101);
      map.set('playback-010-02', 102);
      map.set('playback-010-03', 103);
      map.set('playback-010-04', 104);
      map.set('playback-010-05', 105);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=5', map.size);
      expect(map.size).assertEqual(5);
      expect(map.get('playback-010-05')).assertEqual(105);
      map.delete('playback-010-01');
      expect(map.size).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0210 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0211
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0211
     * @tc.desc   Verify playback map bulk variant 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0211 begin');
      const map: Map<string, number> = new Map();
      map.set('playback-011-01', 111);
      map.set('playback-011-02', 112);
      map.set('playback-011-03', 113);
      map.set('playback-011-04', 114);
      map.set('playback-011-05', 115);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=5', map.size);
      expect(map.size).assertEqual(5);
      expect(map.get('playback-011-05')).assertEqual(115);
      map.delete('playback-011-01');
      expect(map.size).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0211 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0212
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0212
     * @tc.desc   Verify playback map bulk variant 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0212 begin');
      const map: Map<string, number> = new Map();
      map.set('playback-012-01', 121);
      map.set('playback-012-02', 122);
      map.set('playback-012-03', 123);
      map.set('playback-012-04', 124);
      map.set('playback-012-05', 125);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=5', map.size);
      expect(map.size).assertEqual(5);
      expect(map.get('playback-012-05')).assertEqual(125);
      map.delete('playback-012-01');
      expect(map.size).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0212 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0213
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0213
     * @tc.desc   Verify playback map bulk variant 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0213 begin');
      const map: Map<string, number> = new Map();
      map.set('playback-013-01', 131);
      map.set('playback-013-02', 132);
      map.set('playback-013-03', 133);
      map.set('playback-013-04', 134);
      map.set('playback-013-05', 135);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=5', map.size);
      expect(map.size).assertEqual(5);
      expect(map.get('playback-013-05')).assertEqual(135);
      map.delete('playback-013-01');
      expect(map.size).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0213 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0214
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0214
     * @tc.desc   Verify playback map bulk variant 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0214 begin');
      const map: Map<string, number> = new Map();
      map.set('playback-014-01', 141);
      map.set('playback-014-02', 142);
      map.set('playback-014-03', 143);
      map.set('playback-014-04', 144);
      map.set('playback-014-05', 145);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=5', map.size);
      expect(map.size).assertEqual(5);
      expect(map.get('playback-014-05')).assertEqual(145);
      map.delete('playback-014-01');
      expect(map.size).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0214 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0215
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0215
     * @tc.desc   Verify playback map bulk variant 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0215 begin');
      const map: Map<string, number> = new Map();
      map.set('playback-015-01', 151);
      map.set('playback-015-02', 152);
      map.set('playback-015-03', 153);
      map.set('playback-015-04', 154);
      map.set('playback-015-05', 155);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=5', map.size);
      expect(map.size).assertEqual(5);
      expect(map.get('playback-015-05')).assertEqual(155);
      map.delete('playback-015-01');
      expect(map.size).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0215 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0216
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0216
     * @tc.desc   Verify playback map bulk variant 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0216 begin');
      const map: Map<string, number> = new Map();
      map.set('playback-016-01', 161);
      map.set('playback-016-02', 162);
      map.set('playback-016-03', 163);
      map.set('playback-016-04', 164);
      map.set('playback-016-05', 165);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=5', map.size);
      expect(map.size).assertEqual(5);
      expect(map.get('playback-016-05')).assertEqual(165);
      map.delete('playback-016-01');
      expect(map.size).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0216 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0217
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0217
     * @tc.desc   Verify playback map bulk variant 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0217 begin');
      const map: Map<string, number> = new Map();
      map.set('playback-017-01', 171);
      map.set('playback-017-02', 172);
      map.set('playback-017-03', 173);
      map.set('playback-017-04', 174);
      map.set('playback-017-05', 175);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=5', map.size);
      expect(map.size).assertEqual(5);
      expect(map.get('playback-017-05')).assertEqual(175);
      map.delete('playback-017-01');
      expect(map.size).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0217 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0218
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0218
     * @tc.desc   Verify playback map bulk variant 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0218 begin');
      const map: Map<string, number> = new Map();
      map.set('playback-018-01', 181);
      map.set('playback-018-02', 182);
      map.set('playback-018-03', 183);
      map.set('playback-018-04', 184);
      map.set('playback-018-05', 185);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=5', map.size);
      expect(map.size).assertEqual(5);
      expect(map.get('playback-018-05')).assertEqual(185);
      map.delete('playback-018-01');
      expect(map.size).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0218 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0219
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0219
     * @tc.desc   Verify playback map bulk variant 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0219 begin');
      const map: Map<string, number> = new Map();
      map.set('playback-019-01', 191);
      map.set('playback-019-02', 192);
      map.set('playback-019-03', 193);
      map.set('playback-019-04', 194);
      map.set('playback-019-05', 195);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=5', map.size);
      expect(map.size).assertEqual(5);
      expect(map.get('playback-019-05')).assertEqual(195);
      map.delete('playback-019-01');
      expect(map.size).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0219 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0220
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0220
     * @tc.desc   Verify playback map bulk variant 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0220 begin');
      const map: Map<string, number> = new Map();
      map.set('playback-020-01', 201);
      map.set('playback-020-02', 202);
      map.set('playback-020-03', 203);
      map.set('playback-020-04', 204);
      map.set('playback-020-05', 205);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=5', map.size);
      expect(map.size).assertEqual(5);
      expect(map.get('playback-020-05')).assertEqual(205);
      map.delete('playback-020-01');
      expect(map.size).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0220 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0221
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0221
     * @tc.desc   Verify playback map bulk variant 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0221', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0221 begin');
      const map: Map<string, number> = new Map();
      map.set('playback-021-01', 211);
      map.set('playback-021-02', 212);
      map.set('playback-021-03', 213);
      map.set('playback-021-04', 214);
      map.set('playback-021-05', 215);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=5', map.size);
      expect(map.size).assertEqual(5);
      expect(map.get('playback-021-05')).assertEqual(215);
      map.delete('playback-021-01');
      expect(map.size).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0221 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0222
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0222
     * @tc.desc   Verify playback map bulk variant 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0222', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0222 begin');
      const map: Map<string, number> = new Map();
      map.set('playback-022-01', 221);
      map.set('playback-022-02', 222);
      map.set('playback-022-03', 223);
      map.set('playback-022-04', 224);
      map.set('playback-022-05', 225);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=5', map.size);
      expect(map.size).assertEqual(5);
      expect(map.get('playback-022-05')).assertEqual(225);
      map.delete('playback-022-01');
      expect(map.size).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0222 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0223
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0223
     * @tc.desc   Verify playback map bulk variant 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0223', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0223 begin');
      const map: Map<string, number> = new Map();
      map.set('playback-023-01', 231);
      map.set('playback-023-02', 232);
      map.set('playback-023-03', 233);
      map.set('playback-023-04', 234);
      map.set('playback-023-05', 235);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=5', map.size);
      expect(map.size).assertEqual(5);
      expect(map.get('playback-023-05')).assertEqual(235);
      map.delete('playback-023-01');
      expect(map.size).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0223 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0224
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0224
     * @tc.desc   Verify playback map bulk variant 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0224', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0224 begin');
      const map: Map<string, number> = new Map();
      map.set('playback-024-01', 241);
      map.set('playback-024-02', 242);
      map.set('playback-024-03', 243);
      map.set('playback-024-04', 244);
      map.set('playback-024-05', 245);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=5', map.size);
      expect(map.size).assertEqual(5);
      expect(map.get('playback-024-05')).assertEqual(245);
      map.delete('playback-024-01');
      expect(map.size).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0224 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0225
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0225
     * @tc.desc   Verify playback map bulk variant 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0225', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0225 begin');
      const map: Map<string, number> = new Map();
      map.set('playback-025-01', 251);
      map.set('playback-025-02', 252);
      map.set('playback-025-03', 253);
      map.set('playback-025-04', 254);
      map.set('playback-025-05', 255);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=5', map.size);
      expect(map.size).assertEqual(5);
      expect(map.get('playback-025-05')).assertEqual(255);
      map.delete('playback-025-01');
      expect(map.size).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0225 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0226
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0226
     * @tc.desc   Verify playback map bulk variant 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0226', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0226 begin');
      const map: Map<string, number> = new Map();
      map.set('playback-026-01', 261);
      map.set('playback-026-02', 262);
      map.set('playback-026-03', 263);
      map.set('playback-026-04', 264);
      map.set('playback-026-05', 265);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=5', map.size);
      expect(map.size).assertEqual(5);
      expect(map.get('playback-026-05')).assertEqual(265);
      map.delete('playback-026-01');
      expect(map.size).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0226 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0227
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0227
     * @tc.desc   Verify playback map bulk variant 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0227', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0227 begin');
      const map: Map<string, number> = new Map();
      map.set('playback-027-01', 271);
      map.set('playback-027-02', 272);
      map.set('playback-027-03', 273);
      map.set('playback-027-04', 274);
      map.set('playback-027-05', 275);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=5', map.size);
      expect(map.size).assertEqual(5);
      expect(map.get('playback-027-05')).assertEqual(275);
      map.delete('playback-027-01');
      expect(map.size).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0227 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0228
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0228
     * @tc.desc   Verify playback map bulk variant 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0228', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0228 begin');
      const map: Map<string, number> = new Map();
      map.set('playback-028-01', 281);
      map.set('playback-028-02', 282);
      map.set('playback-028-03', 283);
      map.set('playback-028-04', 284);
      map.set('playback-028-05', 285);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=5', map.size);
      expect(map.size).assertEqual(5);
      expect(map.get('playback-028-05')).assertEqual(285);
      map.delete('playback-028-01');
      expect(map.size).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0228 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0229
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0229
     * @tc.desc   Verify playback map bulk variant 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0229', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0229 begin');
      const map: Map<string, number> = new Map();
      map.set('playback-029-01', 291);
      map.set('playback-029-02', 292);
      map.set('playback-029-03', 293);
      map.set('playback-029-04', 294);
      map.set('playback-029-05', 295);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=5', map.size);
      expect(map.size).assertEqual(5);
      expect(map.get('playback-029-05')).assertEqual(295);
      map.delete('playback-029-01');
      expect(map.size).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0229 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0230
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0230
     * @tc.desc   Verify playback map bulk variant 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0230 begin');
      const map: Map<string, number> = new Map();
      map.set('playback-030-01', 301);
      map.set('playback-030-02', 302);
      map.set('playback-030-03', 303);
      map.set('playback-030-04', 304);
      map.set('playback-030-05', 305);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=5', map.size);
      expect(map.size).assertEqual(5);
      expect(map.get('playback-030-05')).assertEqual(305);
      map.delete('playback-030-01');
      expect(map.size).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0230 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0231
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0231
     * @tc.desc   Verify playback map bulk variant 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0231', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0231 begin');
      const map: Map<string, number> = new Map();
      map.set('playback-031-01', 311);
      map.set('playback-031-02', 312);
      map.set('playback-031-03', 313);
      map.set('playback-031-04', 314);
      map.set('playback-031-05', 315);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=5', map.size);
      expect(map.size).assertEqual(5);
      expect(map.get('playback-031-05')).assertEqual(315);
      map.delete('playback-031-01');
      expect(map.size).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0231 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0232
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0232
     * @tc.desc   Verify playback map bulk variant 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0232', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0232 begin');
      const map: Map<string, number> = new Map();
      map.set('playback-032-01', 321);
      map.set('playback-032-02', 322);
      map.set('playback-032-03', 323);
      map.set('playback-032-04', 324);
      map.set('playback-032-05', 325);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=5', map.size);
      expect(map.size).assertEqual(5);
      expect(map.get('playback-032-05')).assertEqual(325);
      map.delete('playback-032-01');
      expect(map.size).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0232 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0233
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0233
     * @tc.desc   Verify playback map bulk variant 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0233', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0233 begin');
      const map: Map<string, number> = new Map();
      map.set('playback-033-01', 331);
      map.set('playback-033-02', 332);
      map.set('playback-033-03', 333);
      map.set('playback-033-04', 334);
      map.set('playback-033-05', 335);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=5', map.size);
      expect(map.size).assertEqual(5);
      expect(map.get('playback-033-05')).assertEqual(335);
      map.delete('playback-033-01');
      expect(map.size).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0233 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0234
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0234
     * @tc.desc   Verify playback map bulk variant 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0234', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0234 begin');
      const map: Map<string, number> = new Map();
      map.set('playback-034-01', 341);
      map.set('playback-034-02', 342);
      map.set('playback-034-03', 343);
      map.set('playback-034-04', 344);
      map.set('playback-034-05', 345);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=5', map.size);
      expect(map.size).assertEqual(5);
      expect(map.get('playback-034-05')).assertEqual(345);
      map.delete('playback-034-01');
      expect(map.size).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0234 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0235
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0235
     * @tc.desc   Verify playback map bulk variant 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0235', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0235 begin');
      const map: Map<string, number> = new Map();
      map.set('playback-035-01', 351);
      map.set('playback-035-02', 352);
      map.set('playback-035-03', 353);
      map.set('playback-035-04', 354);
      map.set('playback-035-05', 355);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=5', map.size);
      expect(map.size).assertEqual(5);
      expect(map.get('playback-035-05')).assertEqual(355);
      map.delete('playback-035-01');
      expect(map.size).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0235 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Playback_0236
     * @tc.number SUB_MEDIA_CONTROLLER_PLAYBACK_0236
     * @tc.desc   Verify playback map bulk variant 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Playback_0236', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0236 begin');
      const map: Map<string, number> = new Map();
      map.set('playback-036-01', 361);
      map.set('playback-036-02', 362);
      map.set('playback-036-03', 363);
      map.set('playback-036-04', 364);
      map.set('playback-036-05', 365);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%%{public}d expected=5', map.size);
      expect(map.size).assertEqual(5);
      expect(map.get('playback-036-05')).assertEqual(365);
      map.delete('playback-036-01');
      expect(map.size).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Playback_0236 end');
    })
  })
}
