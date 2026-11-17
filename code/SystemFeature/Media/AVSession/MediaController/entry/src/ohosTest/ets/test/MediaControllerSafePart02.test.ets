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

export default function mediaControllerSafeTestPart02() {
  describe('MediaControllerSafePart02', () => {
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0095
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0095
     * @tc.desc   Verify queue item case 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0095 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-015', title: 'Safe Queue 015' };
      const item: AVSessionManager.AVQueueItem = { itemId: 15, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 15);
      expect(item.itemId).assertEqual(15);
      expect(item.description?.assetId).assertEqual('safe-queue-015');
      expect(item.description?.title === 'Safe Queue 015').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0095 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0096
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0096
     * @tc.desc   Verify queue item case 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0096 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-016', title: 'Safe Queue 016' };
      const item: AVSessionManager.AVQueueItem = { itemId: 16, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 16);
      expect(item.itemId).assertEqual(16);
      expect(item.description?.assetId).assertEqual('safe-queue-016');
      expect(item.description?.title === 'Safe Queue 016').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0096 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0097
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0097
     * @tc.desc   Verify queue item case 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0097 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-017', title: 'Safe Queue 017' };
      const item: AVSessionManager.AVQueueItem = { itemId: 17, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 17);
      expect(item.itemId).assertEqual(17);
      expect(item.description?.assetId).assertEqual('safe-queue-017');
      expect(item.description?.title === 'Safe Queue 017').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0097 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0098
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0098
     * @tc.desc   Verify queue item case 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0098 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-018', title: 'Safe Queue 018' };
      const item: AVSessionManager.AVQueueItem = { itemId: 18, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 18);
      expect(item.itemId).assertEqual(18);
      expect(item.description?.assetId).assertEqual('safe-queue-018');
      expect(item.description?.title === 'Safe Queue 018').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0098 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0099
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0099
     * @tc.desc   Verify queue item case 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0099 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-019', title: 'Safe Queue 019' };
      const item: AVSessionManager.AVQueueItem = { itemId: 19, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 19);
      expect(item.itemId).assertEqual(19);
      expect(item.description?.assetId).assertEqual('safe-queue-019');
      expect(item.description?.title === 'Safe Queue 019').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0099 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0100
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0100
     * @tc.desc   Verify queue item case 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0100 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-020', title: 'Safe Queue 020' };
      const item: AVSessionManager.AVQueueItem = { itemId: 20, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 20);
      expect(item.itemId).assertEqual(20);
      expect(item.description?.assetId).assertEqual('safe-queue-020');
      expect(item.description?.title === 'Safe Queue 020').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0100 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0101
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0101
     * @tc.desc   Verify queue item case 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0101 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-021', title: 'Safe Queue 021' };
      const item: AVSessionManager.AVQueueItem = { itemId: 21, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 21);
      expect(item.itemId).assertEqual(21);
      expect(item.description?.assetId).assertEqual('safe-queue-021');
      expect(item.description?.title === 'Safe Queue 021').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0101 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0102
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0102
     * @tc.desc   Verify queue item case 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0102 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-022', title: 'Safe Queue 022' };
      const item: AVSessionManager.AVQueueItem = { itemId: 22, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 22);
      expect(item.itemId).assertEqual(22);
      expect(item.description?.assetId).assertEqual('safe-queue-022');
      expect(item.description?.title === 'Safe Queue 022').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0102 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0103
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0103
     * @tc.desc   Verify queue item case 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0103 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-023', title: 'Safe Queue 023' };
      const item: AVSessionManager.AVQueueItem = { itemId: 23, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 23);
      expect(item.itemId).assertEqual(23);
      expect(item.description?.assetId).assertEqual('safe-queue-023');
      expect(item.description?.title === 'Safe Queue 023').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0103 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0104
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0104
     * @tc.desc   Verify queue item case 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0104 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-024', title: 'Safe Queue 024' };
      const item: AVSessionManager.AVQueueItem = { itemId: 24, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 24);
      expect(item.itemId).assertEqual(24);
      expect(item.description?.assetId).assertEqual('safe-queue-024');
      expect(item.description?.title === 'Safe Queue 024').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0104 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0105
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0105
     * @tc.desc   Verify queue item case 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0105 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-025', title: 'Safe Queue 025' };
      const item: AVSessionManager.AVQueueItem = { itemId: 25, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 25);
      expect(item.itemId).assertEqual(25);
      expect(item.description?.assetId).assertEqual('safe-queue-025');
      expect(item.description?.title === 'Safe Queue 025').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0105 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0106
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0106
     * @tc.desc   Verify queue item case 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0106 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-026', title: 'Safe Queue 026' };
      const item: AVSessionManager.AVQueueItem = { itemId: 26, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 26);
      expect(item.itemId).assertEqual(26);
      expect(item.description?.assetId).assertEqual('safe-queue-026');
      expect(item.description?.title === 'Safe Queue 026').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0106 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0107
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0107
     * @tc.desc   Verify queue item case 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0107 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-027', title: 'Safe Queue 027' };
      const item: AVSessionManager.AVQueueItem = { itemId: 27, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 27);
      expect(item.itemId).assertEqual(27);
      expect(item.description?.assetId).assertEqual('safe-queue-027');
      expect(item.description?.title === 'Safe Queue 027').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0107 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0108
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0108
     * @tc.desc   Verify queue item case 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0108 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-028', title: 'Safe Queue 028' };
      const item: AVSessionManager.AVQueueItem = { itemId: 28, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 28);
      expect(item.itemId).assertEqual(28);
      expect(item.description?.assetId).assertEqual('safe-queue-028');
      expect(item.description?.title === 'Safe Queue 028').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0108 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0109
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0109
     * @tc.desc   Verify queue item case 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0109 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-029', title: 'Safe Queue 029' };
      const item: AVSessionManager.AVQueueItem = { itemId: 29, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 29);
      expect(item.itemId).assertEqual(29);
      expect(item.description?.assetId).assertEqual('safe-queue-029');
      expect(item.description?.title === 'Safe Queue 029').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0109 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0110
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0110
     * @tc.desc   Verify queue item case 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0110 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-030', title: 'Safe Queue 030' };
      const item: AVSessionManager.AVQueueItem = { itemId: 30, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 30);
      expect(item.itemId).assertEqual(30);
      expect(item.description?.assetId).assertEqual('safe-queue-030');
      expect(item.description?.title === 'Safe Queue 030').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0110 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0111
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0111
     * @tc.desc   Verify queue item case 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0111 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-031', title: 'Safe Queue 031' };
      const item: AVSessionManager.AVQueueItem = { itemId: 31, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 31);
      expect(item.itemId).assertEqual(31);
      expect(item.description?.assetId).assertEqual('safe-queue-031');
      expect(item.description?.title === 'Safe Queue 031').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0111 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0112
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0112
     * @tc.desc   Verify queue item case 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0112 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-032', title: 'Safe Queue 032' };
      const item: AVSessionManager.AVQueueItem = { itemId: 32, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 32);
      expect(item.itemId).assertEqual(32);
      expect(item.description?.assetId).assertEqual('safe-queue-032');
      expect(item.description?.title === 'Safe Queue 032').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0112 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0113
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0113
     * @tc.desc   Verify queue item case 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0113 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-033', title: 'Safe Queue 033' };
      const item: AVSessionManager.AVQueueItem = { itemId: 33, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 33);
      expect(item.itemId).assertEqual(33);
      expect(item.description?.assetId).assertEqual('safe-queue-033');
      expect(item.description?.title === 'Safe Queue 033').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0113 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0114
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0114
     * @tc.desc   Verify queue item case 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0114 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-034', title: 'Safe Queue 034' };
      const item: AVSessionManager.AVQueueItem = { itemId: 34, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 34);
      expect(item.itemId).assertEqual(34);
      expect(item.description?.assetId).assertEqual('safe-queue-034');
      expect(item.description?.title === 'Safe Queue 034').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0114 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0115
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0115
     * @tc.desc   Verify queue item case 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0115 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-035', title: 'Safe Queue 035' };
      const item: AVSessionManager.AVQueueItem = { itemId: 35, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 35);
      expect(item.itemId).assertEqual(35);
      expect(item.description?.assetId).assertEqual('safe-queue-035');
      expect(item.description?.title === 'Safe Queue 035').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0115 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0116
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0116
     * @tc.desc   Verify queue item case 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0116 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-036', title: 'Safe Queue 036' };
      const item: AVSessionManager.AVQueueItem = { itemId: 36, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 36);
      expect(item.itemId).assertEqual(36);
      expect(item.description?.assetId).assertEqual('safe-queue-036');
      expect(item.description?.title === 'Safe Queue 036').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0116 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0117
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0117
     * @tc.desc   Verify queue item case 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0117 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-037', title: 'Safe Queue 037' };
      const item: AVSessionManager.AVQueueItem = { itemId: 37, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 37);
      expect(item.itemId).assertEqual(37);
      expect(item.description?.assetId).assertEqual('safe-queue-037');
      expect(item.description?.title === 'Safe Queue 037').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0117 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0118
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0118
     * @tc.desc   Verify queue item case 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0118 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-038', title: 'Safe Queue 038' };
      const item: AVSessionManager.AVQueueItem = { itemId: 38, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 38);
      expect(item.itemId).assertEqual(38);
      expect(item.description?.assetId).assertEqual('safe-queue-038');
      expect(item.description?.title === 'Safe Queue 038').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0118 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0119
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0119
     * @tc.desc   Verify queue item case 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0119 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-039', title: 'Safe Queue 039' };
      const item: AVSessionManager.AVQueueItem = { itemId: 39, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 39);
      expect(item.itemId).assertEqual(39);
      expect(item.description?.assetId).assertEqual('safe-queue-039');
      expect(item.description?.title === 'Safe Queue 039').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0119 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0120
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0120
     * @tc.desc   Verify queue item case 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0120 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-040', title: 'Safe Queue 040' };
      const item: AVSessionManager.AVQueueItem = { itemId: 40, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 40);
      expect(item.itemId).assertEqual(40);
      expect(item.description?.assetId).assertEqual('safe-queue-040');
      expect(item.description?.title === 'Safe Queue 040').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0120 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0121
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0121
     * @tc.desc   Verify queue item case 41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0121 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-041', title: 'Safe Queue 041' };
      const item: AVSessionManager.AVQueueItem = { itemId: 41, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 41);
      expect(item.itemId).assertEqual(41);
      expect(item.description?.assetId).assertEqual('safe-queue-041');
      expect(item.description?.title === 'Safe Queue 041').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0121 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0122
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0122
     * @tc.desc   Verify queue item case 42.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0122 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-042', title: 'Safe Queue 042' };
      const item: AVSessionManager.AVQueueItem = { itemId: 42, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 42);
      expect(item.itemId).assertEqual(42);
      expect(item.description?.assetId).assertEqual('safe-queue-042');
      expect(item.description?.title === 'Safe Queue 042').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0122 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0123
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0123
     * @tc.desc   Verify queue item case 43.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0123 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-043', title: 'Safe Queue 043' };
      const item: AVSessionManager.AVQueueItem = { itemId: 43, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 43);
      expect(item.itemId).assertEqual(43);
      expect(item.description?.assetId).assertEqual('safe-queue-043');
      expect(item.description?.title === 'Safe Queue 043').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0123 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0124
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0124
     * @tc.desc   Verify queue item case 44.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0124 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-044', title: 'Safe Queue 044' };
      const item: AVSessionManager.AVQueueItem = { itemId: 44, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 44);
      expect(item.itemId).assertEqual(44);
      expect(item.description?.assetId).assertEqual('safe-queue-044');
      expect(item.description?.title === 'Safe Queue 044').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0124 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0125
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0125
     * @tc.desc   Verify queue item case 45.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0125 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-045', title: 'Safe Queue 045' };
      const item: AVSessionManager.AVQueueItem = { itemId: 45, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 45);
      expect(item.itemId).assertEqual(45);
      expect(item.description?.assetId).assertEqual('safe-queue-045');
      expect(item.description?.title === 'Safe Queue 045').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0125 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0126
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0126
     * @tc.desc   Verify queue item case 46.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0126 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-046', title: 'Safe Queue 046' };
      const item: AVSessionManager.AVQueueItem = { itemId: 46, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 46);
      expect(item.itemId).assertEqual(46);
      expect(item.description?.assetId).assertEqual('safe-queue-046');
      expect(item.description?.title === 'Safe Queue 046').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0126 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0127
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0127
     * @tc.desc   Verify queue item case 47.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0127 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-047', title: 'Safe Queue 047' };
      const item: AVSessionManager.AVQueueItem = { itemId: 47, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 47);
      expect(item.itemId).assertEqual(47);
      expect(item.description?.assetId).assertEqual('safe-queue-047');
      expect(item.description?.title === 'Safe Queue 047').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0127 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0128
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0128
     * @tc.desc   Verify queue item case 48.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0128 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-048', title: 'Safe Queue 048' };
      const item: AVSessionManager.AVQueueItem = { itemId: 48, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 48);
      expect(item.itemId).assertEqual(48);
      expect(item.description?.assetId).assertEqual('safe-queue-048');
      expect(item.description?.title === 'Safe Queue 048').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0128 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0129
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0129
     * @tc.desc   Verify queue item case 49.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0129 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-049', title: 'Safe Queue 049' };
      const item: AVSessionManager.AVQueueItem = { itemId: 49, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 49);
      expect(item.itemId).assertEqual(49);
      expect(item.description?.assetId).assertEqual('safe-queue-049');
      expect(item.description?.title === 'Safe Queue 049').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0129 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0130
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0130
     * @tc.desc   Verify queue item case 50.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0130 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-050', title: 'Safe Queue 050' };
      const item: AVSessionManager.AVQueueItem = { itemId: 50, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 50);
      expect(item.itemId).assertEqual(50);
      expect(item.description?.assetId).assertEqual('safe-queue-050');
      expect(item.description?.title === 'Safe Queue 050').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0130 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0131
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0131
     * @tc.desc   Verify queue item case 51.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0131 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-051', title: 'Safe Queue 051' };
      const item: AVSessionManager.AVQueueItem = { itemId: 51, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 51);
      expect(item.itemId).assertEqual(51);
      expect(item.description?.assetId).assertEqual('safe-queue-051');
      expect(item.description?.title === 'Safe Queue 051').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0131 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0132
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0132
     * @tc.desc   Verify queue item case 52.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0132 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-052', title: 'Safe Queue 052' };
      const item: AVSessionManager.AVQueueItem = { itemId: 52, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 52);
      expect(item.itemId).assertEqual(52);
      expect(item.description?.assetId).assertEqual('safe-queue-052');
      expect(item.description?.title === 'Safe Queue 052').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0132 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0133
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0133
     * @tc.desc   Verify queue item case 53.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0133 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-053', title: 'Safe Queue 053' };
      const item: AVSessionManager.AVQueueItem = { itemId: 53, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 53);
      expect(item.itemId).assertEqual(53);
      expect(item.description?.assetId).assertEqual('safe-queue-053');
      expect(item.description?.title === 'Safe Queue 053').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0133 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0134
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0134
     * @tc.desc   Verify queue item case 54.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0134 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-054', title: 'Safe Queue 054' };
      const item: AVSessionManager.AVQueueItem = { itemId: 54, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 54);
      expect(item.itemId).assertEqual(54);
      expect(item.description?.assetId).assertEqual('safe-queue-054');
      expect(item.description?.title === 'Safe Queue 054').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0134 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0135
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0135
     * @tc.desc   Verify queue item case 55.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0135 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-055', title: 'Safe Queue 055' };
      const item: AVSessionManager.AVQueueItem = { itemId: 55, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 55);
      expect(item.itemId).assertEqual(55);
      expect(item.description?.assetId).assertEqual('safe-queue-055');
      expect(item.description?.title === 'Safe Queue 055').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0135 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0136
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0136
     * @tc.desc   Verify queue item case 56.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0136 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-056', title: 'Safe Queue 056' };
      const item: AVSessionManager.AVQueueItem = { itemId: 56, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 56);
      expect(item.itemId).assertEqual(56);
      expect(item.description?.assetId).assertEqual('safe-queue-056');
      expect(item.description?.title === 'Safe Queue 056').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0136 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0137
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0137
     * @tc.desc   Verify queue item case 57.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0137 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-057', title: 'Safe Queue 057' };
      const item: AVSessionManager.AVQueueItem = { itemId: 57, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 57);
      expect(item.itemId).assertEqual(57);
      expect(item.description?.assetId).assertEqual('safe-queue-057');
      expect(item.description?.title === 'Safe Queue 057').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0137 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0138
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0138
     * @tc.desc   Verify queue item case 58.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0138 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-058', title: 'Safe Queue 058' };
      const item: AVSessionManager.AVQueueItem = { itemId: 58, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 58);
      expect(item.itemId).assertEqual(58);
      expect(item.description?.assetId).assertEqual('safe-queue-058');
      expect(item.description?.title === 'Safe Queue 058').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0138 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0139
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0139
     * @tc.desc   Verify queue item case 59.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0139 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-059', title: 'Safe Queue 059' };
      const item: AVSessionManager.AVQueueItem = { itemId: 59, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 59);
      expect(item.itemId).assertEqual(59);
      expect(item.description?.assetId).assertEqual('safe-queue-059');
      expect(item.description?.title === 'Safe Queue 059').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0139 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0140
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0140
     * @tc.desc   Verify queue item case 60.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0140 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-060', title: 'Safe Queue 060' };
      const item: AVSessionManager.AVQueueItem = { itemId: 60, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 60);
      expect(item.itemId).assertEqual(60);
      expect(item.description?.assetId).assertEqual('safe-queue-060');
      expect(item.description?.title === 'Safe Queue 060').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0140 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0141
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0141
     * @tc.desc   Verify queue item case 61.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0141 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-061', title: 'Safe Queue 061' };
      const item: AVSessionManager.AVQueueItem = { itemId: 61, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 61);
      expect(item.itemId).assertEqual(61);
      expect(item.description?.assetId).assertEqual('safe-queue-061');
      expect(item.description?.title === 'Safe Queue 061').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0141 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0142
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0142
     * @tc.desc   Verify queue item case 62.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0142 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-062', title: 'Safe Queue 062' };
      const item: AVSessionManager.AVQueueItem = { itemId: 62, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 62);
      expect(item.itemId).assertEqual(62);
      expect(item.description?.assetId).assertEqual('safe-queue-062');
      expect(item.description?.title === 'Safe Queue 062').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0142 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0143
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0143
     * @tc.desc   Verify queue item case 63.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0143 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-063', title: 'Safe Queue 063' };
      const item: AVSessionManager.AVQueueItem = { itemId: 63, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 63);
      expect(item.itemId).assertEqual(63);
      expect(item.description?.assetId).assertEqual('safe-queue-063');
      expect(item.description?.title === 'Safe Queue 063').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0143 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0144
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0144
     * @tc.desc   Verify queue item case 64.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0144 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-064', title: 'Safe Queue 064' };
      const item: AVSessionManager.AVQueueItem = { itemId: 64, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 64);
      expect(item.itemId).assertEqual(64);
      expect(item.description?.assetId).assertEqual('safe-queue-064');
      expect(item.description?.title === 'Safe Queue 064').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0144 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0145
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0145
     * @tc.desc   Verify queue item case 65.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0145 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-065', title: 'Safe Queue 065' };
      const item: AVSessionManager.AVQueueItem = { itemId: 65, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 65);
      expect(item.itemId).assertEqual(65);
      expect(item.description?.assetId).assertEqual('safe-queue-065');
      expect(item.description?.title === 'Safe Queue 065').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0145 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0146
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0146
     * @tc.desc   Verify queue item case 66.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0146 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-066', title: 'Safe Queue 066' };
      const item: AVSessionManager.AVQueueItem = { itemId: 66, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 66);
      expect(item.itemId).assertEqual(66);
      expect(item.description?.assetId).assertEqual('safe-queue-066');
      expect(item.description?.title === 'Safe Queue 066').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0146 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0147
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0147
     * @tc.desc   Verify queue item case 67.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0147 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-067', title: 'Safe Queue 067' };
      const item: AVSessionManager.AVQueueItem = { itemId: 67, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 67);
      expect(item.itemId).assertEqual(67);
      expect(item.description?.assetId).assertEqual('safe-queue-067');
      expect(item.description?.title === 'Safe Queue 067').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0147 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0148
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0148
     * @tc.desc   Verify queue item case 68.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0148 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-068', title: 'Safe Queue 068' };
      const item: AVSessionManager.AVQueueItem = { itemId: 68, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 68);
      expect(item.itemId).assertEqual(68);
      expect(item.description?.assetId).assertEqual('safe-queue-068');
      expect(item.description?.title === 'Safe Queue 068').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0148 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0149
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0149
     * @tc.desc   Verify queue item case 69.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0149 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-069', title: 'Safe Queue 069' };
      const item: AVSessionManager.AVQueueItem = { itemId: 69, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 69);
      expect(item.itemId).assertEqual(69);
      expect(item.description?.assetId).assertEqual('safe-queue-069');
      expect(item.description?.title === 'Safe Queue 069').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0149 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0150
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0150
     * @tc.desc   Verify queue item case 70.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0150 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-070', title: 'Safe Queue 070' };
      const item: AVSessionManager.AVQueueItem = { itemId: 70, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 70);
      expect(item.itemId).assertEqual(70);
      expect(item.description?.assetId).assertEqual('safe-queue-070');
      expect(item.description?.title === 'Safe Queue 070').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0150 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0151
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0151
     * @tc.desc   Verify queue item case 71.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0151 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-071', title: 'Safe Queue 071' };
      const item: AVSessionManager.AVQueueItem = { itemId: 71, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 71);
      expect(item.itemId).assertEqual(71);
      expect(item.description?.assetId).assertEqual('safe-queue-071');
      expect(item.description?.title === 'Safe Queue 071').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0151 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0152
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0152
     * @tc.desc   Verify queue item case 72.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0152 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-072', title: 'Safe Queue 072' };
      const item: AVSessionManager.AVQueueItem = { itemId: 72, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 72);
      expect(item.itemId).assertEqual(72);
      expect(item.description?.assetId).assertEqual('safe-queue-072');
      expect(item.description?.title === 'Safe Queue 072').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0152 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0153
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0153
     * @tc.desc   Verify queue item case 73.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0153 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-073', title: 'Safe Queue 073' };
      const item: AVSessionManager.AVQueueItem = { itemId: 73, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 73);
      expect(item.itemId).assertEqual(73);
      expect(item.description?.assetId).assertEqual('safe-queue-073');
      expect(item.description?.title === 'Safe Queue 073').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0153 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0154
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0154
     * @tc.desc   Verify queue item case 74.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0154 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-074', title: 'Safe Queue 074' };
      const item: AVSessionManager.AVQueueItem = { itemId: 74, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 74);
      expect(item.itemId).assertEqual(74);
      expect(item.description?.assetId).assertEqual('safe-queue-074');
      expect(item.description?.title === 'Safe Queue 074').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0154 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0155
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0155
     * @tc.desc   Verify queue item case 75.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0155 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-075', title: 'Safe Queue 075' };
      const item: AVSessionManager.AVQueueItem = { itemId: 75, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 75);
      expect(item.itemId).assertEqual(75);
      expect(item.description?.assetId).assertEqual('safe-queue-075');
      expect(item.description?.title === 'Safe Queue 075').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0155 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0156
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0156
     * @tc.desc   Verify queue item case 76.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0156 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-076', title: 'Safe Queue 076' };
      const item: AVSessionManager.AVQueueItem = { itemId: 76, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 76);
      expect(item.itemId).assertEqual(76);
      expect(item.description?.assetId).assertEqual('safe-queue-076');
      expect(item.description?.title === 'Safe Queue 076').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0156 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0157
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0157
     * @tc.desc   Verify queue item case 77.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0157 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-077', title: 'Safe Queue 077' };
      const item: AVSessionManager.AVQueueItem = { itemId: 77, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 77);
      expect(item.itemId).assertEqual(77);
      expect(item.description?.assetId).assertEqual('safe-queue-077');
      expect(item.description?.title === 'Safe Queue 077').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0157 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0158
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0158
     * @tc.desc   Verify queue item case 78.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0158 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-078', title: 'Safe Queue 078' };
      const item: AVSessionManager.AVQueueItem = { itemId: 78, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 78);
      expect(item.itemId).assertEqual(78);
      expect(item.description?.assetId).assertEqual('safe-queue-078');
      expect(item.description?.title === 'Safe Queue 078').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0158 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0159
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0159
     * @tc.desc   Verify queue item case 79.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0159 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-079', title: 'Safe Queue 079' };
      const item: AVSessionManager.AVQueueItem = { itemId: 79, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 79);
      expect(item.itemId).assertEqual(79);
      expect(item.description?.assetId).assertEqual('safe-queue-079');
      expect(item.description?.title === 'Safe Queue 079').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0159 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0160
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0160
     * @tc.desc   Verify queue item case 80.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0160 begin');
      const description: AVSessionManager.AVMediaDescription = { assetId: 'safe-queue-080', title: 'Safe Queue 080' };
      const item: AVSessionManager.AVQueueItem = { itemId: 80, description: description };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 80);
      expect(item.itemId).assertEqual(80);
      expect(item.description?.assetId).assertEqual('safe-queue-080');
      expect(item.description?.title === 'Safe Queue 080').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0160 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0161
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0161
     * @tc.desc   Verify Map entry 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0161 begin');
      const map: Map<string, string> = new Map();
      map.set('safe-key-001', 'safe-value-001');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%s', String(map.get('safe-key-001')), String('safe-value-001'));
      expect(map.get('safe-key-001') === 'safe-value-001').assertTrue();
      expect(map.size).assertEqual(1);
      expect(map.delete('safe-key-001')).assertTrue();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0161 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0162
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0162
     * @tc.desc   Verify Map entry 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0162 begin');
      const map: Map<string, string> = new Map();
      map.set('safe-key-002', 'safe-value-002');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%s', String(map.get('safe-key-002')), String('safe-value-002'));
      expect(map.get('safe-key-002') === 'safe-value-002').assertTrue();
      expect(map.size).assertEqual(1);
      expect(map.delete('safe-key-002')).assertTrue();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0162 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0163
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0163
     * @tc.desc   Verify Map entry 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0163 begin');
      const map: Map<string, string> = new Map();
      map.set('safe-key-003', 'safe-value-003');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%s', String(map.get('safe-key-003')), String('safe-value-003'));
      expect(map.get('safe-key-003') === 'safe-value-003').assertTrue();
      expect(map.size).assertEqual(1);
      expect(map.delete('safe-key-003')).assertTrue();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0163 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0164
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0164
     * @tc.desc   Verify Map entry 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0164 begin');
      const map: Map<string, string> = new Map();
      map.set('safe-key-004', 'safe-value-004');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%s', String(map.get('safe-key-004')), String('safe-value-004'));
      expect(map.get('safe-key-004') === 'safe-value-004').assertTrue();
      expect(map.size).assertEqual(1);
      expect(map.delete('safe-key-004')).assertTrue();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0164 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0165
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0165
     * @tc.desc   Verify Map entry 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0165 begin');
      const map: Map<string, string> = new Map();
      map.set('safe-key-005', 'safe-value-005');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%s', String(map.get('safe-key-005')), String('safe-value-005'));
      expect(map.get('safe-key-005') === 'safe-value-005').assertTrue();
      expect(map.size).assertEqual(1);
      expect(map.delete('safe-key-005')).assertTrue();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0165 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0166
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0166
     * @tc.desc   Verify Map entry 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0166 begin');
      const map: Map<string, string> = new Map();
      map.set('safe-key-006', 'safe-value-006');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%s', String(map.get('safe-key-006')), String('safe-value-006'));
      expect(map.get('safe-key-006') === 'safe-value-006').assertTrue();
      expect(map.size).assertEqual(1);
      expect(map.delete('safe-key-006')).assertTrue();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0166 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0167
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0167
     * @tc.desc   Verify Map entry 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0167 begin');
      const map: Map<string, string> = new Map();
      map.set('safe-key-007', 'safe-value-007');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%s', String(map.get('safe-key-007')), String('safe-value-007'));
      expect(map.get('safe-key-007') === 'safe-value-007').assertTrue();
      expect(map.size).assertEqual(1);
      expect(map.delete('safe-key-007')).assertTrue();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0167 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0168
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0168
     * @tc.desc   Verify Map entry 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0168 begin');
      const map: Map<string, string> = new Map();
      map.set('safe-key-008', 'safe-value-008');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%s', String(map.get('safe-key-008')), String('safe-value-008'));
      expect(map.get('safe-key-008') === 'safe-value-008').assertTrue();
      expect(map.size).assertEqual(1);
      expect(map.delete('safe-key-008')).assertTrue();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0168 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0169
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0169
     * @tc.desc   Verify Map entry 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0169 begin');
      const map: Map<string, string> = new Map();
      map.set('safe-key-009', 'safe-value-009');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%s', String(map.get('safe-key-009')), String('safe-value-009'));
      expect(map.get('safe-key-009') === 'safe-value-009').assertTrue();
      expect(map.size).assertEqual(1);
      expect(map.delete('safe-key-009')).assertTrue();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0169 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0170
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0170
     * @tc.desc   Verify Map entry 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0170 begin');
      const map: Map<string, string> = new Map();
      map.set('safe-key-010', 'safe-value-010');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%s', String(map.get('safe-key-010')), String('safe-value-010'));
      expect(map.get('safe-key-010') === 'safe-value-010').assertTrue();
      expect(map.size).assertEqual(1);
      expect(map.delete('safe-key-010')).assertTrue();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0170 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0171
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0171
     * @tc.desc   Verify Map entry 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0171 begin');
      const map: Map<string, string> = new Map();
      map.set('safe-key-011', 'safe-value-011');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%s', String(map.get('safe-key-011')), String('safe-value-011'));
      expect(map.get('safe-key-011') === 'safe-value-011').assertTrue();
      expect(map.size).assertEqual(1);
      expect(map.delete('safe-key-011')).assertTrue();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0171 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0172
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0172
     * @tc.desc   Verify Map entry 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0172 begin');
      const map: Map<string, string> = new Map();
      map.set('safe-key-012', 'safe-value-012');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%s', String(map.get('safe-key-012')), String('safe-value-012'));
      expect(map.get('safe-key-012') === 'safe-value-012').assertTrue();
      expect(map.size).assertEqual(1);
      expect(map.delete('safe-key-012')).assertTrue();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0172 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0173
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0173
     * @tc.desc   Verify Map entry 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0173 begin');
      const map: Map<string, string> = new Map();
      map.set('safe-key-013', 'safe-value-013');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%s', String(map.get('safe-key-013')), String('safe-value-013'));
      expect(map.get('safe-key-013') === 'safe-value-013').assertTrue();
      expect(map.size).assertEqual(1);
      expect(map.delete('safe-key-013')).assertTrue();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0173 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0174
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0174
     * @tc.desc   Verify Map entry 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0174 begin');
      const map: Map<string, string> = new Map();
      map.set('safe-key-014', 'safe-value-014');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%s', String(map.get('safe-key-014')), String('safe-value-014'));
      expect(map.get('safe-key-014') === 'safe-value-014').assertTrue();
      expect(map.size).assertEqual(1);
      expect(map.delete('safe-key-014')).assertTrue();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0174 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0175
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0175
     * @tc.desc   Verify Map entry 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0175 begin');
      const map: Map<string, string> = new Map();
      map.set('safe-key-015', 'safe-value-015');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%s', String(map.get('safe-key-015')), String('safe-value-015'));
      expect(map.get('safe-key-015') === 'safe-value-015').assertTrue();
      expect(map.size).assertEqual(1);
      expect(map.delete('safe-key-015')).assertTrue();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0175 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0176
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0176
     * @tc.desc   Verify Map entry 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0176 begin');
      const map: Map<string, string> = new Map();
      map.set('safe-key-016', 'safe-value-016');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%s', String(map.get('safe-key-016')), String('safe-value-016'));
      expect(map.get('safe-key-016') === 'safe-value-016').assertTrue();
      expect(map.size).assertEqual(1);
      expect(map.delete('safe-key-016')).assertTrue();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0176 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0177
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0177
     * @tc.desc   Verify Map entry 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0177 begin');
      const map: Map<string, string> = new Map();
      map.set('safe-key-017', 'safe-value-017');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%s', String(map.get('safe-key-017')), String('safe-value-017'));
      expect(map.get('safe-key-017') === 'safe-value-017').assertTrue();
      expect(map.size).assertEqual(1);
      expect(map.delete('safe-key-017')).assertTrue();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0177 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0178
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0178
     * @tc.desc   Verify Map entry 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0178 begin');
      const map: Map<string, string> = new Map();
      map.set('safe-key-018', 'safe-value-018');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%s', String(map.get('safe-key-018')), String('safe-value-018'));
      expect(map.get('safe-key-018') === 'safe-value-018').assertTrue();
      expect(map.size).assertEqual(1);
      expect(map.delete('safe-key-018')).assertTrue();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0178 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0179
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0179
     * @tc.desc   Verify Map entry 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0179 begin');
      const map: Map<string, string> = new Map();
      map.set('safe-key-019', 'safe-value-019');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%s', String(map.get('safe-key-019')), String('safe-value-019'));
      expect(map.get('safe-key-019') === 'safe-value-019').assertTrue();
      expect(map.size).assertEqual(1);
      expect(map.delete('safe-key-019')).assertTrue();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0179 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0180
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0180
     * @tc.desc   Verify Map entry 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0180 begin');
      const map: Map<string, string> = new Map();
      map.set('safe-key-020', 'safe-value-020');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%s', String(map.get('safe-key-020')), String('safe-value-020'));
      expect(map.get('safe-key-020') === 'safe-value-020').assertTrue();
      expect(map.size).assertEqual(1);
      expect(map.delete('safe-key-020')).assertTrue();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0180 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0181
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0181
     * @tc.desc   Verify Map entry 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0181 begin');
      const map: Map<string, string> = new Map();
      map.set('safe-key-021', 'safe-value-021');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%s', String(map.get('safe-key-021')), String('safe-value-021'));
      expect(map.get('safe-key-021') === 'safe-value-021').assertTrue();
      expect(map.size).assertEqual(1);
      expect(map.delete('safe-key-021')).assertTrue();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0181 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0182
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0182
     * @tc.desc   Verify Map entry 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0182 begin');
      const map: Map<string, string> = new Map();
      map.set('safe-key-022', 'safe-value-022');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%s', String(map.get('safe-key-022')), String('safe-value-022'));
      expect(map.get('safe-key-022') === 'safe-value-022').assertTrue();
      expect(map.size).assertEqual(1);
      expect(map.delete('safe-key-022')).assertTrue();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0182 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0183
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0183
     * @tc.desc   Verify Map entry 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0183 begin');
      const map: Map<string, string> = new Map();
      map.set('safe-key-023', 'safe-value-023');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%s', String(map.get('safe-key-023')), String('safe-value-023'));
      expect(map.get('safe-key-023') === 'safe-value-023').assertTrue();
      expect(map.size).assertEqual(1);
      expect(map.delete('safe-key-023')).assertTrue();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0183 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0184
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0184
     * @tc.desc   Verify Map entry 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0184 begin');
      const map: Map<string, string> = new Map();
      map.set('safe-key-024', 'safe-value-024');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%s', String(map.get('safe-key-024')), String('safe-value-024'));
      expect(map.get('safe-key-024') === 'safe-value-024').assertTrue();
      expect(map.size).assertEqual(1);
      expect(map.delete('safe-key-024')).assertTrue();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0184 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0185
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0185
     * @tc.desc   Verify Map entry 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0185 begin');
      const map: Map<string, string> = new Map();
      map.set('safe-key-025', 'safe-value-025');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%s', String(map.get('safe-key-025')), String('safe-value-025'));
      expect(map.get('safe-key-025') === 'safe-value-025').assertTrue();
      expect(map.size).assertEqual(1);
      expect(map.delete('safe-key-025')).assertTrue();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0185 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0186
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0186
     * @tc.desc   Verify Map entry 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0186 begin');
      const map: Map<string, string> = new Map();
      map.set('safe-key-026', 'safe-value-026');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%s', String(map.get('safe-key-026')), String('safe-value-026'));
      expect(map.get('safe-key-026') === 'safe-value-026').assertTrue();
      expect(map.size).assertEqual(1);
      expect(map.delete('safe-key-026')).assertTrue();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0186 end');
    })
  })
}
