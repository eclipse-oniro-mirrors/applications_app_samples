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
import { UIContext } from '@kit.ArkUI';
import {
  GroupSpec, GROUP_BITMAP, GROUP_CANVAS, GROUP_COLOR, GROUP_COLOR_FILTER, GROUP_ERROR, GROUP_FONT, GROUP_GEOMETRY,
  GROUP_IMAGE_FILTER, GROUP_IMAGE_IO, GROUP_MASK_FILTER, GROUP_MATRIX, GROUP_PAINT, GROUP_PIXELMAP, GROUP_RECORD,
  GROUP_SHADER, GROUP_SHADOW, GROUP_OFFSCREEN, GROUP_TEXTBLOB, GROUP_TYPOGRAPHY
} from '../../../main/ets/core/SchemaTypes';
import { defaultsOf, groupById } from './SceneDefaults';
import { HARNESS, HARNESS_SIZE } from './PixelHarness';
import {
  capture, changedPixels, CLEAR_SCENE, digest, readyUiContext, renderScene, waitForRedraw, waitReady
} from './PixelProbe';

const TAG: string = '[Sample_NdkRenderNodeResizeTest]';
const DOMAIN: number = 0xF811;
// 重绘确认的超时：装载场景后 ArkUI 必然在一帧内回调 draw，超过该时长说明节点已失效。
const REDRAW_TIMEOUT_MS: number = 3000;
// 四种画布尺寸变体：零边长、负边长、单像素、超大画布。
const SIZE_ZERO: number = 0;
const SIZE_NEGATIVE: number = -8;
const SIZE_ONE: number = 1;
const SIZE_WIDE: number = 4096;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

// 画布尺寸链路的观测值：一次过链换来四个互不相同的断言维度
// （接受后的宽度、高度、是否继续重绘、恢复基准尺寸后的画面摘要）。
export class ResizeObs {
  public frameWidth: number = 0;
  public frameHeight: number = 0;
  public expectedWidth: number = 0;
  public expectedHeight: number = 0;
  public baselineWidth: number = 0;
  public baselineHeight: number = 0;
  public baselineBytes: number = 0;
  public resizedBytes: number = 0;
  public redrawn: boolean = false;
  public baselineDigest: string = '';
  public resizedDigest: string = '';
  public restoredDigest: string = '';
}

// 走一遍画布尺寸链路：基准 -> 目标尺寸 -> 装载场景重绘 -> 恢复基准，只观测不下断言。
// 这条链路是全部场景的地基：高度一旦被算成 0，所有能力域会同时全白，而编译期完全查不出。
async function runResizeCase(group: number, width: number, height: number, accepted: boolean,
  label: string): Promise<ResizeObs> {
  const observed: ResizeObs = new ResizeObs();
  observed.expectedWidth = accepted ? width : HARNESS_SIZE;
  observed.expectedHeight = accepted ? height : HARNESS_SIZE;
  observed.redrawn = false;
  if (!(await waitReady())) {
    return observed;
  }
  const uiContext: UIContext = readyUiContext();
  const spec: GroupSpec | undefined = groupById(group);
  if (spec === undefined) {
    return observed;
  }
  const params: number[] = defaultsOf(spec, CLEAR_SCENE);
  HARNESS.resize(HARNESS_SIZE, HARNESS_SIZE);
  const baseline: Uint8Array = await renderScene(uiContext, group, CLEAR_SCENE, params);
  observed.baselineWidth = HARNESS.frameWidth();
  observed.baselineHeight = HARNESS.frameHeight();
  observed.baselineBytes = baseline.length;
  observed.baselineDigest = digest(baseline);
  HARNESS.resize(width, height);
  observed.frameWidth = HARNESS.frameWidth();
  observed.frameHeight = HARNESS.frameHeight();
  logInfo(label + ' frame=' + observed.frameWidth.toString() + 'x' + observed.frameHeight.toString());
  // 无论 resize 是否被接受，装载场景都会请求一次重绘：绘制计数必须继续增长，节点没有被废掉。
  HARNESS.load(group, CLEAR_SCENE, params, true);
  observed.redrawn = await waitForRedraw(REDRAW_TIMEOUT_MS);
  const resized: Uint8Array = await capture(uiContext);
  observed.resizedBytes = resized.length;
  observed.resizedDigest = digest(resized);
  HARNESS.resize(HARNESS_SIZE, HARNESS_SIZE);
  const restored: Uint8Array = await renderScene(uiContext, group, CLEAR_SCENE, params);
  observed.restoredDigest = digest(restored);
  logInfo(label + ' restored diff = ' + changedPixels(baseline, restored).toString());
  return observed;
}

