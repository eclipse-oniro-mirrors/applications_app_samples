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
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { CommentDataSource, Constants } from '../../../main/ets/bridge/ImmersiveBridge';

const DOMAIN: number = 0xF814;
const TAG: string = 'CommentDataSourceExtendedTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

class ExtendedListener implements DataChangeListener {
  addCount: number = 0;
  notifiedIndexes: number[] = [];

  onDataReloaded(): void {
  }

  onDataAdded(index: number): void {
  }

  onDataAdd(index: number): void {
    this.addCount++;
    this.notifiedIndexes.push(index);
  }

  onDataChange(index: number): void {
  }

  onDataChanged(index: number): void {
  }

  onDataDelete(index: number): void {
  }

  onDataDeleted(index: number): void {
  }

  onDataMove(from: number, to: number): void {
  }

  onDataMoved(from: number, to: number): void {
  }

  onDatasetChange(dataOperations: DataOperation[]): void {
  }
}

export default function commentDataSourceExtendedTest(): void {
  describe('CommentDataSourceExtendedTest', () => {
    /**
     * @tc.number    SUB_IMMERSIVE_CMDSRC_EXT_0301
     * @tc.name      testCmdSrcExt0301
     * @tc.desc      Verify consecutive pushes notify listener with 1, 2, 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCmdSrcExt0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCmdSrcExt0301 begin');
      const source: CommentDataSource = new CommentDataSource([]);
      const listener: ExtendedListener = new ExtendedListener();
      source.registerDataChangeListener(listener);
      source.pushItem(1);
      source.pushItem(2);
      source.pushItem(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.notifiedIndexes.length}, expected=3`);
      expect(listener.notifiedIndexes.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.notifiedIndexes[0]=${listener.notifiedIndexes[0]}`);
      expect(listener.notifiedIndexes[0]).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.notifiedIndexes[1]=${listener.notifiedIndexes[1]}`);
      expect(listener.notifiedIndexes[1]).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.notifiedIndexes[2]=${listener.notifiedIndexes[2]}`);
      expect(listener.notifiedIndexes[2]).assertEqual(3);
      log('testCmdSrcExt0301 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_CMDSRC_EXT_0302
     * @tc.name      testCmdSrcExt0302
     * @tc.desc      Verify pre-seeded elements report the seeded total count.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCmdSrcExt0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCmdSrcExt0302 begin');
      const source: CommentDataSource = new CommentDataSource([1, 2, 3]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=3`);
      expect(source.totalCount()).assertEqual(3);
      log('testCmdSrcExt0302 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_CMDSRC_EXT_0303
     * @tc.name      testCmdSrcExt0303
     * @tc.desc      Verify pre-seeded elements are readable by index.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCmdSrcExt0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCmdSrcExt0303 begin');
      const source: CommentDataSource = new CommentDataSource([1, 2, 3]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected=1`);
      expect(source.getData(0)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(1)=${source.getData(1)}, expected=2`);
      expect(source.getData(1)).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(2)=${source.getData(2)}, expected=3`);
      expect(source.getData(2)).assertEqual(3);
      log('testCmdSrcExt0303 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_CMDSRC_EXT_0304
     * @tc.name      testCmdSrcExt0304
     * @tc.desc      Verify push after seeding notifies with the new total count.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCmdSrcExt0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCmdSrcExt0304 begin');
      const source: CommentDataSource = new CommentDataSource([1, 2, 3]);
      const listener: ExtendedListener = new ExtendedListener();
      source.registerDataChangeListener(listener);
      source.pushItem(4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.notifiedIndexes.length}, expected=1`);
      expect(listener.notifiedIndexes.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.notifiedIndexes[0]=${listener.notifiedIndexes[0]}`);
      expect(listener.notifiedIndexes[0]).assertEqual(4);
      log('testCmdSrcExt0304 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_CMDSRC_EXT_0305
     * @tc.name      testCmdSrcExt0305
     * @tc.desc      Verify pushing TEST_COMMENTS_COUNT items mirrors the comment loading flow.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCmdSrcExt0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCmdSrcExt0305 begin');
      const source: CommentDataSource = new CommentDataSource([]);
      for (let i: number = 0; i < Constants.TEST_COMMENTS_COUNT; i++) {
        source.pushItem(i + 1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}`);
      expect(source.totalCount()).assertEqual(Constants.TEST_COMMENTS_COUNT);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=10`);
      expect(source.totalCount()).assertEqual(10);
      log('testCmdSrcExt0305 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_CMDSRC_EXT_0306
     * @tc.name      testCmdSrcExt0306
     * @tc.desc      Verify loop-pushed items are readable back in push order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCmdSrcExt0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCmdSrcExt0306 begin');
      const source: CommentDataSource = new CommentDataSource([]);
      for (let i: number = 0; i < 4; i++) {
        source.pushItem(i + 1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected=1`);
      expect(source.getData(0)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(1)=${source.getData(1)}, expected=2`);
      expect(source.getData(1)).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(2)=${source.getData(2)}, expected=3`);
      expect(source.getData(2)).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(3)=${source.getData(3)}, expected=4`);
      expect(source.getData(3)).assertEqual(4);
      log('testCmdSrcExt0306 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_CMDSRC_EXT_0307
     * @tc.name      testCmdSrcExt0307
     * @tc.desc      Verify a negative element value is preserved by getData.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCmdSrcExt0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCmdSrcExt0307 begin');
      const source: CommentDataSource = new CommentDataSource([]);
      source.pushItem(-5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected=-5`);
      expect(source.getData(0)).assertEqual(-5);
      log('testCmdSrcExt0307 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_CMDSRC_EXT_0308
     * @tc.name      testCmdSrcExt0308
     * @tc.desc      Verify a large element value is preserved by getData.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCmdSrcExt0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCmdSrcExt0308 begin');
      const source: CommentDataSource = new CommentDataSource([]);
      source.pushItem(2147483647);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected=2147483647`);
      expect(source.getData(0)).assertEqual(2147483647);
      log('testCmdSrcExt0308 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_CMDSRC_EXT_0309
     * @tc.name      testCmdSrcExt0309
     * @tc.desc      Verify registering the same listener twice deduplicates notifications.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCmdSrcExt0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCmdSrcExt0309 begin');
      const source: CommentDataSource = new CommentDataSource([]);
      const listener: ExtendedListener = new ExtendedListener();
      source.registerDataChangeListener(listener);
      source.registerDataChangeListener(listener);
      source.pushItem(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addCount=${listener.addCount}, expected=1`);
      expect(listener.addCount).assertEqual(1);
      log('testCmdSrcExt0309 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_CMDSRC_EXT_0310
     * @tc.name      testCmdSrcExt0310
     * @tc.desc      Verify the last readable element equals the last pushed value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCmdSrcExt0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCmdSrcExt0310 begin');
      const source: CommentDataSource = new CommentDataSource([]);
      source.pushItem(10);
      source.pushItem(20);
      source.pushItem(30);
      const lastValue: number = source.getData(source.totalCount() - 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual lastValue=${lastValue}, expected=30`);
      expect(lastValue).assertEqual(30);
      log('testCmdSrcExt0310 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_CMDSRC_EXT_0311
     * @tc.name      testCmdSrcExt0311
     * @tc.desc      Verify multi-round register and unregister keeps count exact.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCmdSrcExt0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCmdSrcExt0311 begin');
      const source: CommentDataSource = new CommentDataSource([]);
      const listener: ExtendedListener = new ExtendedListener();
      source.registerDataChangeListener(listener);
      source.pushItem(1);
      source.unregisterDataChangeListener(listener);
      source.pushItem(2);
      source.registerDataChangeListener(listener);
      source.pushItem(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addCount=${listener.addCount}, expected=2`);
      expect(listener.addCount).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=3`);
      expect(source.totalCount()).assertEqual(3);
      log('testCmdSrcExt0311 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_CMDSRC_EXT_0312
     * @tc.name      testCmdSrcExt0312
     * @tc.desc      Verify pushing the same value twice stores both occurrences.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCmdSrcExt0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCmdSrcExt0312 begin');
      const source: CommentDataSource = new CommentDataSource([]);
      source.pushItem(7);
      source.pushItem(7);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=2`);
      expect(source.totalCount()).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected=7`);
      expect(source.getData(0)).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(1)=${source.getData(1)}, expected=7`);
      expect(source.getData(1)).assertEqual(7);
      log('testCmdSrcExt0312 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_CMDSRC_EXT_0313
     * @tc.name      testCmdSrcExt0313
     * @tc.desc      Verify the first push on an empty source notifies with index one.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCmdSrcExt0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCmdSrcExt0313 begin');
      const source: CommentDataSource = new CommentDataSource([]);
      const listener: ExtendedListener = new ExtendedListener();
      source.registerDataChangeListener(listener);
      source.pushItem(100);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.notifiedIndexes[0]=${listener.notifiedIndexes[0]}`);
      expect(listener.notifiedIndexes[0]).assertEqual(1);
      log('testCmdSrcExt0313 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_CMDSRC_EXT_0314
     * @tc.name      testCmdSrcExt0314
     * @tc.desc      Verify five consecutive pushes raise addCount to five.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCmdSrcExt0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCmdSrcExt0314 begin');
      const source: CommentDataSource = new CommentDataSource([]);
      const listener: ExtendedListener = new ExtendedListener();
      source.registerDataChangeListener(listener);
      for (let i: number = 0; i < 5; i++) {
        source.pushItem(i);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addCount=${listener.addCount}, expected=5`);
      expect(listener.addCount).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=5`);
      expect(source.totalCount()).assertEqual(5);
      log('testCmdSrcExt0314 end');
    })
  })
}
