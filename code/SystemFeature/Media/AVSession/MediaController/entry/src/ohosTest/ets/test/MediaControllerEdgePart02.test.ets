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

export default function mediaControllerEdgeTestPart02() {
  describe('MediaControllerEdgePart02', () => {
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0096
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0096
     * @tc.desc   Verify queue item boundary variant 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0096 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: -1, description: { assetId: 'edge-queue-016', title: 'Edge Queue 016' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, -1);
      expect(item.itemId).assertEqual(-1);
      expect(item.description?.assetId).assertEqual('edge-queue-016');
      expect(item.description?.title).assertEqual('Edge Queue 016');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0096 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0097
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0097
     * @tc.desc   Verify queue item boundary variant 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0097 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 2147483647, description: { assetId: 'edge-queue-017', title: 'Edge Queue 017' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 2147483647);
      expect(item.itemId).assertEqual(2147483647);
      expect(item.description?.assetId).assertEqual('edge-queue-017');
      expect(item.description?.title).assertEqual('Edge Queue 017');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0097 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0098
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0098
     * @tc.desc   Verify queue item boundary variant 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0098 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 18, description: { assetId: 'edge-queue-018', title: 'Edge Queue 018' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 18);
      expect(item.itemId).assertEqual(18);
      expect(item.description?.assetId).assertEqual('edge-queue-018');
      expect(item.description?.title).assertEqual('Edge Queue 018');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0098 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0099
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0099
     * @tc.desc   Verify queue item boundary variant 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0099 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 1900, description: { assetId: 'edge-queue-019', title: 'Edge Queue 019' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 1900);
      expect(item.itemId).assertEqual(1900);
      expect(item.description?.assetId).assertEqual('edge-queue-019');
      expect(item.description?.title).assertEqual('Edge Queue 019');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0099 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0100
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0100
     * @tc.desc   Verify queue item boundary variant 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0100 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 0, description: { assetId: 'edge-queue-020', title: 'Edge Queue 020' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 0);
      expect(item.itemId).assertEqual(0);
      expect(item.description?.assetId).assertEqual('edge-queue-020');
      expect(item.description?.title).assertEqual('Edge Queue 020');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0100 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0101
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0101
     * @tc.desc   Verify queue item boundary variant 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0101 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: -1, description: { assetId: 'edge-queue-021', title: '' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, -1);
      expect(item.itemId).assertEqual(-1);
      expect(item.description?.assetId).assertEqual('edge-queue-021');
      expect(item.description?.title).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0101 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0102
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0102
     * @tc.desc   Verify queue item boundary variant 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0102 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 2147483647, description: { assetId: '', title: 'Edge Queue 022' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 2147483647);
      expect(item.itemId).assertEqual(2147483647);
      expect(item.description?.assetId).assertEqual('');
      expect(item.description?.title).assertEqual('Edge Queue 022');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0102 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0103
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0103
     * @tc.desc   Verify queue item boundary variant 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0103 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 23, description: { assetId: 'edge-queue-023', title: 'Edge Queue 023' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 23);
      expect(item.itemId).assertEqual(23);
      expect(item.description?.assetId).assertEqual('edge-queue-023');
      expect(item.description?.title).assertEqual('Edge Queue 023');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0103 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0104
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0104
     * @tc.desc   Verify queue item boundary variant 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0104 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 2400, description: { assetId: 'edge-queue-024', title: 'Edge Queue 024' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 2400);
      expect(item.itemId).assertEqual(2400);
      expect(item.description?.assetId).assertEqual('edge-queue-024');
      expect(item.description?.title).assertEqual('Edge Queue 024');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0104 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0105
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0105
     * @tc.desc   Verify queue item boundary variant 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0105 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 0, description: { assetId: 'edge-queue-025', title: 'Edge Queue 025' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 0);
      expect(item.itemId).assertEqual(0);
      expect(item.description?.assetId).assertEqual('edge-queue-025');
      expect(item.description?.title).assertEqual('Edge Queue 025');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0105 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0106
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0106
     * @tc.desc   Verify queue item boundary variant 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0106 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: -1, description: { assetId: 'edge-queue-026', title: 'Edge Queue 026' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, -1);
      expect(item.itemId).assertEqual(-1);
      expect(item.description?.assetId).assertEqual('edge-queue-026');
      expect(item.description?.title).assertEqual('Edge Queue 026');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0106 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0107
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0107
     * @tc.desc   Verify queue item boundary variant 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0107 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 2147483647, description: { assetId: 'edge-queue-027', title: 'Edge Queue 027' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 2147483647);
      expect(item.itemId).assertEqual(2147483647);
      expect(item.description?.assetId).assertEqual('edge-queue-027');
      expect(item.description?.title).assertEqual('Edge Queue 027');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0107 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0108
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0108
     * @tc.desc   Verify queue item boundary variant 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0108 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 28, description: { assetId: 'edge-queue-028', title: '' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 28);
      expect(item.itemId).assertEqual(28);
      expect(item.description?.assetId).assertEqual('edge-queue-028');
      expect(item.description?.title).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0108 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0109
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0109
     * @tc.desc   Verify queue item boundary variant 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0109 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 2900, description: { assetId: 'edge-queue-029', title: 'Edge Queue 029' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 2900);
      expect(item.itemId).assertEqual(2900);
      expect(item.description?.assetId).assertEqual('edge-queue-029');
      expect(item.description?.title).assertEqual('Edge Queue 029');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0109 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0110
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0110
     * @tc.desc   Verify queue item boundary variant 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0110 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 0, description: { assetId: 'edge-queue-030', title: 'Edge Queue 030' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 0);
      expect(item.itemId).assertEqual(0);
      expect(item.description?.assetId).assertEqual('edge-queue-030');
      expect(item.description?.title).assertEqual('Edge Queue 030');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0110 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0111
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0111
     * @tc.desc   Verify queue item boundary variant 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0111 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: -1, description: { assetId: 'edge-queue-031', title: 'Edge Queue 031' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, -1);
      expect(item.itemId).assertEqual(-1);
      expect(item.description?.assetId).assertEqual('edge-queue-031');
      expect(item.description?.title).assertEqual('Edge Queue 031');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0111 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0112
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0112
     * @tc.desc   Verify queue item boundary variant 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0112 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 2147483647, description: { assetId: 'edge-queue-032', title: 'Edge Queue 032' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 2147483647);
      expect(item.itemId).assertEqual(2147483647);
      expect(item.description?.assetId).assertEqual('edge-queue-032');
      expect(item.description?.title).assertEqual('Edge Queue 032');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0112 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0113
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0113
     * @tc.desc   Verify queue item boundary variant 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0113 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 33, description: { assetId: '', title: 'Edge Queue 033' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 33);
      expect(item.itemId).assertEqual(33);
      expect(item.description?.assetId).assertEqual('');
      expect(item.description?.title).assertEqual('Edge Queue 033');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0113 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0114
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0114
     * @tc.desc   Verify queue item boundary variant 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0114 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 3400, description: { assetId: 'edge-queue-034', title: 'Edge Queue 034' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 3400);
      expect(item.itemId).assertEqual(3400);
      expect(item.description?.assetId).assertEqual('edge-queue-034');
      expect(item.description?.title).assertEqual('Edge Queue 034');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0114 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0115
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0115
     * @tc.desc   Verify queue item boundary variant 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0115 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 0, description: { assetId: 'edge-queue-035', title: '' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 0);
      expect(item.itemId).assertEqual(0);
      expect(item.description?.assetId).assertEqual('edge-queue-035');
      expect(item.description?.title).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0115 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0116
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0116
     * @tc.desc   Verify queue item boundary variant 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0116 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: -1, description: { assetId: 'edge-queue-036', title: 'Edge Queue 036' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, -1);
      expect(item.itemId).assertEqual(-1);
      expect(item.description?.assetId).assertEqual('edge-queue-036');
      expect(item.description?.title).assertEqual('Edge Queue 036');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0116 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0117
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0117
     * @tc.desc   Verify queue item boundary variant 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0117 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 2147483647, description: { assetId: 'edge-queue-037', title: 'Edge Queue 037' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 2147483647);
      expect(item.itemId).assertEqual(2147483647);
      expect(item.description?.assetId).assertEqual('edge-queue-037');
      expect(item.description?.title).assertEqual('Edge Queue 037');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0117 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0118
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0118
     * @tc.desc   Verify queue item boundary variant 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0118 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 38, description: { assetId: 'edge-queue-038', title: 'Edge Queue 038' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 38);
      expect(item.itemId).assertEqual(38);
      expect(item.description?.assetId).assertEqual('edge-queue-038');
      expect(item.description?.title).assertEqual('Edge Queue 038');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0118 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0119
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0119
     * @tc.desc   Verify queue item boundary variant 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0119 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 3900, description: { assetId: 'edge-queue-039', title: 'Edge Queue 039' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 3900);
      expect(item.itemId).assertEqual(3900);
      expect(item.description?.assetId).assertEqual('edge-queue-039');
      expect(item.description?.title).assertEqual('Edge Queue 039');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0119 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0120
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0120
     * @tc.desc   Verify queue item boundary variant 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0120 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 0, description: { assetId: 'edge-queue-040', title: 'Edge Queue 040' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 0);
      expect(item.itemId).assertEqual(0);
      expect(item.description?.assetId).assertEqual('edge-queue-040');
      expect(item.description?.title).assertEqual('Edge Queue 040');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0120 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0121
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0121
     * @tc.desc   Verify queue item boundary variant 41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0121 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: -1, description: { assetId: 'edge-queue-041', title: 'Edge Queue 041' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, -1);
      expect(item.itemId).assertEqual(-1);
      expect(item.description?.assetId).assertEqual('edge-queue-041');
      expect(item.description?.title).assertEqual('Edge Queue 041');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0121 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0122
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0122
     * @tc.desc   Verify queue item boundary variant 42.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0122 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 2147483647, description: { assetId: 'edge-queue-042', title: '' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 2147483647);
      expect(item.itemId).assertEqual(2147483647);
      expect(item.description?.assetId).assertEqual('edge-queue-042');
      expect(item.description?.title).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0122 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0123
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0123
     * @tc.desc   Verify queue item boundary variant 43.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0123 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 43, description: { assetId: 'edge-queue-043', title: 'Edge Queue 043' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 43);
      expect(item.itemId).assertEqual(43);
      expect(item.description?.assetId).assertEqual('edge-queue-043');
      expect(item.description?.title).assertEqual('Edge Queue 043');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0123 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0124
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0124
     * @tc.desc   Verify queue item boundary variant 44.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0124 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 4400, description: { assetId: '', title: 'Edge Queue 044' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 4400);
      expect(item.itemId).assertEqual(4400);
      expect(item.description?.assetId).assertEqual('');
      expect(item.description?.title).assertEqual('Edge Queue 044');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0124 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0125
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0125
     * @tc.desc   Verify queue item boundary variant 45.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0125 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 0, description: { assetId: 'edge-queue-045', title: 'Edge Queue 045' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 0);
      expect(item.itemId).assertEqual(0);
      expect(item.description?.assetId).assertEqual('edge-queue-045');
      expect(item.description?.title).assertEqual('Edge Queue 045');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0125 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0126
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0126
     * @tc.desc   Verify queue item boundary variant 46.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0126 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: -1, description: { assetId: 'edge-queue-046', title: 'Edge Queue 046' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, -1);
      expect(item.itemId).assertEqual(-1);
      expect(item.description?.assetId).assertEqual('edge-queue-046');
      expect(item.description?.title).assertEqual('Edge Queue 046');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0126 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0127
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0127
     * @tc.desc   Verify queue item boundary variant 47.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0127 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 2147483647, description: { assetId: 'edge-queue-047', title: 'Edge Queue 047' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 2147483647);
      expect(item.itemId).assertEqual(2147483647);
      expect(item.description?.assetId).assertEqual('edge-queue-047');
      expect(item.description?.title).assertEqual('Edge Queue 047');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0127 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0128
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0128
     * @tc.desc   Verify queue item boundary variant 48.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0128 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 48, description: { assetId: 'edge-queue-048', title: 'Edge Queue 048' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 48);
      expect(item.itemId).assertEqual(48);
      expect(item.description?.assetId).assertEqual('edge-queue-048');
      expect(item.description?.title).assertEqual('Edge Queue 048');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0128 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0129
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0129
     * @tc.desc   Verify queue item boundary variant 49.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0129 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 4900, description: { assetId: 'edge-queue-049', title: '' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 4900);
      expect(item.itemId).assertEqual(4900);
      expect(item.description?.assetId).assertEqual('edge-queue-049');
      expect(item.description?.title).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0129 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0130
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0130
     * @tc.desc   Verify queue item boundary variant 50.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0130 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 0, description: { assetId: 'edge-queue-050', title: 'Edge Queue 050' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 0);
      expect(item.itemId).assertEqual(0);
      expect(item.description?.assetId).assertEqual('edge-queue-050');
      expect(item.description?.title).assertEqual('Edge Queue 050');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0130 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0131
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0131
     * @tc.desc   Verify queue item boundary variant 51.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0131 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: -1, description: { assetId: 'edge-queue-051', title: 'Edge Queue 051' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, -1);
      expect(item.itemId).assertEqual(-1);
      expect(item.description?.assetId).assertEqual('edge-queue-051');
      expect(item.description?.title).assertEqual('Edge Queue 051');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0131 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0132
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0132
     * @tc.desc   Verify queue item boundary variant 52.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0132 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 2147483647, description: { assetId: 'edge-queue-052', title: 'Edge Queue 052' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 2147483647);
      expect(item.itemId).assertEqual(2147483647);
      expect(item.description?.assetId).assertEqual('edge-queue-052');
      expect(item.description?.title).assertEqual('Edge Queue 052');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0132 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0133
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0133
     * @tc.desc   Verify queue item boundary variant 53.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0133 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 53, description: { assetId: 'edge-queue-053', title: 'Edge Queue 053' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 53);
      expect(item.itemId).assertEqual(53);
      expect(item.description?.assetId).assertEqual('edge-queue-053');
      expect(item.description?.title).assertEqual('Edge Queue 053');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0133 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0134
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0134
     * @tc.desc   Verify queue item boundary variant 54.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0134 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 5400, description: { assetId: 'edge-queue-054', title: 'Edge Queue 054' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 5400);
      expect(item.itemId).assertEqual(5400);
      expect(item.description?.assetId).assertEqual('edge-queue-054');
      expect(item.description?.title).assertEqual('Edge Queue 054');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0134 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0135
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0135
     * @tc.desc   Verify queue item boundary variant 55.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0135 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 0, description: { assetId: '', title: 'Edge Queue 055' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 0);
      expect(item.itemId).assertEqual(0);
      expect(item.description?.assetId).assertEqual('');
      expect(item.description?.title).assertEqual('Edge Queue 055');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0135 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0136
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0136
     * @tc.desc   Verify queue item boundary variant 56.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0136 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: -1, description: { assetId: 'edge-queue-056', title: '' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, -1);
      expect(item.itemId).assertEqual(-1);
      expect(item.description?.assetId).assertEqual('edge-queue-056');
      expect(item.description?.title).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0136 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0137
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0137
     * @tc.desc   Verify queue item boundary variant 57.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0137 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 2147483647, description: { assetId: 'edge-queue-057', title: 'Edge Queue 057' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 2147483647);
      expect(item.itemId).assertEqual(2147483647);
      expect(item.description?.assetId).assertEqual('edge-queue-057');
      expect(item.description?.title).assertEqual('Edge Queue 057');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0137 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0138
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0138
     * @tc.desc   Verify queue item boundary variant 58.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0138 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 58, description: { assetId: 'edge-queue-058', title: 'Edge Queue 058' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 58);
      expect(item.itemId).assertEqual(58);
      expect(item.description?.assetId).assertEqual('edge-queue-058');
      expect(item.description?.title).assertEqual('Edge Queue 058');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0138 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0139
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0139
     * @tc.desc   Verify queue item boundary variant 59.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0139 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 5900, description: { assetId: 'edge-queue-059', title: 'Edge Queue 059' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 5900);
      expect(item.itemId).assertEqual(5900);
      expect(item.description?.assetId).assertEqual('edge-queue-059');
      expect(item.description?.title).assertEqual('Edge Queue 059');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0139 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0140
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0140
     * @tc.desc   Verify queue item boundary variant 60.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0140 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 0, description: { assetId: 'edge-queue-060', title: 'Edge Queue 060' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 0);
      expect(item.itemId).assertEqual(0);
      expect(item.description?.assetId).assertEqual('edge-queue-060');
      expect(item.description?.title).assertEqual('Edge Queue 060');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0140 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0141
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0141
     * @tc.desc   Verify queue item boundary variant 61.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0141 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: -1, description: { assetId: 'edge-queue-061', title: 'Edge Queue 061' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, -1);
      expect(item.itemId).assertEqual(-1);
      expect(item.description?.assetId).assertEqual('edge-queue-061');
      expect(item.description?.title).assertEqual('Edge Queue 061');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0141 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0142
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0142
     * @tc.desc   Verify queue item boundary variant 62.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0142 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 2147483647, description: { assetId: 'edge-queue-062', title: 'Edge Queue 062' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 2147483647);
      expect(item.itemId).assertEqual(2147483647);
      expect(item.description?.assetId).assertEqual('edge-queue-062');
      expect(item.description?.title).assertEqual('Edge Queue 062');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0142 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0143
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0143
     * @tc.desc   Verify queue item boundary variant 63.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0143 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 63, description: { assetId: 'edge-queue-063', title: '' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 63);
      expect(item.itemId).assertEqual(63);
      expect(item.description?.assetId).assertEqual('edge-queue-063');
      expect(item.description?.title).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0143 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0144
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0144
     * @tc.desc   Verify queue item boundary variant 64.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0144 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 6400, description: { assetId: 'edge-queue-064', title: 'Edge Queue 064' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 6400);
      expect(item.itemId).assertEqual(6400);
      expect(item.description?.assetId).assertEqual('edge-queue-064');
      expect(item.description?.title).assertEqual('Edge Queue 064');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0144 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0145
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0145
     * @tc.desc   Verify queue item boundary variant 65.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0145 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 0, description: { assetId: 'edge-queue-065', title: 'Edge Queue 065' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 0);
      expect(item.itemId).assertEqual(0);
      expect(item.description?.assetId).assertEqual('edge-queue-065');
      expect(item.description?.title).assertEqual('Edge Queue 065');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0145 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0146
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0146
     * @tc.desc   Verify queue item boundary variant 66.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0146 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: -1, description: { assetId: '', title: 'Edge Queue 066' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, -1);
      expect(item.itemId).assertEqual(-1);
      expect(item.description?.assetId).assertEqual('');
      expect(item.description?.title).assertEqual('Edge Queue 066');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0146 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0147
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0147
     * @tc.desc   Verify queue item boundary variant 67.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0147 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 2147483647, description: { assetId: 'edge-queue-067', title: 'Edge Queue 067' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 2147483647);
      expect(item.itemId).assertEqual(2147483647);
      expect(item.description?.assetId).assertEqual('edge-queue-067');
      expect(item.description?.title).assertEqual('Edge Queue 067');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0147 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0148
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0148
     * @tc.desc   Verify queue item boundary variant 68.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0148 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 68, description: { assetId: 'edge-queue-068', title: 'Edge Queue 068' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 68);
      expect(item.itemId).assertEqual(68);
      expect(item.description?.assetId).assertEqual('edge-queue-068');
      expect(item.description?.title).assertEqual('Edge Queue 068');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0148 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0149
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0149
     * @tc.desc   Verify queue item boundary variant 69.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0149 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 6900, description: { assetId: 'edge-queue-069', title: 'Edge Queue 069' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 6900);
      expect(item.itemId).assertEqual(6900);
      expect(item.description?.assetId).assertEqual('edge-queue-069');
      expect(item.description?.title).assertEqual('Edge Queue 069');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0149 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0150
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0150
     * @tc.desc   Verify queue item boundary variant 70.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0150 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 0, description: { assetId: 'edge-queue-070', title: '' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 0);
      expect(item.itemId).assertEqual(0);
      expect(item.description?.assetId).assertEqual('edge-queue-070');
      expect(item.description?.title).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0150 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0151
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0151
     * @tc.desc   Verify queue item boundary variant 71.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0151 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: -1, description: { assetId: 'edge-queue-071', title: 'Edge Queue 071' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, -1);
      expect(item.itemId).assertEqual(-1);
      expect(item.description?.assetId).assertEqual('edge-queue-071');
      expect(item.description?.title).assertEqual('Edge Queue 071');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0151 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0152
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0152
     * @tc.desc   Verify queue item boundary variant 72.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0152 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 2147483647, description: { assetId: 'edge-queue-072', title: 'Edge Queue 072' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 2147483647);
      expect(item.itemId).assertEqual(2147483647);
      expect(item.description?.assetId).assertEqual('edge-queue-072');
      expect(item.description?.title).assertEqual('Edge Queue 072');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0152 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0153
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0153
     * @tc.desc   Verify queue item boundary variant 73.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0153 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 73, description: { assetId: 'edge-queue-073', title: 'Edge Queue 073' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 73);
      expect(item.itemId).assertEqual(73);
      expect(item.description?.assetId).assertEqual('edge-queue-073');
      expect(item.description?.title).assertEqual('Edge Queue 073');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0153 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0154
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0154
     * @tc.desc   Verify queue item boundary variant 74.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0154 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 7400, description: { assetId: 'edge-queue-074', title: 'Edge Queue 074' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 7400);
      expect(item.itemId).assertEqual(7400);
      expect(item.description?.assetId).assertEqual('edge-queue-074');
      expect(item.description?.title).assertEqual('Edge Queue 074');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0154 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0155
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0155
     * @tc.desc   Verify queue item boundary variant 75.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0155 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 0, description: { assetId: 'edge-queue-075', title: 'Edge Queue 075' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 0);
      expect(item.itemId).assertEqual(0);
      expect(item.description?.assetId).assertEqual('edge-queue-075');
      expect(item.description?.title).assertEqual('Edge Queue 075');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0155 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0156
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0156
     * @tc.desc   Verify queue item boundary variant 76.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0156 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: -1, description: { assetId: 'edge-queue-076', title: 'Edge Queue 076' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, -1);
      expect(item.itemId).assertEqual(-1);
      expect(item.description?.assetId).assertEqual('edge-queue-076');
      expect(item.description?.title).assertEqual('Edge Queue 076');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0156 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0157
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0157
     * @tc.desc   Verify queue item boundary variant 77.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0157 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 2147483647, description: { assetId: '', title: '' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 2147483647);
      expect(item.itemId).assertEqual(2147483647);
      expect(item.description?.assetId).assertEqual('');
      expect(item.description?.title).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0157 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0158
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0158
     * @tc.desc   Verify queue item boundary variant 78.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0158 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 78, description: { assetId: 'edge-queue-078', title: 'Edge Queue 078' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 78);
      expect(item.itemId).assertEqual(78);
      expect(item.description?.assetId).assertEqual('edge-queue-078');
      expect(item.description?.title).assertEqual('Edge Queue 078');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0158 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0159
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0159
     * @tc.desc   Verify queue item boundary variant 79.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0159 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 7900, description: { assetId: 'edge-queue-079', title: 'Edge Queue 079' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 7900);
      expect(item.itemId).assertEqual(7900);
      expect(item.description?.assetId).assertEqual('edge-queue-079');
      expect(item.description?.title).assertEqual('Edge Queue 079');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0159 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0160
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0160
     * @tc.desc   Verify queue item boundary variant 80.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0160 begin');
      const item: AVSessionManager.AVQueueItem = { itemId: 0, description: { assetId: 'edge-queue-080', title: 'Edge Queue 080' } };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', item.itemId, 0);
      expect(item.itemId).assertEqual(0);
      expect(item.description?.assetId).assertEqual('edge-queue-080');
      expect(item.description?.title).assertEqual('Edge Queue 080');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0160 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0161
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0161
     * @tc.desc   Verify map overwrite and clear 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0161 begin');
      const map: Map<string, string> = new Map();
      map.set('edge-key-001', 'first');
      map.set('edge-key-001', 'second');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=second', String(map.get('edge-key-001')));
      expect(map.get('edge-key-001')).assertEqual('second');
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0161 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0162
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0162
     * @tc.desc   Verify map overwrite and clear 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0162 begin');
      const map: Map<string, string> = new Map();
      map.set('edge-key-002', 'first');
      map.set('edge-key-002', 'second');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=second', String(map.get('edge-key-002')));
      expect(map.get('edge-key-002')).assertEqual('second');
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0162 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0163
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0163
     * @tc.desc   Verify map overwrite and clear 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0163 begin');
      const map: Map<string, string> = new Map();
      map.set('edge-key-003', 'first');
      map.set('edge-key-003', 'second');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=second', String(map.get('edge-key-003')));
      expect(map.get('edge-key-003')).assertEqual('second');
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0163 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0164
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0164
     * @tc.desc   Verify map overwrite and clear 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0164 begin');
      const map: Map<string, string> = new Map();
      map.set('edge-key-004', 'first');
      map.set('edge-key-004', 'second');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=second', String(map.get('edge-key-004')));
      expect(map.get('edge-key-004')).assertEqual('second');
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0164 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0165
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0165
     * @tc.desc   Verify map overwrite and clear 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0165 begin');
      const map: Map<string, string> = new Map();
      map.set('edge-key-005', 'first');
      map.set('edge-key-005', 'second');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=second', String(map.get('edge-key-005')));
      expect(map.get('edge-key-005')).assertEqual('second');
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0165 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0166
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0166
     * @tc.desc   Verify map overwrite and clear 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0166 begin');
      const map: Map<string, string> = new Map();
      map.set('edge-key-006', 'first');
      map.set('edge-key-006', 'second');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=second', String(map.get('edge-key-006')));
      expect(map.get('edge-key-006')).assertEqual('second');
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0166 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0167
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0167
     * @tc.desc   Verify map overwrite and clear 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0167 begin');
      const map: Map<string, string> = new Map();
      map.set('edge-key-007', 'first');
      map.set('edge-key-007', 'second');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=second', String(map.get('edge-key-007')));
      expect(map.get('edge-key-007')).assertEqual('second');
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0167 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0168
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0168
     * @tc.desc   Verify map overwrite and clear 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0168 begin');
      const map: Map<string, string> = new Map();
      map.set('edge-key-008', 'first');
      map.set('edge-key-008', 'second');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=second', String(map.get('edge-key-008')));
      expect(map.get('edge-key-008')).assertEqual('second');
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0168 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0169
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0169
     * @tc.desc   Verify map overwrite and clear 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0169 begin');
      const map: Map<string, string> = new Map();
      map.set('edge-key-009', 'first');
      map.set('edge-key-009', 'second');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=second', String(map.get('edge-key-009')));
      expect(map.get('edge-key-009')).assertEqual('second');
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0169 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0170
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0170
     * @tc.desc   Verify map overwrite and clear 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0170 begin');
      const map: Map<string, string> = new Map();
      map.set('edge-key-010', 'first');
      map.set('edge-key-010', 'second');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=second', String(map.get('edge-key-010')));
      expect(map.get('edge-key-010')).assertEqual('second');
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0170 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0171
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0171
     * @tc.desc   Verify map overwrite and clear 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0171 begin');
      const map: Map<string, string> = new Map();
      map.set('edge-key-011', 'first');
      map.set('edge-key-011', 'second');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=second', String(map.get('edge-key-011')));
      expect(map.get('edge-key-011')).assertEqual('second');
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0171 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0172
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0172
     * @tc.desc   Verify map overwrite and clear 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0172 begin');
      const map: Map<string, string> = new Map();
      map.set('edge-key-012', 'first');
      map.set('edge-key-012', 'second');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=second', String(map.get('edge-key-012')));
      expect(map.get('edge-key-012')).assertEqual('second');
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0172 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0173
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0173
     * @tc.desc   Verify map overwrite and clear 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0173 begin');
      const map: Map<string, string> = new Map();
      map.set('edge-key-013', 'first');
      map.set('edge-key-013', 'second');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=second', String(map.get('edge-key-013')));
      expect(map.get('edge-key-013')).assertEqual('second');
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0173 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0174
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0174
     * @tc.desc   Verify map overwrite and clear 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0174 begin');
      const map: Map<string, string> = new Map();
      map.set('edge-key-014', 'first');
      map.set('edge-key-014', 'second');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=second', String(map.get('edge-key-014')));
      expect(map.get('edge-key-014')).assertEqual('second');
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0174 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0175
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0175
     * @tc.desc   Verify map overwrite and clear 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0175 begin');
      const map: Map<string, string> = new Map();
      map.set('edge-key-015', 'first');
      map.set('edge-key-015', 'second');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=second', String(map.get('edge-key-015')));
      expect(map.get('edge-key-015')).assertEqual('second');
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0175 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0176
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0176
     * @tc.desc   Verify map overwrite and clear 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0176 begin');
      const map: Map<string, string> = new Map();
      map.set('edge-key-016', 'first');
      map.set('edge-key-016', 'second');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=second', String(map.get('edge-key-016')));
      expect(map.get('edge-key-016')).assertEqual('second');
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0176 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0177
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0177
     * @tc.desc   Verify map overwrite and clear 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0177 begin');
      const map: Map<string, string> = new Map();
      map.set('edge-key-017', 'first');
      map.set('edge-key-017', 'second');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=second', String(map.get('edge-key-017')));
      expect(map.get('edge-key-017')).assertEqual('second');
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0177 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0178
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0178
     * @tc.desc   Verify map overwrite and clear 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0178 begin');
      const map: Map<string, string> = new Map();
      map.set('edge-key-018', 'first');
      map.set('edge-key-018', 'second');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=second', String(map.get('edge-key-018')));
      expect(map.get('edge-key-018')).assertEqual('second');
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0178 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0179
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0179
     * @tc.desc   Verify map overwrite and clear 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0179 begin');
      const map: Map<string, string> = new Map();
      map.set('edge-key-019', 'first');
      map.set('edge-key-019', 'second');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=second', String(map.get('edge-key-019')));
      expect(map.get('edge-key-019')).assertEqual('second');
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0179 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0180
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0180
     * @tc.desc   Verify map overwrite and clear 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0180 begin');
      const map: Map<string, string> = new Map();
      map.set('edge-key-020', 'first');
      map.set('edge-key-020', 'second');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=second', String(map.get('edge-key-020')));
      expect(map.get('edge-key-020')).assertEqual('second');
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0180 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0181
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0181
     * @tc.desc   Verify map overwrite and clear 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0181 begin');
      const map: Map<string, string> = new Map();
      map.set('edge-key-021', 'first');
      map.set('edge-key-021', 'second');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=second', String(map.get('edge-key-021')));
      expect(map.get('edge-key-021')).assertEqual('second');
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0181 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0182
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0182
     * @tc.desc   Verify map overwrite and clear 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0182 begin');
      const map: Map<string, string> = new Map();
      map.set('edge-key-022', 'first');
      map.set('edge-key-022', 'second');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=second', String(map.get('edge-key-022')));
      expect(map.get('edge-key-022')).assertEqual('second');
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0182 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0183
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0183
     * @tc.desc   Verify map overwrite and clear 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0183 begin');
      const map: Map<string, string> = new Map();
      map.set('edge-key-023', 'first');
      map.set('edge-key-023', 'second');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=second', String(map.get('edge-key-023')));
      expect(map.get('edge-key-023')).assertEqual('second');
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0183 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0184
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0184
     * @tc.desc   Verify map overwrite and clear 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0184 begin');
      const map: Map<string, string> = new Map();
      map.set('edge-key-024', 'first');
      map.set('edge-key-024', 'second');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=second', String(map.get('edge-key-024')));
      expect(map.get('edge-key-024')).assertEqual('second');
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0184 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0185
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0185
     * @tc.desc   Verify map overwrite and clear 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0185 begin');
      const map: Map<string, string> = new Map();
      map.set('edge-key-025', 'first');
      map.set('edge-key-025', 'second');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=second', String(map.get('edge-key-025')));
      expect(map.get('edge-key-025')).assertEqual('second');
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0185 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0186
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0186
     * @tc.desc   Verify map overwrite and clear 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0186 begin');
      const map: Map<string, string> = new Map();
      map.set('edge-key-026', 'first');
      map.set('edge-key-026', 'second');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=second', String(map.get('edge-key-026')));
      expect(map.get('edge-key-026')).assertEqual('second');
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0186 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0187
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0187
     * @tc.desc   Verify map overwrite and clear 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0187 begin');
      const map: Map<string, string> = new Map();
      map.set('edge-key-027', 'first');
      map.set('edge-key-027', 'second');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=second', String(map.get('edge-key-027')));
      expect(map.get('edge-key-027')).assertEqual('second');
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0187 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0188
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0188
     * @tc.desc   Verify map overwrite and clear 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0188 begin');
      const map: Map<string, string> = new Map();
      map.set('edge-key-028', 'first');
      map.set('edge-key-028', 'second');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=second', String(map.get('edge-key-028')));
      expect(map.get('edge-key-028')).assertEqual('second');
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0188 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Edge_0189
     * @tc.number SUB_MEDIA_CONTROLLER_EDGE_0189
     * @tc.desc   Verify map overwrite and clear 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Edge_0189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0189 begin');
      const map: Map<string, string> = new Map();
      map.set('edge-key-029', 'first');
      map.set('edge-key-029', 'second');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=second', String(map.get('edge-key-029')));
      expect(map.get('edge-key-029')).assertEqual('second');
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Edge_0189 end');
    })
  })
}