export default function ndkRenderNodeResizeTest(): void {
  describe('NdkRenderNodeResize', () => {
    /**
         * @tc.number    SUB_RENDER_NODE_RESIZE_0001
         * @tc.name      testNdkRenderNodeResize0001
         * @tc.desc      校验画布域在零高度画布下，resize 传入零高度时被拒绝，尺寸不变、画面不白且节点继续重绘。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeResize0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ResizeObs = await runResizeCase(GROUP_CANVAS, HARNESS_SIZE, SIZE_ZERO, false, '画布域#零高度画布');
      expect(observed.frameWidth).assertEqual(observed.expectedWidth);
      expect(observed.frameHeight).assertEqual(observed.expectedHeight);
      expect(observed.redrawn).assertTrue();
      expect(observed.restoredDigest).assertEqual(observed.baselineDigest);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_RESIZE_0002
         * @tc.name      testNdkRenderNodeResize0002
         * @tc.desc      校验几何域在零高度画布下，resize 传入零高度时被拒绝，尺寸不变、画面不白且节点继续重绘。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeResize0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ResizeObs = await runResizeCase(GROUP_GEOMETRY, HARNESS_SIZE, SIZE_ZERO, false, '几何域#零高度画布');
      expect(observed.frameWidth).assertEqual(observed.expectedWidth);
      expect(observed.frameHeight).assertEqual(observed.expectedHeight);
      expect(observed.redrawn).assertTrue();
      expect(observed.restoredDigest).assertEqual(observed.baselineDigest);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_RESIZE_0003
         * @tc.name      testNdkRenderNodeResize0003
         * @tc.desc      校验画笔域在零高度画布下，resize 传入零高度时被拒绝，尺寸不变、画面不白且节点继续重绘。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeResize0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ResizeObs = await runResizeCase(GROUP_PAINT, HARNESS_SIZE, SIZE_ZERO, false, '画笔域#零高度画布');
      expect(observed.frameWidth).assertEqual(observed.expectedWidth);
      expect(observed.frameHeight).assertEqual(observed.expectedHeight);
      expect(observed.redrawn).assertTrue();
      expect(observed.restoredDigest).assertEqual(observed.baselineDigest);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_RESIZE_0004
         * @tc.name      testNdkRenderNodeResize0004
         * @tc.desc      校验颜色域在零高度画布下，resize 传入零高度时被拒绝，尺寸不变、画面不白且节点继续重绘。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeResize0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ResizeObs = await runResizeCase(GROUP_COLOR, HARNESS_SIZE, SIZE_ZERO, false, '颜色域#零高度画布');
      expect(observed.frameWidth).assertEqual(observed.expectedWidth);
      expect(observed.frameHeight).assertEqual(observed.expectedHeight);
      expect(observed.redrawn).assertTrue();
      expect(observed.restoredDigest).assertEqual(observed.baselineDigest);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_RESIZE_0005
         * @tc.name      testNdkRenderNodeResize0005
         * @tc.desc      校验颜色滤波器域在零高度画布下，resize 传入零高度时被拒绝，尺寸不变、画面不白且节点继续重绘。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeResize0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ResizeObs = await runResizeCase(GROUP_COLOR_FILTER, HARNESS_SIZE, SIZE_ZERO, false, 
        '颜色滤波器域#零高度画布');
      expect(observed.frameWidth).assertEqual(observed.expectedWidth);
      expect(observed.frameHeight).assertEqual(observed.expectedHeight);
      expect(observed.redrawn).assertTrue();
      expect(observed.restoredDigest).assertEqual(observed.baselineDigest);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_RESIZE_0006
         * @tc.name      testNdkRenderNodeResize0006
         * @tc.desc      校验着色器域在零高度画布下，resize 传入零高度时被拒绝，尺寸不变、画面不白且节点继续重绘。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeResize0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ResizeObs = await runResizeCase(GROUP_SHADER, HARNESS_SIZE, SIZE_ZERO, false, '着色器域#零高度画布');
      expect(observed.frameWidth).assertEqual(observed.expectedWidth);
      expect(observed.frameHeight).assertEqual(observed.expectedHeight);
      expect(observed.redrawn).assertTrue();
      expect(observed.restoredDigest).assertEqual(observed.baselineDigest);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_RESIZE_0007
         * @tc.name      testNdkRenderNodeResize0007
         * @tc.desc      校验遮罩滤波器域在零高度画布下，resize 传入零高度时被拒绝，尺寸不变、画面不白且节点继续重绘。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeResize0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ResizeObs = await runResizeCase(GROUP_MASK_FILTER, HARNESS_SIZE, SIZE_ZERO, false, 
        '遮罩滤波器域#零高度画布');
      expect(observed.frameWidth).assertEqual(observed.expectedWidth);
      expect(observed.frameHeight).assertEqual(observed.expectedHeight);
      expect(observed.redrawn).assertTrue();
      expect(observed.restoredDigest).assertEqual(observed.baselineDigest);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_RESIZE_0008
         * @tc.name      testNdkRenderNodeResize0008
         * @tc.desc      校验图像滤波器域在零高度画布下，resize 传入零高度时被拒绝，尺寸不变、画面不白且节点继续重绘。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeResize0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ResizeObs = await runResizeCase(GROUP_IMAGE_FILTER, HARNESS_SIZE, SIZE_ZERO, false, 
        '图像滤波器域#零高度画布');
      expect(observed.frameWidth).assertEqual(observed.expectedWidth);
      expect(observed.frameHeight).assertEqual(observed.expectedHeight);
      expect(observed.redrawn).assertTrue();
      expect(observed.restoredDigest).assertEqual(observed.baselineDigest);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_RESIZE_0009
         * @tc.name      testNdkRenderNodeResize0009
         * @tc.desc      校验位图域在零高度画布下，resize 传入零高度时被拒绝，尺寸不变、画面不白且节点继续重绘。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeResize0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ResizeObs = await runResizeCase(GROUP_BITMAP, HARNESS_SIZE, SIZE_ZERO, false, '位图域#零高度画布');
      expect(observed.frameWidth).assertEqual(observed.expectedWidth);
      expect(observed.frameHeight).assertEqual(observed.expectedHeight);
      expect(observed.redrawn).assertTrue();
      expect(observed.restoredDigest).assertEqual(observed.baselineDigest);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_RESIZE_0010
         * @tc.name      testNdkRenderNodeResize0010
         * @tc.desc      校验像素图域在零高度画布下，resize 传入零高度时被拒绝，尺寸不变、画面不白且节点继续重绘。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeResize0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ResizeObs = await runResizeCase(GROUP_PIXELMAP, HARNESS_SIZE, SIZE_ZERO, false, '像素图域#零高度画布');
      expect(observed.frameWidth).assertEqual(observed.expectedWidth);
      expect(observed.frameHeight).assertEqual(observed.expectedHeight);
      expect(observed.redrawn).assertTrue();
      expect(observed.restoredDigest).assertEqual(observed.baselineDigest);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_RESIZE_0011
         * @tc.name      testNdkRenderNodeResize0011
         * @tc.desc      校验图片编解码域在零高度画布下，resize 传入零高度时被拒绝，尺寸不变、画面不白且节点继续重绘。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeResize0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ResizeObs = await runResizeCase(GROUP_IMAGE_IO, HARNESS_SIZE, SIZE_ZERO, false, '图片编解码域#零高度画布');
      expect(observed.frameWidth).assertEqual(observed.expectedWidth);
      expect(observed.frameHeight).assertEqual(observed.expectedHeight);
      expect(observed.redrawn).assertTrue();
      expect(observed.restoredDigest).assertEqual(observed.baselineDigest);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_RESIZE_0012
         * @tc.name      testNdkRenderNodeResize0012
         * @tc.desc      校验字体域在零高度画布下，resize 传入零高度时被拒绝，尺寸不变、画面不白且节点继续重绘。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeResize0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ResizeObs = await runResizeCase(GROUP_FONT, HARNESS_SIZE, SIZE_ZERO, false, '字体域#零高度画布');
      expect(observed.frameWidth).assertEqual(observed.expectedWidth);
      expect(observed.frameHeight).assertEqual(observed.expectedHeight);
      expect(observed.redrawn).assertTrue();
      expect(observed.restoredDigest).assertEqual(observed.baselineDigest);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_RESIZE_0013
         * @tc.name      testNdkRenderNodeResize0013
         * @tc.desc      校验文本块域在零高度画布下，resize 传入零高度时被拒绝，尺寸不变、画面不白且节点继续重绘。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeResize0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ResizeObs = await runResizeCase(GROUP_TEXTBLOB, HARNESS_SIZE, SIZE_ZERO, false, '文本块域#零高度画布');
      expect(observed.frameWidth).assertEqual(observed.expectedWidth);
      expect(observed.frameHeight).assertEqual(observed.expectedHeight);
      expect(observed.redrawn).assertTrue();
      expect(observed.restoredDigest).assertEqual(observed.baselineDigest);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_RESIZE_0014
         * @tc.name      testNdkRenderNodeResize0014
         * @tc.desc      校验排版域在零高度画布下，resize 传入零高度时被拒绝，尺寸不变、画面不白且节点继续重绘。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeResize0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ResizeObs = await runResizeCase(GROUP_TYPOGRAPHY, HARNESS_SIZE, SIZE_ZERO, false, '排版域#零高度画布');
      expect(observed.frameWidth).assertEqual(observed.expectedWidth);
      expect(observed.frameHeight).assertEqual(observed.expectedHeight);
      expect(observed.redrawn).assertTrue();
      expect(observed.restoredDigest).assertEqual(observed.baselineDigest);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_RESIZE_0015
         * @tc.name      testNdkRenderNodeResize0015
         * @tc.desc      校验阴影域在零高度画布下，resize 传入零高度时被拒绝，尺寸不变、画面不白且节点继续重绘。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeResize0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ResizeObs = await runResizeCase(GROUP_SHADOW, HARNESS_SIZE, SIZE_ZERO, false, '阴影域#零高度画布');
      expect(observed.frameWidth).assertEqual(observed.expectedWidth);
      expect(observed.frameHeight).assertEqual(observed.expectedHeight);
      expect(observed.redrawn).assertTrue();
      expect(observed.restoredDigest).assertEqual(observed.baselineDigest);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_RESIZE_0016
         * @tc.name      testNdkRenderNodeResize0016
         * @tc.desc      校验矩阵域在零高度画布下，resize 传入零高度时被拒绝，尺寸不变、画面不白且节点继续重绘。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeResize0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ResizeObs = await runResizeCase(GROUP_MATRIX, HARNESS_SIZE, SIZE_ZERO, false, '矩阵域#零高度画布');
      expect(observed.frameWidth).assertEqual(observed.expectedWidth);
      expect(observed.frameHeight).assertEqual(observed.expectedHeight);
      expect(observed.redrawn).assertTrue();
      expect(observed.restoredDigest).assertEqual(observed.baselineDigest);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_RESIZE_0017
         * @tc.name      testNdkRenderNodeResize0017
         * @tc.desc      校验录制指令域在零高度画布下，resize 传入零高度时被拒绝，尺寸不变、画面不白且节点继续重绘。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeResize0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ResizeObs = await runResizeCase(GROUP_RECORD, HARNESS_SIZE, SIZE_ZERO, false, '录制指令域#零高度画布');
      expect(observed.frameWidth).assertEqual(observed.expectedWidth);
      expect(observed.frameHeight).assertEqual(observed.expectedHeight);
      expect(observed.redrawn).assertTrue();
      expect(observed.restoredDigest).assertEqual(observed.baselineDigest);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_RESIZE_0018
         * @tc.name      testNdkRenderNodeResize0018
         * @tc.desc      校验离屏绘制域在零高度画布下，resize 传入零高度时被拒绝，尺寸不变、画面不白且节点继续重绘。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeResize0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ResizeObs = await runResizeCase(GROUP_OFFSCREEN, HARNESS_SIZE, SIZE_ZERO, false, '离屏绘制域#零高度画布');
      expect(observed.frameWidth).assertEqual(observed.expectedWidth);
      expect(observed.frameHeight).assertEqual(observed.expectedHeight);
      expect(observed.redrawn).assertTrue();
      expect(observed.restoredDigest).assertEqual(observed.baselineDigest);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_RESIZE_0019
         * @tc.name      testNdkRenderNodeResize0019
         * @tc.desc      校验错误码域在零高度画布下，resize 传入零高度时被拒绝，尺寸不变、画面不白且节点继续重绘。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeResize0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ResizeObs = await runResizeCase(GROUP_ERROR, HARNESS_SIZE, SIZE_ZERO, false, '错误码域#零高度画布');
      expect(observed.frameWidth).assertEqual(observed.expectedWidth);
      expect(observed.frameHeight).assertEqual(observed.expectedHeight);
      expect(observed.redrawn).assertTrue();
      expect(observed.restoredDigest).assertEqual(observed.baselineDigest);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_RESIZE_0020
         * @tc.name      testNdkRenderNodeResize0020
         * @tc.desc      校验画布域在负尺寸画布下，resize 传入负尺寸时被拒绝，尺寸不变、画面不白且节点继续重绘。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeResize0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ResizeObs = await runResizeCase(GROUP_CANVAS, SIZE_NEGATIVE, SIZE_NEGATIVE, false, '画布域#负尺寸画布');
      expect(observed.frameWidth).assertEqual(observed.expectedWidth);
      expect(observed.frameHeight).assertEqual(observed.expectedHeight);
      expect(observed.redrawn).assertTrue();
      expect(observed.restoredDigest).assertEqual(observed.baselineDigest);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_RESIZE_0021
         * @tc.name      testNdkRenderNodeResize0021
         * @tc.desc      校验几何域在负尺寸画布下，resize 传入负尺寸时被拒绝，尺寸不变、画面不白且节点继续重绘。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeResize0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ResizeObs = await runResizeCase(GROUP_GEOMETRY, SIZE_NEGATIVE, SIZE_NEGATIVE, false, '几何域#负尺寸画布');
      expect(observed.frameWidth).assertEqual(observed.expectedWidth);
      expect(observed.frameHeight).assertEqual(observed.expectedHeight);
      expect(observed.redrawn).assertTrue();
      expect(observed.restoredDigest).assertEqual(observed.baselineDigest);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_RESIZE_0022
         * @tc.name      testNdkRenderNodeResize0022
         * @tc.desc      校验画笔域在负尺寸画布下，resize 传入负尺寸时被拒绝，尺寸不变、画面不白且节点继续重绘。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeResize0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ResizeObs = await runResizeCase(GROUP_PAINT, SIZE_NEGATIVE, SIZE_NEGATIVE, false, '画笔域#负尺寸画布');
      expect(observed.frameWidth).assertEqual(observed.expectedWidth);
      expect(observed.frameHeight).assertEqual(observed.expectedHeight);
      expect(observed.redrawn).assertTrue();
      expect(observed.restoredDigest).assertEqual(observed.baselineDigest);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_RESIZE_0023
         * @tc.name      testNdkRenderNodeResize0023
         * @tc.desc      校验颜色域在负尺寸画布下，resize 传入负尺寸时被拒绝，尺寸不变、画面不白且节点继续重绘。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeResize0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ResizeObs = await runResizeCase(GROUP_COLOR, SIZE_NEGATIVE, SIZE_NEGATIVE, false, '颜色域#负尺寸画布');
      expect(observed.frameWidth).assertEqual(observed.expectedWidth);
      expect(observed.frameHeight).assertEqual(observed.expectedHeight);
      expect(observed.redrawn).assertTrue();
      expect(observed.restoredDigest).assertEqual(observed.baselineDigest);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_RESIZE_0024
         * @tc.name      testNdkRenderNodeResize0024
         * @tc.desc      校验颜色滤波器域在负尺寸画布下，resize 传入负尺寸时被拒绝，尺寸不变、画面不白且节点继续重绘。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeResize0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ResizeObs = await runResizeCase(GROUP_COLOR_FILTER, SIZE_NEGATIVE, SIZE_NEGATIVE, false, 
        '颜色滤波器域#负尺寸画布');
      expect(observed.frameWidth).assertEqual(observed.expectedWidth);
      expect(observed.frameHeight).assertEqual(observed.expectedHeight);
      expect(observed.redrawn).assertTrue();
      expect(observed.restoredDigest).assertEqual(observed.baselineDigest);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_RESIZE_0025
         * @tc.name      testNdkRenderNodeResize0025
         * @tc.desc      校验着色器域在负尺寸画布下，resize 传入负尺寸时被拒绝，尺寸不变、画面不白且节点继续重绘。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeResize0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ResizeObs = await runResizeCase(GROUP_SHADER, SIZE_NEGATIVE, SIZE_NEGATIVE, false, '着色器域#负尺寸画布');
      expect(observed.frameWidth).assertEqual(observed.expectedWidth);
      expect(observed.frameHeight).assertEqual(observed.expectedHeight);
      expect(observed.redrawn).assertTrue();
      expect(observed.restoredDigest).assertEqual(observed.baselineDigest);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_RESIZE_0026
         * @tc.name      testNdkRenderNodeResize0026
         * @tc.desc      校验遮罩滤波器域在负尺寸画布下，resize 传入负尺寸时被拒绝，尺寸不变、画面不白且节点继续重绘。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeResize0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ResizeObs = await runResizeCase(GROUP_MASK_FILTER, SIZE_NEGATIVE, SIZE_NEGATIVE, false, 
        '遮罩滤波器域#负尺寸画布');
      expect(observed.frameWidth).assertEqual(observed.expectedWidth);
      expect(observed.frameHeight).assertEqual(observed.expectedHeight);
      expect(observed.redrawn).assertTrue();
      expect(observed.restoredDigest).assertEqual(observed.baselineDigest);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_RESIZE_0027
         * @tc.name      testNdkRenderNodeResize0027
         * @tc.desc      校验图像滤波器域在负尺寸画布下，resize 传入负尺寸时被拒绝，尺寸不变、画面不白且节点继续重绘。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeResize0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ResizeObs = await runResizeCase(GROUP_IMAGE_FILTER, SIZE_NEGATIVE, SIZE_NEGATIVE, false, 
        '图像滤波器域#负尺寸画布');
      expect(observed.frameWidth).assertEqual(observed.expectedWidth);
      expect(observed.frameHeight).assertEqual(observed.expectedHeight);
      expect(observed.redrawn).assertTrue();
      expect(observed.restoredDigest).assertEqual(observed.baselineDigest);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_RESIZE_0028
         * @tc.name      testNdkRenderNodeResize0028
         * @tc.desc      校验位图域在负尺寸画布下，resize 传入负尺寸时被拒绝，尺寸不变、画面不白且节点继续重绘。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeResize0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ResizeObs = await runResizeCase(GROUP_BITMAP, SIZE_NEGATIVE, SIZE_NEGATIVE, false, '位图域#负尺寸画布');
      expect(observed.frameWidth).assertEqual(observed.expectedWidth);
      expect(observed.frameHeight).assertEqual(observed.expectedHeight);
      expect(observed.redrawn).assertTrue();
      expect(observed.restoredDigest).assertEqual(observed.baselineDigest);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_RESIZE_0029
         * @tc.name      testNdkRenderNodeResize0029
         * @tc.desc      校验像素图域在负尺寸画布下，resize 传入负尺寸时被拒绝，尺寸不变、画面不白且节点继续重绘。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeResize0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ResizeObs = await runResizeCase(GROUP_PIXELMAP, SIZE_NEGATIVE, SIZE_NEGATIVE, false, 
        '像素图域#负尺寸画布');
      expect(observed.frameWidth).assertEqual(observed.expectedWidth);
      expect(observed.frameHeight).assertEqual(observed.expectedHeight);
      expect(observed.redrawn).assertTrue();
      expect(observed.restoredDigest).assertEqual(observed.baselineDigest);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_RESIZE_0030
         * @tc.name      testNdkRenderNodeResize0030
         * @tc.desc      校验图片编解码域在负尺寸画布下，resize 传入负尺寸时被拒绝，尺寸不变、画面不白且节点继续重绘。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeResize0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ResizeObs = await runResizeCase(GROUP_IMAGE_IO, SIZE_NEGATIVE, SIZE_NEGATIVE, false, 
        '图片编解码域#负尺寸画布');
      expect(observed.frameWidth).assertEqual(observed.expectedWidth);
      expect(observed.frameHeight).assertEqual(observed.expectedHeight);
      expect(observed.redrawn).assertTrue();
      expect(observed.restoredDigest).assertEqual(observed.baselineDigest);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_RESIZE_0031
         * @tc.name      testNdkRenderNodeResize0031
         * @tc.desc      校验字体域在负尺寸画布下，resize 传入负尺寸时被拒绝，尺寸不变、画面不白且节点继续重绘。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeResize0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ResizeObs = await runResizeCase(GROUP_FONT, SIZE_NEGATIVE, SIZE_NEGATIVE, false, '字体域#负尺寸画布');
      expect(observed.frameWidth).assertEqual(observed.expectedWidth);
      expect(observed.frameHeight).assertEqual(observed.expectedHeight);
      expect(observed.redrawn).assertTrue();
      expect(observed.restoredDigest).assertEqual(observed.baselineDigest);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_RESIZE_0032
         * @tc.name      testNdkRenderNodeResize0032
         * @tc.desc      校验文本块域在负尺寸画布下，resize 传入负尺寸时被拒绝，尺寸不变、画面不白且节点继续重绘。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeResize0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ResizeObs = await runResizeCase(GROUP_TEXTBLOB, SIZE_NEGATIVE, SIZE_NEGATIVE, false, 
        '文本块域#负尺寸画布');
      expect(observed.frameWidth).assertEqual(observed.expectedWidth);
      expect(observed.frameHeight).assertEqual(observed.expectedHeight);
      expect(observed.redrawn).assertTrue();
      expect(observed.restoredDigest).assertEqual(observed.baselineDigest);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_RESIZE_0033
         * @tc.name      testNdkRenderNodeResize0033
         * @tc.desc      校验排版域在负尺寸画布下，resize 传入负尺寸时被拒绝，尺寸不变、画面不白且节点继续重绘。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeResize0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ResizeObs = await runResizeCase(GROUP_TYPOGRAPHY, SIZE_NEGATIVE, SIZE_NEGATIVE, false, 
        '排版域#负尺寸画布');
      expect(observed.frameWidth).assertEqual(observed.expectedWidth);
      expect(observed.frameHeight).assertEqual(observed.expectedHeight);
      expect(observed.redrawn).assertTrue();
      expect(observed.restoredDigest).assertEqual(observed.baselineDigest);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_RESIZE_0034
         * @tc.name      testNdkRenderNodeResize0034
         * @tc.desc      校验阴影域在负尺寸画布下，resize 传入负尺寸时被拒绝，尺寸不变、画面不白且节点继续重绘。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeResize0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ResizeObs = await runResizeCase(GROUP_SHADOW, SIZE_NEGATIVE, SIZE_NEGATIVE, false, '阴影域#负尺寸画布');
      expect(observed.frameWidth).assertEqual(observed.expectedWidth);
      expect(observed.frameHeight).assertEqual(observed.expectedHeight);
      expect(observed.redrawn).assertTrue();
      expect(observed.restoredDigest).assertEqual(observed.baselineDigest);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_RESIZE_0035
         * @tc.name      testNdkRenderNodeResize0035
         * @tc.desc      校验矩阵域在负尺寸画布下，resize 传入负尺寸时被拒绝，尺寸不变、画面不白且节点继续重绘。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeResize0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ResizeObs = await runResizeCase(GROUP_MATRIX, SIZE_NEGATIVE, SIZE_NEGATIVE, false, '矩阵域#负尺寸画布');
      expect(observed.frameWidth).assertEqual(observed.expectedWidth);
      expect(observed.frameHeight).assertEqual(observed.expectedHeight);
      expect(observed.redrawn).assertTrue();
      expect(observed.restoredDigest).assertEqual(observed.baselineDigest);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_RESIZE_0036
         * @tc.name      testNdkRenderNodeResize0036
         * @tc.desc      校验录制指令域在负尺寸画布下，resize 传入负尺寸时被拒绝，尺寸不变、画面不白且节点继续重绘。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeResize0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ResizeObs = await runResizeCase(GROUP_RECORD, SIZE_NEGATIVE, SIZE_NEGATIVE, false, '录制指令域#负尺寸画布');
      expect(observed.frameWidth).assertEqual(observed.expectedWidth);
      expect(observed.frameHeight).assertEqual(observed.expectedHeight);
      expect(observed.redrawn).assertTrue();
      expect(observed.restoredDigest).assertEqual(observed.baselineDigest);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_RESIZE_0037
         * @tc.name      testNdkRenderNodeResize0037
         * @tc.desc      校验离屏绘制域在负尺寸画布下，resize 传入负尺寸时被拒绝，尺寸不变、画面不白且节点继续重绘。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeResize0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ResizeObs = await runResizeCase(GROUP_OFFSCREEN, SIZE_NEGATIVE, SIZE_NEGATIVE, false, 
        '离屏绘制域#负尺寸画布');
      expect(observed.frameWidth).assertEqual(observed.expectedWidth);
      expect(observed.frameHeight).assertEqual(observed.expectedHeight);
      expect(observed.redrawn).assertTrue();
      expect(observed.restoredDigest).assertEqual(observed.baselineDigest);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_RESIZE_0038
         * @tc.name      testNdkRenderNodeResize0038
         * @tc.desc      校验错误码域在负尺寸画布下，resize 传入负尺寸时被拒绝，尺寸不变、画面不白且节点继续重绘。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeResize0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ResizeObs = await runResizeCase(GROUP_ERROR, SIZE_NEGATIVE, SIZE_NEGATIVE, false, '错误码域#负尺寸画布');
      expect(observed.frameWidth).assertEqual(observed.expectedWidth);
      expect(observed.frameHeight).assertEqual(observed.expectedHeight);
      expect(observed.redrawn).assertTrue();
      expect(observed.restoredDigest).assertEqual(observed.baselineDigest);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_RESIZE_0039
         * @tc.name      testNdkRenderNodeResize0039
         * @tc.desc      校验画布域在单像素画布下，resize 收敛到 1x1 时被接受，绘制不中断且恢复标准画布后画面回到基准。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeResize0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ResizeObs = await runResizeCase(GROUP_CANVAS, SIZE_ONE, SIZE_ONE, true, '画布域#单像素画布');
      expect(observed.frameWidth).assertEqual(observed.expectedWidth);
      expect(observed.frameHeight).assertEqual(observed.expectedHeight);
      expect(observed.redrawn).assertTrue();
      expect(observed.restoredDigest).assertEqual(observed.baselineDigest);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_RESIZE_0040
         * @tc.name      testNdkRenderNodeResize0040
         * @tc.desc      校验几何域在单像素画布下，resize 收敛到 1x1 时被接受，绘制不中断且恢复标准画布后画面回到基准。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeResize0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ResizeObs = await runResizeCase(GROUP_GEOMETRY, SIZE_ONE, SIZE_ONE, true, '几何域#单像素画布');
      expect(observed.frameWidth).assertEqual(observed.expectedWidth);
      expect(observed.frameHeight).assertEqual(observed.expectedHeight);
      expect(observed.redrawn).assertTrue();
      expect(observed.restoredDigest).assertEqual(observed.baselineDigest);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_RESIZE_0041
         * @tc.name      testNdkRenderNodeResize0041
         * @tc.desc      校验画笔域在单像素画布下，resize 收敛到 1x1 时被接受，绘制不中断且恢复标准画布后画面回到基准。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeResize0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ResizeObs = await runResizeCase(GROUP_PAINT, SIZE_ONE, SIZE_ONE, true, '画笔域#单像素画布');
      expect(observed.frameWidth).assertEqual(observed.expectedWidth);
      expect(observed.frameHeight).assertEqual(observed.expectedHeight);
      expect(observed.redrawn).assertTrue();
      expect(observed.restoredDigest).assertEqual(observed.baselineDigest);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_RESIZE_0042
         * @tc.name      testNdkRenderNodeResize0042
         * @tc.desc      校验颜色域在单像素画布下，resize 收敛到 1x1 时被接受，绘制不中断且恢复标准画布后画面回到基准。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeResize0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ResizeObs = await runResizeCase(GROUP_COLOR, SIZE_ONE, SIZE_ONE, true, '颜色域#单像素画布');
      expect(observed.frameWidth).assertEqual(observed.expectedWidth);
      expect(observed.frameHeight).assertEqual(observed.expectedHeight);
      expect(observed.redrawn).assertTrue();
      expect(observed.restoredDigest).assertEqual(observed.baselineDigest);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_RESIZE_0043
         * @tc.name      testNdkRenderNodeResize0043
         * @tc.desc      校验颜色滤波器域在单像素画布下，resize 收敛到 1x1 时被接受，绘制不中断且恢复标准画布后画面回到基准。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeResize0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ResizeObs = await runResizeCase(GROUP_COLOR_FILTER, SIZE_ONE, SIZE_ONE, true, '颜色滤波器域#单像素画布');
      expect(observed.frameWidth).assertEqual(observed.expectedWidth);
      expect(observed.frameHeight).assertEqual(observed.expectedHeight);
      expect(observed.redrawn).assertTrue();
      expect(observed.restoredDigest).assertEqual(observed.baselineDigest);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_RESIZE_0044
         * @tc.name      testNdkRenderNodeResize0044
         * @tc.desc      校验着色器域在单像素画布下，resize 收敛到 1x1 时被接受，绘制不中断且恢复标准画布后画面回到基准。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeResize0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ResizeObs = await runResizeCase(GROUP_SHADER, SIZE_ONE, SIZE_ONE, true, '着色器域#单像素画布');
      expect(observed.frameWidth).assertEqual(observed.expectedWidth);
      expect(observed.frameHeight).assertEqual(observed.expectedHeight);
      expect(observed.redrawn).assertTrue();
      expect(observed.restoredDigest).assertEqual(observed.baselineDigest);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_RESIZE_0045
         * @tc.name      testNdkRenderNodeResize0045
         * @tc.desc      校验遮罩滤波器域在单像素画布下，resize 收敛到 1x1 时被接受，绘制不中断且恢复标准画布后画面回到基准。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeResize0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ResizeObs = await runResizeCase(GROUP_MASK_FILTER, SIZE_ONE, SIZE_ONE, true, '遮罩滤波器域#单像素画布');
      expect(observed.frameWidth).assertEqual(observed.expectedWidth);
      expect(observed.frameHeight).assertEqual(observed.expectedHeight);
      expect(observed.redrawn).assertTrue();
      expect(observed.restoredDigest).assertEqual(observed.baselineDigest);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_RESIZE_0046
         * @tc.name      testNdkRenderNodeResize0046
         * @tc.desc      校验图像滤波器域在单像素画布下，resize 收敛到 1x1 时被接受，绘制不中断且恢复标准画布后画面回到基准。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeResize0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ResizeObs = await runResizeCase(GROUP_IMAGE_FILTER, SIZE_ONE, SIZE_ONE, true, '图像滤波器域#单像素画布');
      expect(observed.frameWidth).assertEqual(observed.expectedWidth);
      expect(observed.frameHeight).assertEqual(observed.expectedHeight);
      expect(observed.redrawn).assertTrue();
      expect(observed.restoredDigest).assertEqual(observed.baselineDigest);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_RESIZE_0047
         * @tc.name      testNdkRenderNodeResize0047
         * @tc.desc      校验位图域在单像素画布下，resize 收敛到 1x1 时被接受，绘制不中断且恢复标准画布后画面回到基准。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeResize0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ResizeObs = await runResizeCase(GROUP_BITMAP, SIZE_ONE, SIZE_ONE, true, '位图域#单像素画布');
      expect(observed.frameWidth).assertEqual(observed.expectedWidth);
      expect(observed.frameHeight).assertEqual(observed.expectedHeight);
      expect(observed.redrawn).assertTrue();
      expect(observed.restoredDigest).assertEqual(observed.baselineDigest);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_RESIZE_0048
         * @tc.name      testNdkRenderNodeResize0048
         * @tc.desc      校验像素图域在单像素画布下，resize 收敛到 1x1 时被接受，绘制不中断且恢复标准画布后画面回到基准。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeResize0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ResizeObs = await runResizeCase(GROUP_PIXELMAP, SIZE_ONE, SIZE_ONE, true, '像素图域#单像素画布');
      expect(observed.frameWidth).assertEqual(observed.expectedWidth);
      expect(observed.frameHeight).assertEqual(observed.expectedHeight);
      expect(observed.redrawn).assertTrue();
      expect(observed.restoredDigest).assertEqual(observed.baselineDigest);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_RESIZE_0049
         * @tc.name      testNdkRenderNodeResize0049
         * @tc.desc      校验图片编解码域在单像素画布下，resize 收敛到 1x1 时被接受，绘制不中断且恢复标准画布后画面回到基准。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeResize0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ResizeObs = await runResizeCase(GROUP_IMAGE_IO, SIZE_ONE, SIZE_ONE, true, '图片编解码域#单像素画布');
      expect(observed.frameWidth).assertEqual(observed.expectedWidth);
      expect(observed.frameHeight).assertEqual(observed.expectedHeight);
      expect(observed.redrawn).assertTrue();
      expect(observed.restoredDigest).assertEqual(observed.baselineDigest);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_RESIZE_0050
         * @tc.name      testNdkRenderNodeResize0050
         * @tc.desc      校验字体域在单像素画布下，resize 收敛到 1x1 时被接受，绘制不中断且恢复标准画布后画面回到基准。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeResize0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ResizeObs = await runResizeCase(GROUP_FONT, SIZE_ONE, SIZE_ONE, true, '字体域#单像素画布');
      expect(observed.frameWidth).assertEqual(observed.expectedWidth);
      expect(observed.frameHeight).assertEqual(observed.expectedHeight);
      expect(observed.redrawn).assertTrue();
      expect(observed.restoredDigest).assertEqual(observed.baselineDigest);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_RESIZE_0051
         * @tc.name      testNdkRenderNodeResize0051
         * @tc.desc      校验文本块域在单像素画布下，resize 收敛到 1x1 时被接受，绘制不中断且恢复标准画布后画面回到基准。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeResize0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ResizeObs = await runResizeCase(GROUP_TEXTBLOB, SIZE_ONE, SIZE_ONE, true, '文本块域#单像素画布');
      expect(observed.frameWidth).assertEqual(observed.expectedWidth);
      expect(observed.frameHeight).assertEqual(observed.expectedHeight);
      expect(observed.redrawn).assertTrue();
      expect(observed.restoredDigest).assertEqual(observed.baselineDigest);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_RESIZE_0052
         * @tc.name      testNdkRenderNodeResize0052
         * @tc.desc      校验排版域在单像素画布下，resize 收敛到 1x1 时被接受，绘制不中断且恢复标准画布后画面回到基准。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeResize0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ResizeObs = await runResizeCase(GROUP_TYPOGRAPHY, SIZE_ONE, SIZE_ONE, true, '排版域#单像素画布');
      expect(observed.frameWidth).assertEqual(observed.expectedWidth);
      expect(observed.frameHeight).assertEqual(observed.expectedHeight);
      expect(observed.redrawn).assertTrue();
      expect(observed.restoredDigest).assertEqual(observed.baselineDigest);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_RESIZE_0053
         * @tc.name      testNdkRenderNodeResize0053
         * @tc.desc      校验阴影域在单像素画布下，resize 收敛到 1x1 时被接受，绘制不中断且恢复标准画布后画面回到基准。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeResize0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ResizeObs = await runResizeCase(GROUP_SHADOW, SIZE_ONE, SIZE_ONE, true, '阴影域#单像素画布');
      expect(observed.frameWidth).assertEqual(observed.expectedWidth);
      expect(observed.frameHeight).assertEqual(observed.expectedHeight);
      expect(observed.redrawn).assertTrue();
      expect(observed.restoredDigest).assertEqual(observed.baselineDigest);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_RESIZE_0054
         * @tc.name      testNdkRenderNodeResize0054
         * @tc.desc      校验矩阵域在单像素画布下，resize 收敛到 1x1 时被接受，绘制不中断且恢复标准画布后画面回到基准。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeResize0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ResizeObs = await runResizeCase(GROUP_MATRIX, SIZE_ONE, SIZE_ONE, true, '矩阵域#单像素画布');
      expect(observed.frameWidth).assertEqual(observed.expectedWidth);
      expect(observed.frameHeight).assertEqual(observed.expectedHeight);
      expect(observed.redrawn).assertTrue();
      expect(observed.restoredDigest).assertEqual(observed.baselineDigest);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_RESIZE_0055
         * @tc.name      testNdkRenderNodeResize0055
         * @tc.desc      校验录制指令域在单像素画布下，resize 收敛到 1x1 时被接受，绘制不中断且恢复标准画布后画面回到基准。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeResize0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ResizeObs = await runResizeCase(GROUP_RECORD, SIZE_ONE, SIZE_ONE, true, '录制指令域#单像素画布');
      expect(observed.frameWidth).assertEqual(observed.expectedWidth);
      expect(observed.frameHeight).assertEqual(observed.expectedHeight);
      expect(observed.redrawn).assertTrue();
      expect(observed.restoredDigest).assertEqual(observed.baselineDigest);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_RESIZE_0056
         * @tc.name      testNdkRenderNodeResize0056
         * @tc.desc      校验离屏绘制域在单像素画布下，resize 收敛到 1x1 时被接受，绘制不中断且恢复标准画布后画面回到基准。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeResize0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ResizeObs = await runResizeCase(GROUP_OFFSCREEN, SIZE_ONE, SIZE_ONE, true, '离屏绘制域#单像素画布');
      expect(observed.frameWidth).assertEqual(observed.expectedWidth);
      expect(observed.frameHeight).assertEqual(observed.expectedHeight);
      expect(observed.redrawn).assertTrue();
      expect(observed.restoredDigest).assertEqual(observed.baselineDigest);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_RESIZE_0057
         * @tc.name      testNdkRenderNodeResize0057
         * @tc.desc      校验错误码域在单像素画布下，resize 收敛到 1x1 时被接受，绘制不中断且恢复标准画布后画面回到基准。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeResize0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ResizeObs = await runResizeCase(GROUP_ERROR, SIZE_ONE, SIZE_ONE, true, '错误码域#单像素画布');
      expect(observed.frameWidth).assertEqual(observed.expectedWidth);
      expect(observed.frameHeight).assertEqual(observed.expectedHeight);
      expect(observed.redrawn).assertTrue();
      expect(observed.restoredDigest).assertEqual(observed.baselineDigest);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_RESIZE_0058
         * @tc.name      testNdkRenderNodeResize0058
         * @tc.desc      校验画布域在超大画布下，resize 放大到 4096x4096 时被接受，绘制不中断且恢复标准画布后画面回到基准。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeResize0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ResizeObs = await runResizeCase(GROUP_CANVAS, SIZE_WIDE, SIZE_WIDE, true, '画布域#超大画布');
      expect(observed.frameWidth).assertEqual(observed.expectedWidth);
      expect(observed.frameHeight).assertEqual(observed.expectedHeight);
      expect(observed.redrawn).assertTrue();
      expect(observed.restoredDigest).assertEqual(observed.baselineDigest);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_RESIZE_0059
         * @tc.name      testNdkRenderNodeResize0059
         * @tc.desc      校验几何域在超大画布下，resize 放大到 4096x4096 时被接受，绘制不中断且恢复标准画布后画面回到基准。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeResize0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ResizeObs = await runResizeCase(GROUP_GEOMETRY, SIZE_WIDE, SIZE_WIDE, true, '几何域#超大画布');
      expect(observed.frameWidth).assertEqual(observed.expectedWidth);
      expect(observed.frameHeight).assertEqual(observed.expectedHeight);
      expect(observed.redrawn).assertTrue();
      expect(observed.restoredDigest).assertEqual(observed.baselineDigest);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_RESIZE_0060
         * @tc.name      testNdkRenderNodeResize0060
         * @tc.desc      校验画笔域在超大画布下，resize 放大到 4096x4096 时被接受，绘制不中断且恢复标准画布后画面回到基准。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeResize0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ResizeObs = await runResizeCase(GROUP_PAINT, SIZE_WIDE, SIZE_WIDE, true, '画笔域#超大画布');
      expect(observed.frameWidth).assertEqual(observed.expectedWidth);
      expect(observed.frameHeight).assertEqual(observed.expectedHeight);
      expect(observed.redrawn).assertTrue();
      expect(observed.restoredDigest).assertEqual(observed.baselineDigest);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_RESIZE_0061
         * @tc.name      testNdkRenderNodeResize0061
         * @tc.desc      校验颜色域在超大画布下，resize 放大到 4096x4096 时被接受，绘制不中断且恢复标准画布后画面回到基准。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeResize0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ResizeObs = await runResizeCase(GROUP_COLOR, SIZE_WIDE, SIZE_WIDE, true, '颜色域#超大画布');
      expect(observed.frameWidth).assertEqual(observed.expectedWidth);
      expect(observed.frameHeight).assertEqual(observed.expectedHeight);
      expect(observed.redrawn).assertTrue();
      expect(observed.restoredDigest).assertEqual(observed.baselineDigest);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_RESIZE_0062
         * @tc.name      testNdkRenderNodeResize0062
         * @tc.desc      校验颜色滤波器域在超大画布下，resize 放大到 4096x4096 时被接受，绘制不中断且恢复标准画布后画面回到基准。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeResize0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ResizeObs = await runResizeCase(GROUP_COLOR_FILTER, SIZE_WIDE, SIZE_WIDE, true, '颜色滤波器域#超大画布');
      expect(observed.frameWidth).assertEqual(observed.expectedWidth);
      expect(observed.frameHeight).assertEqual(observed.expectedHeight);
      expect(observed.redrawn).assertTrue();
      expect(observed.restoredDigest).assertEqual(observed.baselineDigest);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_RESIZE_0063
         * @tc.name      testNdkRenderNodeResize0063
         * @tc.desc      校验着色器域在超大画布下，resize 放大到 4096x4096 时被接受，绘制不中断且恢复标准画布后画面回到基准。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeResize0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ResizeObs = await runResizeCase(GROUP_SHADER, SIZE_WIDE, SIZE_WIDE, true, '着色器域#超大画布');
      expect(observed.frameWidth).assertEqual(observed.expectedWidth);
      expect(observed.frameHeight).assertEqual(observed.expectedHeight);
      expect(observed.redrawn).assertTrue();
      expect(observed.restoredDigest).assertEqual(observed.baselineDigest);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_RESIZE_0064
         * @tc.name      testNdkRenderNodeResize0064
         * @tc.desc      校验遮罩滤波器域在超大画布下，resize 放大到 4096x4096 时被接受，绘制不中断且恢复标准画布后画面回到基准。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeResize0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ResizeObs = await runResizeCase(GROUP_MASK_FILTER, SIZE_WIDE, SIZE_WIDE, true, '遮罩滤波器域#超大画布');
      expect(observed.frameWidth).assertEqual(observed.expectedWidth);
      expect(observed.frameHeight).assertEqual(observed.expectedHeight);
      expect(observed.redrawn).assertTrue();
      expect(observed.restoredDigest).assertEqual(observed.baselineDigest);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_RESIZE_0065
         * @tc.name      testNdkRenderNodeResize0065
         * @tc.desc      校验图像滤波器域在超大画布下，resize 放大到 4096x4096 时被接受，绘制不中断且恢复标准画布后画面回到基准。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeResize0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ResizeObs = await runResizeCase(GROUP_IMAGE_FILTER, SIZE_WIDE, SIZE_WIDE, true, '图像滤波器域#超大画布');
      expect(observed.frameWidth).assertEqual(observed.expectedWidth);
      expect(observed.frameHeight).assertEqual(observed.expectedHeight);
      expect(observed.redrawn).assertTrue();
      expect(observed.restoredDigest).assertEqual(observed.baselineDigest);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_RESIZE_0066
         * @tc.name      testNdkRenderNodeResize0066
         * @tc.desc      校验位图域在超大画布下，resize 放大到 4096x4096 时被接受，绘制不中断且恢复标准画布后画面回到基准。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeResize0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ResizeObs = await runResizeCase(GROUP_BITMAP, SIZE_WIDE, SIZE_WIDE, true, '位图域#超大画布');
      expect(observed.frameWidth).assertEqual(observed.expectedWidth);
      expect(observed.frameHeight).assertEqual(observed.expectedHeight);
      expect(observed.redrawn).assertTrue();
      expect(observed.restoredDigest).assertEqual(observed.baselineDigest);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_RESIZE_0067
         * @tc.name      testNdkRenderNodeResize0067
         * @tc.desc      校验像素图域在超大画布下，resize 放大到 4096x4096 时被接受，绘制不中断且恢复标准画布后画面回到基准。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeResize0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ResizeObs = await runResizeCase(GROUP_PIXELMAP, SIZE_WIDE, SIZE_WIDE, true, '像素图域#超大画布');
      expect(observed.frameWidth).assertEqual(observed.expectedWidth);
      expect(observed.frameHeight).assertEqual(observed.expectedHeight);
      expect(observed.redrawn).assertTrue();
      expect(observed.restoredDigest).assertEqual(observed.baselineDigest);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_RESIZE_0068
         * @tc.name      testNdkRenderNodeResize0068
         * @tc.desc      校验图片编解码域在超大画布下，resize 放大到 4096x4096 时被接受，绘制不中断且恢复标准画布后画面回到基准。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeResize0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ResizeObs = await runResizeCase(GROUP_IMAGE_IO, SIZE_WIDE, SIZE_WIDE, true, '图片编解码域#超大画布');
      expect(observed.frameWidth).assertEqual(observed.expectedWidth);
      expect(observed.frameHeight).assertEqual(observed.expectedHeight);
      expect(observed.redrawn).assertTrue();
      expect(observed.restoredDigest).assertEqual(observed.baselineDigest);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_RESIZE_0069
         * @tc.name      testNdkRenderNodeResize0069
         * @tc.desc      校验字体域在超大画布下，resize 放大到 4096x4096 时被接受，绘制不中断且恢复标准画布后画面回到基准。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeResize0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ResizeObs = await runResizeCase(GROUP_FONT, SIZE_WIDE, SIZE_WIDE, true, '字体域#超大画布');
      expect(observed.frameWidth).assertEqual(observed.expectedWidth);
      expect(observed.frameHeight).assertEqual(observed.expectedHeight);
      expect(observed.redrawn).assertTrue();
      expect(observed.restoredDigest).assertEqual(observed.baselineDigest);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_RESIZE_0070
         * @tc.name      testNdkRenderNodeResize0070
         * @tc.desc      校验文本块域在超大画布下，resize 放大到 4096x4096 时被接受，绘制不中断且恢复标准画布后画面回到基准。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeResize0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ResizeObs = await runResizeCase(GROUP_TEXTBLOB, SIZE_WIDE, SIZE_WIDE, true, '文本块域#超大画布');
      expect(observed.frameWidth).assertEqual(observed.expectedWidth);
      expect(observed.frameHeight).assertEqual(observed.expectedHeight);
      expect(observed.redrawn).assertTrue();
      expect(observed.restoredDigest).assertEqual(observed.baselineDigest);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_RESIZE_0071
         * @tc.name      testNdkRenderNodeResize0071
         * @tc.desc      校验排版域在超大画布下，resize 放大到 4096x4096 时被接受，绘制不中断且恢复标准画布后画面回到基准。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeResize0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ResizeObs = await runResizeCase(GROUP_TYPOGRAPHY, SIZE_WIDE, SIZE_WIDE, true, '排版域#超大画布');
      expect(observed.frameWidth).assertEqual(observed.expectedWidth);
      expect(observed.frameHeight).assertEqual(observed.expectedHeight);
      expect(observed.redrawn).assertTrue();
      expect(observed.restoredDigest).assertEqual(observed.baselineDigest);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_RESIZE_0072
         * @tc.name      testNdkRenderNodeResize0072
         * @tc.desc      校验阴影域在超大画布下，resize 放大到 4096x4096 时被接受，绘制不中断且恢复标准画布后画面回到基准。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeResize0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ResizeObs = await runResizeCase(GROUP_SHADOW, SIZE_WIDE, SIZE_WIDE, true, '阴影域#超大画布');
      expect(observed.frameWidth).assertEqual(observed.expectedWidth);
      expect(observed.frameHeight).assertEqual(observed.expectedHeight);
      expect(observed.redrawn).assertTrue();
      expect(observed.restoredDigest).assertEqual(observed.baselineDigest);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_RESIZE_0073
         * @tc.name      testNdkRenderNodeResize0073
         * @tc.desc      校验矩阵域在超大画布下，resize 放大到 4096x4096 时被接受，绘制不中断且恢复标准画布后画面回到基准。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeResize0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ResizeObs = await runResizeCase(GROUP_MATRIX, SIZE_WIDE, SIZE_WIDE, true, '矩阵域#超大画布');
      expect(observed.frameWidth).assertEqual(observed.expectedWidth);
      expect(observed.frameHeight).assertEqual(observed.expectedHeight);
      expect(observed.redrawn).assertTrue();
      expect(observed.restoredDigest).assertEqual(observed.baselineDigest);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_RESIZE_0074
         * @tc.name      testNdkRenderNodeResize0074
         * @tc.desc      校验录制指令域在超大画布下，resize 放大到 4096x4096 时被接受，绘制不中断且恢复标准画布后画面回到基准。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeResize0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ResizeObs = await runResizeCase(GROUP_RECORD, SIZE_WIDE, SIZE_WIDE, true, '录制指令域#超大画布');
      expect(observed.frameWidth).assertEqual(observed.expectedWidth);
      expect(observed.frameHeight).assertEqual(observed.expectedHeight);
      expect(observed.redrawn).assertTrue();
      expect(observed.restoredDigest).assertEqual(observed.baselineDigest);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_RESIZE_0075
         * @tc.name      testNdkRenderNodeResize0075
         * @tc.desc      校验离屏绘制域在超大画布下，resize 放大到 4096x4096 时被接受，绘制不中断且恢复标准画布后画面回到基准。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeResize0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ResizeObs = await runResizeCase(GROUP_OFFSCREEN, SIZE_WIDE, SIZE_WIDE, true, '离屏绘制域#超大画布');
      expect(observed.frameWidth).assertEqual(observed.expectedWidth);
      expect(observed.frameHeight).assertEqual(observed.expectedHeight);
      expect(observed.redrawn).assertTrue();
      expect(observed.restoredDigest).assertEqual(observed.baselineDigest);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_RESIZE_0076
         * @tc.name      testNdkRenderNodeResize0076
         * @tc.desc      校验错误码域在超大画布下，resize 放大到 4096x4096 时被接受，绘制不中断且恢复标准画布后画面回到基准。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeResize0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ResizeObs = await runResizeCase(GROUP_ERROR, SIZE_WIDE, SIZE_WIDE, true, '错误码域#超大画布');
      expect(observed.frameWidth).assertEqual(observed.expectedWidth);
      expect(observed.frameHeight).assertEqual(observed.expectedHeight);
      expect(observed.redrawn).assertTrue();
      expect(observed.restoredDigest).assertEqual(observed.baselineDigest);
    })

  })
}
