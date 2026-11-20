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
import { CommentDataSource } from '../../../main/ets/bridge/ImmersiveBridge';

const DOMAIN: number = 0xF814;
const TAG: string = 'CommentDataSourceCoreTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

class TestListener implements DataChangeListener {
  addCount: number = 0;
  lastIndex: number = -1;
  notifiedIndexes: number[] = [];

  onDataReloaded(): void {
  }

  onDataAdded(index: number): void {
  }

  onDataAdd(index: number): void {
    this.addCount++;
    this.lastIndex = index;
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

export default function commentDataSourceCoreTest(): void {
  describe('CommentDataSourceCoreTest', () => {
    /**
     * @tc.number    SUB_IMMERSIVE_CMDSRC_0201
     * @tc.name      testCmdSrc0201
     * @tc.desc      Verify a fresh data source reports zero total count.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCmdSrc0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCmdSrc0201 begin');
      const source: CommentDataSource = new CommentDataSource([]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=0`);
      expect(source.totalCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source.totalCount()=${typeof source.totalCount()}`);
      expect(typeof source.totalCount()).assertEqual('number');
      log('testCmdSrc0201 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_CMDSRC_0202
     * @tc.name      testCmdSrc0202
     * @tc.desc      Verify pushing one item raises the total count to one.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCmdSrc0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCmdSrc0202 begin');
      const source: CommentDataSource = new CommentDataSource([]);
      source.pushItem(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=1`);
      expect(source.totalCount()).assertEqual(1);
      log('testCmdSrc0202 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_CMDSRC_0203
     * @tc.name      testCmdSrc0203
     * @tc.desc      Verify pushing three items raises the total count to three.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCmdSrc0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCmdSrc0203 begin');
      const source: CommentDataSource = new CommentDataSource([]);
      source.pushItem(1);
      source.pushItem(2);
      source.pushItem(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=3`);
      expect(source.totalCount()).assertEqual(3);
      log('testCmdSrc0203 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_CMDSRC_0204
     * @tc.name      testCmdSrc0204
     * @tc.desc      Verify getData(0) returns the first pushed element.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCmdSrc0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCmdSrc0204 begin');
      const source: CommentDataSource = new CommentDataSource([]);
      source.pushItem(11);
      source.pushItem(22);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected=11`);
      expect(source.getData(0)).assertEqual(11);
      log('testCmdSrc0204 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_CMDSRC_0205
     * @tc.name      testCmdSrc0205
     * @tc.desc      Verify getData(1) returns the second pushed element.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCmdSrc0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCmdSrc0205 begin');
      const source: CommentDataSource = new CommentDataSource([]);
      source.pushItem(11);
      source.pushItem(22);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(1)=${source.getData(1)}, expected=22`);
      expect(source.getData(1)).assertEqual(22);
      log('testCmdSrc0205 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_CMDSRC_0206
     * @tc.name      testCmdSrc0206
     * @tc.desc      Verify getData(2) returns the third pushed element.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCmdSrc0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCmdSrc0206 begin');
      const source: CommentDataSource = new CommentDataSource([]);
      source.pushItem(11);
      source.pushItem(22);
      source.pushItem(33);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(2)=${source.getData(2)}, expected=33`);
      expect(source.getData(2)).assertEqual(33);
      log('testCmdSrc0206 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_CMDSRC_0207
     * @tc.name      testCmdSrc0207
     * @tc.desc      Verify getData(-1) on empty source returns undefined.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCmdSrc0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCmdSrc0207 begin');
      const source: CommentDataSource = new CommentDataSource([]);
      const value: number = source.getData(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined value`);
      expect(value).assertUndefined();
      log('testCmdSrc0207 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_CMDSRC_0208
     * @tc.name      testCmdSrc0208
     * @tc.desc      Verify out-of-range getData returns undefined.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCmdSrc0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCmdSrc0208 begin');
      const source: CommentDataSource = new CommentDataSource([]);
      source.pushItem(7);
      const value: number = source.getData(5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined value`);
      expect(value).assertUndefined();
      log('testCmdSrc0208 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_CMDSRC_0209
     * @tc.name      testCmdSrc0209
     * @tc.desc      Verify getData keeps number type for valid indexes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCmdSrc0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCmdSrc0209 begin');
      const source: CommentDataSource = new CommentDataSource([]);
      source.pushItem(7);
      const value: number = source.getData(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      log('testCmdSrc0209 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_CMDSRC_0210
     * @tc.name      testCmdSrc0210
     * @tc.desc      Verify a registered listener gets notified once per push.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCmdSrc0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCmdSrc0210 begin');
      const source: CommentDataSource = new CommentDataSource([]);
      const listener: TestListener = new TestListener();
      source.registerDataChangeListener(listener);
      source.pushItem(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addCount=${listener.addCount}, expected=1`);
      expect(listener.addCount).assertEqual(1);
      log('testCmdSrc0210 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_CMDSRC_0211
     * @tc.name      testCmdSrc0211
     * @tc.desc      Verify onDataAdd receives the post-push total count.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCmdSrc0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCmdSrc0211 begin');
      const source: CommentDataSource = new CommentDataSource([]);
      const listener: TestListener = new TestListener();
      source.registerDataChangeListener(listener);
      source.pushItem(9);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.lastIndex=${listener.lastIndex}`);
      expect(listener.lastIndex).assertEqual(source.totalCount());
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.lastIndex=${listener.lastIndex}, expected=1`);
      expect(listener.lastIndex).assertEqual(1);
      log('testCmdSrc0211 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_CMDSRC_0212
     * @tc.name      testCmdSrc0212
     * @tc.desc      Verify two registered listeners both receive push events.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCmdSrc0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCmdSrc0212 begin');
      const source: CommentDataSource = new CommentDataSource([]);
      const first: TestListener = new TestListener();
      const second: TestListener = new TestListener();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.pushItem(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.addCount=${first.addCount}, expected=1`);
      expect(first.addCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.addCount=${second.addCount}, expected=1`);
      expect(second.addCount).assertEqual(1);
      log('testCmdSrc0212 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_CMDSRC_0213
     * @tc.name      testCmdSrc0213
     * @tc.desc      Verify an unregistered listener stops receiving events.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCmdSrc0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCmdSrc0213 begin');
      const source: CommentDataSource = new CommentDataSource([]);
      const listener: TestListener = new TestListener();
      source.registerDataChangeListener(listener);
      source.pushItem(1);
      source.unregisterDataChangeListener(listener);
      source.pushItem(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addCount=${listener.addCount}, expected=1`);
      expect(listener.addCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=2`);
      expect(source.totalCount()).assertEqual(2);
      log('testCmdSrc0213 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_CMDSRC_0214
     * @tc.name      testCmdSrc0214
     * @tc.desc      Verify unregistering a never-registered listener does not throw.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCmdSrc0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCmdSrc0214 begin');
      const source: CommentDataSource = new CommentDataSource([]);
      const listener: TestListener = new TestListener();
      source.unregisterDataChangeListener(listener);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=0`);
      expect(source.totalCount()).assertEqual(0);
      log('testCmdSrc0214 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_CMDSRC_0215
     * @tc.name      testCmdSrc0215
     * @tc.desc      Verify pushing with no registered listener does not throw.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCmdSrc0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCmdSrc0215 begin');
      const source: CommentDataSource = new CommentDataSource([]);
      source.pushItem(1);
      source.pushItem(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=2`);
      expect(source.totalCount()).assertEqual(2);
      log('testCmdSrc0215 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_CMDSRC_0216
     * @tc.name      testCmdSrc0216
     * @tc.desc      Verify repeated unregister calls of one listener do not throw.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCmdSrc0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCmdSrc0216 begin');
      const source: CommentDataSource = new CommentDataSource([]);
      const listener: TestListener = new TestListener();
      source.registerDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=0`);
      expect(source.totalCount()).assertEqual(0);
      log('testCmdSrc0216 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_CMDSRC_0217
     * @tc.name      testCmdSrc0217
     * @tc.desc      Verify listener add count matches the number of pushes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCmdSrc0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCmdSrc0217 begin');
      const source: CommentDataSource = new CommentDataSource([]);
      const listener: TestListener = new TestListener();
      source.registerDataChangeListener(listener);
      source.pushItem(1);
      source.pushItem(2);
      source.pushItem(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addCount=${listener.addCount}, expected=3`);
      expect(listener.addCount).assertEqual(3);
      log('testCmdSrc0217 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_CMDSRC_0218
     * @tc.name      testCmdSrc0218
     * @tc.desc      Verify a constructed instance is a CommentDataSource.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCmdSrc0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCmdSrc0218 begin');
      const source: CommentDataSource = new CommentDataSource([]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${source instanceof CommentDataSource}`);
      expect(source instanceof CommentDataSource).assertTrue();
      log('testCmdSrc0218 end');
    })
  })
}
