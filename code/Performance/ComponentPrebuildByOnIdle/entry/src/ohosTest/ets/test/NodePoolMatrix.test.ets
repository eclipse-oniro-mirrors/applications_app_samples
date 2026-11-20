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

import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { NodeItem, NodePool } from '@ohos/customreusablepool/src/main/ets/utils/BuilderNodePool';

import { paceTurn } from './shared/TestPace';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PrebuildOnIdle_NodePoolMatrix]';

@Builder
function poolProbeBuilder(data: ESObject) {
}

const POOL_BUILDER: WrappedBuilder<ESObject> = wrapBuilder<ESObject>(poolProbeBuilder);

class PoolProbeItem {
  public value: string;

  constructor(value: string) {
    this.value = value;
  }
}

export default function nodePoolMatrixTest() {
  describe('nodePoolMatrixTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_PREBUILD_NODEPOOL_MATRIX_0001
     * @tc.name test_nodePoolMatrix_c0001
     * @tc.desc Verify NodePoolMatrix behavior for matrix index 0
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('test_nodePoolMatrix_c0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_nodePoolMatrix_c0001 begin');
      const pool: NodePool = NodePool.getInstance();
      expect(pool === NodePool.getInstance()).assertTrue();
      const id1: number = pool.getNextId();
      const id2: number = pool.getNextId();
      expect(id2).assertEqual(id1 + 1);
      const type: string = 'pool_type_' + (0 % 8);
      const marker: number = 10000 + 0;
      const recycled: NodeItem = new NodeItem();
      recycled.type = type;
      recycled.id = marker;
      pool.recycleNode(type, recycled);
      const probe: ESObject = new PoolProbeItem('p' + 0);
      const got: NodeItem | undefined = pool.getNode(type, probe, Color.Red, POOL_BUILDER);
      expect(got !== undefined).assertTrue();
      if (got !== undefined) {
        expect(got.id).assertEqual(marker);
        expect(got.type).assertEqual(type);
      }
      const otherType: string = 'pool_other_' + (0 % 8);
      const otherProbe: ESObject = new PoolProbeItem('q' + 0);
      const fresh: NodeItem | undefined = pool.getNode(otherType, otherProbe, Color.Blue, POOL_BUILDER);
      expect(fresh !== undefined).assertTrue();
      if (fresh !== undefined) {
        expect(fresh.type).assertEqual(otherType);
        expect(fresh.id).assertEqual(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_nodePoolMatrix_c0001 end');
    });

    /**
     * @tc.number SUB_PREBUILD_NODEPOOL_MATRIX_0002
     * @tc.name test_nodePoolMatrix_c0002
     * @tc.desc Verify NodePoolMatrix behavior for matrix index 1
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('test_nodePoolMatrix_c0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_nodePoolMatrix_c0002 begin');
      const pool: NodePool = NodePool.getInstance();
      expect(pool === NodePool.getInstance()).assertTrue();
      const id1: number = pool.getNextId();
      const id2: number = pool.getNextId();
      expect(id2).assertEqual(id1 + 1);
      const type: string = 'pool_type_' + (1 % 8);
      const marker: number = 10000 + 1;
      const recycled: NodeItem = new NodeItem();
      recycled.type = type;
      recycled.id = marker;
      pool.recycleNode(type, recycled);
      const probe: ESObject = new PoolProbeItem('p' + 1);
      const got: NodeItem | undefined = pool.getNode(type, probe, Color.Red, POOL_BUILDER);
      expect(got !== undefined).assertTrue();
      if (got !== undefined) {
        expect(got.id).assertEqual(marker);
        expect(got.type).assertEqual(type);
      }
      const otherType: string = 'pool_other_' + (1 % 8);
      const otherProbe: ESObject = new PoolProbeItem('q' + 1);
      const fresh: NodeItem | undefined = pool.getNode(otherType, otherProbe, Color.Blue, POOL_BUILDER);
      expect(fresh !== undefined).assertTrue();
      if (fresh !== undefined) {
        expect(fresh.type).assertEqual(otherType);
        expect(fresh.id).assertEqual(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_nodePoolMatrix_c0002 end');
    });

    /**
     * @tc.number SUB_PREBUILD_NODEPOOL_MATRIX_0003
     * @tc.name test_nodePoolMatrix_c0003
     * @tc.desc Verify NodePoolMatrix behavior for matrix index 2
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('test_nodePoolMatrix_c0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_nodePoolMatrix_c0003 begin');
      const pool: NodePool = NodePool.getInstance();
      expect(pool === NodePool.getInstance()).assertTrue();
      const id1: number = pool.getNextId();
      const id2: number = pool.getNextId();
      expect(id2).assertEqual(id1 + 1);
      const type: string = 'pool_type_' + (2 % 8);
      const marker: number = 10000 + 2;
      const recycled: NodeItem = new NodeItem();
      recycled.type = type;
      recycled.id = marker;
      pool.recycleNode(type, recycled);
      const probe: ESObject = new PoolProbeItem('p' + 2);
      const got: NodeItem | undefined = pool.getNode(type, probe, Color.Red, POOL_BUILDER);
      expect(got !== undefined).assertTrue();
      if (got !== undefined) {
        expect(got.id).assertEqual(marker);
        expect(got.type).assertEqual(type);
      }
      const otherType: string = 'pool_other_' + (2 % 8);
      const otherProbe: ESObject = new PoolProbeItem('q' + 2);
      const fresh: NodeItem | undefined = pool.getNode(otherType, otherProbe, Color.Blue, POOL_BUILDER);
      expect(fresh !== undefined).assertTrue();
      if (fresh !== undefined) {
        expect(fresh.type).assertEqual(otherType);
        expect(fresh.id).assertEqual(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_nodePoolMatrix_c0003 end');
    });

    /**
     * @tc.number SUB_PREBUILD_NODEPOOL_MATRIX_0004
     * @tc.name test_nodePoolMatrix_c0004
     * @tc.desc Verify NodePoolMatrix behavior for matrix index 3
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('test_nodePoolMatrix_c0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_nodePoolMatrix_c0004 begin');
      const pool: NodePool = NodePool.getInstance();
      expect(pool === NodePool.getInstance()).assertTrue();
      const id1: number = pool.getNextId();
      const id2: number = pool.getNextId();
      expect(id2).assertEqual(id1 + 1);
      const type: string = 'pool_type_' + (3 % 8);
      const marker: number = 10000 + 3;
      const recycled: NodeItem = new NodeItem();
      recycled.type = type;
      recycled.id = marker;
      pool.recycleNode(type, recycled);
      const probe: ESObject = new PoolProbeItem('p' + 3);
      const got: NodeItem | undefined = pool.getNode(type, probe, Color.Red, POOL_BUILDER);
      expect(got !== undefined).assertTrue();
      if (got !== undefined) {
        expect(got.id).assertEqual(marker);
        expect(got.type).assertEqual(type);
      }
      const otherType: string = 'pool_other_' + (3 % 8);
      const otherProbe: ESObject = new PoolProbeItem('q' + 3);
      const fresh: NodeItem | undefined = pool.getNode(otherType, otherProbe, Color.Blue, POOL_BUILDER);
      expect(fresh !== undefined).assertTrue();
      if (fresh !== undefined) {
        expect(fresh.type).assertEqual(otherType);
        expect(fresh.id).assertEqual(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_nodePoolMatrix_c0004 end');
    });

    /**
     * @tc.number SUB_PREBUILD_NODEPOOL_MATRIX_0005
     * @tc.name test_nodePoolMatrix_c0005
     * @tc.desc Verify NodePoolMatrix behavior for matrix index 4
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('test_nodePoolMatrix_c0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_nodePoolMatrix_c0005 begin');
      const pool: NodePool = NodePool.getInstance();
      expect(pool === NodePool.getInstance()).assertTrue();
      const id1: number = pool.getNextId();
      const id2: number = pool.getNextId();
      expect(id2).assertEqual(id1 + 1);
      const type: string = 'pool_type_' + (4 % 8);
      const marker: number = 10000 + 4;
      const recycled: NodeItem = new NodeItem();
      recycled.type = type;
      recycled.id = marker;
      pool.recycleNode(type, recycled);
      const probe: ESObject = new PoolProbeItem('p' + 4);
      const got: NodeItem | undefined = pool.getNode(type, probe, Color.Red, POOL_BUILDER);
      expect(got !== undefined).assertTrue();
      if (got !== undefined) {
        expect(got.id).assertEqual(marker);
        expect(got.type).assertEqual(type);
      }
      const otherType: string = 'pool_other_' + (4 % 8);
      const otherProbe: ESObject = new PoolProbeItem('q' + 4);
      const fresh: NodeItem | undefined = pool.getNode(otherType, otherProbe, Color.Blue, POOL_BUILDER);
      expect(fresh !== undefined).assertTrue();
      if (fresh !== undefined) {
        expect(fresh.type).assertEqual(otherType);
        expect(fresh.id).assertEqual(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_nodePoolMatrix_c0005 end');
    });

    /**
     * @tc.number SUB_PREBUILD_NODEPOOL_MATRIX_0006
     * @tc.name test_nodePoolMatrix_c0006
     * @tc.desc Verify NodePoolMatrix behavior for matrix index 5
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('test_nodePoolMatrix_c0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_nodePoolMatrix_c0006 begin');
      const pool: NodePool = NodePool.getInstance();
      expect(pool === NodePool.getInstance()).assertTrue();
      const id1: number = pool.getNextId();
      const id2: number = pool.getNextId();
      expect(id2).assertEqual(id1 + 1);
      const type: string = 'pool_type_' + (5 % 8);
      const marker: number = 10000 + 5;
      const recycled: NodeItem = new NodeItem();
      recycled.type = type;
      recycled.id = marker;
      pool.recycleNode(type, recycled);
      const probe: ESObject = new PoolProbeItem('p' + 5);
      const got: NodeItem | undefined = pool.getNode(type, probe, Color.Red, POOL_BUILDER);
      expect(got !== undefined).assertTrue();
      if (got !== undefined) {
        expect(got.id).assertEqual(marker);
        expect(got.type).assertEqual(type);
      }
      const otherType: string = 'pool_other_' + (5 % 8);
      const otherProbe: ESObject = new PoolProbeItem('q' + 5);
      const fresh: NodeItem | undefined = pool.getNode(otherType, otherProbe, Color.Blue, POOL_BUILDER);
      expect(fresh !== undefined).assertTrue();
      if (fresh !== undefined) {
        expect(fresh.type).assertEqual(otherType);
        expect(fresh.id).assertEqual(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_nodePoolMatrix_c0006 end');
    });

    /**
     * @tc.number SUB_PREBUILD_NODEPOOL_MATRIX_0128
     * @tc.name test_nodePoolMatrix_c0128
     * @tc.desc Verify NodePoolMatrix behavior for matrix index 127
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('test_nodePoolMatrix_c0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_nodePoolMatrix_c0128 begin');
      const pool: NodePool = NodePool.getInstance();
      expect(pool === NodePool.getInstance()).assertTrue();
      const id1: number = pool.getNextId();
      const id2: number = pool.getNextId();
      expect(id2).assertEqual(id1 + 1);
      const type: string = 'pool_type_' + (127 % 8);
      const marker: number = 10000 + 127;
      const recycled: NodeItem = new NodeItem();
      recycled.type = type;
      recycled.id = marker;
      pool.recycleNode(type, recycled);
      const probe: ESObject = new PoolProbeItem('p' + 127);
      const got: NodeItem | undefined = pool.getNode(type, probe, Color.Red, POOL_BUILDER);
      expect(got !== undefined).assertTrue();
      if (got !== undefined) {
        expect(got.id).assertEqual(marker);
        expect(got.type).assertEqual(type);
      }
      const otherType: string = 'pool_other_' + (127 % 8);
      const otherProbe: ESObject = new PoolProbeItem('q' + 127);
      const fresh: NodeItem | undefined = pool.getNode(otherType, otherProbe, Color.Blue, POOL_BUILDER);
      expect(fresh !== undefined).assertTrue();
      if (fresh !== undefined) {
        expect(fresh.type).assertEqual(otherType);
        expect(fresh.id).assertEqual(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_nodePoolMatrix_c0128 end');
    });

    /**
     * @tc.number SUB_PREBUILD_NODEPOOL_MATRIX_0256
     * @tc.name test_nodePoolMatrix_c0256
     * @tc.desc Verify NodePoolMatrix behavior for matrix index 255
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('test_nodePoolMatrix_c0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_nodePoolMatrix_c0256 begin');
      const pool: NodePool = NodePool.getInstance();
      expect(pool === NodePool.getInstance()).assertTrue();
      const id1: number = pool.getNextId();
      const id2: number = pool.getNextId();
      expect(id2).assertEqual(id1 + 1);
      const type: string = 'pool_type_' + (255 % 8);
      const marker: number = 10000 + 255;
      const recycled: NodeItem = new NodeItem();
      recycled.type = type;
      recycled.id = marker;
      pool.recycleNode(type, recycled);
      const probe: ESObject = new PoolProbeItem('p' + 255);
      const got: NodeItem | undefined = pool.getNode(type, probe, Color.Red, POOL_BUILDER);
      expect(got !== undefined).assertTrue();
      if (got !== undefined) {
        expect(got.id).assertEqual(marker);
        expect(got.type).assertEqual(type);
      }
      const otherType: string = 'pool_other_' + (255 % 8);
      const otherProbe: ESObject = new PoolProbeItem('q' + 255);
      const fresh: NodeItem | undefined = pool.getNode(otherType, otherProbe, Color.Blue, POOL_BUILDER);
      expect(fresh !== undefined).assertTrue();
      if (fresh !== undefined) {
        expect(fresh.type).assertEqual(otherType);
        expect(fresh.id).assertEqual(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_nodePoolMatrix_c0256 end');
    });

  });
}
