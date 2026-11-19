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
import { Driver } from '@kit.TestKit';
import {
  backToIndex,
  clickText,
  countText,
  delay,
  enterPage,
  logInfo,
  textOfId,
  UI_SETTLE_TIME
} from './UiDriverUtil';

const TAG: string = '[Sample_NdkRenderNodeSceneTest]';

// 每个场景页的入口标题、页面标记控件与全部 kind 按钮文案，与 SceneType.ets 保持一致。
const SHAPE_ENTRY: string = 'Primitives';
const SHAPE_KINDS: string[] = ['Point', 'Line', 'Circle', 'Oval', 'Rect', 'RoundRect', 'Arc', 'Path', 'Region'];
const EFFECT_ENTRY: string = 'Drawing Effects';
const EFFECT_KINDS: string[] = ['Fill/Stroke', 'BlendMode', 'Dash', 'Linear', 'Radial', 'Sweep', 'ColorFilter',
  'MaskBlur'];
const TRANSFORM_ENTRY: string = 'Canvas Transform';
const TRANSFORM_KINDS: string[] = ['ClipRect', 'ClipPath', 'Translate', 'Rotate', 'Scale', 'Matrix',
  'Save/Restore'];
const IMAGE_ENTRY: string = 'Image Drawing';
const IMAGE_KINDS: string[] = ['Stretch', 'Nearest', 'Linear', 'ScaleView'];
const TEXT_ENTRY: string = 'Text Drawing';
const TEXT_KINDS: string[] = ['TextBlob', 'Typography', 'Measure'];

export default function ndkRenderNodeSceneTest(): void {
  describe('NdkRenderNodeScene', () => {
    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_0001
     * @tc.name      testNdkRenderNodeScene0001
     * @tc.desc      校验几何图元场景九个 kind（点、线、圆、椭圆、矩形、圆角矩形、弧、路径、区域）均可切换且页面保持可用。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeScene0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo(TAG, 'testNdkRenderNodeScene0001 begin');
      const driver: Driver = Driver.create();
      expect(await enterPage(driver, SHAPE_ENTRY, SHAPE_KINDS[0], TAG)).assertTrue();
      for (let index = 0; index < SHAPE_KINDS.length; index++) {
        const kind: string = SHAPE_KINDS[index];
        expect(await clickText(driver, kind, TAG)).assertTrue();
        const alive: number = await countText(driver, SHAPE_KINDS[0], TAG);
        logInfo(TAG, 'shape kind=' + kind + ' alive=' + alive.toString());
        expect(alive).assertEqual(1);
      }
      expect(await backToIndex(driver, TAG)).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeScene0001 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_0002
     * @tc.name      testNdkRenderNodeScene0002
     * @tc.desc      校验绘制效果场景八个 kind（填充描边、混合模式、虚线、三种渐变、颜色滤镜、遮罩模糊）均可切换且页面保持可用。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeScene0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo(TAG, 'testNdkRenderNodeScene0002 begin');
      const driver: Driver = Driver.create();
      expect(await enterPage(driver, EFFECT_ENTRY, EFFECT_KINDS[0], TAG)).assertTrue();
      for (let index = 0; index < EFFECT_KINDS.length; index++) {
        const kind: string = EFFECT_KINDS[index];
        expect(await clickText(driver, kind, TAG)).assertTrue();
        const alive: number = await countText(driver, EFFECT_KINDS[0], TAG);
        logInfo(TAG, 'effect kind=' + kind + ' alive=' + alive.toString());
        expect(alive).assertEqual(1);
      }
      expect(await backToIndex(driver, TAG)).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeScene0002 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_0003
     * @tc.name      testNdkRenderNodeScene0003
     * @tc.desc      校验画布操作场景七个 kind（矩形裁剪、路径裁剪、平移、旋转、缩放、矩阵、保存恢复）均可切换且页面保持可用。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeScene0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo(TAG, 'testNdkRenderNodeScene0003 begin');
      const driver: Driver = Driver.create();
      expect(await enterPage(driver, TRANSFORM_ENTRY, TRANSFORM_KINDS[0], TAG)).assertTrue();
      for (let index = 0; index < TRANSFORM_KINDS.length; index++) {
        const kind: string = TRANSFORM_KINDS[index];
        expect(await clickText(driver, kind, TAG)).assertTrue();
        const alive: number = await countText(driver, TRANSFORM_KINDS[0], TAG);
        logInfo(TAG, 'transform kind=' + kind + ' alive=' + alive.toString());
        expect(alive).assertEqual(1);
      }
      expect(await backToIndex(driver, TAG)).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeScene0003 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_0004
     * @tc.name      testNdkRenderNodeScene0004
     * @tc.desc      校验图片绘制场景四个 kind（拉伸、最近邻、双线性、缩放视图）均可切换且页面保持可用。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeScene0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeScene0004 begin');
      const driver: Driver = Driver.create();
      expect(await enterPage(driver, IMAGE_ENTRY, IMAGE_KINDS[0], TAG)).assertTrue();
      for (let index = 0; index < IMAGE_KINDS.length; index++) {
        const kind: string = IMAGE_KINDS[index];
        expect(await clickText(driver, kind, TAG)).assertTrue();
        const alive: number = await countText(driver, IMAGE_KINDS[0], TAG);
        logInfo(TAG, 'image kind=' + kind + ' alive=' + alive.toString());
        expect(alive).assertEqual(1);
      }
      expect(await backToIndex(driver, TAG)).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeScene0004 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_0005
     * @tc.name      testNdkRenderNodeScene0005
     * @tc.desc      校验文本绘制场景三个 kind（TextBlob、Typography、Measure）均可切换且页面保持可用。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeScene0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeScene0005 begin');
      const driver: Driver = Driver.create();
      expect(await enterPage(driver, TEXT_ENTRY, TEXT_KINDS[0], TAG)).assertTrue();
      for (let index = 0; index < TEXT_KINDS.length; index++) {
        const kind: string = TEXT_KINDS[index];
        expect(await clickText(driver, kind, TAG)).assertTrue();
        const alive: number = await countText(driver, TEXT_KINDS[0], TAG);
        logInfo(TAG, 'text kind=' + kind + ' alive=' + alive.toString());
        expect(alive).assertEqual(1);
      }
      expect(await backToIndex(driver, TAG)).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeScene0005 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_0006
     * @tc.name      testNdkRenderNodeScene0006
     * @tc.desc      校验点击测量按钮后界面展示 native 侧返回的文本尺寸，格式为「宽 x 高 px」且宽高均大于零。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeScene0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeScene0006 begin');
      const driver: Driver = Driver.create();
      expect(await enterPage(driver, TEXT_ENTRY, TEXT_KINDS[0], TAG)).assertTrue();
      expect(await clickText(driver, 'Measure Text', TAG)).assertTrue();
      await delay(driver, UI_SETTLE_TIME);
      const measureInfo: string = await textOfId(driver, 'text_measure_result', TAG);
      logInfo(TAG, 'measure info = ' + measureInfo);
      expect(measureInfo.length > 0).assertTrue();
      expect(measureInfo.endsWith(' px')).assertTrue();
      const width: number = Number.parseFloat(measureInfo);
      logInfo(TAG, 'measure width = ' + width.toString());
      expect(width > 0).assertTrue();
      expect(await backToIndex(driver, TAG)).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeScene0006 end');
    })
  })
}
