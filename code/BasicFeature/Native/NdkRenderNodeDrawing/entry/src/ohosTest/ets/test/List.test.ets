/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import abilityTest from './NdkRenderNodeAbility.test';
import bridgeTest from './NdkRenderNodeBridge.test';
import capabilityTest from './NdkRenderNodeCapability.test';
import contractTest from './NdkRenderNodeContract.test';
import dispatchTest from './NdkRenderNodeDispatch.test';
import domainTest from './NdkRenderNodeDomain.test';
import drawTest from './NdkRenderNodeDraw.test';
import guardTest from './NdkRenderNodeGuard.test';
import indexTest from './NdkRenderNodeIndex.test';
import matrixTest from './NdkRenderNodeMatrix.test';
import matrixTailTest from './NdkRenderNodeMatrixTail.test';
import measureTest from './NdkRenderNodeMeasure.test';
import measureArgTest from './NdkRenderNodeMeasureArg.test';
import measureTextTest from './NdkRenderNodeMeasureText.test';
import napiTest from './NdkRenderNodeNapi.test';
import nodeTest from './NdkRenderNodeNode.test';
import pageTest from './NdkRenderNodePage.test';
import paramTest from './NdkRenderNodeParam.test';
import paramTailTest from './NdkRenderNodeParamTail.test';
import pixelTest from './NdkRenderNodePixel.test';
import pixelMapArgTest from './NdkRenderNodePixelMapArg.test';
import pixelSceneATest from './NdkRenderNodePixelSceneA.test';
import pixelSceneBTest from './NdkRenderNodePixelSceneB.test';
import pixelSceneCTest from './NdkRenderNodePixelSceneC.test';
import resizeTest from './NdkRenderNodeResize.test';
import sceneArgTest from './NdkRenderNodeSceneArg.test';
import sceneTest from './NdkRenderNodeScene.test';
import schemaTest from './NdkRenderNodeSchema.test';
import sensitivityTest from './NdkRenderNodeSensitivity.test';
import topicTest from './NdkRenderNodeTopic.test';
import topicFlowTest from './NdkRenderNodeTopicFlow.test';
import topicMatrixTest from './NdkRenderNodeTopicMatrix.test';
import topicNodeTest from './NdkRenderNodeTopicNode.test';
import uiProbeTest from './NdkRenderNodeUiProbe.test';

