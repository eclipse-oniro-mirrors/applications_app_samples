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
import drawing from '@ohos.graphics.drawing';
import common2D from '@ohos.graphics.common2D';

const DOMAIN: number = 0xF814;
const TAG: string = 'DrawingParamModelCoreTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

function makeSampleRect(): common2D.Rect {
  const rect: common2D.Rect = { left: 20, top: 150, right: 300, bottom: 250 };
  return rect;
}

function makeTitleColor(): common2D.Color {
  const color: common2D.Color = { alpha: 255, red: 68, green: 114, blue: 195 };
  return color;
}

export default function drawingParamModelCoreTest(): void {
  describe('DrawingParamModelCoreTest', () => {
    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0401
     * @tc.name      testDrawingParam0401
     * @tc.desc      Verify Pen can be constructed standalone without a canvas.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0401', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0401 begin');
      const pen: drawing.Pen = new drawing.Pen();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${pen !== undefined && pen !== null}`);
      expect(pen !== undefined && pen !== null).assertTrue();
      log('testDrawingParam0401 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0402
     * @tc.name      testDrawingParam0402
     * @tc.desc      Verify Pen construction returns an object value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0402', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0402 begin');
      const pen: drawing.Pen = new drawing.Pen();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof pen=${typeof pen}, expected='object'`);
      expect(typeof pen).assertEqual('object');
      log('testDrawingParam0402 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0403
     * @tc.name      testDrawingParam0403
     * @tc.desc      Verify Pen setColor with color object round trips red.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0403', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0403 begin');
      const pen: drawing.Pen = new drawing.Pen();
      const color: common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 };
      pen.setColor(color);
      const got: common2D.Color = pen.getColor();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.alpha=${got.alpha}, expected=255`);
      expect(got.alpha).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.red=${got.red}, expected=255`);
      expect(got.red).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.green=${got.green}, expected=0`);
      expect(got.green).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.blue=${got.blue}, expected=0`);
      expect(got.blue).assertEqual(0);
      log('testDrawingParam0403 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0404
     * @tc.name      testDrawingParam0404
     * @tc.desc      Verify Pen setColor with sample title color round trips all channels.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0404', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0404 begin');
      const pen: drawing.Pen = new drawing.Pen();
      pen.setColor(makeTitleColor());
      const got: common2D.Color = pen.getColor();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.alpha=${got.alpha}, expected=255`);
      expect(got.alpha).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.red=${got.red}, expected=68`);
      expect(got.red).assertEqual(68);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.green=${got.green}, expected=114`);
      expect(got.green).assertEqual(114);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.blue=${got.blue}, expected=195`);
      expect(got.blue).assertEqual(195);
      log('testDrawingParam0404 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0405
     * @tc.name      testDrawingParam0405
     * @tc.desc      Verify Pen four argument setColor round trips blue.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0405', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0405 begin');
      const pen: drawing.Pen = new drawing.Pen();
      pen.setColor(0xFF, 0x00, 0x00, 0xFF);
      const got: common2D.Color = pen.getColor();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.alpha=${got.alpha}, expected=255`);
      expect(got.alpha).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.red=${got.red}, expected=0`);
      expect(got.red).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.green=${got.green}, expected=0`);
      expect(got.green).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.blue=${got.blue}, expected=255`);
      expect(got.blue).assertEqual(255);
      log('testDrawingParam0405 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0406
     * @tc.name      testDrawingParam0406
     * @tc.desc      Verify Pen four argument setColor round trips red used by sample canvas matrix.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0406', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0406 begin');
      const pen: drawing.Pen = new drawing.Pen();
      pen.setColor(0xFF, 0xFF, 0x00, 0x00);
      const got: common2D.Color = pen.getColor();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.alpha=${got.alpha}, expected=255`);
      expect(got.alpha).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.red=${got.red}, expected=255`);
      expect(got.red).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.green=${got.green}, expected=0`);
      expect(got.green).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.blue=${got.blue}, expected=0`);
      expect(got.blue).assertEqual(0);
      log('testDrawingParam0406 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0407
     * @tc.name      testDrawingParam0407
     * @tc.desc      Verify Pen packed number setColor completes without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0407', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0407 begin');
      const pen: drawing.Pen = new drawing.Pen();
      pen.setColor(0xFF0000FF);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${pen !== undefined && pen !== null}`);
      expect(pen !== undefined && pen !== null).assertTrue();
      log('testDrawingParam0407 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0408
     * @tc.name      testDrawingParam0408
     * @tc.desc      Verify Pen setStrokeWidth with sample width 3 completes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0408', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0408 begin');
      const pen: drawing.Pen = new drawing.Pen();
      pen.setStrokeWidth(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${pen !== undefined && pen !== null}`);
      expect(pen !== undefined && pen !== null).assertTrue();
      log('testDrawingParam0408 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0409
     * @tc.name      testDrawingParam0409
     * @tc.desc      Verify Pen setStrokeWidth with sample width 10.0 completes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0409', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0409 begin');
      const pen: drawing.Pen = new drawing.Pen();
      pen.setStrokeWidth(10.0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${pen !== undefined && pen !== null}`);
      expect(pen !== undefined && pen !== null).assertTrue();
      log('testDrawingParam0409 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0410
     * @tc.name      testDrawingParam0410
     * @tc.desc      Verify Pen setAntiAlias true completes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0410', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0410 begin');
      const pen: drawing.Pen = new drawing.Pen();
      pen.setAntiAlias(true);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${pen !== undefined && pen !== null}`);
      expect(pen !== undefined && pen !== null).assertTrue();
      log('testDrawingParam0410 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0411
     * @tc.name      testDrawingParam0411
     * @tc.desc      Verify Pen setAntiAlias false completes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0411', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0411 begin');
      const pen: drawing.Pen = new drawing.Pen();
      pen.setAntiAlias(false);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${pen !== undefined && pen !== null}`);
      expect(pen !== undefined && pen !== null).assertTrue();
      log('testDrawingParam0411 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0412
     * @tc.name      testDrawingParam0412
     * @tc.desc      Verify Pen combined color width and antialias configuration completes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0412', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0412 begin');
      const pen: drawing.Pen = new drawing.Pen();
      pen.setColor(makeTitleColor());
      pen.setStrokeWidth(10.0);
      pen.setAntiAlias(true);
      const got: common2D.Color = pen.getColor();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.red=${got.red}, expected=68`);
      expect(got.red).assertEqual(68);
      log('testDrawingParam0412 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0413
     * @tc.name      testDrawingParam0413
     * @tc.desc      Verify Pen setPathEffect with sample dash effect completes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0413', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0413 begin');
      const pen: drawing.Pen = new drawing.Pen();
      const intervals: number[] = [20.0, 10.0];
      const effect: drawing.PathEffect = drawing.PathEffect.createDashPathEffect(intervals, 0);
      pen.setPathEffect(effect);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${pen !== undefined && pen !== null}`);
      expect(pen !== undefined && pen !== null).assertTrue();
      log('testDrawingParam0413 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0414
     * @tc.name      testDrawingParam0414
     * @tc.desc      Verify Pen reset completes without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0414', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0414 begin');
      const pen: drawing.Pen = new drawing.Pen();
      pen.setStrokeWidth(10.0);
      pen.reset();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${pen !== undefined && pen !== null}`);
      expect(pen !== undefined && pen !== null).assertTrue();
      log('testDrawingParam0414 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0415
     * @tc.name      testDrawingParam0415
     * @tc.desc      Verify Pen copy constructor produces a standalone pen.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0415', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0415 begin');
      const pen: drawing.Pen = new drawing.Pen();
      pen.setColor(makeTitleColor());
      const copy: drawing.Pen = new drawing.Pen(pen);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${copy !== undefined && copy !== null}`);
      expect(copy !== undefined && copy !== null).assertTrue();
      const got: common2D.Color = copy.getColor();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.red=${got.red}, expected=68`);
      expect(got.red).assertEqual(68);
      log('testDrawingParam0415 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0416
     * @tc.name      testDrawingParam0416
     * @tc.desc      Verify two pens keep independent color state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0416', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0416 begin');
      const penA: drawing.Pen = new drawing.Pen();
      const penB: drawing.Pen = new drawing.Pen();
      const red: common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 };
      const blue: common2D.Color = { alpha: 255, red: 0, green: 0, blue: 255 };
      penA.setColor(red);
      penB.setColor(blue);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual penA.getColor().red=${penA.getColor().red}, expected=255`);
      expect(penA.getColor().red).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual penB.getColor().red=${penB.getColor().red}, expected=0`);
      expect(penB.getColor().red).assertEqual(0);
      log('testDrawingParam0416 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0417
     * @tc.name      testDrawingParam0417
     * @tc.desc      Verify Brush can be constructed standalone without a canvas.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0417', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0417 begin');
      const brush: drawing.Brush = new drawing.Brush();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${brush !== undefined && brush !== null}`);
      expect(brush !== undefined && brush !== null).assertTrue();
      log('testDrawingParam0417 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0418
     * @tc.name      testDrawingParam0418
     * @tc.desc      Verify Brush construction returns an object value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0418', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0418 begin');
      const brush: drawing.Brush = new drawing.Brush();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof brush=${typeof brush}, expected='object'`);
      expect(typeof brush).assertEqual('object');
      log('testDrawingParam0418 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0419
     * @tc.name      testDrawingParam0419
     * @tc.desc      Verify Brush setColor object form round trips red.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0419', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0419 begin');
      const brush: drawing.Brush = new drawing.Brush();
      const color: common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 };
      brush.setColor(color);
      const got: common2D.Color = brush.getColor();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.red=${got.red}, expected=255`);
      expect(got.red).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.green=${got.green}, expected=0`);
      expect(got.green).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.blue=${got.blue}, expected=0`);
      expect(got.blue).assertEqual(0);
      log('testDrawingParam0419 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0420
     * @tc.name      testDrawingParam0420
     * @tc.desc      Verify Brush setColor object form round trips sample path blue.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0420', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0420 begin');
      const brush: drawing.Brush = new drawing.Brush();
      const color: common2D.Color = { alpha: 255, red: 0, green: 0, blue: 255 };
      brush.setColor(color);
      const got: common2D.Color = brush.getColor();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.red=${got.red}, expected=0`);
      expect(got.red).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.blue=${got.blue}, expected=255`);
      expect(got.blue).assertEqual(255);
      log('testDrawingParam0420 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0421
     * @tc.name      testDrawingParam0421
     * @tc.desc      Verify Brush setColor sample title color round trips all channels.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0421', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0421 begin');
      const brush: drawing.Brush = new drawing.Brush();
      brush.setColor(makeTitleColor());
      const got: common2D.Color = brush.getColor();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.alpha=${got.alpha}, expected=255`);
      expect(got.alpha).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.red=${got.red}, expected=68`);
      expect(got.red).assertEqual(68);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.green=${got.green}, expected=114`);
      expect(got.green).assertEqual(114);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.blue=${got.blue}, expected=195`);
      expect(got.blue).assertEqual(195);
      log('testDrawingParam0421 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0422
     * @tc.name      testDrawingParam0422
     * @tc.desc      Verify Brush four argument setColor round trips green.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0422', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0422 begin');
      const brush: drawing.Brush = new drawing.Brush();
      brush.setColor(0xFF, 0x00, 0xFF, 0x00);
      const got: common2D.Color = brush.getColor();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.red=${got.red}, expected=0`);
      expect(got.red).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.green=${got.green}, expected=255`);
      expect(got.green).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual got.blue=${got.blue}, expected=0`);
      expect(got.blue).assertEqual(0);
      log('testDrawingParam0422 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0423
     * @tc.name      testDrawingParam0423
     * @tc.desc      Verify Brush packed number setColor completes without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0423', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0423 begin');
      const brush: drawing.Brush = new drawing.Brush();
      brush.setColor(0xFFFFFF00);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${brush !== undefined && brush !== null}`);
      expect(brush !== undefined && brush !== null).assertTrue();
      log('testDrawingParam0423 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0424
     * @tc.name      testDrawingParam0424
     * @tc.desc      Verify Brush setAntiAlias true completes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0424', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0424 begin');
      const brush: drawing.Brush = new drawing.Brush();
      brush.setAntiAlias(true);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${brush !== undefined && brush !== null}`);
      expect(brush !== undefined && brush !== null).assertTrue();
      log('testDrawingParam0424 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0425
     * @tc.name      testDrawingParam0425
     * @tc.desc      Verify Brush accepts the sample three color linear gradient shader.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0425', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0425 begin');
      const brush: drawing.Brush = new drawing.Brush();
      const startPt: common2D.Point = { x: 100, y: 100 };
      const endPt: common2D.Point = { x: 400, y: 400 };
      const colors: number[] = [0xFFFFFF00, 0xFFFF0000, 0xFF0000FF];
      const shader: drawing.ShaderEffect =
        drawing.ShaderEffect.createLinearGradient(startPt, endPt, colors, drawing.TileMode.CLAMP);
      brush.setShaderEffect(shader);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${brush !== undefined && brush !== null}`);
      expect(brush !== undefined && brush !== null).assertTrue();
      log('testDrawingParam0425 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0426
     * @tc.name      testDrawingParam0426
     * @tc.desc      Verify Brush accepts the sample two color linear gradient shader.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0426', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0426 begin');
      const brush: drawing.Brush = new drawing.Brush();
      const startPt: common2D.Point = { x: 0, y: 0 };
      const endPt: common2D.Point = { x: 0, y: 60 };
      const colors: number[] = [0xFFF8FA12, 0xFFACC3DD];
      const shader: drawing.ShaderEffect =
        drawing.ShaderEffect.createLinearGradient(startPt, endPt, colors, drawing.TileMode.CLAMP);
      brush.setShaderEffect(shader);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${brush !== undefined && brush !== null}`);
      expect(brush !== undefined && brush !== null).assertTrue();
      log('testDrawingParam0426 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0427
     * @tc.name      testDrawingParam0427
     * @tc.desc      Verify Brush combined color and shader configuration completes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0427', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0427 begin');
      const brush: drawing.Brush = new drawing.Brush();
      brush.setColor(makeTitleColor());
      const startPt: common2D.Point = { x: 0, y: 0 };
      const endPt: common2D.Point = { x: 100, y: 100 };
      const colors: number[] = [0xFFFFFF00, 0xFFFF0000];
      const shader: drawing.ShaderEffect =
        drawing.ShaderEffect.createLinearGradient(startPt, endPt, colors, drawing.TileMode.CLAMP);
      brush.setShaderEffect(shader);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual brush.getColor().alpha=${brush.getColor().alpha}`);
      expect(brush.getColor().alpha).assertEqual(255);
      log('testDrawingParam0427 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0428
     * @tc.name      testDrawingParam0428
     * @tc.desc      Verify Brush reset completes without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0428', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0428 begin');
      const brush: drawing.Brush = new drawing.Brush();
      brush.setColor(makeTitleColor());
      brush.reset();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${brush !== undefined && brush !== null}`);
      expect(brush !== undefined && brush !== null).assertTrue();
      log('testDrawingParam0428 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0429
     * @tc.name      testDrawingParam0429
     * @tc.desc      Verify Brush copy constructor produces a standalone brush.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0429', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0429 begin');
      const brush: drawing.Brush = new drawing.Brush();
      brush.setColor(makeTitleColor());
      const copy: drawing.Brush = new drawing.Brush(brush);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${copy !== undefined && copy !== null}`);
      expect(copy !== undefined && copy !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual copy.getColor().red=${copy.getColor().red}, expected=68`);
      expect(copy.getColor().red).assertEqual(68);
      log('testDrawingParam0429 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0430
     * @tc.name      testDrawingParam0430
     * @tc.desc      Verify two brushes keep independent color state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0430', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0430 begin');
      const brushA: drawing.Brush = new drawing.Brush();
      const brushB: drawing.Brush = new drawing.Brush();
      const red: common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 };
      const blue: common2D.Color = { alpha: 255, red: 0, green: 0, blue: 255 };
      brushA.setColor(red);
      brushB.setColor(blue);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual brushA.getColor().red=${brushA.getColor().red}, expected=255`);
      expect(brushA.getColor().red).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual brushB.getColor().red=${brushB.getColor().red}, expected=0`);
      expect(brushB.getColor().red).assertEqual(0);
      log('testDrawingParam0430 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0431
     * @tc.name      testDrawingParam0431
     * @tc.desc      Verify Font can be constructed standalone without a canvas.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0431', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0431 begin');
      const font: drawing.Font = new drawing.Font();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${font !== undefined && font !== null}`);
      expect(font !== undefined && font !== null).assertTrue();
      log('testDrawingParam0431 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0432
     * @tc.name      testDrawingParam0432
     * @tc.desc      Verify Font construction returns an object value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0432', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0432 begin');
      const font: drawing.Font = new drawing.Font();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof font=${typeof font}, expected='object'`);
      expect(typeof font).assertEqual('object');
      log('testDrawingParam0432 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0433
     * @tc.name      testDrawingParam0433
     * @tc.desc      Verify Font setSize 30 round trips through getSize.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0433', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0433 begin');
      const font: drawing.Font = new drawing.Font();
      font.setSize(30);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual font.getSize()=${font.getSize()}, expected=30`);
      expect(font.getSize()).assertEqual(30);
      log('testDrawingParam0433 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0434
     * @tc.name      testDrawingParam0434
     * @tc.desc      Verify Font setSize 22 round trips through getSize.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0434', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0434 begin');
      const font: drawing.Font = new drawing.Font();
      font.setSize(22);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual font.getSize()=${font.getSize()}, expected=22`);
      expect(font.getSize()).assertEqual(22);
      log('testDrawingParam0434 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0435
     * @tc.name      testDrawingParam0435
     * @tc.desc      Verify Font setSize 100 round trips through getSize.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0435', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0435 begin');
      const font: drawing.Font = new drawing.Font();
      font.setSize(100);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual font.getSize()=${font.getSize()}, expected=100`);
      expect(font.getSize()).assertEqual(100);
      log('testDrawingParam0435 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0436
     * @tc.name      testDrawingParam0436
     * @tc.desc      Verify Font setSize 200 round trips through getSize.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0436', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0436 begin');
      const font: drawing.Font = new drawing.Font();
      font.setSize(200);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual font.getSize()=${font.getSize()}, expected=200`);
      expect(font.getSize()).assertEqual(200);
      log('testDrawingParam0436 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0437
     * @tc.name      testDrawingParam0437
     * @tc.desc      Verify Font setSize 0 round trips through getSize.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0437', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0437 begin');
      const font: drawing.Font = new drawing.Font();
      font.setSize(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual font.getSize()=${font.getSize()}, expected=0`);
      expect(font.getSize()).assertEqual(0);
      log('testDrawingParam0437 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0438
     * @tc.name      testDrawingParam0438
     * @tc.desc      Verify Font setSize with fractional value round trips exactly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0438', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0438 begin');
      const font: drawing.Font = new drawing.Font();
      font.setSize(50.5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual font.getSize()=${font.getSize()}, expected=50.5`);
      expect(font.getSize()).assertEqual(50.5);
      log('testDrawingParam0438 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0439
     * @tc.name      testDrawingParam0439
     * @tc.desc      Verify Font getTextPath returns a path object.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0439', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0439 begin');
      const font: drawing.Font = new drawing.Font();
      font.setSize(100);
      const path: drawing.Path = font.getTextPath('AB', 2, 10, 20);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${path !== undefined && path !== null}`);
      expect(path !== undefined && path !== null).assertTrue();
      log('testDrawingParam0439 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0440
     * @tc.name      testDrawingParam0440
     * @tc.desc      Verify glyph text path for visible characters is not empty.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0440', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0440 begin');
      const font: drawing.Font = new drawing.Font();
      font.setSize(100);
      const path: drawing.Path = font.getTextPath('AB', 2, 10, 20);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse path.isEmpty()=${path.isEmpty()}`);
      expect(path.isEmpty()).assertFalse();
      log('testDrawingParam0440 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0441
     * @tc.name      testDrawingParam0441
     * @tc.desc      Verify TextBlob.makeFromString builds a blob for latin text.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0441', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0441 begin');
      const font: drawing.Font = new drawing.Font();
      font.setSize(100);
      const blob: drawing.TextBlob =
        drawing.TextBlob.makeFromString('Hello world', font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${blob !== undefined && blob !== null}`);
      expect(blob !== undefined && blob !== null).assertTrue();
      log('testDrawingParam0441 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0442
     * @tc.name      testDrawingParam0442
     * @tc.desc      Verify TextBlob.makeFromString returns an object value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0442', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0442 begin');
      const font: drawing.Font = new drawing.Font();
      const blob: drawing.TextBlob =
        drawing.TextBlob.makeFromString('Hello world', font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof blob=${typeof blob}, expected='object'`);
      expect(typeof blob).assertEqual('object');
      log('testDrawingParam0442 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0443
     * @tc.name      testDrawingParam0443
     * @tc.desc      Verify TextBlob builds for the sample DrawRect label.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0443', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0443 begin');
      const font: drawing.Font = new drawing.Font();
      font.setSize(22);
      const blob: drawing.TextBlob =
        drawing.TextBlob.makeFromString('DrawRect', font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${blob !== undefined && blob !== null}`);
      expect(blob !== undefined && blob !== null).assertTrue();
      log('testDrawingParam0443 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0444
     * @tc.name      testDrawingParam0444
     * @tc.desc      Verify TextBlob builds for chinese text with utf8 encoding.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0444', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0444 begin');
      const font: drawing.Font = new drawing.Font();
      font.setSize(50);
      const blob: drawing.TextBlob =
        drawing.TextBlob.makeFromString('绘制文本', font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${blob !== undefined && blob !== null}`);
      expect(blob !== undefined && blob !== null).assertTrue();
      log('testDrawingParam0444 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0446
     * @tc.name      testDrawingParam0446
     * @tc.desc      Verify TextBlob builds when the optional encoding argument is omitted.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0446', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0446 begin');
      const font: drawing.Font = new drawing.Font();
      const blob: drawing.TextBlob = drawing.TextBlob.makeFromString('Hello world', font);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${blob !== undefined && blob !== null}`);
      expect(blob !== undefined && blob !== null).assertTrue();
      log('testDrawingParam0446 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0447
     * @tc.name      testDrawingParam0447
     * @tc.desc      Verify TextBlob.makeFromPosText builds a positioned blob.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0447', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0447 begin');
      const font: drawing.Font = new drawing.Font();
      font.setSize(30);
      const p0: common2D.Point = { x: 0, y: 0 };
      const p1: common2D.Point = { x: 10, y: 0 };
      const points: common2D.Point[] = [p0, p1];
      const blob: drawing.TextBlob = drawing.TextBlob.makeFromPosText('AB', 2, points, font);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${blob !== undefined && blob !== null}`);
      expect(blob !== undefined && blob !== null).assertTrue();
      log('testDrawingParam0447 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0448
     * @tc.name      testDrawingParam0448
     * @tc.desc      Verify two TextBlobs built from the same font are independent objects.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0448', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0448 begin');
      const font: drawing.Font = new drawing.Font();
      const blobA: drawing.TextBlob =
        drawing.TextBlob.makeFromString('A', font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
      const blobB: drawing.TextBlob =
        drawing.TextBlob.makeFromString('B', font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue blobA !== blobB=${blobA !== blobB}`);
      expect(blobA !== blobB).assertTrue();
      log('testDrawingParam0448 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0449
     * @tc.name      testDrawingParam0449
     * @tc.desc      Verify a fresh Path reports isEmpty true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0449', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0449 begin');
      const path: drawing.Path = new drawing.Path();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue path.isEmpty()=${path.isEmpty()}`);
      expect(path.isEmpty()).assertTrue();
      log('testDrawingParam0449 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0450
     * @tc.name      testDrawingParam0450
     * @tc.desc      Verify moveTo makes a Path no longer empty.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0450', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0450 begin');
      const path: drawing.Path = new drawing.Path();
      path.moveTo(100, 100);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse path.isEmpty()=${path.isEmpty()}`);
      expect(path.isEmpty()).assertFalse();
      log('testDrawingParam0450 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0451
     * @tc.name      testDrawingParam0451
     * @tc.desc      Verify moveTo lineTo close sequence completes without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0451', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0451 begin');
      const path: drawing.Path = new drawing.Path();
      path.moveTo(150, 80);
      path.lineTo(210, 194);
      path.close();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse path.isEmpty()=${path.isEmpty()}`);
      expect(path.isEmpty()).assertFalse();
      log('testDrawingParam0451 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0452
     * @tc.name      testDrawingParam0452
     * @tc.desc      Verify addRect with sample rect bounds produces a non empty path.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0452', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0452 begin');
      const path: drawing.Path = new drawing.Path();
      path.addRect(makeSampleRect());
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse path.isEmpty()=${path.isEmpty()}`);
      expect(path.isEmpty()).assertFalse();
      log('testDrawingParam0452 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0453
     * @tc.name      testDrawingParam0453
     * @tc.desc      Verify addOval with sample rect completes without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0453', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0453 begin');
      const path: drawing.Path = new drawing.Path();
      path.addOval(makeSampleRect(), 0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse path.isEmpty()=${path.isEmpty()}`);
      expect(path.isEmpty()).assertFalse();
      log('testDrawingParam0453 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0454
     * @tc.name      testDrawingParam0454
     * @tc.desc      Verify addRoundRect with sample round rect completes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0454', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0454 begin');
      const roundRect: drawing.RoundRect = new drawing.RoundRect(makeSampleRect(), 20, 20);
      const path: drawing.Path = new drawing.Path();
      path.addRoundRect(roundRect);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse path.isEmpty()=${path.isEmpty()}`);
      expect(path.isEmpty()).assertFalse();
      log('testDrawingParam0454 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0455
     * @tc.name      testDrawingParam0455
     * @tc.desc      Verify addPolygon with three closed points completes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0455', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0455 begin');
      const path: drawing.Path = new drawing.Path();
      const p1: common2D.Point = { x: 10, y: 160 };
      const p2: common2D.Point = { x: 110, y: 160 };
      const p3: common2D.Point = { x: 60, y: 100 };
      const points: common2D.Point[] = [p1, p2, p3];
      path.addPolygon(points, true);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse path.isEmpty()=${path.isEmpty()}`);
      expect(path.isEmpty()).assertFalse();
      log('testDrawingParam0455 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0456
     * @tc.name      testDrawingParam0456
     * @tc.desc      Verify addPolygon with three open points completes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0456', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0456 begin');
      const path: drawing.Path = new drawing.Path();
      const p1: common2D.Point = { x: 10, y: 160 };
      const p2: common2D.Point = { x: 110, y: 160 };
      const p3: common2D.Point = { x: 60, y: 100 };
      const points: common2D.Point[] = [p1, p2, p3];
      path.addPolygon(points, false);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse path.isEmpty()=${path.isEmpty()}`);
      expect(path.isEmpty()).assertFalse();
      log('testDrawingParam0456 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0457
     * @tc.name      testDrawingParam0457
     * @tc.desc      Verify addArc with sample angles completes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0457', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0457 begin');
      const path: drawing.Path = new drawing.Path();
      path.addArc(makeSampleRect(), 0, -90);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse path.isEmpty()=${path.isEmpty()}`);
      expect(path.isEmpty()).assertFalse();
      log('testDrawingParam0457 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0458
     * @tc.name      testDrawingParam0458
     * @tc.desc      Verify addCircle with clockwise direction completes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0458', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0458 begin');
      const path: drawing.Path = new drawing.Path();
      path.addCircle(380, 750, 100, drawing.PathDirection.CLOCKWISE);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse path.isEmpty()=${path.isEmpty()}`);
      expect(path.isEmpty()).assertFalse();
      log('testDrawingParam0458 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0459
     * @tc.name      testDrawingParam0459
     * @tc.desc      Verify addCircle with omitted optional direction completes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0459', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0459 begin');
      const path: drawing.Path = new drawing.Path();
      path.addCircle(100, 100, 50);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse path.isEmpty()=${path.isEmpty()}`);
      expect(path.isEmpty()).assertFalse();
      log('testDrawingParam0459 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0460
     * @tc.name      testDrawingParam0460
     * @tc.desc      Verify cubicTo with sample curve values completes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0460', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0460 begin');
      const path: drawing.Path = new drawing.Path();
      path.moveTo(400, 350);
      path.cubicTo(400, 420, 550, 380, 450, 500);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse path.isEmpty()=${path.isEmpty()}`);
      expect(path.isEmpty()).assertFalse();
      log('testDrawingParam0460 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0461
     * @tc.name      testDrawingParam0461
     * @tc.desc      Verify rCubicTo with sample curve values completes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0461', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0461 begin');
      const path: drawing.Path = new drawing.Path();
      path.moveTo(100, 380);
      path.rCubicTo(200, 200, 200, 100, 200, 50);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse path.isEmpty()=${path.isEmpty()}`);
      expect(path.isEmpty()).assertFalse();
      log('testDrawingParam0461 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0462
     * @tc.name      testDrawingParam0462
     * @tc.desc      Verify quadTo builds a non empty path.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0462', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0462 begin');
      const path: drawing.Path = new drawing.Path();
      path.moveTo(0, 0);
      path.quadTo(50, 100, 100, 0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse path.isEmpty()=${path.isEmpty()}`);
      expect(path.isEmpty()).assertFalse();
      log('testDrawingParam0462 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0463
     * @tc.name      testDrawingParam0463
     * @tc.desc      Verify calling close twice completes without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0463', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0463 begin');
      const path: drawing.Path = new drawing.Path();
      path.moveTo(10, 10);
      path.lineTo(50, 10);
      path.close();
      path.close();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse path.isEmpty()=${path.isEmpty()}`);
      expect(path.isEmpty()).assertFalse();
      log('testDrawingParam0463 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0464
     * @tc.name      testDrawingParam0464
     * @tc.desc      Verify offset returns a new Path object.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0464', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0464 begin');
      const path: drawing.Path = new drawing.Path();
      path.addRect(makeSampleRect());
      const moved: drawing.Path = path.offset(10, 20);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${moved !== undefined && moved !== null}`);
      expect(moved !== undefined && moved !== null).assertTrue();
      log('testDrawingParam0464 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0465
     * @tc.name      testDrawingParam0465
     * @tc.desc      Verify offset result path is not empty.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0465', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0465 begin');
      const path: drawing.Path = new drawing.Path();
      path.addRect(makeSampleRect());
      const moved: drawing.Path = path.offset(10, 20);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse moved.isEmpty()=${moved.isEmpty()}`);
      expect(moved.isEmpty()).assertFalse();
      log('testDrawingParam0465 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0466
     * @tc.name      testDrawingParam0466
     * @tc.desc      Verify setFillType EVEN_ODD round trips through getFillType.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0466', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0466 begin');
      const path: drawing.Path = new drawing.Path();
      path.setFillType(drawing.PathFillType.EVEN_ODD);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual path.getFillType()=${path.getFillType()}`);
      expect(path.getFillType()).assertEqual(drawing.PathFillType.EVEN_ODD);
      log('testDrawingParam0466 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0467
     * @tc.name      testDrawingParam0467
     * @tc.desc      Verify setFillType WINDING round trips through getFillType.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0467', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0467 begin');
      const path: drawing.Path = new drawing.Path();
      path.setFillType(drawing.PathFillType.EVEN_ODD);
      path.setFillType(drawing.PathFillType.WINDING);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual path.getFillType()=${path.getFillType()}`);
      expect(path.getFillType()).assertEqual(drawing.PathFillType.WINDING);
      log('testDrawingParam0467 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0468
     * @tc.name      testDrawingParam0468
     * @tc.desc      Verify isEqual returns true for identical simple geometry.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0468', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0468 begin');
      const pathA: drawing.Path = new drawing.Path();
      pathA.moveTo(0, 0);
      pathA.lineTo(100, 0);
      const pathB: drawing.Path = new drawing.Path();
      pathB.moveTo(0, 0);
      pathB.lineTo(100, 0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue pathA.isEqual(pathB)=${pathA.isEqual(pathB)}`);
      expect(pathA.isEqual(pathB)).assertTrue();
      log('testDrawingParam0468 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0469
     * @tc.name      testDrawingParam0469
     * @tc.desc      Verify isEqual returns false for different geometry.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0469', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0469 begin');
      const pathA: drawing.Path = new drawing.Path();
      pathA.moveTo(0, 0);
      pathA.lineTo(100, 0);
      const pathB: drawing.Path = new drawing.Path();
      pathB.moveTo(0, 0);
      pathB.lineTo(50, 50);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse pathA.isEqual(pathB)=${pathA.isEqual(pathB)}`);
      expect(pathA.isEqual(pathB)).assertFalse();
      log('testDrawingParam0469 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0470
     * @tc.name      testDrawingParam0470
     * @tc.desc      Verify Path op with union returns a boolean result.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0470', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0470 begin');
      const pathA: drawing.Path = new drawing.Path();
      pathA.addRect(makeSampleRect());
      const pathB: drawing.Path = new drawing.Path();
      pathB.addCircle(160, 200, 50, drawing.PathDirection.CLOCKWISE);
      const result: boolean = pathA.op(pathB, drawing.PathOp.UNION);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof result=${typeof result}, expected='boolean'`);
      expect(typeof result).assertEqual('boolean');
      log('testDrawingParam0470 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0471
     * @tc.name      testDrawingParam0471
     * @tc.desc      Verify the sample pentagon region path builds without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0471', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0471 begin');
      const centerX = 70;
      const centerY = 600;
      const sideLength = 60;
      const angleIncrement = 2 * Math.PI / 5;
      const regionPath: drawing.Path = new drawing.Path();
      for (let i: number = 0; i < 5; ++i) {
        const angle: number = angleIncrement * i;
        const x: number = centerX + sideLength * Math.cos(angle - 60);
        const y: number = centerY - sideLength * Math.sin(angle - 60);
        if (i === 0) {
          regionPath.moveTo(x, y);
        } else {
          regionPath.lineTo(x, y);
        }
      }
      regionPath.close();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse regionPath.isEmpty()=${regionPath.isEmpty()}`);
      expect(regionPath.isEmpty()).assertFalse();
      log('testDrawingParam0471 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0472
     * @tc.name      testDrawingParam0472
     * @tc.desc      Verify the sample cat face and ear path builds without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0472', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0472 begin');
      const path: drawing.Path = new drawing.Path();
      path.addCircle(380, 750, 100, drawing.PathDirection.CLOCKWISE);
      path.moveTo(280, 560);
      path.lineTo(290, 710);
      path.moveTo(280, 560);
      path.lineTo(360, 650);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse path.isEmpty()=${path.isEmpty()}`);
      expect(path.isEmpty()).assertFalse();
      log('testDrawingParam0472 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0473
     * @tc.name      testDrawingParam0473
     * @tc.desc      Verify the sample five point star path builds without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0473', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0473 begin');
      const path: drawing.Path = new drawing.Path();
      const centerX = 450.0;
      const centerY = 180.0;
      const outerRadius = 80;
      const innerRadius = 30;
      const points = 5;
      for (let i: number = 0; i < points * 2; i++) {
        const angle: number = (i * Math.PI) / points;
        const radius: number = i % 2 === 0 ? outerRadius : innerRadius;
        const x: number = centerX + radius * Math.cos(angle + 60.0);
        const y: number = centerY + radius * Math.sin(angle + 60.0);
        if (i === 0) {
          path.moveTo(x, y);
        } else {
          path.lineTo(x, y);
        }
      }
      path.close();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse path.isEmpty()=${path.isEmpty()}`);
      expect(path.isEmpty()).assertFalse();
      log('testDrawingParam0473 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0474
     * @tc.name      testDrawingParam0474
     * @tc.desc      Verify the sample cat whisker paths build without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0474', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0474 begin');
      const clen = 150.0;
      const path: drawing.Path = new drawing.Path();
      path.moveTo(330, 750);
      path.lineTo(330 - clen, 730);
      path.moveTo(330, 770);
      path.lineTo(330 - clen, 770);
      path.moveTo(420, 750);
      path.lineTo(420 + clen, 730);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse path.isEmpty()=${path.isEmpty()}`);
      expect(path.isEmpty()).assertFalse();
      log('testDrawingParam0474 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0475
     * @tc.name      testDrawingParam0475
     * @tc.desc      Verify the sample unclosed cubic curve path builds without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0475', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0475 begin');
      const path: drawing.Path = new drawing.Path();
      path.moveTo(400, 350);
      path.cubicTo(400, 420, 550, 380, 450, 500);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse path.isEmpty()=${path.isEmpty()}`);
      expect(path.isEmpty()).assertFalse();
      log('testDrawingParam0475 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0476
     * @tc.name      testDrawingParam0476
     * @tc.desc      Verify combined rect and circle path builds without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0476', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0476 begin');
      const path: drawing.Path = new drawing.Path();
      path.addRect(makeSampleRect());
      path.addCircle(160, 200, 40, drawing.PathDirection.COUNTER_CLOCKWISE);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse path.isEmpty()=${path.isEmpty()}`);
      expect(path.isEmpty()).assertFalse();
      log('testDrawingParam0476 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0477
     * @tc.name      testDrawingParam0477
     * @tc.desc      Verify RoundRect can be constructed with sample radii.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0477', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0477 begin');
      const roundRect: drawing.RoundRect = new drawing.RoundRect(makeSampleRect(), 20, 20);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${roundRect !== undefined && roundRect !== null}`);
      expect(roundRect !== undefined && roundRect !== null).assertTrue();
      log('testDrawingParam0477 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0478
     * @tc.name      testDrawingParam0478
     * @tc.desc      Verify RoundRect construction returns an object value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0478', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0478 begin');
      const roundRect: drawing.RoundRect = new drawing.RoundRect(makeSampleRect(), 20, 20);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof roundRect=${typeof roundRect}, expected='object'`);
      expect(typeof roundRect).assertEqual('object');
      log('testDrawingParam0478 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0479
     * @tc.name      testDrawingParam0479
     * @tc.desc      Verify RoundRect accepts zero radii.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0479', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0479 begin');
      const roundRect: drawing.RoundRect = new drawing.RoundRect(makeSampleRect(), 0, 0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${roundRect !== undefined && roundRect !== null}`);
      expect(roundRect !== undefined && roundRect !== null).assertTrue();
      log('testDrawingParam0479 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0480
     * @tc.name      testDrawingParam0480
     * @tc.desc      Verify RoundRect accepts a degenerate zero size rect.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0480', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0480 begin');
      const rect: common2D.Rect = { left: 10, top: 10, right: 10, bottom: 10 };
      const roundRect: drawing.RoundRect = new drawing.RoundRect(rect, 5, 5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${roundRect !== undefined && roundRect !== null}`);
      expect(roundRect !== undefined && roundRect !== null).assertTrue();
      log('testDrawingParam0480 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0481
     * @tc.name      testDrawingParam0481
     * @tc.desc      Verify RoundRect accepts fractional radii.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0481', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0481 begin');
      const roundRect: drawing.RoundRect = new drawing.RoundRect(makeSampleRect(), 12.5, 8.25);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${roundRect !== undefined && roundRect !== null}`);
      expect(roundRect !== undefined && roundRect !== null).assertTrue();
      log('testDrawingParam0481 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0482
     * @tc.name      testDrawingParam0482
     * @tc.desc      Verify RoundRect can be consumed by path addRoundRect.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0482', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0482 begin');
      const roundRect: drawing.RoundRect = new drawing.RoundRect(makeSampleRect(), 20, 20);
      const path: drawing.Path = new drawing.Path();
      path.addRoundRect(roundRect, drawing.PathDirection.CLOCKWISE);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse path.isEmpty()=${path.isEmpty()}`);
      expect(path.isEmpty()).assertFalse();
      log('testDrawingParam0482 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0483
     * @tc.name      testDrawingParam0483
     * @tc.desc      Verify Region can be constructed standalone.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0483', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0483 begin');
      const region: drawing.Region = new drawing.Region();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${region !== undefined && region !== null}`);
      expect(region !== undefined && region !== null).assertTrue();
      log('testDrawingParam0483 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0484
     * @tc.name      testDrawingParam0484
     * @tc.desc      Verify Region.setRect with sample clip bounds returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0484', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0484 begin');
      const clip: drawing.Region = new drawing.Region();
      const result: boolean = clip.setRect(10, 400, 690, 650);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue result=${result}`);
      expect(result).assertTrue();
      log('testDrawingParam0484 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0485
     * @tc.name      testDrawingParam0485
     * @tc.desc      Verify Region.setRect degenerate bounds returns a boolean result.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0485', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0485 begin');
      const clip: drawing.Region = new drawing.Region();
      const result: boolean = clip.setRect(10, 10, 10, 10);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof result=${typeof result}, expected='boolean'`);
      expect(typeof result).assertEqual('boolean');
      log('testDrawingParam0485 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0486
     * @tc.name      testDrawingParam0486
     * @tc.desc      Verify Region.setPath with sample pentagon inside clip returns true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0486', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0486 begin');
      const centerX = 70;
      const centerY = 600;
      const sideLength = 60;
      const angleIncrement = 2 * Math.PI / 5;
      const regionPath: drawing.Path = new drawing.Path();
      for (let i: number = 0; i < 5; ++i) {
        const angle: number = angleIncrement * i;
        const x: number = centerX + sideLength * Math.cos(angle - 60);
        const y: number = centerY - sideLength * Math.sin(angle - 60);
        if (i === 0) {
          regionPath.moveTo(x, y);
        } else {
          regionPath.lineTo(x, y);
        }
      }
      regionPath.close();
      const region: drawing.Region = new drawing.Region();
      const clip: drawing.Region = new drawing.Region();
      clip.setRect(10, 400, 690, 650);
      const result: boolean = region.setPath(regionPath, clip);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue result=${result}`);
      expect(result).assertTrue();
      log('testDrawingParam0486 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0487
     * @tc.name      testDrawingParam0487
     * @tc.desc      Verify Region.setPath with an empty path reports an empty region.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0487', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0487 begin');
      const emptyPath: drawing.Path = new drawing.Path();
      const region: drawing.Region = new drawing.Region();
      const clip: drawing.Region = new drawing.Region();
      clip.setRect(10, 400, 690, 650);
      const result: boolean = region.setPath(emptyPath, clip);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse result=${result}`);
      expect(result).assertFalse();
      log('testDrawingParam0487 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0488
     * @tc.name      testDrawingParam0488
     * @tc.desc      Verify Region.setPath returns a boolean type result.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0488', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0488 begin');
      const path: drawing.Path = new drawing.Path();
      path.addCircle(70, 600, 40, drawing.PathDirection.CLOCKWISE);
      const region: drawing.Region = new drawing.Region();
      const clip: drawing.Region = new drawing.Region();
      clip.setRect(10, 400, 690, 650);
      const result: boolean = region.setPath(path, clip);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof result=${typeof result}, expected='boolean'`);
      expect(typeof result).assertEqual('boolean');
      log('testDrawingParam0488 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0489
     * @tc.name      testDrawingParam0489
     * @tc.desc      Verify two regions keep independent state after setRect.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0489', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0489 begin');
      const regionA: drawing.Region = new drawing.Region();
      const regionB: drawing.Region = new drawing.Region();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue regionA.setRect(0, 0, 100, 100)`);
      expect(regionA.setRect(0, 0, 100, 100)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue regionB.setRect(200, 200, 300, 300)`);
      expect(regionB.setRect(200, 200, 300, 300)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof regionA=${typeof regionA}, expected='object'`);
      expect(typeof regionA).assertEqual('object');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof regionB=${typeof regionB}, expected='object'`);
      expect(typeof regionB).assertEqual('object');
      log('testDrawingParam0489 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0490
     * @tc.name      testDrawingParam0490
     * @tc.desc      Verify calling setPath twice on one region completes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0490', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0490 begin');
      const pathA: drawing.Path = new drawing.Path();
      pathA.addCircle(70, 600, 40, drawing.PathDirection.CLOCKWISE);
      const pathB: drawing.Path = new drawing.Path();
      pathB.addRect(makeSampleRect());
      const region: drawing.Region = new drawing.Region();
      const clip: drawing.Region = new drawing.Region();
      clip.setRect(10, 400, 690, 650);
      region.setPath(pathA, clip);
      region.setPath(pathB, clip);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${region !== undefined && region !== null}`);
      expect(region !== undefined && region !== null).assertTrue();
      log('testDrawingParam0490 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0491
     * @tc.name      testDrawingParam0491
     * @tc.desc      Verify linear gradient shader with two colors builds.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0491', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0491 begin');
      const startPt: common2D.Point = { x: 0, y: 0 };
      const endPt: common2D.Point = { x: 0, y: 60 };
      const colors: number[] = [0xFFF8FA12, 0xFFACC3DD];
      const shader: drawing.ShaderEffect =
        drawing.ShaderEffect.createLinearGradient(startPt, endPt, colors, drawing.TileMode.CLAMP);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${shader !== undefined && shader !== null}`);
      expect(shader !== undefined && shader !== null).assertTrue();
      log('testDrawingParam0491 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0492
     * @tc.name      testDrawingParam0492
     * @tc.desc      Verify linear gradient shader with sample three colors builds.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0492', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0492 begin');
      const startPt: common2D.Point = { x: 100, y: 100 };
      const endPt: common2D.Point = { x: 400, y: 400 };
      const colors: number[] = [0xFFFFFF00, 0xFFFF0000, 0xFF0000FF];
      const shader: drawing.ShaderEffect =
        drawing.ShaderEffect.createLinearGradient(startPt, endPt, colors, drawing.TileMode.CLAMP);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${shader !== undefined && shader !== null}`);
      expect(shader !== undefined && shader !== null).assertTrue();
      log('testDrawingParam0492 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0493
     * @tc.name      testDrawingParam0493
     * @tc.desc      Verify linear gradient shader with four colors builds.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0493', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0493 begin');
      const startPt: common2D.Point = { x: 0, y: 0 };
      const endPt: common2D.Point = { x: 100, y: 0 };
      const colors: number[] = [0xFFFF0000, 0xFF00FF00, 0xFF0000FF, 0xFFFFFFFF];
      const shader: drawing.ShaderEffect =
        drawing.ShaderEffect.createLinearGradient(startPt, endPt, colors, drawing.TileMode.CLAMP);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${shader !== undefined && shader !== null}`);
      expect(shader !== undefined && shader !== null).assertTrue();
      log('testDrawingParam0493 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0494
     * @tc.name      testDrawingParam0494
     * @tc.desc      Verify linear gradient shader with repeat tile mode builds.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0494', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0494 begin');
      const startPt: common2D.Point = { x: 0, y: 0 };
      const endPt: common2D.Point = { x: 50, y: 0 };
      const colors: number[] = [0xFFFF0000, 0xFF0000FF];
      const shader: drawing.ShaderEffect =
        drawing.ShaderEffect.createLinearGradient(startPt, endPt, colors, drawing.TileMode.REPEAT);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${shader !== undefined && shader !== null}`);
      expect(shader !== undefined && shader !== null).assertTrue();
      log('testDrawingParam0494 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0495
     * @tc.name      testDrawingParam0495
     * @tc.desc      Verify linear gradient shader with mirror tile mode builds.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0495', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0495 begin');
      const startPt: common2D.Point = { x: 0, y: 0 };
      const endPt: common2D.Point = { x: 50, y: 0 };
      const colors: number[] = [0xFFFF0000, 0xFF0000FF];
      const shader: drawing.ShaderEffect =
        drawing.ShaderEffect.createLinearGradient(startPt, endPt, colors, drawing.TileMode.MIRROR);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${shader !== undefined && shader !== null}`);
      expect(shader !== undefined && shader !== null).assertTrue();
      log('testDrawingParam0495 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0496
     * @tc.name      testDrawingParam0496
     * @tc.desc      Verify linear gradient shader with explicit position array builds.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0496', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0496 begin');
      const startPt: common2D.Point = { x: 0, y: 0 };
      const endPt: common2D.Point = { x: 100, y: 0 };
      const colors: number[] = [0xFFFF0000, 0xFF00FF00, 0xFF0000FF];
      const pos: number[] = [0, 0.5, 1];
      const shader: drawing.ShaderEffect =
        drawing.ShaderEffect.createLinearGradient(startPt, endPt, colors, drawing.TileMode.CLAMP, pos);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${shader !== undefined && shader !== null}`);
      expect(shader !== undefined && shader !== null).assertTrue();
      log('testDrawingParam0496 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0497
     * @tc.name      testDrawingParam0497
     * @tc.desc      Verify dash path effect with sample intervals builds.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0497', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0497 begin');
      const intervals: number[] = [20.0, 10.0];
      const effect: drawing.PathEffect = drawing.PathEffect.createDashPathEffect(intervals, 0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${effect !== undefined && effect !== null}`);
      expect(effect !== undefined && effect !== null).assertTrue();
      log('testDrawingParam0497 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0500
     * @tc.name      testDrawingParam0500
     * @tc.desc      Verify dash path effect with fractional phase builds.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0500 begin');
      const intervals: number[] = [20.0, 10.0];
      const effect: drawing.PathEffect = drawing.PathEffect.createDashPathEffect(intervals, 0.5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${effect !== undefined && effect !== null}`);
      expect(effect !== undefined && effect !== null).assertTrue();
      log('testDrawingParam0500 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0501
     * @tc.name      testDrawingParam0501
     * @tc.desc      Verify blur image filter with sample sigma and clamp mode builds.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0501', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0501 begin');
      const filter: drawing.ImageFilter =
        drawing.ImageFilter.createBlurImageFilter(20, 20, drawing.TileMode.CLAMP);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${filter !== undefined && filter !== null}`);
      expect(filter !== undefined && filter !== null).assertTrue();
      log('testDrawingParam0501 end');
    })

    /**
     * @tc.number    SUB_TSDRAWING_PARAM_0502
     * @tc.name      testDrawingParam0502
     * @tc.desc      Verify blur image filter with fractional sigma and repeat mode builds.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDrawingParam0502', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDrawingParam0502 begin');
      const filter: drawing.ImageFilter =
        drawing.ImageFilter.createBlurImageFilter(2.5, 4.5, drawing.TileMode.REPEAT);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${filter !== undefined && filter !== null}`);
      expect(filter !== undefined && filter !== null).assertTrue();
      log('testDrawingParam0502 end');
    })
  })
}
