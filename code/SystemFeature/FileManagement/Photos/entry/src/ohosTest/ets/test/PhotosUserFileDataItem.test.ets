/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { UserFileDataItem } from '../../../main/ets/base/UserFileDataItem';
import { ViewType } from '../../../main/ets/models/ViewType';
import { MediaConstants } from '../../../main/ets/constants/MediaConstants';

const TAG = '[Sample_PhotosUserFileDataItemTest]';
const DOMAIN = 0xF811;

export default function PhotosUserFileDataItemTest(): void {
  describe('PhotosUserFileDataItemTest', () => {
    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_0100
     * @tc.name      testPhotosUserFileDataItemInit0001
     * @tc.desc      Initializes a media item from selection, device, and index inputs.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemInit0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInit0001 begin');
      const item: UserFileDataItem = new UserFileDataItem('media.selection', ['arg1', 'arg2'], 'device-1', 7);
      expect(item.selections).assertEqual('media.selection');
      expect(item.selectionArgs.length).assertEqual(2);
      expect(item.deviceId).assertEqual('device-1');
      expect(item.index).assertEqual(7);
      expect(item.hashIndex).assertEqual(7);
      expect(item.viewType).assertEqual(ViewType.ITEM);
      expect(item.isSelect).assertFalse();
      expect(item.status).assertEqual(MediaConstants.UNDEFINED);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemInit0001 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_0200
     * @tc.name      testPhotosUserFileDataItemLoadState0002
     * @tc.desc      Reports loaded state only after the item leaves the undefined state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemLoadState0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemLoadState0002 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], '', 1);
      expect(item.isLoad()).assertFalse();
      item.status = MediaConstants.PART_LOADED;
      expect(item.isLoad()).assertTrue();
      item.status = MediaConstants.LOADED;
      expect(item.isLoad()).assertTrue();
      item.status = MediaConstants.TRASHED;
      expect(item.isLoad()).assertTrue();
      expect(item.status).assertEqual(MediaConstants.TRASHED);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemLoadState0002 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_0300
     * @tc.name      testPhotosUserFileDataItemHash0003
     * @tc.desc      Builds a stable hash from the index before load and from media state after load.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemHash0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHash0003 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], '', 9);
      expect(item.getHashCode()).assertEqual('9');
      item.status = MediaConstants.PART_LOADED;
      item.uri = 'file://media/1';
      item.favouriteStatus = 1;
      item.orientation = 90;
      item.isSelect = true;
      expect(item.getHashCode()).assertEqual('file://media/11 90 true');
      expect(item.getHashCode() === '9').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemHash0003 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_ITEM_0400
     * @tc.name      testPhotosUserFileDataItemMutableState0004
     * @tc.desc      Updates mutable media fields and reflects them in the next hash calculation.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUserFileDataItemMutableState0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemMutableState0004 begin');
      const item: UserFileDataItem = new UserFileDataItem('', [], '', 2);
      item.status = MediaConstants.LOADED;
      item.uri = 'file://media/2';
      item.favouriteStatus = 0;
      item.orientation = 0;
      item.isSelect = false;
      const firstHash: string = item.getHashCode();
      item.favouriteStatus = 1;
      const favoriteHash: string = item.getHashCode();
      expect(firstHash).assertEqual('file://media/20 0 false');
      expect(favoriteHash).assertEqual('file://media/21 0 false');
      expect(firstHash === favoriteHash).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosUserFileDataItemMutableState0004 end');
    })
  })
}
