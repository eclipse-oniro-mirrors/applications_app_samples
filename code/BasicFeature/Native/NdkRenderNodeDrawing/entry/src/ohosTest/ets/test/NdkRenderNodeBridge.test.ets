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
import { toVp } from '../../../main/ets/common/UnitUtil';
import { DemoNodeController } from '../../../main/ets/common/DemoRenderNode';
import { CapabilityController, CapabilityRenderNode } from '../../../main/ets/core/SceneRenderNode';
import { GROUP_CANVAS } from '../../../main/ets/core/SchemaTypes';

const TAG: string = '[Sample_NdkRenderNodeBridgeTest]';
const DOMAIN: number = 0xF811;
// 规格常量：DemoRenderNode 的默认场景为第一个图元场景，节点在 makeNode 之前为 null。
const DEFAULT_SCENE: number = 0;
const DEFAULT_KIND: number = 0;
const GROUP_PAINT: number = 3;
const SCENE_SAMPLE: number = 2;
const LAYOUT_SIZE: number = 100;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

export default function ndkRenderNodeBridgeTest(): void {
  describe('NdkRenderNodeBridge', () => {
    /**
     * @tc.number    SUB_RENDER_NODE_BRIDGE_0001
     * @tc.name      testNdkRenderNodeBridge0001
     * @tc.desc      校验数值型长度原样转成 vp，整数不会被二次换算。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeBridge0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeBridge0001 begin');
      expect(toVp(24)).assertEqual(24);
      expect(toVp(1)).assertEqual(1);
      expect(toVp(24) === 24.5).assertFalse();
      logInfo('testNdkRenderNodeBridge0001 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_BRIDGE_0002
     * @tc.name      testNdkRenderNodeBridge0002
     * @tc.desc      校验数值 0 转换后仍为 0，不被当成缺省值替换。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeBridge0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeBridge0002 begin');
      expect(toVp(0)).assertEqual(0);
      expect(Number.isFinite(toVp(0))).assertTrue();
      expect(toVp(0) > 0).assertFalse();
      logInfo('testNdkRenderNodeBridge0002 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_BRIDGE_0003
     * @tc.name      testNdkRenderNodeBridge0003
     * @tc.desc      校验负数值原样透传，转换函数不做符号裁剪。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeBridge0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeBridge0003 begin');
      expect(toVp(-5)).assertEqual(-5);
      expect(toVp(-5) < 0).assertTrue();
      expect(toVp(-5) === 5).assertFalse();
      logInfo('testNdkRenderNodeBridge0003 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_BRIDGE_0004
     * @tc.name      testNdkRenderNodeBridge0004
     * @tc.desc      校验纯数字字符串按数值解析，'24' 转换为 24。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeBridge0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeBridge0004 begin');
      expect(toVp('24')).assertEqual(24);
      expect(toVp('24') > 0).assertTrue();
      expect(Number.isInteger(toVp('24'))).assertTrue();
      logInfo('testNdkRenderNodeBridge0004 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_BRIDGE_0005
     * @tc.name      testNdkRenderNodeBridge0005
     * @tc.desc      校验带小数点的数字字符串按小数解析，'24.5' 转换为 24.5。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeBridge0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeBridge0005 begin');
      expect(toVp('24.5')).assertEqual(24.5);
      expect(toVp('24.5') > 24).assertTrue();
      expect(Number.isInteger(toVp('24.5'))).assertFalse();
      logInfo('testNdkRenderNodeBridge0005 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_BRIDGE_0006
     * @tc.name      testNdkRenderNodeBridge0006
     * @tc.desc      校验空字符串解析为 0，不会返回 NaN 污染 vp 尺寸。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeBridge0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeBridge0006 begin');
      expect(toVp('')).assertEqual(0);
      expect(Number.isNaN(toVp(''))).assertFalse();
      expect(Number.isInteger(toVp(''))).assertTrue();
      logInfo('testNdkRenderNodeBridge0006 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_BRIDGE_0007
     * @tc.name      testNdkRenderNodeBridge0007
     * @tc.desc      校验非数字字符串回退为 0，非法输入不会抛异常。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeBridge0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeBridge0007 begin');
      expect(toVp('abc')).assertEqual(0);
      expect(toVp('')).assertEqual(toVp('abc'));
      expect(Number.isFinite(toVp('abc'))).assertTrue();
      logInfo('testNdkRenderNodeBridge0007 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_BRIDGE_0008
     * @tc.name      testNdkRenderNodeBridge0008
     * @tc.desc      校验带单位后缀的数字串会去掉单位后再解析，不再因 NaN 静默退化为 0。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeBridge0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeBridge0008 begin');
      expect(toVp('12vp')).assertEqual(12);
      expect(toVp('12vp') === 12).assertTrue();
      expect(toVp('12px')).assertEqual(12);
      logInfo('testNdkRenderNodeBridge0008 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_BRIDGE_0009
     * @tc.name      testNdkRenderNodeBridge0009
     * @tc.desc      校验最大安全整数原样返回，转换过程不发生精度丢失。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeBridge0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeBridge0009 begin');
      const value: number = Number.MAX_SAFE_INTEGER;
      expect(toVp(value)).assertEqual(value);
      expect(Number.isSafeInteger(toVp(value))).assertTrue();
      expect(toVp(value) === value - 1).assertFalse();
      logInfo('testNdkRenderNodeBridge0009 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_BRIDGE_0010
     * @tc.name      testNdkRenderNodeBridge0010
     * @tc.desc      校验数值 NaN 原样返回，本函数只对字符串做兜底。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeBridge0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeBridge0010 begin');
      expect(Number.isNaN(toVp(Number.NaN))).assertTrue();
      expect(toVp(Number.NaN) === 0).assertFalse();
      expect(toVp('NaN')).assertEqual(0);
      logInfo('testNdkRenderNodeBridge0010 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_BRIDGE_0011
     * @tc.name      testNdkRenderNodeBridge0011
     * @tc.desc      校验新建演示控制器尚未挂载渲染节点，重复读取仍为空。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeBridge0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeBridge0011 begin');
      const controller: DemoNodeController = new DemoNodeController();
      expect(controller.getNode() === null).assertTrue();
      const other: DemoNodeController = new DemoNodeController();
      expect(other.getNode() === null).assertTrue();
      expect(other === controller).assertFalse();
      logInfo('testNdkRenderNodeBridge0011 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_BRIDGE_0012
     * @tc.name      testNdkRenderNodeBridge0012
     * @tc.desc      校验未挂载时设置场景与像素图不创建渲染节点，调用被静默丢弃。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeBridge0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeBridge0012 begin');
      const controller: DemoNodeController = new DemoNodeController();
      controller.setScene(DEFAULT_SCENE, DEFAULT_KIND);
      expect(controller.getNode() === null).assertTrue();
      controller.setPixelMap(undefined);
      expect(controller.getNode() === null).assertTrue();
      controller.setScene(DEFAULT_SCENE + 1, DEFAULT_KIND + 1);
      expect(controller.getNode() === null).assertTrue();
      logInfo('testNdkRenderNodeBridge0012 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_BRIDGE_0013
     * @tc.name      testNdkRenderNodeBridge0013
     * @tc.desc      校验未挂载时零尺寸与负尺寸的 resize 都被丢弃，正常尺寸也不会凭空建节点。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeBridge0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeBridge0013 begin');
      const controller: DemoNodeController = new DemoNodeController();
      controller.resize(0, LAYOUT_SIZE);
      expect(controller.getNode() === null).assertTrue();
      controller.resize(-1, LAYOUT_SIZE);
      expect(controller.getNode() === null).assertTrue();
      controller.resize(LAYOUT_SIZE, LAYOUT_SIZE);
      expect(controller.getNode() === null).assertTrue();
      logInfo('testNdkRenderNodeBridge0013 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_BRIDGE_0014
     * @tc.name      testNdkRenderNodeBridge0014
     * @tc.desc      校验未挂载时重绘请求被忽略，连续两次销毁同样安全。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeBridge0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeBridge0014 begin');
      const controller: DemoNodeController = new DemoNodeController();
      controller.invalidate();
      expect(controller.getNode() === null).assertTrue();
      controller.disposeNode();
      const other: DemoNodeController = new DemoNodeController();
      expect(other.getNode() === null).assertTrue();
      controller.disposeNode();
      expect(controller.getNode() === null).assertTrue();
      logInfo('testNdkRenderNodeBridge0014 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_BRIDGE_0015
     * @tc.name      testNdkRenderNodeBridge0015
     * @tc.desc      校验销毁后再设置场景不会复活渲染节点，控制器保持空态。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeBridge0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeBridge0015 begin');
      const controller: DemoNodeController = new DemoNodeController();
      controller.disposeNode();
      expect(controller.getNode() === null).assertTrue();
      controller.setScene(DEFAULT_SCENE, DEFAULT_KIND);
      expect(controller.getNode() === null).assertTrue();
      controller.resize(LAYOUT_SIZE, LAYOUT_SIZE);
      expect(controller.getNode() === null).assertTrue();
      logInfo('testNdkRenderNodeBridge0015 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_BRIDGE_0016
     * @tc.name      testNdkRenderNodeBridge0016
     * @tc.desc      校验新建能力域渲染节点默认落在画布域第 0 个场景。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeBridge0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeBridge0016 begin');
      const node: CapabilityRenderNode = new CapabilityRenderNode();
      expect(node.groupId()).assertEqual(GROUP_CANVAS);
      expect(node.sceneNumber()).assertEqual(0);
      expect(node.groupId() === GROUP_PAINT).assertFalse();
      logInfo('testNdkRenderNodeBridge0016 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_BRIDGE_0017
     * @tc.name      testNdkRenderNodeBridge0017
     * @tc.desc      校验下发场景后能力域编号与场景编号分别回报，互不串值。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeBridge0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeBridge0017 begin');
      const node: CapabilityRenderNode = new CapabilityRenderNode();
      node.applyScene(GROUP_PAINT, SCENE_SAMPLE, [1, 2]);
      expect(node.groupId()).assertEqual(GROUP_PAINT);
      expect(node.sceneNumber()).assertEqual(SCENE_SAMPLE);
      expect(node.groupId() === node.sceneNumber()).assertFalse();
      logInfo('testNdkRenderNodeBridge0017 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_BRIDGE_0018
     * @tc.name      testNdkRenderNodeBridge0018
     * @tc.desc      校验连续两次下发场景时最后一次生效，前一次状态被覆盖。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeBridge0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeBridge0018 begin');
      const node: CapabilityRenderNode = new CapabilityRenderNode();
      node.applyScene(GROUP_PAINT, SCENE_SAMPLE, [1, 2]);
      node.applyScene(GROUP_CANVAS, 5, []);
      expect(node.groupId()).assertEqual(GROUP_CANVAS);
      expect(node.sceneNumber()).assertEqual(5);
      expect(node.groupId() === GROUP_PAINT).assertFalse();
      logInfo('testNdkRenderNodeBridge0018 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_BRIDGE_0019
     * @tc.name      testNdkRenderNodeBridge0019
     * @tc.desc      校验负能力域编号被原样保存，渲染节点不额外做合法性裁剪。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeBridge0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeBridge0019 begin');
      const node: CapabilityRenderNode = new CapabilityRenderNode();
      node.applyScene(-1, -2, []);
      expect(node.groupId()).assertEqual(-1);
      expect(node.sceneNumber()).assertEqual(-2);
      expect(node.groupId() < 0).assertTrue();
      logInfo('testNdkRenderNodeBridge0019 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_BRIDGE_0020
     * @tc.name      testNdkRenderNodeBridge0020
     * @tc.desc      校验超大场景编号被完整保存，编号不做上限截断。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeBridge0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeBridge0020 begin');
      const node: CapabilityRenderNode = new CapabilityRenderNode();
      node.applyScene(GROUP_PAINT, Number.MAX_SAFE_INTEGER, []);
      expect(node.sceneNumber()).assertEqual(Number.MAX_SAFE_INTEGER);
      expect(Number.isSafeInteger(node.sceneNumber())).assertTrue();
      expect(node.groupId()).assertEqual(GROUP_PAINT);
      logInfo('testNdkRenderNodeBridge0020 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_BRIDGE_0021
     * @tc.name      testNdkRenderNodeBridge0021
     * @tc.desc      校验新建能力域控制器尚未挂载渲染节点。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeBridge0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeBridge0021 begin');
      const controller: CapabilityController = new CapabilityController();
      const twin: CapabilityController = new CapabilityController();
      expect(controller.getNode() === null).assertTrue();
      expect(twin.getNode() === null).assertTrue();
      expect(controller === twin).assertFalse();
      logInfo('testNdkRenderNodeBridge0021 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_BRIDGE_0022
     * @tc.name      testNdkRenderNodeBridge0022
     * @tc.desc      校验挂载前下发的场景只进缓存，不提前创建渲染节点。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeBridge0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeBridge0022 begin');
      const controller: CapabilityController = new CapabilityController();
      controller.applyScene(GROUP_PAINT, SCENE_SAMPLE, [1, 2]);
      expect(controller.getNode() === null).assertTrue();
      controller.applyScene(GROUP_CANVAS, 0, []);
      expect(controller.getNode() === null).assertTrue();
      controller.applyScene(GROUP_PAINT, 0, [1]);
      expect(controller.getNode() === null).assertTrue();
      logInfo('testNdkRenderNodeBridge0022 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_BRIDGE_0023
     * @tc.name      testNdkRenderNodeBridge0023
     * @tc.desc      校验零尺寸与负尺寸的 resize 被拒绝，挂载前后都不会建立节点。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeBridge0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeBridge0023 begin');
      const controller: CapabilityController = new CapabilityController();
      controller.resize(0, 0);
      expect(controller.getNode() === null).assertTrue();
      controller.resize(-LAYOUT_SIZE, LAYOUT_SIZE);
      expect(controller.getNode() === null).assertTrue();
      controller.resize(LAYOUT_SIZE, LAYOUT_SIZE);
      expect(controller.getNode() === null).assertTrue();
      logInfo('testNdkRenderNodeBridge0023 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_BRIDGE_0024
     * @tc.name      testNdkRenderNodeBridge0024
     * @tc.desc      校验销毁能力域控制器是幂等的，重复销毁后仍为空态。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeBridge0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeBridge0024 begin');
      const controller: CapabilityController = new CapabilityController();
      controller.disposeNode();
      expect(controller.getNode() === null).assertTrue();
      controller.disposeNode();
      expect(controller.getNode() === null).assertTrue();
      controller.resize(0, 0);
      expect(controller.getNode() === null).assertTrue();
      logInfo('testNdkRenderNodeBridge0024 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_BRIDGE_0025
     * @tc.name      testNdkRenderNodeBridge0025
     * @tc.desc      校验销毁后再下发场景不会复活节点，控制器保持空态。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeBridge0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeBridge0025 begin');
      const controller: CapabilityController = new CapabilityController();
      controller.applyScene(GROUP_PAINT, SCENE_SAMPLE, []);
      controller.disposeNode();
      expect(controller.getNode() === null).assertTrue();
      controller.applyScene(GROUP_CANVAS, 1, []);
      expect(controller.getNode() === null).assertTrue();
      controller.resize(LAYOUT_SIZE, LAYOUT_SIZE);
      expect(controller.getNode() === null).assertTrue();
      logInfo('testNdkRenderNodeBridge0025 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_BRIDGE_0026
     * @tc.name      testNdkRenderNodeBridge0026
     * @tc.desc      校验两个独立控制器的空态互不影响，销毁其一只影响自身。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeBridge0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeBridge0026 begin');
      const first: CapabilityController = new CapabilityController();
      const second: CapabilityController = new CapabilityController();
      first.disposeNode();
      expect(first.getNode() === null).assertTrue();
      expect(second.getNode() === null).assertTrue();
      expect(first === second).assertFalse();
      logInfo('testNdkRenderNodeBridge0026 end');
    })
  })
}