// A 参数域：按能力域与专题分桶展开参数引擎的六维行为，只依赖 schema 与参数引擎。
import ndkRenderParamA01Test from './NdkRenderParamA01.test';
import ndkRenderParamA02Test from './NdkRenderParamA02.test';
import ndkRenderParamA03Test from './NdkRenderParamA03.test';
import ndkRenderParamA04Test from './NdkRenderParamA04.test';
import ndkRenderParamA05Test from './NdkRenderParamA05.test';
import ndkRenderParamA06Test from './NdkRenderParamA06.test';
import ndkRenderParamA07Test from './NdkRenderParamA07.test';
import ndkRenderParamA08Test from './NdkRenderParamA08.test';
import ndkRenderParamA09Test from './NdkRenderParamA09.test';
import ndkRenderParamA10Test from './NdkRenderParamA10.test';
import ndkRenderParamA11Test from './NdkRenderParamA11.test';
import ndkRenderParamA12Test from './NdkRenderParamA12.test';
import ndkRenderParamA13Test from './NdkRenderParamA13.test';
import ndkRenderParamA14Test from './NdkRenderParamA14.test';
import ndkRenderParamA15Test from './NdkRenderParamA15.test';
import ndkRenderParamA16Test from './NdkRenderParamA16.test';
import ndkRenderParamA17Test from './NdkRenderParamA17.test';
import ndkRenderParamA18Test from './NdkRenderParamA18.test';
import ndkRenderParamA19Test from './NdkRenderParamA19.test';
import ndkRenderParamA20Test from './NdkRenderParamA20.test';
import ndkRenderParamA21Test from './NdkRenderParamA21.test';
import ndkRenderParamA22Test from './NdkRenderParamA22.test';
import ndkRenderParamA23Test from './NdkRenderParamA23.test';
import ndkRenderParamA24Test from './NdkRenderParamA24.test';
import ndkRenderParamA25Test from './NdkRenderParamA25.test';
import ndkRenderParamA26Test from './NdkRenderParamA26.test';
import ndkRenderParamA27Test from './NdkRenderParamA27.test';
import ndkRenderParamA28Test from './NdkRenderParamA28.test';
import ndkRenderParamA29Test from './NdkRenderParamA29.test';
import ndkRenderParamA30Test from './NdkRenderParamA30.test';
import ndkRenderParamA31Test from './NdkRenderParamA31.test';
import ndkRenderParamA32Test from './NdkRenderParamA32.test';
import ndkRenderParamA33Test from './NdkRenderParamA33.test';
import ndkRenderParamT01Test from './NdkRenderParamT01.test';
import ndkRenderParamT02Test from './NdkRenderParamT02.test';
import ndkRenderParamT03Test from './NdkRenderParamT03.test';
import ndkRenderParamT04Test from './NdkRenderParamT04.test';
import ndkRenderParamT05Test from './NdkRenderParamT05.test';
import ndkRenderParamT06Test from './NdkRenderParamT06.test';
import ndkRenderParamT07Test from './NdkRenderParamT07.test';
import ndkRenderParamT08Test from './NdkRenderParamT08.test';
import ndkRenderParamT09Test from './NdkRenderParamT09.test';
import ndkRenderParamT10Test from './NdkRenderParamT10.test';
// P2 场景轴：228 个场景逐场景校验声明形状与参数引擎行为。
import ndkRenderSceneGeometryTest from './NdkRenderSceneGeometry.test';
import ndkRenderScenePaintTest from './NdkRenderScenePaint.test';
import ndkRenderSceneColorTest from './NdkRenderSceneColor.test';
import ndkRenderSceneColorFilterTest from './NdkRenderSceneColorFilter.test';
import ndkRenderSceneShaderTest from './NdkRenderSceneShader.test';
import ndkRenderSceneMaskFilterTest from './NdkRenderSceneMaskFilter.test';
import ndkRenderSceneImageFilterTest from './NdkRenderSceneImageFilter.test';
import ndkRenderSceneBitmapTest from './NdkRenderSceneBitmap.test';
import ndkRenderScenePixelMapTest from './NdkRenderScenePixelMap.test';
import ndkRenderSceneImageIoTest from './NdkRenderSceneImageIo.test';
import ndkRenderSceneFontTest from './NdkRenderSceneFont.test';
import ndkRenderSceneTextBlobTest from './NdkRenderSceneTextBlob.test';
import ndkRenderSceneTypographyTest from './NdkRenderSceneTypography.test';
import ndkRenderSceneShadowTest from './NdkRenderSceneShadow.test';
import ndkRenderSceneMatrixTest from './NdkRenderSceneMatrix.test';
import ndkRenderSceneRecordTest from './NdkRenderSceneRecord.test';
import ndkRenderSceneOffscreenTest from './NdkRenderSceneOffscreen.test';
import ndkRenderSceneErrorTest from './NdkRenderSceneError.test';
import ndkRenderSceneTopicNodeTreeTest from './NdkRenderSceneTopicNodeTree.test';
import ndkRenderSceneTopicRenderPropTest from './NdkRenderSceneTopicRenderProp.test';
import ndkRenderSceneTopicBlurTest from './NdkRenderSceneTopicBlur.test';
import ndkRenderSceneTopicAnimationTest from './NdkRenderSceneTopicAnimation.test';
import ndkRenderSceneTopicHitTestTest from './NdkRenderSceneTopicHitTest.test';
import ndkRenderSceneTopicPerformanceTest from './NdkRenderSceneTopicPerformance.test';
import ndkRenderSceneTopicRecordTest from './NdkRenderSceneTopicRecord.test';
import ndkRenderSceneTopicMultiDeviceTest from './NdkRenderSceneTopicMultiDevice.test';
import ndkRenderSceneTopicLifecycleTest from './NdkRenderSceneTopicLifecycle.test';
import ndkRenderSceneTopicFrameTickTest from './NdkRenderSceneTopicFrameTick.test';

import ndkRenderSceneCanvasTest from './NdkRenderSceneCanvas.test';


