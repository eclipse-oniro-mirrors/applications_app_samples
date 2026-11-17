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

export default function mediaControllerMetadataTestPart02() {
  describe('MediaControllerMetadataPart02', () => {
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0064
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0064
     * @tc.desc   Verify extended AVMediaDescription fields 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0064 begin');
      const item: AVSessionManager.AVQueueItem = {
        itemId: 4,
        description: {
          assetId: 'desc-asset-004', title: 'Desc 004', subtitle: 'Subtitle 004',
          description: 'Description 004', albumTitle: 'Album Title 004', mediaType: 'audio', mediaSize: 4096
        }
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', item.description?.subtitle, String('Subtitle 004'));
      expect(item.description?.title === 'Desc 004').assertTrue();
      expect(item.description?.subtitle === 'Subtitle 004').assertTrue();
      expect(item.description?.description === 'Description 004').assertTrue();
      expect(item.description?.albumTitle === 'Album Title 004').assertTrue();
      expect(item.description?.mediaType === 'audio').assertTrue();
      expect(item.description?.mediaSize === 4096).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0064 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0065
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0065
     * @tc.desc   Verify extended AVMediaDescription fields 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0065 begin');
      const item: AVSessionManager.AVQueueItem = {
        itemId: 5,
        description: {
          assetId: 'desc-asset-005', title: 'Desc 005', subtitle: 'Subtitle 005',
          description: 'Description 005', albumTitle: 'Album Title 005', mediaType: 'audio', mediaSize: 5120
        }
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', item.description?.subtitle, String('Subtitle 005'));
      expect(item.description?.title === 'Desc 005').assertTrue();
      expect(item.description?.subtitle === 'Subtitle 005').assertTrue();
      expect(item.description?.description === 'Description 005').assertTrue();
      expect(item.description?.albumTitle === 'Album Title 005').assertTrue();
      expect(item.description?.mediaType === 'audio').assertTrue();
      expect(item.description?.mediaSize === 5120).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0065 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0066
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0066
     * @tc.desc   Verify extended AVMediaDescription fields 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0066 begin');
      const item: AVSessionManager.AVQueueItem = {
        itemId: 6,
        description: {
          assetId: 'desc-asset-006', title: 'Desc 006', subtitle: 'Subtitle 006',
          description: 'Description 006', albumTitle: 'Album Title 006', mediaType: 'audio', mediaSize: 6144
        }
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', item.description?.subtitle, String('Subtitle 006'));
      expect(item.description?.title === 'Desc 006').assertTrue();
      expect(item.description?.subtitle === 'Subtitle 006').assertTrue();
      expect(item.description?.description === 'Description 006').assertTrue();
      expect(item.description?.albumTitle === 'Album Title 006').assertTrue();
      expect(item.description?.mediaType === 'audio').assertTrue();
      expect(item.description?.mediaSize === 6144).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0066 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0067
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0067
     * @tc.desc   Verify extended AVMediaDescription fields 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0067 begin');
      const item: AVSessionManager.AVQueueItem = {
        itemId: 7,
        description: {
          assetId: 'desc-asset-007', title: 'Desc 007', subtitle: 'Subtitle 007',
          description: 'Description 007', albumTitle: 'Album Title 007', mediaType: 'audio', mediaSize: 7168
        }
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', item.description?.subtitle, String('Subtitle 007'));
      expect(item.description?.title === 'Desc 007').assertTrue();
      expect(item.description?.subtitle === 'Subtitle 007').assertTrue();
      expect(item.description?.description === 'Description 007').assertTrue();
      expect(item.description?.albumTitle === 'Album Title 007').assertTrue();
      expect(item.description?.mediaType === 'audio').assertTrue();
      expect(item.description?.mediaSize === 7168).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0067 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0068
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0068
     * @tc.desc   Verify extended AVMediaDescription fields 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0068 begin');
      const item: AVSessionManager.AVQueueItem = {
        itemId: 8,
        description: {
          assetId: 'desc-asset-008', title: 'Desc 008', subtitle: 'Subtitle 008',
          description: 'Description 008', albumTitle: 'Album Title 008', mediaType: 'audio', mediaSize: 8192
        }
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', item.description?.subtitle, String('Subtitle 008'));
      expect(item.description?.title === 'Desc 008').assertTrue();
      expect(item.description?.subtitle === 'Subtitle 008').assertTrue();
      expect(item.description?.description === 'Description 008').assertTrue();
      expect(item.description?.albumTitle === 'Album Title 008').assertTrue();
      expect(item.description?.mediaType === 'audio').assertTrue();
      expect(item.description?.mediaSize === 8192).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0068 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0069
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0069
     * @tc.desc   Verify extended AVMediaDescription fields 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0069 begin');
      const item: AVSessionManager.AVQueueItem = {
        itemId: 9,
        description: {
          assetId: 'desc-asset-009', title: 'Desc 009', subtitle: 'Subtitle 009',
          description: 'Description 009', albumTitle: 'Album Title 009', mediaType: 'audio', mediaSize: 9216
        }
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', item.description?.subtitle, String('Subtitle 009'));
      expect(item.description?.title === 'Desc 009').assertTrue();
      expect(item.description?.subtitle === 'Subtitle 009').assertTrue();
      expect(item.description?.description === 'Description 009').assertTrue();
      expect(item.description?.albumTitle === 'Album Title 009').assertTrue();
      expect(item.description?.mediaType === 'audio').assertTrue();
      expect(item.description?.mediaSize === 9216).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0069 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0070
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0070
     * @tc.desc   Verify extended AVMediaDescription fields 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0070 begin');
      const item: AVSessionManager.AVQueueItem = {
        itemId: 10,
        description: {
          assetId: 'desc-asset-010', title: 'Desc 010', subtitle: 'Subtitle 010',
          description: 'Description 010', albumTitle: 'Album Title 010', mediaType: 'audio', mediaSize: 10240
        }
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', item.description?.subtitle, String('Subtitle 010'));
      expect(item.description?.title === 'Desc 010').assertTrue();
      expect(item.description?.subtitle === 'Subtitle 010').assertTrue();
      expect(item.description?.description === 'Description 010').assertTrue();
      expect(item.description?.albumTitle === 'Album Title 010').assertTrue();
      expect(item.description?.mediaType === 'audio').assertTrue();
      expect(item.description?.mediaSize === 10240).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0070 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0071
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0071
     * @tc.desc   Verify extended AVMediaDescription fields 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0071 begin');
      const item: AVSessionManager.AVQueueItem = {
        itemId: 11,
        description: {
          assetId: 'desc-asset-011', title: 'Desc 011', subtitle: 'Subtitle 011',
          description: 'Description 011', albumTitle: 'Album Title 011', mediaType: 'audio', mediaSize: 11264
        }
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', item.description?.subtitle, String('Subtitle 011'));
      expect(item.description?.title === 'Desc 011').assertTrue();
      expect(item.description?.subtitle === 'Subtitle 011').assertTrue();
      expect(item.description?.description === 'Description 011').assertTrue();
      expect(item.description?.albumTitle === 'Album Title 011').assertTrue();
      expect(item.description?.mediaType === 'audio').assertTrue();
      expect(item.description?.mediaSize === 11264).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0071 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0072
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0072
     * @tc.desc   Verify extended AVMediaDescription fields 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0072 begin');
      const item: AVSessionManager.AVQueueItem = {
        itemId: 12,
        description: {
          assetId: 'desc-asset-012', title: 'Desc 012', subtitle: 'Subtitle 012',
          description: 'Description 012', albumTitle: 'Album Title 012', mediaType: 'audio', mediaSize: 12288
        }
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', item.description?.subtitle, String('Subtitle 012'));
      expect(item.description?.title === 'Desc 012').assertTrue();
      expect(item.description?.subtitle === 'Subtitle 012').assertTrue();
      expect(item.description?.description === 'Description 012').assertTrue();
      expect(item.description?.albumTitle === 'Album Title 012').assertTrue();
      expect(item.description?.mediaType === 'audio').assertTrue();
      expect(item.description?.mediaSize === 12288).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0072 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0073
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0073
     * @tc.desc   Verify extended AVMediaDescription fields 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0073 begin');
      const item: AVSessionManager.AVQueueItem = {
        itemId: 13,
        description: {
          assetId: 'desc-asset-013', title: 'Desc 013', subtitle: 'Subtitle 013',
          description: 'Description 013', albumTitle: 'Album Title 013', mediaType: 'audio', mediaSize: 13312
        }
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', item.description?.subtitle, String('Subtitle 013'));
      expect(item.description?.title === 'Desc 013').assertTrue();
      expect(item.description?.subtitle === 'Subtitle 013').assertTrue();
      expect(item.description?.description === 'Description 013').assertTrue();
      expect(item.description?.albumTitle === 'Album Title 013').assertTrue();
      expect(item.description?.mediaType === 'audio').assertTrue();
      expect(item.description?.mediaSize === 13312).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0073 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0074
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0074
     * @tc.desc   Verify extended AVMediaDescription fields 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0074 begin');
      const item: AVSessionManager.AVQueueItem = {
        itemId: 14,
        description: {
          assetId: 'desc-asset-014', title: 'Desc 014', subtitle: 'Subtitle 014',
          description: 'Description 014', albumTitle: 'Album Title 014', mediaType: 'audio', mediaSize: 14336
        }
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', item.description?.subtitle, String('Subtitle 014'));
      expect(item.description?.title === 'Desc 014').assertTrue();
      expect(item.description?.subtitle === 'Subtitle 014').assertTrue();
      expect(item.description?.description === 'Description 014').assertTrue();
      expect(item.description?.albumTitle === 'Album Title 014').assertTrue();
      expect(item.description?.mediaType === 'audio').assertTrue();
      expect(item.description?.mediaSize === 14336).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0074 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0075
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0075
     * @tc.desc   Verify extended AVMediaDescription fields 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0075 begin');
      const item: AVSessionManager.AVQueueItem = {
        itemId: 15,
        description: {
          assetId: 'desc-asset-015', title: 'Desc 015', subtitle: 'Subtitle 015',
          description: 'Description 015', albumTitle: 'Album Title 015', mediaType: 'audio', mediaSize: 15360
        }
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', item.description?.subtitle, String('Subtitle 015'));
      expect(item.description?.title === 'Desc 015').assertTrue();
      expect(item.description?.subtitle === 'Subtitle 015').assertTrue();
      expect(item.description?.description === 'Description 015').assertTrue();
      expect(item.description?.albumTitle === 'Album Title 015').assertTrue();
      expect(item.description?.mediaType === 'audio').assertTrue();
      expect(item.description?.mediaSize === 15360).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0075 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0076
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0076
     * @tc.desc   Verify extended AVMediaDescription fields 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0076 begin');
      const item: AVSessionManager.AVQueueItem = {
        itemId: 16,
        description: {
          assetId: 'desc-asset-016', title: 'Desc 016', subtitle: 'Subtitle 016',
          description: 'Description 016', albumTitle: 'Album Title 016', mediaType: 'audio', mediaSize: 16384
        }
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', item.description?.subtitle, String('Subtitle 016'));
      expect(item.description?.title === 'Desc 016').assertTrue();
      expect(item.description?.subtitle === 'Subtitle 016').assertTrue();
      expect(item.description?.description === 'Description 016').assertTrue();
      expect(item.description?.albumTitle === 'Album Title 016').assertTrue();
      expect(item.description?.mediaType === 'audio').assertTrue();
      expect(item.description?.mediaSize === 16384).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0076 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0077
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0077
     * @tc.desc   Verify extended AVMediaDescription fields 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0077 begin');
      const item: AVSessionManager.AVQueueItem = {
        itemId: 17,
        description: {
          assetId: 'desc-asset-017', title: 'Desc 017', subtitle: 'Subtitle 017',
          description: 'Description 017', albumTitle: 'Album Title 017', mediaType: 'audio', mediaSize: 17408
        }
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', item.description?.subtitle, String('Subtitle 017'));
      expect(item.description?.title === 'Desc 017').assertTrue();
      expect(item.description?.subtitle === 'Subtitle 017').assertTrue();
      expect(item.description?.description === 'Description 017').assertTrue();
      expect(item.description?.albumTitle === 'Album Title 017').assertTrue();
      expect(item.description?.mediaType === 'audio').assertTrue();
      expect(item.description?.mediaSize === 17408).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0077 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0078
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0078
     * @tc.desc   Verify extended AVMediaDescription fields 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0078 begin');
      const item: AVSessionManager.AVQueueItem = {
        itemId: 18,
        description: {
          assetId: 'desc-asset-018', title: 'Desc 018', subtitle: 'Subtitle 018',
          description: 'Description 018', albumTitle: 'Album Title 018', mediaType: 'audio', mediaSize: 18432
        }
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', item.description?.subtitle, String('Subtitle 018'));
      expect(item.description?.title === 'Desc 018').assertTrue();
      expect(item.description?.subtitle === 'Subtitle 018').assertTrue();
      expect(item.description?.description === 'Description 018').assertTrue();
      expect(item.description?.albumTitle === 'Album Title 018').assertTrue();
      expect(item.description?.mediaType === 'audio').assertTrue();
      expect(item.description?.mediaSize === 18432).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0078 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0079
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0079
     * @tc.desc   Verify extended AVMediaDescription fields 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0079 begin');
      const item: AVSessionManager.AVQueueItem = {
        itemId: 19,
        description: {
          assetId: 'desc-asset-019', title: 'Desc 019', subtitle: 'Subtitle 019',
          description: 'Description 019', albumTitle: 'Album Title 019', mediaType: 'audio', mediaSize: 19456
        }
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', item.description?.subtitle, String('Subtitle 019'));
      expect(item.description?.title === 'Desc 019').assertTrue();
      expect(item.description?.subtitle === 'Subtitle 019').assertTrue();
      expect(item.description?.description === 'Description 019').assertTrue();
      expect(item.description?.albumTitle === 'Album Title 019').assertTrue();
      expect(item.description?.mediaType === 'audio').assertTrue();
      expect(item.description?.mediaSize === 19456).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0079 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0080
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0080
     * @tc.desc   Verify extended AVMediaDescription fields 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0080 begin');
      const item: AVSessionManager.AVQueueItem = {
        itemId: 20,
        description: {
          assetId: 'desc-asset-020', title: 'Desc 020', subtitle: 'Subtitle 020',
          description: 'Description 020', albumTitle: 'Album Title 020', mediaType: 'audio', mediaSize: 20480
        }
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', item.description?.subtitle, String('Subtitle 020'));
      expect(item.description?.title === 'Desc 020').assertTrue();
      expect(item.description?.subtitle === 'Subtitle 020').assertTrue();
      expect(item.description?.description === 'Description 020').assertTrue();
      expect(item.description?.albumTitle === 'Album Title 020').assertTrue();
      expect(item.description?.mediaType === 'audio').assertTrue();
      expect(item.description?.mediaSize === 20480).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0080 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0081
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0081
     * @tc.desc   Verify extended AVMediaDescription fields 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0081 begin');
      const item: AVSessionManager.AVQueueItem = {
        itemId: 21,
        description: {
          assetId: 'desc-asset-021', title: 'Desc 021', subtitle: 'Subtitle 021',
          description: 'Description 021', albumTitle: 'Album Title 021', mediaType: 'audio', mediaSize: 21504
        }
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', item.description?.subtitle, String('Subtitle 021'));
      expect(item.description?.title === 'Desc 021').assertTrue();
      expect(item.description?.subtitle === 'Subtitle 021').assertTrue();
      expect(item.description?.description === 'Description 021').assertTrue();
      expect(item.description?.albumTitle === 'Album Title 021').assertTrue();
      expect(item.description?.mediaType === 'audio').assertTrue();
      expect(item.description?.mediaSize === 21504).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0081 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0082
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0082
     * @tc.desc   Verify extended AVMediaDescription fields 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0082 begin');
      const item: AVSessionManager.AVQueueItem = {
        itemId: 22,
        description: {
          assetId: 'desc-asset-022', title: 'Desc 022', subtitle: 'Subtitle 022',
          description: 'Description 022', albumTitle: 'Album Title 022', mediaType: 'audio', mediaSize: 22528
        }
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', item.description?.subtitle, String('Subtitle 022'));
      expect(item.description?.title === 'Desc 022').assertTrue();
      expect(item.description?.subtitle === 'Subtitle 022').assertTrue();
      expect(item.description?.description === 'Description 022').assertTrue();
      expect(item.description?.albumTitle === 'Album Title 022').assertTrue();
      expect(item.description?.mediaType === 'audio').assertTrue();
      expect(item.description?.mediaSize === 22528).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0082 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0083
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0083
     * @tc.desc   Verify extended AVMediaDescription fields 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0083 begin');
      const item: AVSessionManager.AVQueueItem = {
        itemId: 23,
        description: {
          assetId: 'desc-asset-023', title: 'Desc 023', subtitle: 'Subtitle 023',
          description: 'Description 023', albumTitle: 'Album Title 023', mediaType: 'audio', mediaSize: 23552
        }
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', item.description?.subtitle, String('Subtitle 023'));
      expect(item.description?.title === 'Desc 023').assertTrue();
      expect(item.description?.subtitle === 'Subtitle 023').assertTrue();
      expect(item.description?.description === 'Description 023').assertTrue();
      expect(item.description?.albumTitle === 'Album Title 023').assertTrue();
      expect(item.description?.mediaType === 'audio').assertTrue();
      expect(item.description?.mediaSize === 23552).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0083 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0084
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0084
     * @tc.desc   Verify extended AVMediaDescription fields 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0084 begin');
      const item: AVSessionManager.AVQueueItem = {
        itemId: 24,
        description: {
          assetId: 'desc-asset-024', title: 'Desc 024', subtitle: 'Subtitle 024',
          description: 'Description 024', albumTitle: 'Album Title 024', mediaType: 'audio', mediaSize: 24576
        }
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', item.description?.subtitle, String('Subtitle 024'));
      expect(item.description?.title === 'Desc 024').assertTrue();
      expect(item.description?.subtitle === 'Subtitle 024').assertTrue();
      expect(item.description?.description === 'Description 024').assertTrue();
      expect(item.description?.albumTitle === 'Album Title 024').assertTrue();
      expect(item.description?.mediaType === 'audio').assertTrue();
      expect(item.description?.mediaSize === 24576).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0084 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0085
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0085
     * @tc.desc   Verify extended AVMediaDescription fields 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0085 begin');
      const item: AVSessionManager.AVQueueItem = {
        itemId: 25,
        description: {
          assetId: 'desc-asset-025', title: 'Desc 025', subtitle: 'Subtitle 025',
          description: 'Description 025', albumTitle: 'Album Title 025', mediaType: 'audio', mediaSize: 25600
        }
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', item.description?.subtitle, String('Subtitle 025'));
      expect(item.description?.title === 'Desc 025').assertTrue();
      expect(item.description?.subtitle === 'Subtitle 025').assertTrue();
      expect(item.description?.description === 'Description 025').assertTrue();
      expect(item.description?.albumTitle === 'Album Title 025').assertTrue();
      expect(item.description?.mediaType === 'audio').assertTrue();
      expect(item.description?.mediaSize === 25600).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0085 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0086
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0086
     * @tc.desc   Verify extended AVMediaDescription fields 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0086 begin');
      const item: AVSessionManager.AVQueueItem = {
        itemId: 26,
        description: {
          assetId: 'desc-asset-026', title: 'Desc 026', subtitle: 'Subtitle 026',
          description: 'Description 026', albumTitle: 'Album Title 026', mediaType: 'audio', mediaSize: 26624
        }
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', item.description?.subtitle, String('Subtitle 026'));
      expect(item.description?.title === 'Desc 026').assertTrue();
      expect(item.description?.subtitle === 'Subtitle 026').assertTrue();
      expect(item.description?.description === 'Description 026').assertTrue();
      expect(item.description?.albumTitle === 'Album Title 026').assertTrue();
      expect(item.description?.mediaType === 'audio').assertTrue();
      expect(item.description?.mediaSize === 26624).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0086 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0087
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0087
     * @tc.desc   Verify extended AVMediaDescription fields 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0087 begin');
      const item: AVSessionManager.AVQueueItem = {
        itemId: 27,
        description: {
          assetId: 'desc-asset-027', title: 'Desc 027', subtitle: 'Subtitle 027',
          description: 'Description 027', albumTitle: 'Album Title 027', mediaType: 'audio', mediaSize: 27648
        }
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', item.description?.subtitle, String('Subtitle 027'));
      expect(item.description?.title === 'Desc 027').assertTrue();
      expect(item.description?.subtitle === 'Subtitle 027').assertTrue();
      expect(item.description?.description === 'Description 027').assertTrue();
      expect(item.description?.albumTitle === 'Album Title 027').assertTrue();
      expect(item.description?.mediaType === 'audio').assertTrue();
      expect(item.description?.mediaSize === 27648).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0087 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0088
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0088
     * @tc.desc   Verify extended AVMediaDescription fields 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0088 begin');
      const item: AVSessionManager.AVQueueItem = {
        itemId: 28,
        description: {
          assetId: 'desc-asset-028', title: 'Desc 028', subtitle: 'Subtitle 028',
          description: 'Description 028', albumTitle: 'Album Title 028', mediaType: 'audio', mediaSize: 28672
        }
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', item.description?.subtitle, String('Subtitle 028'));
      expect(item.description?.title === 'Desc 028').assertTrue();
      expect(item.description?.subtitle === 'Subtitle 028').assertTrue();
      expect(item.description?.description === 'Description 028').assertTrue();
      expect(item.description?.albumTitle === 'Album Title 028').assertTrue();
      expect(item.description?.mediaType === 'audio').assertTrue();
      expect(item.description?.mediaSize === 28672).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0088 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0089
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0089
     * @tc.desc   Verify extended AVMediaDescription fields 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0089 begin');
      const item: AVSessionManager.AVQueueItem = {
        itemId: 29,
        description: {
          assetId: 'desc-asset-029', title: 'Desc 029', subtitle: 'Subtitle 029',
          description: 'Description 029', albumTitle: 'Album Title 029', mediaType: 'audio', mediaSize: 29696
        }
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', item.description?.subtitle, String('Subtitle 029'));
      expect(item.description?.title === 'Desc 029').assertTrue();
      expect(item.description?.subtitle === 'Subtitle 029').assertTrue();
      expect(item.description?.description === 'Description 029').assertTrue();
      expect(item.description?.albumTitle === 'Album Title 029').assertTrue();
      expect(item.description?.mediaType === 'audio').assertTrue();
      expect(item.description?.mediaSize === 29696).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0089 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0090
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0090
     * @tc.desc   Verify extended AVMediaDescription fields 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0090 begin');
      const item: AVSessionManager.AVQueueItem = {
        itemId: 30,
        description: {
          assetId: 'desc-asset-030', title: 'Desc 030', subtitle: 'Subtitle 030',
          description: 'Description 030', albumTitle: 'Album Title 030', mediaType: 'audio', mediaSize: 30720
        }
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', item.description?.subtitle, String('Subtitle 030'));
      expect(item.description?.title === 'Desc 030').assertTrue();
      expect(item.description?.subtitle === 'Subtitle 030').assertTrue();
      expect(item.description?.description === 'Description 030').assertTrue();
      expect(item.description?.albumTitle === 'Album Title 030').assertTrue();
      expect(item.description?.mediaType === 'audio').assertTrue();
      expect(item.description?.mediaSize === 30720).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0090 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0091
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0091
     * @tc.desc   Verify extended AVMediaDescription fields 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0091 begin');
      const item: AVSessionManager.AVQueueItem = {
        itemId: 31,
        description: {
          assetId: 'desc-asset-031', title: 'Desc 031', subtitle: 'Subtitle 031',
          description: 'Description 031', albumTitle: 'Album Title 031', mediaType: 'audio', mediaSize: 31744
        }
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', item.description?.subtitle, String('Subtitle 031'));
      expect(item.description?.title === 'Desc 031').assertTrue();
      expect(item.description?.subtitle === 'Subtitle 031').assertTrue();
      expect(item.description?.description === 'Description 031').assertTrue();
      expect(item.description?.albumTitle === 'Album Title 031').assertTrue();
      expect(item.description?.mediaType === 'audio').assertTrue();
      expect(item.description?.mediaSize === 31744).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0091 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0092
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0092
     * @tc.desc   Verify extended AVMediaDescription fields 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0092 begin');
      const item: AVSessionManager.AVQueueItem = {
        itemId: 32,
        description: {
          assetId: 'desc-asset-032', title: 'Desc 032', subtitle: 'Subtitle 032',
          description: 'Description 032', albumTitle: 'Album Title 032', mediaType: 'audio', mediaSize: 32768
        }
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', item.description?.subtitle, String('Subtitle 032'));
      expect(item.description?.title === 'Desc 032').assertTrue();
      expect(item.description?.subtitle === 'Subtitle 032').assertTrue();
      expect(item.description?.description === 'Description 032').assertTrue();
      expect(item.description?.albumTitle === 'Album Title 032').assertTrue();
      expect(item.description?.mediaType === 'audio').assertTrue();
      expect(item.description?.mediaSize === 32768).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0092 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0093
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0093
     * @tc.desc   Verify extended AVMediaDescription fields 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0093 begin');
      const item: AVSessionManager.AVQueueItem = {
        itemId: 33,
        description: {
          assetId: 'desc-asset-033', title: 'Desc 033', subtitle: 'Subtitle 033',
          description: 'Description 033', albumTitle: 'Album Title 033', mediaType: 'audio', mediaSize: 33792
        }
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', item.description?.subtitle, String('Subtitle 033'));
      expect(item.description?.title === 'Desc 033').assertTrue();
      expect(item.description?.subtitle === 'Subtitle 033').assertTrue();
      expect(item.description?.description === 'Description 033').assertTrue();
      expect(item.description?.albumTitle === 'Album Title 033').assertTrue();
      expect(item.description?.mediaType === 'audio').assertTrue();
      expect(item.description?.mediaSize === 33792).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0093 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0094
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0094
     * @tc.desc   Verify extended AVMediaDescription fields 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0094 begin');
      const item: AVSessionManager.AVQueueItem = {
        itemId: 34,
        description: {
          assetId: 'desc-asset-034', title: 'Desc 034', subtitle: 'Subtitle 034',
          description: 'Description 034', albumTitle: 'Album Title 034', mediaType: 'audio', mediaSize: 34816
        }
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', item.description?.subtitle, String('Subtitle 034'));
      expect(item.description?.title === 'Desc 034').assertTrue();
      expect(item.description?.subtitle === 'Subtitle 034').assertTrue();
      expect(item.description?.description === 'Description 034').assertTrue();
      expect(item.description?.albumTitle === 'Album Title 034').assertTrue();
      expect(item.description?.mediaType === 'audio').assertTrue();
      expect(item.description?.mediaSize === 34816).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0094 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0095
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0095
     * @tc.desc   Verify extended AVMediaDescription fields 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0095 begin');
      const item: AVSessionManager.AVQueueItem = {
        itemId: 35,
        description: {
          assetId: 'desc-asset-035', title: 'Desc 035', subtitle: 'Subtitle 035',
          description: 'Description 035', albumTitle: 'Album Title 035', mediaType: 'audio', mediaSize: 35840
        }
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', item.description?.subtitle, String('Subtitle 035'));
      expect(item.description?.title === 'Desc 035').assertTrue();
      expect(item.description?.subtitle === 'Subtitle 035').assertTrue();
      expect(item.description?.description === 'Description 035').assertTrue();
      expect(item.description?.albumTitle === 'Album Title 035').assertTrue();
      expect(item.description?.mediaType === 'audio').assertTrue();
      expect(item.description?.mediaSize === 35840).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0095 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0096
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0096
     * @tc.desc   Verify extended AVMediaDescription fields 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0096 begin');
      const item: AVSessionManager.AVQueueItem = {
        itemId: 36,
        description: {
          assetId: 'desc-asset-036', title: 'Desc 036', subtitle: 'Subtitle 036',
          description: 'Description 036', albumTitle: 'Album Title 036', mediaType: 'audio', mediaSize: 36864
        }
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', item.description?.subtitle, String('Subtitle 036'));
      expect(item.description?.title === 'Desc 036').assertTrue();
      expect(item.description?.subtitle === 'Subtitle 036').assertTrue();
      expect(item.description?.description === 'Description 036').assertTrue();
      expect(item.description?.albumTitle === 'Album Title 036').assertTrue();
      expect(item.description?.mediaType === 'audio').assertTrue();
      expect(item.description?.mediaSize === 36864).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0096 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0097
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0097
     * @tc.desc   Verify extended AVMediaDescription fields 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0097 begin');
      const item: AVSessionManager.AVQueueItem = {
        itemId: 37,
        description: {
          assetId: 'desc-asset-037', title: 'Desc 037', subtitle: 'Subtitle 037',
          description: 'Description 037', albumTitle: 'Album Title 037', mediaType: 'audio', mediaSize: 37888
        }
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', item.description?.subtitle, String('Subtitle 037'));
      expect(item.description?.title === 'Desc 037').assertTrue();
      expect(item.description?.subtitle === 'Subtitle 037').assertTrue();
      expect(item.description?.description === 'Description 037').assertTrue();
      expect(item.description?.albumTitle === 'Album Title 037').assertTrue();
      expect(item.description?.mediaType === 'audio').assertTrue();
      expect(item.description?.mediaSize === 37888).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0097 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0098
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0098
     * @tc.desc   Verify extended AVMediaDescription fields 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0098 begin');
      const item: AVSessionManager.AVQueueItem = {
        itemId: 38,
        description: {
          assetId: 'desc-asset-038', title: 'Desc 038', subtitle: 'Subtitle 038',
          description: 'Description 038', albumTitle: 'Album Title 038', mediaType: 'audio', mediaSize: 38912
        }
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', item.description?.subtitle, String('Subtitle 038'));
      expect(item.description?.title === 'Desc 038').assertTrue();
      expect(item.description?.subtitle === 'Subtitle 038').assertTrue();
      expect(item.description?.description === 'Description 038').assertTrue();
      expect(item.description?.albumTitle === 'Album Title 038').assertTrue();
      expect(item.description?.mediaType === 'audio').assertTrue();
      expect(item.description?.mediaSize === 38912).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0098 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0099
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0099
     * @tc.desc   Verify extended AVMediaDescription fields 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0099 begin');
      const item: AVSessionManager.AVQueueItem = {
        itemId: 39,
        description: {
          assetId: 'desc-asset-039', title: 'Desc 039', subtitle: 'Subtitle 039',
          description: 'Description 039', albumTitle: 'Album Title 039', mediaType: 'audio', mediaSize: 39936
        }
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', item.description?.subtitle, String('Subtitle 039'));
      expect(item.description?.title === 'Desc 039').assertTrue();
      expect(item.description?.subtitle === 'Subtitle 039').assertTrue();
      expect(item.description?.description === 'Description 039').assertTrue();
      expect(item.description?.albumTitle === 'Album Title 039').assertTrue();
      expect(item.description?.mediaType === 'audio').assertTrue();
      expect(item.description?.mediaSize === 39936).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0099 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0100
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0100
     * @tc.desc   Verify extended AVMediaDescription fields 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0100 begin');
      const item: AVSessionManager.AVQueueItem = {
        itemId: 40,
        description: {
          assetId: 'desc-asset-040', title: 'Desc 040', subtitle: 'Subtitle 040',
          description: 'Description 040', albumTitle: 'Album Title 040', mediaType: 'audio', mediaSize: 40960
        }
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', item.description?.subtitle, String('Subtitle 040'));
      expect(item.description?.title === 'Desc 040').assertTrue();
      expect(item.description?.subtitle === 'Subtitle 040').assertTrue();
      expect(item.description?.description === 'Description 040').assertTrue();
      expect(item.description?.albumTitle === 'Album Title 040').assertTrue();
      expect(item.description?.mediaType === 'audio').assertTrue();
      expect(item.description?.mediaSize === 40960).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0100 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0101
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0101
     * @tc.desc   Verify extended AVMediaDescription fields 41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0101 begin');
      const item: AVSessionManager.AVQueueItem = {
        itemId: 41,
        description: {
          assetId: 'desc-asset-041', title: 'Desc 041', subtitle: 'Subtitle 041',
          description: 'Description 041', albumTitle: 'Album Title 041', mediaType: 'audio', mediaSize: 41984
        }
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', item.description?.subtitle, String('Subtitle 041'));
      expect(item.description?.title === 'Desc 041').assertTrue();
      expect(item.description?.subtitle === 'Subtitle 041').assertTrue();
      expect(item.description?.description === 'Description 041').assertTrue();
      expect(item.description?.albumTitle === 'Album Title 041').assertTrue();
      expect(item.description?.mediaType === 'audio').assertTrue();
      expect(item.description?.mediaSize === 41984).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0101 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0102
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0102
     * @tc.desc   Verify extended AVMediaDescription fields 42.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0102 begin');
      const item: AVSessionManager.AVQueueItem = {
        itemId: 42,
        description: {
          assetId: 'desc-asset-042', title: 'Desc 042', subtitle: 'Subtitle 042',
          description: 'Description 042', albumTitle: 'Album Title 042', mediaType: 'audio', mediaSize: 43008
        }
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', item.description?.subtitle, String('Subtitle 042'));
      expect(item.description?.title === 'Desc 042').assertTrue();
      expect(item.description?.subtitle === 'Subtitle 042').assertTrue();
      expect(item.description?.description === 'Description 042').assertTrue();
      expect(item.description?.albumTitle === 'Album Title 042').assertTrue();
      expect(item.description?.mediaType === 'audio').assertTrue();
      expect(item.description?.mediaSize === 43008).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0102 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0103
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0103
     * @tc.desc   Verify extended AVMediaDescription fields 43.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0103 begin');
      const item: AVSessionManager.AVQueueItem = {
        itemId: 43,
        description: {
          assetId: 'desc-asset-043', title: 'Desc 043', subtitle: 'Subtitle 043',
          description: 'Description 043', albumTitle: 'Album Title 043', mediaType: 'audio', mediaSize: 44032
        }
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', item.description?.subtitle, String('Subtitle 043'));
      expect(item.description?.title === 'Desc 043').assertTrue();
      expect(item.description?.subtitle === 'Subtitle 043').assertTrue();
      expect(item.description?.description === 'Description 043').assertTrue();
      expect(item.description?.albumTitle === 'Album Title 043').assertTrue();
      expect(item.description?.mediaType === 'audio').assertTrue();
      expect(item.description?.mediaSize === 44032).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0103 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0104
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0104
     * @tc.desc   Verify extended AVMediaDescription fields 44.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0104 begin');
      const item: AVSessionManager.AVQueueItem = {
        itemId: 44,
        description: {
          assetId: 'desc-asset-044', title: 'Desc 044', subtitle: 'Subtitle 044',
          description: 'Description 044', albumTitle: 'Album Title 044', mediaType: 'audio', mediaSize: 45056
        }
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', item.description?.subtitle, String('Subtitle 044'));
      expect(item.description?.title === 'Desc 044').assertTrue();
      expect(item.description?.subtitle === 'Subtitle 044').assertTrue();
      expect(item.description?.description === 'Description 044').assertTrue();
      expect(item.description?.albumTitle === 'Album Title 044').assertTrue();
      expect(item.description?.mediaType === 'audio').assertTrue();
      expect(item.description?.mediaSize === 45056).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0104 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0105
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0105
     * @tc.desc   Verify extended AVMediaDescription fields 45.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0105 begin');
      const item: AVSessionManager.AVQueueItem = {
        itemId: 45,
        description: {
          assetId: 'desc-asset-045', title: 'Desc 045', subtitle: 'Subtitle 045',
          description: 'Description 045', albumTitle: 'Album Title 045', mediaType: 'audio', mediaSize: 46080
        }
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', item.description?.subtitle, String('Subtitle 045'));
      expect(item.description?.title === 'Desc 045').assertTrue();
      expect(item.description?.subtitle === 'Subtitle 045').assertTrue();
      expect(item.description?.description === 'Description 045').assertTrue();
      expect(item.description?.albumTitle === 'Album Title 045').assertTrue();
      expect(item.description?.mediaType === 'audio').assertTrue();
      expect(item.description?.mediaSize === 46080).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0105 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0106
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0106
     * @tc.desc   Verify extended AVMediaDescription fields 46.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0106 begin');
      const item: AVSessionManager.AVQueueItem = {
        itemId: 46,
        description: {
          assetId: 'desc-asset-046', title: 'Desc 046', subtitle: 'Subtitle 046',
          description: 'Description 046', albumTitle: 'Album Title 046', mediaType: 'audio', mediaSize: 47104
        }
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', item.description?.subtitle, String('Subtitle 046'));
      expect(item.description?.title === 'Desc 046').assertTrue();
      expect(item.description?.subtitle === 'Subtitle 046').assertTrue();
      expect(item.description?.description === 'Description 046').assertTrue();
      expect(item.description?.albumTitle === 'Album Title 046').assertTrue();
      expect(item.description?.mediaType === 'audio').assertTrue();
      expect(item.description?.mediaSize === 47104).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0106 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0107
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0107
     * @tc.desc   Verify extended AVMediaDescription fields 47.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0107 begin');
      const item: AVSessionManager.AVQueueItem = {
        itemId: 47,
        description: {
          assetId: 'desc-asset-047', title: 'Desc 047', subtitle: 'Subtitle 047',
          description: 'Description 047', albumTitle: 'Album Title 047', mediaType: 'audio', mediaSize: 48128
        }
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', item.description?.subtitle, String('Subtitle 047'));
      expect(item.description?.title === 'Desc 047').assertTrue();
      expect(item.description?.subtitle === 'Subtitle 047').assertTrue();
      expect(item.description?.description === 'Description 047').assertTrue();
      expect(item.description?.albumTitle === 'Album Title 047').assertTrue();
      expect(item.description?.mediaType === 'audio').assertTrue();
      expect(item.description?.mediaSize === 48128).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0107 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0108
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0108
     * @tc.desc   Verify extended AVMediaDescription fields 48.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0108 begin');
      const item: AVSessionManager.AVQueueItem = {
        itemId: 48,
        description: {
          assetId: 'desc-asset-048', title: 'Desc 048', subtitle: 'Subtitle 048',
          description: 'Description 048', albumTitle: 'Album Title 048', mediaType: 'audio', mediaSize: 49152
        }
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', item.description?.subtitle, String('Subtitle 048'));
      expect(item.description?.title === 'Desc 048').assertTrue();
      expect(item.description?.subtitle === 'Subtitle 048').assertTrue();
      expect(item.description?.description === 'Description 048').assertTrue();
      expect(item.description?.albumTitle === 'Album Title 048').assertTrue();
      expect(item.description?.mediaType === 'audio').assertTrue();
      expect(item.description?.mediaSize === 49152).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0108 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0109
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0109
     * @tc.desc   Verify extended AVMediaDescription fields 49.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0109 begin');
      const item: AVSessionManager.AVQueueItem = {
        itemId: 49,
        description: {
          assetId: 'desc-asset-049', title: 'Desc 049', subtitle: 'Subtitle 049',
          description: 'Description 049', albumTitle: 'Album Title 049', mediaType: 'audio', mediaSize: 50176
        }
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', item.description?.subtitle, String('Subtitle 049'));
      expect(item.description?.title === 'Desc 049').assertTrue();
      expect(item.description?.subtitle === 'Subtitle 049').assertTrue();
      expect(item.description?.description === 'Description 049').assertTrue();
      expect(item.description?.albumTitle === 'Album Title 049').assertTrue();
      expect(item.description?.mediaType === 'audio').assertTrue();
      expect(item.description?.mediaSize === 50176).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0109 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0110
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0110
     * @tc.desc   Verify extended AVMediaDescription fields 50.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0110 begin');
      const item: AVSessionManager.AVQueueItem = {
        itemId: 50,
        description: {
          assetId: 'desc-asset-050', title: 'Desc 050', subtitle: 'Subtitle 050',
          description: 'Description 050', albumTitle: 'Album Title 050', mediaType: 'audio', mediaSize: 51200
        }
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', item.description?.subtitle, String('Subtitle 050'));
      expect(item.description?.title === 'Desc 050').assertTrue();
      expect(item.description?.subtitle === 'Subtitle 050').assertTrue();
      expect(item.description?.description === 'Description 050').assertTrue();
      expect(item.description?.albumTitle === 'Album Title 050').assertTrue();
      expect(item.description?.mediaType === 'audio').assertTrue();
      expect(item.description?.mediaSize === 51200).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0110 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0111
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0111
     * @tc.desc   Verify extended AVMediaDescription fields 51.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0111 begin');
      const item: AVSessionManager.AVQueueItem = {
        itemId: 51,
        description: {
          assetId: 'desc-asset-051', title: 'Desc 051', subtitle: 'Subtitle 051',
          description: 'Description 051', albumTitle: 'Album Title 051', mediaType: 'audio', mediaSize: 52224
        }
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', item.description?.subtitle, String('Subtitle 051'));
      expect(item.description?.title === 'Desc 051').assertTrue();
      expect(item.description?.subtitle === 'Subtitle 051').assertTrue();
      expect(item.description?.description === 'Description 051').assertTrue();
      expect(item.description?.albumTitle === 'Album Title 051').assertTrue();
      expect(item.description?.mediaType === 'audio').assertTrue();
      expect(item.description?.mediaSize === 52224).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0111 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0112
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0112
     * @tc.desc   Verify extended AVMediaDescription fields 52.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0112 begin');
      const item: AVSessionManager.AVQueueItem = {
        itemId: 52,
        description: {
          assetId: 'desc-asset-052', title: 'Desc 052', subtitle: 'Subtitle 052',
          description: 'Description 052', albumTitle: 'Album Title 052', mediaType: 'audio', mediaSize: 53248
        }
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', item.description?.subtitle, String('Subtitle 052'));
      expect(item.description?.title === 'Desc 052').assertTrue();
      expect(item.description?.subtitle === 'Subtitle 052').assertTrue();
      expect(item.description?.description === 'Description 052').assertTrue();
      expect(item.description?.albumTitle === 'Album Title 052').assertTrue();
      expect(item.description?.mediaType === 'audio').assertTrue();
      expect(item.description?.mediaSize === 53248).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0112 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0113
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0113
     * @tc.desc   Verify extended AVMediaDescription fields 53.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0113 begin');
      const item: AVSessionManager.AVQueueItem = {
        itemId: 53,
        description: {
          assetId: 'desc-asset-053', title: 'Desc 053', subtitle: 'Subtitle 053',
          description: 'Description 053', albumTitle: 'Album Title 053', mediaType: 'audio', mediaSize: 54272
        }
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', item.description?.subtitle, String('Subtitle 053'));
      expect(item.description?.title === 'Desc 053').assertTrue();
      expect(item.description?.subtitle === 'Subtitle 053').assertTrue();
      expect(item.description?.description === 'Description 053').assertTrue();
      expect(item.description?.albumTitle === 'Album Title 053').assertTrue();
      expect(item.description?.mediaType === 'audio').assertTrue();
      expect(item.description?.mediaSize === 54272).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0113 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0114
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0114
     * @tc.desc   Verify extended AVMediaDescription fields 54.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0114 begin');
      const item: AVSessionManager.AVQueueItem = {
        itemId: 54,
        description: {
          assetId: 'desc-asset-054', title: 'Desc 054', subtitle: 'Subtitle 054',
          description: 'Description 054', albumTitle: 'Album Title 054', mediaType: 'audio', mediaSize: 55296
        }
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', item.description?.subtitle, String('Subtitle 054'));
      expect(item.description?.title === 'Desc 054').assertTrue();
      expect(item.description?.subtitle === 'Subtitle 054').assertTrue();
      expect(item.description?.description === 'Description 054').assertTrue();
      expect(item.description?.albumTitle === 'Album Title 054').assertTrue();
      expect(item.description?.mediaType === 'audio').assertTrue();
      expect(item.description?.mediaSize === 55296).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0114 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0115
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0115
     * @tc.desc   Verify extended AVMediaDescription fields 55.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0115 begin');
      const item: AVSessionManager.AVQueueItem = {
        itemId: 55,
        description: {
          assetId: 'desc-asset-055', title: 'Desc 055', subtitle: 'Subtitle 055',
          description: 'Description 055', albumTitle: 'Album Title 055', mediaType: 'audio', mediaSize: 56320
        }
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', item.description?.subtitle, String('Subtitle 055'));
      expect(item.description?.title === 'Desc 055').assertTrue();
      expect(item.description?.subtitle === 'Subtitle 055').assertTrue();
      expect(item.description?.description === 'Description 055').assertTrue();
      expect(item.description?.albumTitle === 'Album Title 055').assertTrue();
      expect(item.description?.mediaType === 'audio').assertTrue();
      expect(item.description?.mediaSize === 56320).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0115 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0116
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0116
     * @tc.desc   Verify extended AVMediaDescription fields 56.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0116 begin');
      const item: AVSessionManager.AVQueueItem = {
        itemId: 56,
        description: {
          assetId: 'desc-asset-056', title: 'Desc 056', subtitle: 'Subtitle 056',
          description: 'Description 056', albumTitle: 'Album Title 056', mediaType: 'audio', mediaSize: 57344
        }
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', item.description?.subtitle, String('Subtitle 056'));
      expect(item.description?.title === 'Desc 056').assertTrue();
      expect(item.description?.subtitle === 'Subtitle 056').assertTrue();
      expect(item.description?.description === 'Description 056').assertTrue();
      expect(item.description?.albumTitle === 'Album Title 056').assertTrue();
      expect(item.description?.mediaType === 'audio').assertTrue();
      expect(item.description?.mediaSize === 57344).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0116 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0117
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0117
     * @tc.desc   Verify extended AVMediaDescription fields 57.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0117 begin');
      const item: AVSessionManager.AVQueueItem = {
        itemId: 57,
        description: {
          assetId: 'desc-asset-057', title: 'Desc 057', subtitle: 'Subtitle 057',
          description: 'Description 057', albumTitle: 'Album Title 057', mediaType: 'audio', mediaSize: 58368
        }
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', item.description?.subtitle, String('Subtitle 057'));
      expect(item.description?.title === 'Desc 057').assertTrue();
      expect(item.description?.subtitle === 'Subtitle 057').assertTrue();
      expect(item.description?.description === 'Description 057').assertTrue();
      expect(item.description?.albumTitle === 'Album Title 057').assertTrue();
      expect(item.description?.mediaType === 'audio').assertTrue();
      expect(item.description?.mediaSize === 58368).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0117 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0118
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0118
     * @tc.desc   Verify extended AVMediaDescription fields 58.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0118 begin');
      const item: AVSessionManager.AVQueueItem = {
        itemId: 58,
        description: {
          assetId: 'desc-asset-058', title: 'Desc 058', subtitle: 'Subtitle 058',
          description: 'Description 058', albumTitle: 'Album Title 058', mediaType: 'audio', mediaSize: 59392
        }
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', item.description?.subtitle, String('Subtitle 058'));
      expect(item.description?.title === 'Desc 058').assertTrue();
      expect(item.description?.subtitle === 'Subtitle 058').assertTrue();
      expect(item.description?.description === 'Description 058').assertTrue();
      expect(item.description?.albumTitle === 'Album Title 058').assertTrue();
      expect(item.description?.mediaType === 'audio').assertTrue();
      expect(item.description?.mediaSize === 59392).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0118 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0119
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0119
     * @tc.desc   Verify extended AVMediaDescription fields 59.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0119 begin');
      const item: AVSessionManager.AVQueueItem = {
        itemId: 59,
        description: {
          assetId: 'desc-asset-059', title: 'Desc 059', subtitle: 'Subtitle 059',
          description: 'Description 059', albumTitle: 'Album Title 059', mediaType: 'audio', mediaSize: 60416
        }
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', item.description?.subtitle, String('Subtitle 059'));
      expect(item.description?.title === 'Desc 059').assertTrue();
      expect(item.description?.subtitle === 'Subtitle 059').assertTrue();
      expect(item.description?.description === 'Description 059').assertTrue();
      expect(item.description?.albumTitle === 'Album Title 059').assertTrue();
      expect(item.description?.mediaType === 'audio').assertTrue();
      expect(item.description?.mediaSize === 60416).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0119 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0120
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0120
     * @tc.desc   Verify extended AVMediaDescription fields 60.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0120 begin');
      const item: AVSessionManager.AVQueueItem = {
        itemId: 60,
        description: {
          assetId: 'desc-asset-060', title: 'Desc 060', subtitle: 'Subtitle 060',
          description: 'Description 060', albumTitle: 'Album Title 060', mediaType: 'audio', mediaSize: 61440
        }
      };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', item.description?.subtitle, String('Subtitle 060'));
      expect(item.description?.title === 'Desc 060').assertTrue();
      expect(item.description?.subtitle === 'Subtitle 060').assertTrue();
      expect(item.description?.description === 'Description 060').assertTrue();
      expect(item.description?.albumTitle === 'Album Title 060').assertTrue();
      expect(item.description?.mediaType === 'audio').assertTrue();
      expect(item.description?.mediaSize === 61440).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0120 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0121
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0121
     * @tc.desc   Verify multi-session map with 1 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0121 begin');
      const map: Map<string, string> = new Map();
      map.set('multi-001-001', 'value-001');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=1', map.size);
      expect(map.size).assertEqual(1);
      expect(map.get('multi-001-001')).assertEqual('value-001');
      expect(map.has('multi-001-001')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0121 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0122
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0122
     * @tc.desc   Verify multi-session map with 2 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0122 begin');
      const map: Map<string, string> = new Map();
      map.set('multi-002-001', 'value-001');
      map.set('multi-002-002', 'value-002');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=2', map.size);
      expect(map.size).assertEqual(2);
      expect(map.get('multi-002-002')).assertEqual('value-002');
      expect(map.has('multi-002-001')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0122 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0123
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0123
     * @tc.desc   Verify multi-session map with 3 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0123 begin');
      const map: Map<string, string> = new Map();
      map.set('multi-003-001', 'value-001');
      map.set('multi-003-002', 'value-002');
      map.set('multi-003-003', 'value-003');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=3', map.size);
      expect(map.size).assertEqual(3);
      expect(map.get('multi-003-003')).assertEqual('value-003');
      expect(map.has('multi-003-001')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0123 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0124
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0124
     * @tc.desc   Verify multi-session map with 4 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0124 begin');
      const map: Map<string, string> = new Map();
      map.set('multi-004-001', 'value-001');
      map.set('multi-004-002', 'value-002');
      map.set('multi-004-003', 'value-003');
      map.set('multi-004-004', 'value-004');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=4', map.size);
      expect(map.size).assertEqual(4);
      expect(map.get('multi-004-004')).assertEqual('value-004');
      expect(map.has('multi-004-001')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0124 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0125
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0125
     * @tc.desc   Verify multi-session map with 5 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0125 begin');
      const map: Map<string, string> = new Map();
      map.set('multi-005-001', 'value-001');
      map.set('multi-005-002', 'value-002');
      map.set('multi-005-003', 'value-003');
      map.set('multi-005-004', 'value-004');
      map.set('multi-005-005', 'value-005');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=5', map.size);
      expect(map.size).assertEqual(5);
      expect(map.get('multi-005-005')).assertEqual('value-005');
      expect(map.has('multi-005-001')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0125 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0126
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0126
     * @tc.desc   Verify multi-session map with 6 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0126 begin');
      const map: Map<string, string> = new Map();
      map.set('multi-006-001', 'value-001');
      map.set('multi-006-002', 'value-002');
      map.set('multi-006-003', 'value-003');
      map.set('multi-006-004', 'value-004');
      map.set('multi-006-005', 'value-005');
      map.set('multi-006-006', 'value-006');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=6', map.size);
      expect(map.size).assertEqual(6);
      expect(map.get('multi-006-006')).assertEqual('value-006');
      expect(map.has('multi-006-001')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0126 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0127
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0127
     * @tc.desc   Verify multi-session map with 7 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0127 begin');
      const map: Map<string, string> = new Map();
      map.set('multi-007-001', 'value-001');
      map.set('multi-007-002', 'value-002');
      map.set('multi-007-003', 'value-003');
      map.set('multi-007-004', 'value-004');
      map.set('multi-007-005', 'value-005');
      map.set('multi-007-006', 'value-006');
      map.set('multi-007-007', 'value-007');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=7', map.size);
      expect(map.size).assertEqual(7);
      expect(map.get('multi-007-007')).assertEqual('value-007');
      expect(map.has('multi-007-001')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0127 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0128
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0128
     * @tc.desc   Verify multi-session map with 8 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0128 begin');
      const map: Map<string, string> = new Map();
      map.set('multi-008-001', 'value-001');
      map.set('multi-008-002', 'value-002');
      map.set('multi-008-003', 'value-003');
      map.set('multi-008-004', 'value-004');
      map.set('multi-008-005', 'value-005');
      map.set('multi-008-006', 'value-006');
      map.set('multi-008-007', 'value-007');
      map.set('multi-008-008', 'value-008');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=8', map.size);
      expect(map.size).assertEqual(8);
      expect(map.get('multi-008-008')).assertEqual('value-008');
      expect(map.has('multi-008-001')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0128 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Metadata_0129
     * @tc.number SUB_MEDIA_CONTROLLER_METADATA_0129
     * @tc.desc   Verify multi-session map with 9 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Metadata_0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0129 begin');
      const map: Map<string, string> = new Map();
      map.set('multi-009-001', 'value-001');
      map.set('multi-009-002', 'value-002');
      map.set('multi-009-003', 'value-003');
      map.set('multi-009-004', 'value-004');
      map.set('multi-009-005', 'value-005');
      map.set('multi-009-006', 'value-006');
      map.set('multi-009-007', 'value-007');
      map.set('multi-009-008', 'value-008');
      map.set('multi-009-009', 'value-009');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=9', map.size);
      expect(map.size).assertEqual(9);
      expect(map.get('multi-009-009')).assertEqual('value-009');
      expect(map.has('multi-009-001')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Metadata_0129 end');
    })
  })
}
