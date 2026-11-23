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
import { beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from './YieldToEventLoop';
import hilog from '@ohos.hilog';
import image from '@ohos.multimedia.image';
import { ComputeFeature, NodeType, PixelMapQueue } from '../../../main/ets/bridge/PhotomodifyBridge';

const DOMAIN: number = 0xF814;
const TAG: string = 'EditFeatureControllerCoreTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

function createTestPixelMap(): PixelMap {
  const buffer: ArrayBuffer = new ArrayBuffer(16);
  const opts: image.InitializationOptions = {
    size: { width: 2, height: 2 },
    pixelFormat: image.PixelMapFormat.RGBA_8888
  };
  return image.createPixelMapSync(buffer, opts);
}

function newController(): ComputeFeature {
  const cf: ComputeFeature = new ComputeFeature();
  cf.setMaterialAndImageSize(400, 300, 200, 100);
  cf.setOriginMaterialSize(80, 60);
  cf.setFontSize(20);
  return cf;
}

export default function editFeatureControllerCoreTest(): void {
  describe('EditFeatureControllerCoreTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_IMAGE_EDITCTRL_0001
     * @tc.name      testEditFeatureController0001
     * @tc.desc      Verify NodeType.LEFT_TOP maps to ordinal value 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEditFeatureController0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEditFeatureController0001 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual NodeType.LEFT_TOP=${NodeType.LEFT_TOP}, expected=0`);
      expect(NodeType.LEFT_TOP).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof NodeType.LEFT_TOP=${typeof NodeType.LEFT_TOP}`);
      expect(typeof NodeType.LEFT_TOP).assertEqual('number');
      log('testEditFeatureController0001 end');
    })

    /**
     * @tc.number    SUB_IMAGE_EDITCTRL_0002
     * @tc.name      testEditFeatureController0002
     * @tc.desc      Verify NodeType.RIGHT_TOP maps to ordinal value 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEditFeatureController0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEditFeatureController0002 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual NodeType.RIGHT_TOP=${NodeType.RIGHT_TOP}, expected=1`);
      expect(NodeType.RIGHT_TOP).assertEqual(1);
      log('testEditFeatureController0002 end');
    })

    /**
     * @tc.number    SUB_IMAGE_EDITCTRL_0003
     * @tc.name      testEditFeatureController0003
     * @tc.desc      Verify NodeType.LEFT_BOTTOM maps to ordinal value 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEditFeatureController0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEditFeatureController0003 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual NodeType.LEFT_BOTTOM=${NodeType.LEFT_BOTTOM}, expected=2`);
      expect(NodeType.LEFT_BOTTOM).assertEqual(2);
      log('testEditFeatureController0003 end');
    })

    /**
     * @tc.number    SUB_IMAGE_EDITCTRL_0004
     * @tc.name      testEditFeatureController0004
     * @tc.desc      Verify NodeType.RIGHT_BOTTOM maps to ordinal value 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEditFeatureController0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEditFeatureController0004 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual NodeType.RIGHT_BOTTOM=${NodeType.RIGHT_BOTTOM}, expected=3`);
      expect(NodeType.RIGHT_BOTTOM).assertEqual(3);
      log('testEditFeatureController0004 end');
    })

    /**
     * @tc.number    SUB_IMAGE_EDITCTRL_0005
     * @tc.name      testEditFeatureController0005
     * @tc.desc      Verify NodeType.CENTER_MATERIAL maps to ordinal value 4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEditFeatureController0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEditFeatureController0005 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual NodeType.CENTER_MATERIAL=${NodeType.CENTER_MATERIAL}`);
      expect(NodeType.CENTER_MATERIAL).assertEqual(4);
      log('testEditFeatureController0005 end');
    })

    /**
     * @tc.number    SUB_IMAGE_EDITCTRL_0006
     * @tc.name      testEditFeatureController0006
     * @tc.desc      Verify a fresh ComputeFeature keeps zero sized container fields.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEditFeatureController0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEditFeatureController0006 begin');
      const cf: ComputeFeature = new ComputeFeature();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cf.containerWidth=${cf.containerWidth}, expected=0`);
      expect(cf.containerWidth).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cf.containerHeight=${cf.containerHeight}, expected=0`);
      expect(cf.containerHeight).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cf.imageWidth=${cf.imageWidth}, expected=0`);
      expect(cf.imageWidth).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cf.imageHeight=${cf.imageHeight}, expected=0`);
      expect(cf.imageHeight).assertEqual(0);
      log('testEditFeatureController0006 end');
    })

    /**
     * @tc.number    SUB_IMAGE_EDITCTRL_0007
     * @tc.name      testEditFeatureController0007
     * @tc.desc      Verify a fresh ComputeFeature keeps default min scale of 0.5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEditFeatureController0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEditFeatureController0007 begin');
      const cf: ComputeFeature = new ComputeFeature();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cf.minScale=${cf.minScale}, expected=0.5`);
      expect(cf.minScale).assertEqual(0.5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cf.materialWidth=${cf.materialWidth}, expected=0`);
      expect(cf.materialWidth).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cf.fontSize=${cf.fontSize}, expected=0`);
      expect(cf.fontSize).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cf.currentType=${cf.currentType}, expected=NodeType.LEFT_TOP`);
      expect(cf.currentType).assertEqual(NodeType.LEFT_TOP);
      log('testEditFeatureController0007 end');
    })

    /**
     * @tc.number    SUB_IMAGE_EDITCTRL_0008
     * @tc.name      testEditFeatureController0008
     * @tc.desc      Verify setMaterialAndImageSize stores container and image dimensions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEditFeatureController0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEditFeatureController0008 begin');
      const cf: ComputeFeature = new ComputeFeature();
      cf.setMaterialAndImageSize(400, 300, 200, 100);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cf.containerWidth=${cf.containerWidth}, expected=400`);
      expect(cf.containerWidth).assertEqual(400);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cf.containerHeight=${cf.containerHeight}, expected=300`);
      expect(cf.containerHeight).assertEqual(300);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cf.imageWidth=${cf.imageWidth}, expected=200`);
      expect(cf.imageWidth).assertEqual(200);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cf.imageHeight=${cf.imageHeight}, expected=100`);
      expect(cf.imageHeight).assertEqual(100);
      log('testEditFeatureController0008 end');
    })

    /**
     * @tc.number    SUB_IMAGE_EDITCTRL_0009
     * @tc.name      testEditFeatureController0009
     * @tc.desc      Verify max material size is clamped by the smaller of container and image.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEditFeatureController0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEditFeatureController0009 begin');
      const cf: ComputeFeature = new ComputeFeature();
      cf.setMaterialAndImageSize(400, 300, 200, 100);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cf.maxMaterialWidth=${cf.maxMaterialWidth}, expected=200`);
      expect(cf.maxMaterialWidth).assertEqual(200);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cf.maxMaterialHeight=${cf.maxMaterialHeight}, expected=100`);
      expect(cf.maxMaterialHeight).assertEqual(100);
      log('testEditFeatureController0009 end');
    })

    /**
     * @tc.number    SUB_IMAGE_EDITCTRL_0010
     * @tc.name      testEditFeatureController0010
     * @tc.desc      Verify init center point equals half of the container size.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEditFeatureController0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEditFeatureController0010 begin');
      const cf: ComputeFeature = new ComputeFeature();
      cf.setMaterialAndImageSize(400, 300, 200, 100);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cf.initX=${cf.initX}, expected=200`);
      expect(cf.initX).assertEqual(200);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cf.initY=${cf.initY}, expected=150`);
      expect(cf.initY).assertEqual(150);
      log('testEditFeatureController0010 end');
    })

    /**
     * @tc.number    SUB_IMAGE_EDITCTRL_0011
     * @tc.name      testEditFeatureController0011
     * @tc.desc      Verify material center starts at the init center point.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEditFeatureController0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEditFeatureController0011 begin');
      const cf: ComputeFeature = new ComputeFeature();
      cf.setMaterialAndImageSize(400, 300, 200, 100);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cf.x=${cf.x}, expected=200`);
      expect(cf.x).assertEqual(200);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cf.y=${cf.y}, expected=150`);
      expect(cf.y).assertEqual(150);
      log('testEditFeatureController0011 end');
    })

    /**
     * @tc.number    SUB_IMAGE_EDITCTRL_0012
     * @tc.name      testEditFeatureController0012
     * @tc.desc      Verify max material size when image is larger than container.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEditFeatureController0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEditFeatureController0012 begin');
      const cf: ComputeFeature = new ComputeFeature();
      cf.setMaterialAndImageSize(100, 100, 500, 500);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cf.maxMaterialWidth=${cf.maxMaterialWidth}, expected=100`);
      expect(cf.maxMaterialWidth).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cf.maxMaterialHeight=${cf.maxMaterialHeight}, expected=100`);
      expect(cf.maxMaterialHeight).assertEqual(100);
      log('testEditFeatureController0012 end');
    })

    /**
     * @tc.number    SUB_IMAGE_EDITCTRL_0013
     * @tc.name      testEditFeatureController0013
     * @tc.desc      Verify init center uses fractional container halves correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEditFeatureController0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEditFeatureController0013 begin');
      const cf: ComputeFeature = new ComputeFeature();
      cf.setMaterialAndImageSize(101, 301, 20, 20);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cf.initX=${cf.initX}, expected=50.5`);
      expect(cf.initX).assertEqual(50.5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cf.initY=${cf.initY}, expected=150.5`);
      expect(cf.initY).assertEqual(150.5);
      log('testEditFeatureController0013 end');
    })

    /**
     * @tc.number    SUB_IMAGE_EDITCTRL_0014
     * @tc.name      testEditFeatureController0014
     * @tc.desc      Verify setOriginMaterialSize stores material dimensions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEditFeatureController0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEditFeatureController0014 begin');
      const cf: ComputeFeature = new ComputeFeature();
      cf.setOriginMaterialSize(80, 60);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cf.materialWidth=${cf.materialWidth}, expected=80`);
      expect(cf.materialWidth).assertEqual(80);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cf.materialHeight=${cf.materialHeight}, expected=60`);
      expect(cf.materialHeight).assertEqual(60);
      log('testEditFeatureController0014 end');
    })

    /**
     * @tc.number    SUB_IMAGE_EDITCTRL_0015
     * @tc.name      testEditFeatureController0015
     * @tc.desc      Verify min material size equals half of the origin size.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEditFeatureController0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEditFeatureController0015 begin');
      const cf: ComputeFeature = new ComputeFeature();
      cf.setOriginMaterialSize(80, 60);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cf.minMaterialWidth=${cf.minMaterialWidth}, expected=40`);
      expect(cf.minMaterialWidth).assertEqual(40);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cf.minMaterialHeight=${cf.minMaterialHeight}, expected=30`);
      expect(cf.minMaterialHeight).assertEqual(30);
      log('testEditFeatureController0015 end');
    })

    /**
     * @tc.number    SUB_IMAGE_EDITCTRL_0016
     * @tc.name      testEditFeatureController0016
     * @tc.desc      Verify min material size handles fractional origin dimensions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEditFeatureController0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEditFeatureController0016 begin');
      const cf: ComputeFeature = new ComputeFeature();
      cf.setOriginMaterialSize(81, 61);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cf.minMaterialWidth=${cf.minMaterialWidth}, expected=40.5`);
      expect(cf.minMaterialWidth).assertEqual(40.5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cf.minMaterialHeight=${cf.minMaterialHeight}, expected=30.5`);
      expect(cf.minMaterialHeight).assertEqual(30.5);
      log('testEditFeatureController0016 end');
    })

    /**
     * @tc.number    SUB_IMAGE_EDITCTRL_0017
     * @tc.name      testEditFeatureController0017
     * @tc.desc      Verify repeated setOriginMaterialSize overwrites previous state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEditFeatureController0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEditFeatureController0017 begin');
      const cf: ComputeFeature = new ComputeFeature();
      cf.setOriginMaterialSize(80, 60);
      cf.setOriginMaterialSize(40, 30);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cf.materialWidth=${cf.materialWidth}, expected=40`);
      expect(cf.materialWidth).assertEqual(40);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cf.materialHeight=${cf.materialHeight}, expected=30`);
      expect(cf.materialHeight).assertEqual(30);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cf.minMaterialWidth=${cf.minMaterialWidth}, expected=20`);
      expect(cf.minMaterialWidth).assertEqual(20);
      log('testEditFeatureController0017 end');
    })

    /**
     * @tc.number    SUB_IMAGE_EDITCTRL_0018
     * @tc.name      testEditFeatureController0018
     * @tc.desc      Verify setFontSize stores the given font size.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEditFeatureController0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEditFeatureController0018 begin');
      const cf: ComputeFeature = new ComputeFeature();
      cf.setFontSize(20);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cf.fontSize=${cf.fontSize}, expected=20`);
      expect(cf.fontSize).assertEqual(20);
      cf.setFontSize(33.5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cf.fontSize=${cf.fontSize}, expected=33.5`);
      expect(cf.fontSize).assertEqual(33.5);
      log('testEditFeatureController0018 end');
    })

    /**
     * @tc.number    SUB_IMAGE_EDITCTRL_0019
     * @tc.name      testEditFeatureController0019
     * @tc.desc      Verify startDrag switches the active node type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEditFeatureController0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEditFeatureController0019 begin');
      const cf: ComputeFeature = newController();
      cf.startDrag(NodeType.RIGHT_TOP);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cf.currentType=${cf.currentType}`);
      expect(cf.currentType).assertEqual(NodeType.RIGHT_TOP);
      cf.startDrag(NodeType.LEFT_BOTTOM);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cf.currentType=${cf.currentType}`);
      expect(cf.currentType).assertEqual(NodeType.LEFT_BOTTOM);
      log('testEditFeatureController0019 end');
    })

    /**
     * @tc.number    SUB_IMAGE_EDITCTRL_0020
     * @tc.name      testEditFeatureController0020
     * @tc.desc      Verify startDrag snapshots material width and height.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEditFeatureController0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEditFeatureController0020 begin');
      const cf: ComputeFeature = newController();
      cf.startDrag(NodeType.RIGHT_TOP);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cf.dragStartWidth=${cf.dragStartWidth}, expected=80`);
      expect(cf.dragStartWidth).assertEqual(80);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cf.dragStartHeight=${cf.dragStartHeight}, expected=60`);
      expect(cf.dragStartHeight).assertEqual(60);
      log('testEditFeatureController0020 end');
    })

    /**
     * @tc.number    SUB_IMAGE_EDITCTRL_0021
     * @tc.name      testEditFeatureController0021
     * @tc.desc      Verify startDrag snapshots font size and center position.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEditFeatureController0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEditFeatureController0021 begin');
      const cf: ComputeFeature = newController();
      cf.startDrag(NodeType.CENTER_MATERIAL);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cf.dragStartFontSize=${cf.dragStartFontSize}, expected=20`);
      expect(cf.dragStartFontSize).assertEqual(20);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cf.dragStartX=${cf.dragStartX}, expected=200`);
      expect(cf.dragStartX).assertEqual(200);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cf.dragStartY=${cf.dragStartY}, expected=150`);
      expect(cf.dragStartY).assertEqual(150);
      log('testEditFeatureController0021 end');
    })

    /**
     * @tc.number    SUB_IMAGE_EDITCTRL_0022
     * @tc.name      testEditFeatureController0022
     * @tc.desc      Verify onDragMaterial moves the center by the given delta.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEditFeatureController0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEditFeatureController0022 begin');
      const cf: ComputeFeature = newController();
      cf.onDragMaterial(10, -5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cf.x=${cf.x}, expected=210`);
      expect(cf.x).assertEqual(210);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cf.y=${cf.y}, expected=145`);
      expect(cf.y).assertEqual(145);
      log('testEditFeatureController0022 end');
    })

    /**
     * @tc.number    SUB_IMAGE_EDITCTRL_0023
     * @tc.name      testEditFeatureController0023
     * @tc.desc      Verify onDragMaterial accumulates across repeated calls.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEditFeatureController0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEditFeatureController0023 begin');
      const cf: ComputeFeature = newController();
      cf.onDragMaterial(10, 10);
      cf.onDragMaterial(5, -3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cf.x=${cf.x}, expected=215`);
      expect(cf.x).assertEqual(215);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cf.y=${cf.y}, expected=157`);
      expect(cf.y).assertEqual(157);
      log('testEditFeatureController0023 end');
    })

    /**
     * @tc.number    SUB_IMAGE_EDITCTRL_0024
     * @tc.name      testEditFeatureController0024
     * @tc.desc      Verify right top drag grows width by twice the x delta.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEditFeatureController0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEditFeatureController0024 begin');
      const cf: ComputeFeature = newController();
      cf.startDrag(NodeType.RIGHT_TOP);
      let gotW: number = 0;
      let gotH: number = 0;
      let gotScale: number = 0;
      let gotFs: number = 0;
      cf.onDrag(5, 0, (w: number, h: number, s: number, fs: number) => {
        gotW = w;
        gotH = h;
        gotScale = s;
        gotFs = fs;
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual gotW=${gotW}, expected=90`);
      expect(gotW).assertEqual(90);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual gotH=${gotH}, expected=60`);
      expect(gotH).assertEqual(60);
      log('testEditFeatureController0024 end');
    })

    /**
     * @tc.number    SUB_IMAGE_EDITCTRL_0025
     * @tc.name      testEditFeatureController0025
     * @tc.desc      Verify right top drag reports scale and font size growth.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEditFeatureController0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEditFeatureController0025 begin');
      const cf: ComputeFeature = newController();
      cf.startDrag(NodeType.RIGHT_TOP);
      let gotScale: number = 0;
      let gotFs: number = 0;
      cf.onDrag(5, 0, (w: number, h: number, s: number, fs: number) => {
        gotScale = s;
        gotFs = fs;
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual gotScale=${gotScale}, expected=1.125`);
      expect(gotScale).assertEqual(1.125);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual gotFs=${gotFs}, expected=22.5`);
      expect(gotFs).assertEqual(22.5);
      log('testEditFeatureController0025 end');
    })

    /**
     * @tc.number    SUB_IMAGE_EDITCTRL_0026
     * @tc.name      testEditFeatureController0026
     * @tc.desc      Verify right top drag persists the grown material width.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEditFeatureController0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEditFeatureController0026 begin');
      const cf: ComputeFeature = newController();
      cf.startDrag(NodeType.RIGHT_TOP);
      cf.onDrag(5, 0, (w: number, h: number, s: number, fs: number) => {
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cf.materialWidth=${cf.materialWidth}, expected=90`);
      expect(cf.materialWidth).assertEqual(90);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cf.materialHeight=${cf.materialHeight}, expected=60`);
      expect(cf.materialHeight).assertEqual(60);
      log('testEditFeatureController0026 end');
    })

    /**
     * @tc.number    SUB_IMAGE_EDITCTRL_0027
     * @tc.name      testEditFeatureController0027
     * @tc.desc      Verify left bottom drag shrinks width by twice the x delta.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEditFeatureController0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEditFeatureController0027 begin');
      const cf: ComputeFeature = newController();
      cf.startDrag(NodeType.LEFT_BOTTOM);
      let gotW: number = 0;
      let gotH: number = 0;
      let gotScale: number = 0;
      let gotFs: number = 0;
      cf.onDrag(5, 0, (w: number, h: number, s: number, fs: number) => {
        gotW = w;
        gotH = h;
        gotScale = s;
        gotFs = fs;
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual gotW=${gotW}, expected=70`);
      expect(gotW).assertEqual(70);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual gotH=${gotH}, expected=60`);
      expect(gotH).assertEqual(60);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual gotScale=${gotScale}, expected=0.875`);
      expect(gotScale).assertEqual(0.875);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual gotFs=${gotFs}, expected=17.5`);
      expect(gotFs).assertEqual(17.5);
      log('testEditFeatureController0027 end');
    })

    /**
     * @tc.number    SUB_IMAGE_EDITCTRL_0028
     * @tc.name      testEditFeatureController0028
     * @tc.desc      Verify left top drag without switch case collapses to min width.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEditFeatureController0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEditFeatureController0028 begin');
      const cf: ComputeFeature = newController();
      cf.startDrag(NodeType.LEFT_TOP);
      let gotW: number = 0;
      let gotH: number = 0;
      let gotScale: number = 0;
      let gotFs: number = 0;
      cf.onDrag(5, 0, (w: number, h: number, s: number, fs: number) => {
        gotW = w;
        gotH = h;
        gotScale = s;
        gotFs = fs;
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual gotW=${gotW}, expected=40`);
      expect(gotW).assertEqual(40);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual gotH=${gotH}, expected=60`);
      expect(gotH).assertEqual(60);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual gotScale=${gotScale}, expected=0.5`);
      expect(gotScale).assertEqual(0.5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual gotFs=${gotFs}, expected=10`);
      expect(gotFs).assertEqual(10);
      log('testEditFeatureController0028 end');
    })

    /**
     * @tc.number    SUB_IMAGE_EDITCTRL_0029
     * @tc.name      testEditFeatureController0029
     * @tc.desc      Verify right bottom drag grows width like right top.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEditFeatureController0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEditFeatureController0029 begin');
      const cf: ComputeFeature = newController();
      cf.startDrag(NodeType.RIGHT_BOTTOM);
      let gotW: number = 0;
      let gotH: number = 0;
      cf.onDrag(5, 0, (w: number, h: number, s: number, fs: number) => {
        gotW = w;
        gotH = h;
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual gotW=${gotW}, expected=90`);
      expect(gotW).assertEqual(90);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual gotH=${gotH}, expected=60`);
      expect(gotH).assertEqual(60);
      log('testEditFeatureController0029 end');
    })

    /**
     * @tc.number    SUB_IMAGE_EDITCTRL_0030
     * @tc.name      testEditFeatureController0030
     * @tc.desc      Verify endDrag resets the active node type to left top.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEditFeatureController0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEditFeatureController0030 begin');
      const cf: ComputeFeature = newController();
      cf.startDrag(NodeType.RIGHT_TOP);
      cf.endDrag();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cf.currentType=${cf.currentType}, expected=NodeType.LEFT_TOP`);
      expect(cf.currentType).assertEqual(NodeType.LEFT_TOP);
      log('testEditFeatureController0030 end');
    })

    /**
     * @tc.number    SUB_IMAGE_EDITCTRL_0031
     * @tc.name      testEditFeatureController0031
     * @tc.desc      Verify endDrag clears width, height and font size snapshots.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEditFeatureController0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEditFeatureController0031 begin');
      const cf: ComputeFeature = newController();
      cf.startDrag(NodeType.RIGHT_TOP);
      cf.endDrag();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cf.dragStartWidth=${cf.dragStartWidth}, expected=0`);
      expect(cf.dragStartWidth).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cf.dragStartHeight=${cf.dragStartHeight}, expected=0`);
      expect(cf.dragStartHeight).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cf.dragStartFontSize=${cf.dragStartFontSize}, expected=0`);
      expect(cf.dragStartFontSize).assertEqual(0);
      log('testEditFeatureController0031 end');
    })

    /**
     * @tc.number    SUB_IMAGE_EDITCTRL_0032
     * @tc.name      testEditFeatureController0032
     * @tc.desc      Verify endDrag clears the center position snapshot.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEditFeatureController0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEditFeatureController0032 begin');
      const cf: ComputeFeature = newController();
      cf.startDrag(NodeType.CENTER_MATERIAL);
      cf.endDrag();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cf.dragStartX=${cf.dragStartX}, expected=0`);
      expect(cf.dragStartX).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cf.dragStartY=${cf.dragStartY}, expected=0`);
      expect(cf.dragStartY).assertEqual(0);
      log('testEditFeatureController0032 end');
    })

    /**
     * @tc.number    SUB_IMAGE_EDITCTRL_0033
     * @tc.name      testEditFeatureController0033
     * @tc.desc      Verify center drag to the right moves x within image bounds.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEditFeatureController0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEditFeatureController0033 begin');
      const cf: ComputeFeature = newController();
      cf.startDrag(NodeType.CENTER_MATERIAL);
      let gotX: number = 0;
      let gotY: number = 0;
      cf.onDragCenter(10, 0, (x: number, y: number) => {
        gotX = x;
        gotY = y;
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual gotX=${gotX}, expected=210`);
      expect(gotX).assertEqual(210);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual gotY=${gotY}, expected=150`);
      expect(gotY).assertEqual(150);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cf.x=${cf.x}, expected=210`);
      expect(cf.x).assertEqual(210);
      log('testEditFeatureController0033 end');
    })

    /**
     * @tc.number    SUB_IMAGE_EDITCTRL_0034
     * @tc.name      testEditFeatureController0034
     * @tc.desc      Verify center drag clamps x at the left image boundary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEditFeatureController0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEditFeatureController0034 begin');
      const cf: ComputeFeature = newController();
      cf.startDrag(NodeType.CENTER_MATERIAL);
      let gotX: number = 0;
      cf.onDragCenter(-200, 0, (x: number, y: number) => {
        gotX = x;
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual gotX=${gotX}, expected=140`);
      expect(gotX).assertEqual(140);
      log('testEditFeatureController0034 end');
    })

    /**
     * @tc.number    SUB_IMAGE_EDITCTRL_0035
     * @tc.name      testEditFeatureController0035
     * @tc.desc      Verify center drag clamps y at the top image boundary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEditFeatureController0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEditFeatureController0035 begin');
      const cf: ComputeFeature = newController();
      cf.startDrag(NodeType.CENTER_MATERIAL);
      let gotY: number = 0;
      cf.onDragCenter(0, -300, (x: number, y: number) => {
        gotY = y;
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual gotY=${gotY}, expected=130`);
      expect(gotY).assertEqual(130);
      log('testEditFeatureController0035 end');
    })

    /**
     * @tc.number    SUB_IMAGE_EDITCTRL_0036
     * @tc.name      testEditFeatureController0036
     * @tc.desc      Verify adjustMaxMin lifts width and height up to the min size.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEditFeatureController0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEditFeatureController0036 begin');
      const cf: ComputeFeature = newController();
      cf.adjustMaxMin(5, 5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cf.materialWidth=${cf.materialWidth}, expected=40`);
      expect(cf.materialWidth).assertEqual(40);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cf.materialHeight=${cf.materialHeight}, expected=30`);
      expect(cf.materialHeight).assertEqual(30);
      log('testEditFeatureController0036 end');
    })

    /**
     * @tc.number    SUB_IMAGE_EDITCTRL_0037
     * @tc.name      testEditFeatureController0037
     * @tc.desc      Verify adjustMaxMin clamps oversized width to the image bound.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEditFeatureController0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEditFeatureController0037 begin');
      const cf: ComputeFeature = newController();
      cf.adjustMaxMin(1000, 50);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cf.materialWidth=${cf.materialWidth}, expected=200`);
      expect(cf.materialWidth).assertEqual(200);
      log('testEditFeatureController0037 end');
    })

    /**
     * @tc.number    SUB_IMAGE_EDITCTRL_0038
     * @tc.name      testEditFeatureController0038
     * @tc.desc      Verify adjustMaxMin clamps oversized height to the image bound.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEditFeatureController0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEditFeatureController0038 begin');
      const cf: ComputeFeature = newController();
      cf.adjustMaxMin(50, 1000);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cf.materialHeight=${cf.materialHeight}, expected=100`);
      expect(cf.materialHeight).assertEqual(100);
      log('testEditFeatureController0038 end');
    })

    /**
     * @tc.number    SUB_IMAGE_EDITCTRL_0039
     * @tc.name      testEditFeatureController0039
     * @tc.desc      Verify adjustMaxMin keeps values inside limits unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEditFeatureController0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEditFeatureController0039 begin');
      const cf: ComputeFeature = newController();
      cf.adjustMaxMin(100, 60);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cf.materialWidth=${cf.materialWidth}, expected=100`);
      expect(cf.materialWidth).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual cf.materialHeight=${cf.materialHeight}, expected=60`);
      expect(cf.materialHeight).assertEqual(60);
      log('testEditFeatureController0039 end');
    })

    /**
     * @tc.number    SUB_IMAGE_EDITCTRL_0040
     * @tc.name      testEditFeatureController0040
     * @tc.desc      Verify two controllers keep independent drag state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEditFeatureController0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEditFeatureController0040 begin');
      const first: ComputeFeature = newController();
      const second: ComputeFeature = newController();
      first.onDragMaterial(30, 30);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.x=${first.x}, expected=230`);
      expect(first.x).assertEqual(230);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.x=${second.x}, expected=200`);
      expect(second.x).assertEqual(200);
      log('testEditFeatureController0040 end');
    })

    /**
     * @tc.number    SUB_IMAGE_EDITCTRL_0041
     * @tc.name      testEditFeatureController0041
     * @tc.desc      Verify a fresh PixelMapQueue pops undefined.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEditFeatureController0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEditFeatureController0041 begin');
      const queue: PixelMapQueue = new PixelMapQueue();
      const popped: PixelMap | undefined = queue.pop();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined popped`);
      expect(popped).assertUndefined();
      log('testEditFeatureController0041 end');
    })

    /**
     * @tc.number    SUB_IMAGE_EDITCTRL_0042
     * @tc.name      testEditFeatureController0042
     * @tc.desc      Verify push then pop returns the same PixelMap instance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEditFeatureController0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEditFeatureController0042 begin');
      const queue: PixelMapQueue = new PixelMapQueue();
      const pm: PixelMap = createTestPixelMap();
      queue.push(pm);
      const popped: PixelMap | undefined = queue.pop();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue popped === pm=${popped === pm}`);
      expect(popped === pm).assertTrue();
      log('testEditFeatureController0042 end');
    })

    /**
     * @tc.number    SUB_IMAGE_EDITCTRL_0043
     * @tc.name      testEditFeatureController0043
     * @tc.desc      Verify two pushed pixel maps pop in last in first out order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEditFeatureController0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEditFeatureController0043 begin');
      const queue: PixelMapQueue = new PixelMapQueue();
      const first: PixelMap = createTestPixelMap();
      const second: PixelMap = createTestPixelMap();
      queue.push(first);
      queue.push(second);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue queue.pop() === second`);
      expect(queue.pop() === second).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue queue.pop() === first`);
      expect(queue.pop() === first).assertTrue();
      log('testEditFeatureController0043 end');
    })

    /**
     * @tc.number    SUB_IMAGE_EDITCTRL_0044
     * @tc.name      testEditFeatureController0044
     * @tc.desc      Verify three pushed pixel maps pop in reverse push order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEditFeatureController0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEditFeatureController0044 begin');
      const queue: PixelMapQueue = new PixelMapQueue();
      const a: PixelMap = createTestPixelMap();
      const b: PixelMap = createTestPixelMap();
      const c: PixelMap = createTestPixelMap();
      queue.push(a);
      queue.push(b);
      queue.push(c);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue queue.pop() === c`);
      expect(queue.pop() === c).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue queue.pop() === b`);
      expect(queue.pop() === b).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue queue.pop() === a`);
      expect(queue.pop() === a).assertTrue();
      log('testEditFeatureController0044 end');
    })

    /**
     * @tc.number    SUB_IMAGE_EDITCTRL_0045
     * @tc.name      testEditFeatureController0045
     * @tc.desc      Verify popping an emptied queue yields undefined again.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEditFeatureController0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEditFeatureController0045 begin');
      const queue: PixelMapQueue = new PixelMapQueue();
      queue.push(createTestPixelMap());
      queue.pop();
      const popped: PixelMap | undefined = queue.pop();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined popped`);
      expect(popped).assertUndefined();
      log('testEditFeatureController0045 end');
    })

    /**
     * @tc.number    SUB_IMAGE_EDITCTRL_0046
     * @tc.name      testEditFeatureController0046
     * @tc.desc      Verify interleaved push and pop keeps stack semantics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEditFeatureController0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEditFeatureController0046 begin');
      const queue: PixelMapQueue = new PixelMapQueue();
      const a: PixelMap = createTestPixelMap();
      const b: PixelMap = createTestPixelMap();
      const c: PixelMap = createTestPixelMap();
      queue.push(a);
      queue.push(b);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue queue.pop() === b`);
      expect(queue.pop() === b).assertTrue();
      queue.push(c);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue queue.pop() === c`);
      expect(queue.pop() === c).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue queue.pop() === a`);
      expect(queue.pop() === a).assertTrue();
      log('testEditFeatureController0046 end');
    })

    /**
     * @tc.number    SUB_IMAGE_EDITCTRL_0047
     * @tc.name      testEditFeatureController0047
     * @tc.desc      Verify two queues keep independent stacks.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEditFeatureController0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEditFeatureController0047 begin');
      const first: PixelMapQueue = new PixelMapQueue();
      const second: PixelMapQueue = new PixelMapQueue();
      first.push(createTestPixelMap());
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined second.pop()`);
      expect(second.pop()).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue first.pop() !== undefined`);
      expect(first.pop() !== undefined).assertTrue();
      log('testEditFeatureController0047 end');
    })

    /**
     * @tc.number    SUB_IMAGE_EDITCTRL_0048
     * @tc.name      testEditFeatureController0048
     * @tc.desc      Verify PixelMapQueue is an instance of its class.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEditFeatureController0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEditFeatureController0048 begin');
      const queue: PixelMapQueue = new PixelMapQueue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${queue instanceof PixelMapQueue}`);
      expect(queue instanceof PixelMapQueue).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof queue.push=${typeof queue.push}, expected='function'`);
      expect(typeof queue.push).assertEqual('function');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof queue.pop=${typeof queue.pop}, expected='function'`);
      expect(typeof queue.pop).assertEqual('function');
      log('testEditFeatureController0048 end');
    })
  })
}
