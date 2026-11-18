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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { TopicNodeController } from '../../../main/ets/core/TopicNode';
import { TOPIC_LAYOUT_COLUMN, TOPIC_LAYOUT_ROW, TopicStats } from '../../../main/ets/core/TopicTypes';

const TAG: string = '[Sample_NdkRenderNodeTopicNodeTest]';
const DOMAIN: number = 0xF811;
// 规格常量（TopicNode.ets 声明）：单个画布最多挂 8 个子节点，录制缓冲最多 32 步。
const MAX_BOX: number = 8;
const MAX_RECORD: number = 32;
const GAP: number = 8;
const LONG_LABEL_LENGTH: number = 128;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

// 以行布局重建子节点树，返回值为重建后的子节点数。
function rebuildRow(controller: TopicNodeController, count: number): number {
  return controller.rebuildBoxes(count, TOPIC_LAYOUT_ROW, GAP);
}

// 录满录制缓冲，返回写入步数。
function recordTimes(controller: TopicNodeController, times: number): number {
  let size: number = 0;
  for (let index = 0; index < times; index++) {
    size = controller.record(index / times);
  }
  return size;
}

export default function ndkRenderNodeTopicNodeTest(): void {
  describe('NdkRenderNodeTopicNode', () => {
    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_NODE_0001
     * @tc.name      testNdkRenderNodeTopicNode0001
     * @tc.desc      校验新建控制器重建 1 个子节点后计数为 1，且重建本身不计入重绘次数。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeTopicNode0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeTopicNode0001 begin');
      const controller: TopicNodeController = new TopicNodeController();
      const created: number = rebuildRow(controller, 1);
      expect(created).assertEqual(1);
      expect(controller.nodeCount()).assertEqual(1);
      expect(controller.stats().nodes).assertEqual(1);
      expect(controller.stats().draws).assertEqual(0);
      logInfo('testNdkRenderNodeTopicNode0001 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_NODE_0002
     * @tc.name      testNdkRenderNodeTopicNode0002
     * @tc.desc      校验重建 4 个子节点后节点计数、返回值与统计快照三处一致。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeTopicNode0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeTopicNode0002 begin');
      const controller: TopicNodeController = new TopicNodeController();
      const created: number = rebuildRow(controller, 4);
      expect(created).assertEqual(4);
      expect(controller.nodeCount()).assertEqual(4);
      expect(controller.stats().nodes).assertEqual(4);
      logInfo('testNdkRenderNodeTopicNode0002 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_NODE_0003
     * @tc.name      testNdkRenderNodeTopicNode0003
     * @tc.desc      校验重建子节点数达到规格上限 8 时按原样建树，不触发截断。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicNode0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeTopicNode0003 begin');
      const controller: TopicNodeController = new TopicNodeController();
      const created: number = rebuildRow(controller, MAX_BOX);
      expect(created).assertEqual(MAX_BOX);
      expect(controller.nodeCount()).assertEqual(MAX_BOX);
      expect(created).assertEqual(controller.nodeCount());
      logInfo('testNdkRenderNodeTopicNode0003 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_NODE_0004
     * @tc.name      testNdkRenderNodeTopicNode0004
     * @tc.desc      校验上限之下的 7 个子节点按请求数量建树，不被上限逻辑提前收口。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicNode0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeTopicNode0004 begin');
      const controller: TopicNodeController = new TopicNodeController();
      const created: number = rebuildRow(controller, 7);
      expect(created).assertEqual(7);
      expect(controller.nodeCount()).assertEqual(7);
      expect(controller.stats().nodes).assertEqual(7);
      logInfo('testNdkRenderNodeTopicNode0004 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_NODE_0005
     * @tc.name      testNdkRenderNodeTopicNode0005
     * @tc.desc      校验重建 0 个子节点时树为空，节点计数与统计均为 0。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeTopicNode0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeTopicNode0005 begin');
      const controller: TopicNodeController = new TopicNodeController();
      const created: number = rebuildRow(controller, 0);
      expect(created).assertEqual(0);
      expect(controller.nodeCount()).assertEqual(0);
      expect(controller.stats().nodes).assertEqual(0);
      expect(created).assertEqual(controller.stats().nodes);
      logInfo('testNdkRenderNodeTopicNode0005 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_NODE_0006
     * @tc.name      testNdkRenderNodeTopicNode0006
     * @tc.desc      校验重建 9 个子节点被截断到规格上限 8，返回值为截断后的数量。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicNode0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeTopicNode0006 begin');
      const controller: TopicNodeController = new TopicNodeController();
      const created: number = rebuildRow(controller, MAX_BOX + 1);
      expect(created).assertEqual(MAX_BOX);
      expect(controller.nodeCount()).assertEqual(MAX_BOX);
      expect(created < MAX_BOX + 1).assertTrue();
      logInfo('testNdkRenderNodeTopicNode0006 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_NODE_0007
     * @tc.name      testNdkRenderNodeTopicNode0007
     * @tc.desc      校验远大于上限的 100 个子节点请求同样被截断到 8，不产生额外节点。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicNode0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeTopicNode0007 begin');
      const controller: TopicNodeController = new TopicNodeController();
      const created: number = rebuildRow(controller, 100);
      expect(created).assertEqual(MAX_BOX);
      expect(controller.nodeCount()).assertEqual(MAX_BOX);
      expect(controller.stats().nodes).assertEqual(MAX_BOX);
      logInfo('testNdkRenderNodeTopicNode0007 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_NODE_0008
     * @tc.name      testNdkRenderNodeTopicNode0008
     * @tc.desc      校验负数子节点数被归零建树，不产生任何节点也不会抛异常。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicNode0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeTopicNode0008 begin');
      const controller: TopicNodeController = new TopicNodeController();
      const created: number = rebuildRow(controller, -1);
      expect(created).assertEqual(0);
      expect(controller.nodeCount()).assertEqual(0);
      expect(controller.stats().nodes).assertEqual(0);
      logInfo('testNdkRenderNodeTopicNode0008 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_NODE_0009
     * @tc.name      testNdkRenderNodeTopicNode0009
     * @tc.desc      校验极小负数子节点数同样归零建树，负数不参与节点数量换算。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeTopicNode0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeTopicNode0009 begin');
      const controller: TopicNodeController = new TopicNodeController();
      const created: number = rebuildRow(controller, -1000);
      expect(created).assertEqual(0);
      expect(controller.nodeCount()).assertEqual(0);
      expect(created >= 0).assertTrue();
      logInfo('testNdkRenderNodeTopicNode0009 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_NODE_0010
     * @tc.name      testNdkRenderNodeTopicNode0010
     * @tc.desc      校验最大安全整数作为子节点数时仍收敛到上限 8，不发生数量溢出。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeTopicNode0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeTopicNode0010 begin');
      const controller: TopicNodeController = new TopicNodeController();
      const created: number = rebuildRow(controller, Number.MAX_SAFE_INTEGER);
      expect(created).assertEqual(MAX_BOX);
      expect(controller.nodeCount()).assertEqual(MAX_BOX);
      expect(Number.isSafeInteger(created)).assertTrue();
      logInfo('testNdkRenderNodeTopicNode0010 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_NODE_0011
     * @tc.name      testNdkRenderNodeTopicNode0011
     * @tc.desc      校验 NaN 子节点数不会被当成有效数量，建树结果为空且计数可读。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeTopicNode0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeTopicNode0011 begin');
      const controller: TopicNodeController = new TopicNodeController();
      const created: number = rebuildRow(controller, Number.NaN);
      expect(created).assertEqual(0);
      expect(controller.nodeCount()).assertEqual(0);
      expect(Number.isNaN(created)).assertFalse();
      logInfo('testNdkRenderNodeTopicNode0011 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_NODE_0012
     * @tc.name      testNdkRenderNodeTopicNode0012
     * @tc.desc      校验先建 5 个再建 2 个时按覆盖式重建，最终子节点数为 2 而不是 7。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicNode0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeTopicNode0012 begin');
      const controller: TopicNodeController = new TopicNodeController();
      expect(rebuildRow(controller, 5)).assertEqual(5);
      const second: number = rebuildRow(controller, 2);
      expect(second).assertEqual(2);
      expect(controller.nodeCount()).assertEqual(2);
      expect(controller.stats().nodes).assertEqual(2);
      logInfo('testNdkRenderNodeTopicNode0012 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_NODE_0013
     * @tc.name      testNdkRenderNodeTopicNode0013
     * @tc.desc      校验已建 2 个节点后重建 0 个可清空整棵树，节点计数回到 0。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicNode0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeTopicNode0013 begin');
      const controller: TopicNodeController = new TopicNodeController();
      expect(rebuildRow(controller, 2)).assertEqual(2);
      const cleared: number = rebuildRow(controller, 0);
      expect(cleared).assertEqual(0);
      expect(controller.nodeCount()).assertEqual(0);
      expect(controller.stats().nodes).assertEqual(0);
      logInfo('testNdkRenderNodeTopicNode0013 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_NODE_0014
     * @tc.name      testNdkRenderNodeTopicNode0014
     * @tc.desc      校验连续三次重建 3 个节点每次都返回 3，重建不累计节点也不计重绘。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicNode0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeTopicNode0014 begin');
      const controller: TopicNodeController = new TopicNodeController();
      for (let round = 0; round < 3; round++) {
        expect(rebuildRow(controller, 3)).assertEqual(3);
      }
      expect(controller.nodeCount()).assertEqual(3);
      expect(controller.stats().draws).assertEqual(0);
      logInfo('testNdkRenderNodeTopicNode0014 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_NODE_0015
     * @tc.name      testNdkRenderNodeTopicNode0015
     * @tc.desc      校验列布局下重建 6 个节点与行布局数量一致，布局方式不影响节点数量。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeTopicNode0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeTopicNode0015 begin');
      const controller: TopicNodeController = new TopicNodeController();
      const column: number = controller.rebuildBoxes(6, TOPIC_LAYOUT_COLUMN, GAP);
      expect(column).assertEqual(6);
      const row: number = controller.rebuildBoxes(6, TOPIC_LAYOUT_ROW, GAP);
      expect(row).assertEqual(6);
      expect(controller.nodeCount()).assertEqual(6);
      logInfo('testNdkRenderNodeTopicNode0015 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_NODE_0016
     * @tc.name      testNdkRenderNodeTopicNode0016
     * @tc.desc      校验空树上插入 1 个子节点后计数为 1，返回值为插入后的数量。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeTopicNode0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeTopicNode0016 begin');
      const controller: TopicNodeController = new TopicNodeController();
      const inserted: number = controller.insertBox(0);
      expect(inserted).assertEqual(1);
      expect(controller.nodeCount()).assertEqual(1);
      expect(controller.stats().nodes).assertEqual(1);
      logInfo('testNdkRenderNodeTopicNode0016 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_NODE_0017
     * @tc.name      testNdkRenderNodeTopicNode0017
     * @tc.desc      校验负下标插入空树时按追加处理，节点数量为 1 且不抛异常。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicNode0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeTopicNode0017 begin');
      const controller: TopicNodeController = new TopicNodeController();
      const inserted: number = controller.insertBox(-1);
      expect(inserted).assertEqual(1);
      expect(controller.nodeCount()).assertEqual(1);
      expect(controller.stats().nodes).assertEqual(1);
      logInfo('testNdkRenderNodeTopicNode0017 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_NODE_0018
     * @tc.name      testNdkRenderNodeTopicNode0018
     * @tc.desc      校验 3 个节点后在下标 1 之后插入，节点数增长到 4。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeTopicNode0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeTopicNode0018 begin');
      const controller: TopicNodeController = new TopicNodeController();
      expect(rebuildRow(controller, 3)).assertEqual(3);
      const inserted: number = controller.insertBox(1);
      expect(inserted).assertEqual(4);
      expect(controller.nodeCount()).assertEqual(4);
      logInfo('testNdkRenderNodeTopicNode0018 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_NODE_0019
     * @tc.name      testNdkRenderNodeTopicNode0019
     * @tc.desc      校验插入下标等于节点数时按追加处理，节点数增长到 4。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicNode0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeTopicNode0019 begin');
      const controller: TopicNodeController = new TopicNodeController();
      expect(rebuildRow(controller, 3)).assertEqual(3);
      const inserted: number = controller.insertBox(3);
      expect(inserted).assertEqual(4);
      expect(controller.nodeCount()).assertEqual(4);
      logInfo('testNdkRenderNodeTopicNode0019 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_NODE_0020
     * @tc.name      testNdkRenderNodeTopicNode0020
     * @tc.desc      校验远超长度的插入下标退回追加，节点数只增加 1。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicNode0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeTopicNode0020 begin');
      const controller: TopicNodeController = new TopicNodeController();
      expect(rebuildRow(controller, 3)).assertEqual(3);
      const inserted: number = controller.insertBox(999);
      expect(inserted).assertEqual(4);
      expect(controller.nodeCount()).assertEqual(4);
      expect(inserted > 3).assertTrue();
      logInfo('testNdkRenderNodeTopicNode0020 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_NODE_0021
     * @tc.name      testNdkRenderNodeTopicNode0021
     * @tc.desc      校验已满 8 个节点时插入被拒绝，返回与节点数都保持 8。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicNode0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeTopicNode0021 begin');
      const controller: TopicNodeController = new TopicNodeController();
      expect(rebuildRow(controller, MAX_BOX)).assertEqual(MAX_BOX);
      const inserted: number = controller.insertBox(0);
      expect(inserted).assertEqual(MAX_BOX);
      expect(controller.nodeCount()).assertEqual(MAX_BOX);
      expect(controller.stats().nodes).assertEqual(MAX_BOX);
      logInfo('testNdkRenderNodeTopicNode0021 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_NODE_0022
     * @tc.name      testNdkRenderNodeTopicNode0022
     * @tc.desc      校验 6 个节点连续插入三次时逐步增长到上限 8 后停止增长。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicNode0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeTopicNode0022 begin');
      const controller: TopicNodeController = new TopicNodeController();
      expect(rebuildRow(controller, 6)).assertEqual(6);
      expect(controller.insertBox(0)).assertEqual(7);
      expect(controller.insertBox(1)).assertEqual(MAX_BOX);
      expect(controller.insertBox(2)).assertEqual(MAX_BOX);
      logInfo('testNdkRenderNodeTopicNode0022 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_NODE_0023
     * @tc.name      testNdkRenderNodeTopicNode0023
     * @tc.desc      校验插入返回值与节点计数同步，2 个节点插入后两处都为 3。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicNode0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeTopicNode0023 begin');
      const controller: TopicNodeController = new TopicNodeController();
      expect(rebuildRow(controller, 2)).assertEqual(2);
      const inserted: number = controller.insertBox(0);
      expect(inserted).assertEqual(controller.nodeCount());
      expect(inserted).assertEqual(3);
      logInfo('testNdkRenderNodeTopicNode0023 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_NODE_0024
     * @tc.name      testNdkRenderNodeTopicNode0024
     * @tc.desc      校验在 2 个节点上连续两次向首位插入，节点数累计到 4。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicNode0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeTopicNode0024 begin');
      const controller: TopicNodeController = new TopicNodeController();
      expect(rebuildRow(controller, 2)).assertEqual(2);
      expect(controller.insertBox(0)).assertEqual(3);
      const inserted: number = controller.insertBox(0);
      expect(inserted).assertEqual(4);
      expect(controller.nodeCount()).assertEqual(4);
      logInfo('testNdkRenderNodeTopicNode0024 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_NODE_0025
     * @tc.name      testNdkRenderNodeTopicNode0025
     * @tc.desc      校验插入后统计快照的节点数与实际节点计数保持一致。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeTopicNode0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeTopicNode0025 begin');
      const controller: TopicNodeController = new TopicNodeController();
      expect(rebuildRow(controller, 1)).assertEqual(1);
      expect(controller.insertBox(0)).assertEqual(2);
      expect(controller.stats().nodes).assertEqual(controller.nodeCount());
      expect(controller.stats().nodes).assertEqual(2);
      logInfo('testNdkRenderNodeTopicNode0025 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_NODE_0026
     * @tc.name      testNdkRenderNodeTopicNode0026
     * @tc.desc      校验空树上连续插入两次后节点数为 2，空树起点不影响插入累计。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicNode0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeTopicNode0026 begin');
      const controller: TopicNodeController = new TopicNodeController();
      expect(controller.nodeCount()).assertEqual(0);
      expect(controller.insertBox(0)).assertEqual(1);
      expect(controller.insertBox(0)).assertEqual(2);
      expect(controller.nodeCount()).assertEqual(2);
      logInfo('testNdkRenderNodeTopicNode0026 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_NODE_0027
     * @tc.name      testNdkRenderNodeTopicNode0027
     * @tc.desc      校验移除模式 0 移除末尾节点，4 个节点减少为 3 个。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeTopicNode0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeTopicNode0027 begin');
      const controller: TopicNodeController = new TopicNodeController();
      expect(rebuildRow(controller, 4)).assertEqual(4);
      const left: number = controller.removeBoxes(0);
      expect(left).assertEqual(3);
      expect(controller.nodeCount()).assertEqual(3);
      logInfo('testNdkRenderNodeTopicNode0027 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_NODE_0028
     * @tc.name      testNdkRenderNodeTopicNode0028
     * @tc.desc      校验移除模式 1 移除第一个节点，4 个节点减少为 3 个。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicNode0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeTopicNode0028 begin');
      const controller: TopicNodeController = new TopicNodeController();
      expect(rebuildRow(controller, 4)).assertEqual(4);
      const left: number = controller.removeBoxes(1);
      expect(left).assertEqual(3);
      expect(controller.stats().nodes).assertEqual(3);
      logInfo('testNdkRenderNodeTopicNode0028 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_NODE_0029
     * @tc.name      testNdkRenderNodeTopicNode0029
     * @tc.desc      校验移除模式 2 清空全部节点，4 个节点归零。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeTopicNode0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeTopicNode0029 begin');
      const controller: TopicNodeController = new TopicNodeController();
      expect(rebuildRow(controller, 4)).assertEqual(4);
      const left: number = controller.removeBoxes(2);
      expect(left).assertEqual(0);
      expect(controller.nodeCount()).assertEqual(0);
      expect(controller.stats().nodes).assertEqual(0);
      logInfo('testNdkRenderNodeTopicNode0029 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_NODE_0030
     * @tc.name      testNdkRenderNodeTopicNode0030
     * @tc.desc      校验空树调用移除模式 0 返回 0，不产生负数节点数。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicNode0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeTopicNode0030 begin');
      const controller: TopicNodeController = new TopicNodeController();
      const left: number = controller.removeBoxes(0);
      expect(left).assertEqual(0);
      expect(controller.nodeCount()).assertEqual(0);
      expect(left >= 0).assertTrue();
      logInfo('testNdkRenderNodeTopicNode0030 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_NODE_0031
     * @tc.name      testNdkRenderNodeTopicNode0031
     * @tc.desc      校验空树调用移除模式 2 同样返回 0，重复清空是幂等的。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicNode0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeTopicNode0031 begin');
      const controller: TopicNodeController = new TopicNodeController();
      expect(controller.removeBoxes(2)).assertEqual(0);
      const again: number = controller.removeBoxes(2);
      expect(again).assertEqual(0);
      expect(controller.stats().nodes).assertEqual(0);
      logInfo('testNdkRenderNodeTopicNode0031 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_NODE_0032
     * @tc.name      testNdkRenderNodeTopicNode0032
     * @tc.desc      校验只剩 1 个节点时移除第一个节点后树为空。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicNode0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeTopicNode0032 begin');
      const controller: TopicNodeController = new TopicNodeController();
      expect(rebuildRow(controller, 1)).assertEqual(1);
      const left: number = controller.removeBoxes(1);
      expect(left).assertEqual(0);
      expect(controller.nodeCount()).assertEqual(0);
      logInfo('testNdkRenderNodeTopicNode0032 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_NODE_0033
     * @tc.name      testNdkRenderNodeTopicNode0033
     * @tc.desc      校验非法移除模式 99 按末尾移除处理，4 个节点只减少 1 个。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeTopicNode0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeTopicNode0033 begin');
      const controller: TopicNodeController = new TopicNodeController();
      expect(rebuildRow(controller, 4)).assertEqual(4);
      const left: number = controller.removeBoxes(99);
      expect(left).assertEqual(3);
      expect(controller.nodeCount()).assertEqual(3);
      logInfo('testNdkRenderNodeTopicNode0033 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_NODE_0034
     * @tc.name      testNdkRenderNodeTopicNode0034
     * @tc.desc      校验负移除模式不会被当成清空，4 个节点只减少 1 个。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeTopicNode0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeTopicNode0034 begin');
      const controller: TopicNodeController = new TopicNodeController();
      expect(rebuildRow(controller, 4)).assertEqual(4);
      const left: number = controller.removeBoxes(-1);
      expect(left).assertEqual(3);
      expect(left > 0).assertTrue();
      logInfo('testNdkRenderNodeTopicNode0034 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_NODE_0035
     * @tc.name      testNdkRenderNodeTopicNode0035
     * @tc.desc      校验 3 个节点逐个移除后归零，每次移除只减少 1 个。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicNode0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeTopicNode0035 begin');
      const controller: TopicNodeController = new TopicNodeController();
      expect(rebuildRow(controller, 3)).assertEqual(3);
      expect(controller.removeBoxes(0)).assertEqual(2);
      expect(controller.removeBoxes(0)).assertEqual(1);
      expect(controller.removeBoxes(0)).assertEqual(0);
      logInfo('testNdkRenderNodeTopicNode0035 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_NODE_0036
     * @tc.name      testNdkRenderNodeTopicNode0036
     * @tc.desc      校验移除返回值与节点计数同步，统计快照同步更新。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeTopicNode0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeTopicNode0036 begin');
      const controller: TopicNodeController = new TopicNodeController();
      expect(rebuildRow(controller, 5)).assertEqual(5);
      const left: number = controller.removeBoxes(0);
      expect(left).assertEqual(controller.nodeCount());
      expect(controller.stats().nodes).assertEqual(left);
      logInfo('testNdkRenderNodeTopicNode0036 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_NODE_0037
     * @tc.name      testNdkRenderNodeTopicNode0037
     * @tc.desc      校验录制 1 步后缓冲长度为 1，返回值与查询值一致。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeTopicNode0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeTopicNode0037 begin');
      const controller: TopicNodeController = new TopicNodeController();
      const size: number = controller.record(0.5);
      expect(size).assertEqual(1);
      expect(controller.recordSize()).assertEqual(1);
      expect(size).assertEqual(controller.recordSize());
      logInfo('testNdkRenderNodeTopicNode0037 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_NODE_0038
     * @tc.name      testNdkRenderNodeTopicNode0038
     * @tc.desc      校验连续录制 3 步后缓冲长度为 3，步数按次累加。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicNode0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeTopicNode0038 begin');
      const controller: TopicNodeController = new TopicNodeController();
      expect(recordTimes(controller, 3)).assertEqual(3);
      expect(controller.recordSize()).assertEqual(3);
      expect(controller.stats().nodes).assertEqual(0);
      logInfo('testNdkRenderNodeTopicNode0038 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_NODE_0039
     * @tc.name      testNdkRenderNodeTopicNode0039
     * @tc.desc      校验录制正好 32 步时缓冲被写满，长度为规格上限 32。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicNode0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeTopicNode0039 begin');
      const controller: TopicNodeController = new TopicNodeController();
      expect(recordTimes(controller, MAX_RECORD)).assertEqual(MAX_RECORD);
      expect(controller.recordSize()).assertEqual(MAX_RECORD);
      expect(controller.stats().nodes).assertEqual(0);
      logInfo('testNdkRenderNodeTopicNode0039 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_NODE_0040
     * @tc.name      testNdkRenderNodeTopicNode0040
     * @tc.desc      校验录制第 33 步被丢弃，缓冲长度停在上限 32 不再增长。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicNode0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeTopicNode0040 begin');
      const controller: TopicNodeController = new TopicNodeController();
      expect(recordTimes(controller, MAX_RECORD + 1)).assertEqual(MAX_RECORD);
      expect(controller.recordSize()).assertEqual(MAX_RECORD);
      expect(controller.record(0.9)).assertEqual(MAX_RECORD);
      logInfo('testNdkRenderNodeTopicNode0040 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_NODE_0041
     * @tc.name      testNdkRenderNodeTopicNode0041
     * @tc.desc      校验超量录制 100 步仍封顶在 32，缓冲不会无限增长。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeTopicNode0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeTopicNode0041 begin');
      const controller: TopicNodeController = new TopicNodeController();
      expect(recordTimes(controller, 100)).assertEqual(MAX_RECORD);
      expect(controller.recordSize()).assertEqual(MAX_RECORD);
      expect(controller.recordSize() <= MAX_RECORD).assertTrue();
      logInfo('testNdkRenderNodeTopicNode0041 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_NODE_0042
     * @tc.name      testNdkRenderNodeTopicNode0042
     * @tc.desc      校验清空录制后缓冲长度为 0，先前写入的步数全部丢弃。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicNode0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeTopicNode0042 begin');
      const controller: TopicNodeController = new TopicNodeController();
      expect(recordTimes(controller, 5)).assertEqual(5);
      controller.clearRecord();
      expect(controller.recordSize()).assertEqual(0);
      expect(controller.recordSize() === 5).assertFalse();
      logInfo('testNdkRenderNodeTopicNode0042 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_NODE_0043
     * @tc.name      testNdkRenderNodeTopicNode0043
     * @tc.desc      校验清空后重新录制从 1 开始计数，不清空前的长度不残留。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicNode0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeTopicNode0043 begin');
      const controller: TopicNodeController = new TopicNodeController();
      expect(recordTimes(controller, 9)).assertEqual(9);
      controller.clearRecord();
      expect(controller.record(0.3)).assertEqual(1);
      expect(controller.recordSize()).assertEqual(1);
      logInfo('testNdkRenderNodeTopicNode0043 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_NODE_0044
     * @tc.name      testNdkRenderNodeTopicNode0044
     * @tc.desc      校验空录制回放直接返回 0 且不启动定时器。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicNode0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeTopicNode0044 begin');
      const controller: TopicNodeController = new TopicNodeController();
      const steps: number = controller.replay(48, 1);
      expect(steps).assertEqual(0);
      expect(controller.isTicking()).assertFalse();
      expect(controller.recordSize()).assertEqual(0);
      logInfo('testNdkRenderNodeTopicNode0044 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_NODE_0045
     * @tc.name      testNdkRenderNodeTopicNode0045
     * @tc.desc      校验录制 3 步后回放返回步数 3 并启动定时器，停止后定时器关闭。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicNode0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeTopicNode0045 begin');
      const controller: TopicNodeController = new TopicNodeController();
      try {
        expect(recordTimes(controller, 3)).assertEqual(3);
        const steps: number = controller.replay(48, 1);
        expect(steps).assertEqual(3);
        expect(controller.isTicking()).assertTrue();
      } finally {
        controller.stopTick();
      }
      expect(controller.isTicking()).assertFalse();
      logInfo('testNdkRenderNodeTopicNode0045 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_NODE_0046
     * @tc.name      testNdkRenderNodeTopicNode0046
     * @tc.desc      校验回放中销毁节点会同时关掉定时器，不会残留后台计时。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeTopicNode0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeTopicNode0046 begin');
      const controller: TopicNodeController = new TopicNodeController();
      expect(recordTimes(controller, 4)).assertEqual(4);
      expect(controller.replay(48, 2)).assertEqual(4);
      expect(controller.isTicking()).assertTrue();
      controller.disposeNode();
      expect(controller.isTicking()).assertFalse();
      logInfo('testNdkRenderNodeTopicNode0046 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_NODE_0047
     * @tc.name      testNdkRenderNodeTopicNode0047
     * @tc.desc      校验新建控制器的统计快照全为 0 且标签为空串。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeTopicNode0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeTopicNode0047 begin');
      const controller: TopicNodeController = new TopicNodeController();
      const stats: TopicStats = controller.stats();
      expect(stats.nodes).assertEqual(0);
      expect(stats.draws).assertEqual(0);
      expect(stats.touches).assertEqual(0);
      expect(stats.rebuilds).assertEqual(0);
      expect(stats.label).assertEqual('');
      logInfo('testNdkRenderNodeTopicNode0047 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_NODE_0048
     * @tc.name      testNdkRenderNodeTopicNode0048
     * @tc.desc      校验连续重绘 10 次后重绘计数为 10，耗时统计不为负。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicNode0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeTopicNode0048 begin');
      const controller: TopicNodeController = new TopicNodeController();
      const cost: number = controller.invalidateTimes(10);
      expect(controller.stats().draws).assertEqual(10);
      expect(cost >= 0).assertTrue();
      expect(controller.stats().costMs).assertEqual(cost);
      logInfo('testNdkRenderNodeTopicNode0048 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_NODE_0049
     * @tc.name      testNdkRenderNodeTopicNode0049
     * @tc.desc      校验重绘 0 次时不增加重绘计数，耗时为 0。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicNode0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeTopicNode0049 begin');
      const controller: TopicNodeController = new TopicNodeController();
      const cost: number = controller.invalidateTimes(0);
      expect(cost).assertEqual(0);
      expect(controller.stats().draws).assertEqual(0);
      expect(controller.stats().costMs).assertEqual(0);
      logInfo('testNdkRenderNodeTopicNode0049 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_NODE_0050
     * @tc.name      testNdkRenderNodeTopicNode0050
     * @tc.desc      校验统计复位把重绘与耗时归零，但保留当前节点树规模。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicNode0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeTopicNode0050 begin');
      const controller: TopicNodeController = new TopicNodeController();
      expect(rebuildRow(controller, 3)).assertEqual(3);
      controller.invalidateTimes(5);
      expect(controller.stats().draws).assertEqual(5);
      controller.resetStats();
      expect(controller.stats().draws).assertEqual(0);
      expect(controller.stats().costMs).assertEqual(0);
      expect(controller.stats().nodes).assertEqual(3);
      logInfo('testNdkRenderNodeTopicNode0050 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_NODE_0051
     * @tc.name      testNdkRenderNodeTopicNode0051
     * @tc.desc      校验设置标签后统计快照回报该标签，且不影响节点计数。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicNode0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeTopicNode0051 begin');
      const controller: TopicNodeController = new TopicNodeController();
      expect(rebuildRow(controller, 2)).assertEqual(2);
      controller.setLabel('canvas');
      expect(controller.stats().label).assertEqual('canvas');
      expect(controller.stats().nodes).assertEqual(2);
      logInfo('testNdkRenderNodeTopicNode0051 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_NODE_0052
     * @tc.name      testNdkRenderNodeTopicNode0052
     * @tc.desc      校验设置空串标签后统计快照回报空串，不残留上一次的值。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeTopicNode0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeTopicNode0052 begin');
      const controller: TopicNodeController = new TopicNodeController();
      controller.setLabel('canvas');
      controller.setLabel('');
      expect(controller.stats().label).assertEqual('');
      expect(controller.stats().label.length).assertEqual(0);
      expect(controller.stats().nodes).assertEqual(0);
      logInfo('testNdkRenderNodeTopicNode0052 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_NODE_0053
     * @tc.name      testNdkRenderNodeTopicNode0053
     * @tc.desc      校验 128 字符长标签被完整保留，不被截断。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeTopicNode0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeTopicNode0053 begin');
      const controller: TopicNodeController = new TopicNodeController();
      let label: string = '';
      for (let index = 0; index < LONG_LABEL_LENGTH; index++) {
        label += 'a';
      }
      controller.setLabel(label);
      expect(controller.stats().label.length).assertEqual(LONG_LABEL_LENGTH);
      expect(controller.stats().label).assertEqual(label);
      expect(controller.stats().label.charAt(0)).assertEqual('a');
      logInfo('testNdkRenderNodeTopicNode0053 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_NODE_0054
     * @tc.name      testNdkRenderNodeTopicNode0054
     * @tc.desc      校验连续两次设置不同标签时后者生效，不出现两个标签叠加。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicNode0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeTopicNode0054 begin');
      const controller: TopicNodeController = new TopicNodeController();
      controller.setLabel('topic');
      controller.setLabel('frame');
      expect(controller.stats().label).assertEqual('frame');
      expect(controller.stats().label === 'topic').assertFalse();
      expect(controller.stats().label.length).assertEqual(5);
      logInfo('testNdkRenderNodeTopicNode0054 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_NODE_0055
     * @tc.name      testNdkRenderNodeTopicNode0055
     * @tc.desc      校验分批重绘 4 次与 6 次后计数累计到 10，统计不重置。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicNode0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeTopicNode0055 begin');
      const controller: TopicNodeController = new TopicNodeController();
      controller.invalidateTimes(4);
      controller.invalidateTimes(6);
      expect(controller.stats().draws).assertEqual(10);
      expect(controller.stats().nodes).assertEqual(0);
      expect(controller.stats().costMs >= 0).assertTrue();
      logInfo('testNdkRenderNodeTopicNode0055 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_NODE_0056
     * @tc.name      testNdkRenderNodeTopicNode0056
     * @tc.desc      校验销毁后节点树与统计节点数均归零，重复销毁仍为 0。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicNode0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeTopicNode0056 begin');
      const controller: TopicNodeController = new TopicNodeController();
      expect(rebuildRow(controller, 4)).assertEqual(4);
      controller.disposeNode();
      expect(controller.nodeCount()).assertEqual(0);
      expect(controller.stats().nodes).assertEqual(0);
      controller.disposeNode();
      expect(controller.nodeCount()).assertEqual(0);
      logInfo('testNdkRenderNodeTopicNode0056 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_NODE_0057
     * @tc.name      testNdkRenderNodeTopicNode0057
     * @tc.desc      校验新建控制器没有运行中的定时器。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeTopicNode0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeTopicNode0057 begin');
      const controller: TopicNodeController = new TopicNodeController();
      expect(controller.isTicking()).assertFalse();
      expect(controller.nodeCount()).assertEqual(0);
      expect(controller.stats().nodes).assertEqual(0);
      logInfo('testNdkRenderNodeTopicNode0057 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_NODE_0058
     * @tc.name      testNdkRenderNodeTopicNode0058
     * @tc.desc      校验启动帧回调后定时器运行，停止后立即关闭。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicNode0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeTopicNode0058 begin');
      const controller: TopicNodeController = new TopicNodeController();
      try {
        controller.startTick(16, 1);
        expect(controller.isTicking()).assertTrue();
      } finally {
        controller.stopTick();
      }
      expect(controller.isTicking()).assertFalse();
      expect(controller.nodeCount()).assertEqual(0);
      logInfo('testNdkRenderNodeTopicNode0058 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_NODE_0059
     * @tc.name      testNdkRenderNodeTopicNode0059
     * @tc.desc      校验重复启动帧回调只保留一个定时器，停止一次即可全部关闭。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeTopicNode0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeTopicNode0059 begin');
      const controller: TopicNodeController = new TopicNodeController();
      try {
        controller.startTick(16, 1);
        controller.startTick(32, 2);
        expect(controller.isTicking()).assertTrue();
      } finally {
        controller.stopTick();
      }
      expect(controller.isTicking()).assertFalse();
      expect(controller.recordSize()).assertEqual(0);
      logInfo('testNdkRenderNodeTopicNode0059 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_NODE_0060
     * @tc.name      testNdkRenderNodeTopicNode0060
     * @tc.desc      校验启动逐帧动画后定时器运行，停止后关闭且节点树不变。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicNode0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeTopicNode0060 begin');
      const controller: TopicNodeController = new TopicNodeController();
      expect(rebuildRow(controller, 4)).assertEqual(4);
      try {
        controller.startAnimation(0, 1.8, 240, 1);
        expect(controller.isTicking()).assertTrue();
      } finally {
        controller.stopTick();
      }
      expect(controller.isTicking()).assertFalse();
      expect(controller.nodeCount()).assertEqual(4);
      logInfo('testNdkRenderNodeTopicNode0060 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_NODE_0061
     * @tc.name      testNdkRenderNodeTopicNode0061
     * @tc.desc      校验统计复位不影响已启动的帧回调，定时器仍需显式停止。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeTopicNode0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeTopicNode0061 begin');
      const controller: TopicNodeController = new TopicNodeController();
      try {
        controller.startTick(16, 1);
        controller.resetStats();
        expect(controller.isTicking()).assertTrue();
        expect(controller.stats().draws).assertEqual(0);
      } finally {
        controller.stopTick();
      }
      expect(controller.isTicking()).assertFalse();
      logInfo('testNdkRenderNodeTopicNode0061 end');
    })
  })
}