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

  })
}