export default function testsuite(): void {
  // 像素层必须先跑：探针 RenderNode 只在测试页位于前台时才被 ArkUI 调度绘制，
  // 一旦其余套件拉起应用、把测试页遮到后台，draw 回调就不再触发，像素层会整层静默失败。
  pixelTest();
  // 以下套件同样依赖探针页在前台，必须紧跟在像素层之后、UI 类套件之前。
  pixelMapArgTest();
  resizeTest();
  sensitivityTest();
  // C1 逐场景像素基线：18 个能力域 scene>=2 的 150 个深层场景各一条，与像素层同批前置。
  pixelSceneATest();
  pixelSceneBTest();
  pixelSceneCTest();
  // C2 真实画布入参契约探路：在绘制回调里注入非法尺寸/编号，同样依赖探针页在前台。
  sceneArgTest();
  // 页面级用例先执行，保证后续绘制用例在首页就绪的前提下运行。
  abilityTest();
  contractTest();
  paramTest();
  schemaTest();
  // 逐场景矩阵与契约层同源：只依赖 schema、参数引擎与 native 入口，不操作界面，
  // 因此紧跟在 schema 之后、UI 类套件之前执行。
  matrixTest();
  matrixTailTest();
  topicMatrixTest();
  // 控制器与基础工具层：只 import main 的 ets 类，不操作界面与 native 绘制，
  // 与契约层同批执行，失败时能把「控制器状态机」与「UI 通路」两类问题区分开。
  topicNodeTest();
  paramTailTest();
  bridgeTest();
  pageTest();
  indexTest();
  capabilityTest();
  domainTest();
  topicTest();
  topicFlowTest();
  sceneTest();
  nodeTest();
  drawTest();
  napiTest();
  dispatchTest();
  guardTest();
  measureTest();
  // P3-1 NAPI 入参契约：只调用 nativeMeasureText 与探针，不触碰画布与界面。
  measureArgTest();
  measureTextTest();
  // 控件 id 探针：逐个页面校验 P0-c 补的 `.id()` 能否被 `ON.id()` 命中，后续 UI 套件依赖它。
  uiProbeTest();
  // A 参数域套件只依赖 schema 与参数引擎，不操作界面与 native 绘制，放在最后执行。
  ndkRenderParamA01Test();
  ndkRenderParamA02Test();
  ndkRenderParamA03Test();
  ndkRenderParamA04Test();
  ndkRenderParamA05Test();
  ndkRenderParamA06Test();
  ndkRenderParamA07Test();
  ndkRenderParamA08Test();
  ndkRenderParamA09Test();
  ndkRenderParamA10Test();
  ndkRenderParamA11Test();
  ndkRenderParamA12Test();
  ndkRenderParamA13Test();
  ndkRenderParamA14Test();
  ndkRenderParamA15Test();
  ndkRenderParamA16Test();
  ndkRenderParamA17Test();
  ndkRenderParamA18Test();
  ndkRenderParamA19Test();
  ndkRenderParamA20Test();
  ndkRenderParamA21Test();
  ndkRenderParamA22Test();
  ndkRenderParamA23Test();
  ndkRenderParamA24Test();
  ndkRenderParamA25Test();
  ndkRenderParamA26Test();
  ndkRenderParamA27Test();
  ndkRenderParamA28Test();
  ndkRenderParamA29Test();
  ndkRenderParamA30Test();
  ndkRenderParamA31Test();
  ndkRenderParamA32Test();
  ndkRenderParamA33Test();
  ndkRenderParamT01Test();
  ndkRenderParamT02Test();
  ndkRenderParamT03Test();
  ndkRenderParamT04Test();
  ndkRenderParamT05Test();
  ndkRenderParamT06Test();
  ndkRenderParamT07Test();
  ndkRenderParamT08Test();
  ndkRenderParamT09Test();
  ndkRenderParamT10Test();
  // P2 场景轴套件只依赖 schema 与场景探针，不操作界面与 native 绘制。
  ndkRenderSceneGeometryTest();
  ndkRenderScenePaintTest();
  ndkRenderSceneColorTest();
  ndkRenderSceneColorFilterTest();
  ndkRenderSceneShaderTest();
  ndkRenderSceneMaskFilterTest();
  ndkRenderSceneImageFilterTest();
  ndkRenderSceneBitmapTest();
  ndkRenderScenePixelMapTest();
  ndkRenderSceneImageIoTest();
  ndkRenderSceneFontTest();
  ndkRenderSceneTextBlobTest();
  ndkRenderSceneTypographyTest();
  ndkRenderSceneShadowTest();
  ndkRenderSceneMatrixTest();
  ndkRenderSceneRecordTest();
  ndkRenderSceneOffscreenTest();
  ndkRenderSceneErrorTest();
  ndkRenderSceneTopicNodeTreeTest();
  ndkRenderSceneTopicRenderPropTest();
  ndkRenderSceneTopicBlurTest();
  ndkRenderSceneTopicAnimationTest();
  ndkRenderSceneTopicHitTestTest();
  ndkRenderSceneTopicPerformanceTest();
  ndkRenderSceneTopicRecordTest();
  ndkRenderSceneTopicMultiDeviceTest();
  ndkRenderSceneTopicLifecycleTest();
  ndkRenderSceneTopicFrameTickTest();
  ndkRenderSceneCanvasTest();
}
