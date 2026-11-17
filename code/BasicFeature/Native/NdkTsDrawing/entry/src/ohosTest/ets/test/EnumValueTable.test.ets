/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, expect, it } from '@ohos/hypium';
import { drawing } from '@kit.ArkGraphics2D';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { DRAWING_TAG, runCase } from './DrawingTestRunner';

const DOMAIN: number = 0xF811;

export default function enumValueTableTest() {
  describe('EnumValueTableTest', () => {
    /**
     * @tc.number SUB_NdkTsDrawing_ENUM_0598
     * @tc.name testEnumValueTable0598
     * @tc.desc Verify the blend mode values keep their documented positions.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumValueTable0598', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0598 begin');
      await runCase('testEnumValueTable0598', async () => {
        expect(drawing.BlendMode.CLEAR).assertEqual(0);
        expect(drawing.BlendMode.SRC_OVER).assertEqual(3);
        expect(drawing.BlendMode.MULTIPLY).assertEqual(24);
        expect(drawing.BlendMode.LUMINOSITY).assertEqual(28);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0598 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_ENUM_0599
     * @tc.name testEnumValueTable0599
     * @tc.desc Verify the vertex mode values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumValueTable0599', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0599 begin');
      await runCase('testEnumValueTable0599', async () => {
        expect(drawing.VertexMode.TRIANGLES_VERTEXMODE).assertEqual(0);
        expect(drawing.VertexMode.TRIANGLESSTRIP_VERTEXMODE).assertEqual(1);
        expect(drawing.VertexMode.TRIANGLESFAN_VERTEXMODE).assertEqual(2);
        expect(drawing.VertexMode.TRIANGLESFAN_VERTEXMODE > drawing.VertexMode.TRIANGLES_VERTEXMODE).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0599 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_ENUM_0600
     * @tc.name testEnumValueTable0600
     * @tc.desc Verify the path direction values differ by one.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumValueTable0600', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0600 begin');
      await runCase('testEnumValueTable0600', async () => {
        expect(drawing.PathDirection.CLOCKWISE).assertEqual(0);
        expect(drawing.PathDirection.COUNTER_CLOCKWISE).assertEqual(1);
        expect(drawing.PathDirection.COUNTER_CLOCKWISE - drawing.PathDirection.CLOCKWISE).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0600 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_ENUM_0601
     * @tc.name testEnumValueTable0601
     * @tc.desc Verify the path fill type values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumValueTable0601', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0601 begin');
      await runCase('testEnumValueTable0601', async () => {
        expect(drawing.PathFillType.WINDING).assertEqual(0);
        expect(drawing.PathFillType.EVEN_ODD).assertEqual(1);
        expect(drawing.PathFillType.INVERSE_WINDING).assertEqual(2);
        expect(drawing.PathFillType.INVERSE_EVEN_ODD - drawing.PathFillType.INVERSE_WINDING).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0601 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_ENUM_0602
     * @tc.name testEnumValueTable0602
     * @tc.desc Verify the path measure matrix flag values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumValueTable0602', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0602 begin');
      await runCase('testEnumValueTable0602', async () => {
        expect(drawing.PathMeasureMatrixFlags.GET_POSITION_MATRIX).assertEqual(0);
        expect(drawing.PathMeasureMatrixFlags.GET_TANGENT_MATRIX).assertEqual(1);
        expect(drawing.PathMeasureMatrixFlags.GET_POSITION_AND_TANGENT_MATRIX).assertEqual(2);
        expect(drawing.PathMeasureMatrixFlags.GET_POSITION_AND_TANGENT_MATRIX -
          drawing.PathMeasureMatrixFlags.GET_TANGENT_MATRIX).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0602 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_ENUM_0603
     * @tc.name testEnumValueTable0603
     * @tc.desc Verify the path op values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumValueTable0603', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0603 begin');
      await runCase('testEnumValueTable0603', async () => {
        expect(drawing.PathOp.DIFFERENCE).assertEqual(0);
        expect(drawing.PathOp.UNION).assertEqual(2);
        expect(drawing.PathOp.XOR).assertEqual(3);
        expect(drawing.PathOp.REVERSE_DIFFERENCE).assertEqual(4);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0603 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_ENUM_0604
     * @tc.name testEnumValueTable0604
     * @tc.desc Verify the iterator verb values and the done sentinel.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumValueTable0604', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0604 begin');
      await runCase('testEnumValueTable0604', async () => {
        expect(drawing.PathIteratorVerb.MOVE).assertEqual(0);
        expect(drawing.PathIteratorVerb.CUBIC).assertEqual(4);
        expect(drawing.PathIteratorVerb.CLOSE).assertEqual(5);
        expect(drawing.PathIteratorVerb.DONE).assertEqual(drawing.PathIteratorVerb.CLOSE + 1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0604 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_ENUM_0605
     * @tc.name testEnumValueTable0605
     * @tc.desc Verify the point mode values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumValueTable0605', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0605 begin');
      await runCase('testEnumValueTable0605', async () => {
        expect(drawing.PointMode.POINTS).assertEqual(0);
        expect(drawing.PointMode.LINES).assertEqual(1);
        expect(drawing.PointMode.POLYGON).assertEqual(2);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0605 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_ENUM_0606
     * @tc.name testEnumValueTable0606
     * @tc.desc Verify the filter mode values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumValueTable0606', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0606 begin');
      await runCase('testEnumValueTable0606', async () => {
        expect(drawing.FilterMode.FILTER_MODE_NEAREST).assertEqual(0);
        expect(drawing.FilterMode.FILTER_MODE_LINEAR).assertEqual(1);
        expect(drawing.FilterMode.FILTER_MODE_LINEAR - drawing.FilterMode.FILTER_MODE_NEAREST).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0606 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_ENUM_0607
     * @tc.name testEnumValueTable0607
     * @tc.desc Verify the shadow flag values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumValueTable0607', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0607 begin');
      await runCase('testEnumValueTable0607', async () => {
        expect(drawing.ShadowFlag.NONE).assertEqual(0);
        expect(drawing.ShadowFlag.TRANSPARENT_OCCLUDER).assertEqual(1);
        expect(drawing.ShadowFlag.GEOMETRIC_ONLY).assertEqual(2);
        expect(drawing.ShadowFlag.ALL).assertEqual(3);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0607 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_ENUM_0608
     * @tc.name testEnumValueTable0608
     * @tc.desc Verify the clip op values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumValueTable0608', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0608 begin');
      await runCase('testEnumValueTable0608', async () => {
        expect(drawing.ClipOp.DIFFERENCE).assertEqual(0);
        expect(drawing.ClipOp.INTERSECT).assertEqual(1);
        expect(drawing.ClipOp.INTERSECT > drawing.ClipOp.DIFFERENCE).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0608 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_ENUM_0609
     * @tc.name testEnumValueTable0609
     * @tc.desc Verify the text encoding values form a gap free run of four.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumValueTable0609', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0609 begin');
      await runCase('testEnumValueTable0609', async () => {
        expect(drawing.TextEncoding.TEXT_ENCODING_UTF16 - drawing.TextEncoding.TEXT_ENCODING_UTF8).assertEqual(1);
        expect(drawing.TextEncoding.TEXT_ENCODING_UTF32 - drawing.TextEncoding.TEXT_ENCODING_UTF16).assertEqual(1);
        expect(drawing.TextEncoding.TEXT_ENCODING_GLYPH_ID - drawing.TextEncoding.TEXT_ENCODING_UTF8).assertEqual(3);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0609 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_ENUM_0610
     * @tc.name testEnumValueTable0610
     * @tc.desc Verify the font edging values are consecutive.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumValueTable0610', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0610 begin');
      await runCase('testEnumValueTable0610', async () => {
        expect(drawing.FontEdging.ANTI_ALIAS - drawing.FontEdging.ALIAS).assertEqual(1);
        expect(drawing.FontEdging.SUBPIXEL_ANTI_ALIAS - drawing.FontEdging.ANTI_ALIAS).assertEqual(1);
        expect(drawing.FontEdging.SUBPIXEL_ANTI_ALIAS).assertEqual(drawing.FontEdging.ALIAS + 2);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0610 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_ENUM_0611
     * @tc.name testEnumValueTable0611
     * @tc.desc Verify the font hinting values are consecutive.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumValueTable0611', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0611 begin');
      await runCase('testEnumValueTable0611', async () => {
        expect(drawing.FontHinting.SLIGHT - drawing.FontHinting.NONE).assertEqual(1);
        expect(drawing.FontHinting.NORMAL - drawing.FontHinting.SLIGHT).assertEqual(1);
        expect(drawing.FontHinting.FULL - drawing.FontHinting.NONE).assertEqual(3);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0611 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_ENUM_0612
     * @tc.name testEnumValueTable0612
     * @tc.desc Verify the font metrics flags carry one bit each.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumValueTable0612', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0612 begin');
      await runCase('testEnumValueTable0612', async () => {
        expect(drawing.FontMetricsFlags.UNDERLINE_THICKNESS_VALID).assertEqual(1);
        expect(drawing.FontMetricsFlags.UNDERLINE_POSITION_VALID).assertEqual(2);
        expect(drawing.FontMetricsFlags.STRIKETHROUGH_THICKNESS_VALID).assertEqual(4);
        expect(drawing.FontMetricsFlags.STRIKETHROUGH_POSITION_VALID).assertEqual(8);
        expect(drawing.FontMetricsFlags.BOUNDS_INVALID).assertEqual(16);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0612 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_ENUM_0613
     * @tc.name testEnumValueTable0613
     * @tc.desc Verify the rect type values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumValueTable0613', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0613 begin');
      await runCase('testEnumValueTable0613', async () => {
        expect(drawing.RectType.DEFAULT).assertEqual(0);
        expect(drawing.RectType.TRANSPARENT).assertEqual(1);
        expect(drawing.RectType.FIXEDCOLOR).assertEqual(2);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0613 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_ENUM_0614
     * @tc.name testEnumValueTable0614
     * @tc.desc Verify the path dash style values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumValueTable0614', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0614 begin');
      await runCase('testEnumValueTable0614', async () => {
        expect(drawing.PathDashStyle.TRANSLATE).assertEqual(0);
        expect(drawing.PathDashStyle.ROTATE).assertEqual(1);
        expect(drawing.PathDashStyle.MORPH).assertEqual(2);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0614 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_ENUM_0615
     * @tc.name testEnumValueTable0615
     * @tc.desc Verify the tile mode values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumValueTable0615', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0615 begin');
      await runCase('testEnumValueTable0615', async () => {
        expect(drawing.TileMode.CLAMP).assertEqual(0);
        expect(drawing.TileMode.REPEAT).assertEqual(1);
        expect(drawing.TileMode.MIRROR).assertEqual(2);
        expect(drawing.TileMode.DECAL).assertEqual(3);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0615 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_ENUM_0616
     * @tc.name testEnumValueTable0616
     * @tc.desc Verify the join style values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumValueTable0616', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0616 begin');
      await runCase('testEnumValueTable0616', async () => {
        expect(drawing.JoinStyle.MITER_JOIN).assertEqual(0);
        expect(drawing.JoinStyle.ROUND_JOIN).assertEqual(1);
        expect(drawing.JoinStyle.BEVEL_JOIN).assertEqual(2);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0616 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_ENUM_0617
     * @tc.name testEnumValueTable0617
     * @tc.desc Verify the cap style values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumValueTable0617', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0617 begin');
      await runCase('testEnumValueTable0617', async () => {
        expect(drawing.CapStyle.FLAT_CAP).assertEqual(0);
        expect(drawing.CapStyle.SQUARE_CAP).assertEqual(1);
        expect(drawing.CapStyle.ROUND_CAP).assertEqual(2);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0617 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_ENUM_0618
     * @tc.name testEnumValueTable0618
     * @tc.desc Verify the blur type values span three steps.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumValueTable0618', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0618 begin');
      await runCase('testEnumValueTable0618', async () => {
        expect(drawing.BlurType.SOLID).assertEqual(1);
        expect(drawing.BlurType.OUTER - drawing.BlurType.SOLID).assertEqual(1);
        expect(drawing.BlurType.INNER - drawing.BlurType.NORMAL).assertEqual(3);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0618 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_ENUM_0619
     * @tc.name testEnumValueTable0619
     * @tc.desc Verify the scale to fit values span three steps.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumValueTable0619', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0619 begin');
      await runCase('testEnumValueTable0619', async () => {
        expect(drawing.ScaleToFit.START_SCALE_TO_FIT).assertEqual(1);
        expect(drawing.ScaleToFit.CENTER_SCALE_TO_FIT - drawing.ScaleToFit.START_SCALE_TO_FIT).assertEqual(1);
        expect(drawing.ScaleToFit.END_SCALE_TO_FIT - drawing.ScaleToFit.FILL_SCALE_TO_FIT).assertEqual(3);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0619 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_ENUM_0620
     * @tc.name testEnumValueTable0620
     * @tc.desc Verify the region op values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumValueTable0620', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0620 begin');
      await runCase('testEnumValueTable0620', async () => {
        expect(drawing.RegionOp.DIFFERENCE).assertEqual(0);
        expect(drawing.RegionOp.UNION).assertEqual(2);
        expect(drawing.RegionOp.REPLACE).assertEqual(5);
        expect(drawing.RegionOp.REPLACE - drawing.RegionOp.REVERSE_DIFFERENCE).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0620 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_ENUM_0621
     * @tc.name testEnumValueTable0621
     * @tc.desc Verify the corner position values follow the clockwise corner order.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumValueTable0621', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0621 begin');
      await runCase('testEnumValueTable0621', async () => {
        expect(drawing.CornerPos.TOP_LEFT_POS).assertEqual(0);
        expect(drawing.CornerPos.TOP_RIGHT_POS).assertEqual(1);
        expect(drawing.CornerPos.BOTTOM_RIGHT_POS).assertEqual(2);
        expect(drawing.CornerPos.BOTTOM_LEFT_POS).assertEqual(3);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0621 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_ENUM_0622
     * @tc.name testEnumValueTable0622
     * @tc.desc Verify the source rectangle constraint values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testEnumValueTable0622', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0622 begin');
      await runCase('testEnumValueTable0622', async () => {
        expect(drawing.SrcRectConstraint.STRICT).assertEqual(0);
        expect(drawing.SrcRectConstraint.FAST).assertEqual(1);
        expect(drawing.SrcRectConstraint.FAST > drawing.SrcRectConstraint.STRICT).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0622 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_ENUM_0623
     * @tc.name testEnumValueTable0623
     * @tc.desc Verify four unrelated enumerations share the zero start value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumValueTable0623', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0623 begin');
      await runCase('testEnumValueTable0623', async () => {
        expect(drawing.PathDirection.CLOCKWISE).assertEqual(drawing.FilterMode.FILTER_MODE_NEAREST);
        expect(drawing.ClipOp.DIFFERENCE).assertEqual(drawing.SrcRectConstraint.STRICT);
        expect(drawing.PathOp.DIFFERENCE).assertEqual(drawing.PointMode.POINTS);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0623 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_ENUM_0624
     * @tc.name testEnumValueTable0624
     * @tc.desc Verify the two member enumerations end at the same value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumValueTable0624', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0624 begin');
      await runCase('testEnumValueTable0624', async () => {
        expect(drawing.PathDirection.COUNTER_CLOCKWISE).assertEqual(drawing.FilterMode.FILTER_MODE_LINEAR);
        expect(drawing.ClipOp.INTERSECT).assertEqual(drawing.SrcRectConstraint.FAST);
        expect(drawing.PathDirection.COUNTER_CLOCKWISE).assertEqual(drawing.ClipOp.INTERSECT);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0624 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_ENUM_0625
     * @tc.name testEnumValueTable0625
     * @tc.desc Verify the three member enumerations end at the same value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumValueTable0625', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0625 begin');
      await runCase('testEnumValueTable0625', async () => {
        expect(drawing.VertexMode.TRIANGLESFAN_VERTEXMODE).assertEqual(drawing.PointMode.POLYGON);
        expect(drawing.PathDashStyle.MORPH).assertEqual(drawing.RectType.FIXEDCOLOR);
        expect(drawing.JoinStyle.BEVEL_JOIN).assertEqual(drawing.CapStyle.ROUND_CAP);
        expect(drawing.FontEdging.SUBPIXEL_ANTI_ALIAS).assertEqual(drawing.PathDashStyle.MORPH);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0625 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_ENUM_0626
     * @tc.name testEnumValueTable0626
     * @tc.desc Verify the four member enumerations part one end at the same value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumValueTable0626', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0626 begin');
      await runCase('testEnumValueTable0626', async () => {
        expect(drawing.PathFillType.INVERSE_EVEN_ODD).assertEqual(drawing.ShadowFlag.ALL);
        expect(drawing.TextEncoding.TEXT_ENCODING_GLYPH_ID).assertEqual(drawing.FontHinting.FULL);
        expect(drawing.PathFillType.INVERSE_EVEN_ODD).assertEqual(drawing.TextEncoding.TEXT_ENCODING_GLYPH_ID);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0626 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_ENUM_0627
     * @tc.name testEnumValueTable0627
     * @tc.desc Verify the four member enumerations part two end at the same value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumValueTable0627', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0627 begin');
      await runCase('testEnumValueTable0627', async () => {
        expect(drawing.TileMode.DECAL).assertEqual(drawing.BlurType.INNER);
        expect(drawing.ScaleToFit.END_SCALE_TO_FIT).assertEqual(drawing.CornerPos.BOTTOM_LEFT_POS);
        expect(drawing.TileMode.DECAL).assertEqual(drawing.ScaleToFit.END_SCALE_TO_FIT);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0627 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_ENUM_0628
     * @tc.name testEnumValueTable0628
     * @tc.desc Verify the third member of the four member enumerations shares one value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumValueTable0628', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0628 begin');
      await runCase('testEnumValueTable0628', async () => {
        expect(drawing.PathFillType.INVERSE_WINDING).assertEqual(drawing.ShadowFlag.GEOMETRIC_ONLY);
        expect(drawing.TileMode.MIRROR).assertEqual(drawing.BlurType.OUTER);
        expect(drawing.CornerPos.BOTTOM_RIGHT_POS).assertEqual(drawing.PathFillType.INVERSE_WINDING);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0628 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_ENUM_0629
     * @tc.name testEnumValueTable0629
     * @tc.desc Verify the path op and the region op agree on the first five members.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumValueTable0629', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0629 begin');
      await runCase('testEnumValueTable0629', async () => {
        expect(drawing.PathOp.DIFFERENCE).assertEqual(drawing.RegionOp.DIFFERENCE);
        expect(drawing.PathOp.INTERSECT).assertEqual(drawing.RegionOp.INTERSECT);
        expect(drawing.PathOp.UNION).assertEqual(drawing.RegionOp.UNION);
        expect(drawing.PathOp.XOR).assertEqual(drawing.RegionOp.XOR);
        expect(drawing.PathOp.REVERSE_DIFFERENCE).assertEqual(drawing.RegionOp.REVERSE_DIFFERENCE);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0629 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_ENUM_0630
     * @tc.name testEnumValueTable0630
     * @tc.desc Verify the iterator done sentinel sits one step above the region replace value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumValueTable0630', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0630 begin');
      await runCase('testEnumValueTable0630', async () => {
        expect(drawing.PathIteratorVerb.DONE - drawing.RegionOp.REPLACE).assertEqual(1);
        expect(drawing.PathIteratorVerb.CLOSE).assertEqual(drawing.RegionOp.REPLACE);
        expect(drawing.PathIteratorVerb.DONE).assertEqual(6);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0630 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_ENUM_0631
     * @tc.name testEnumValueTable0631
     * @tc.desc Verify the widest enumeration outruns the bit mask ceiling.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumValueTable0631', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0631 begin');
      await runCase('testEnumValueTable0631', async () => {
        expect(drawing.BlendMode.LUMINOSITY).assertEqual(28);
        expect(drawing.FontMetricsFlags.BOUNDS_INVALID).assertEqual(16);
        expect(drawing.BlendMode.LUMINOSITY > drawing.FontMetricsFlags.BOUNDS_INVALID).assertTrue();
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0631 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_ENUM_0632
     * @tc.name testEnumValueTable0632
     * @tc.desc Verify every font metrics flag doubles the previous one.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumValueTable0632', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0632 begin');
      await runCase('testEnumValueTable0632', async () => {
        expect(drawing.FontMetricsFlags.UNDERLINE_POSITION_VALID)
          .assertEqual(drawing.FontMetricsFlags.UNDERLINE_THICKNESS_VALID * 2);
        expect(drawing.FontMetricsFlags.STRIKETHROUGH_THICKNESS_VALID)
          .assertEqual(drawing.FontMetricsFlags.UNDERLINE_POSITION_VALID * 2);
        expect(drawing.FontMetricsFlags.STRIKETHROUGH_POSITION_VALID)
          .assertEqual(drawing.FontMetricsFlags.STRIKETHROUGH_THICKNESS_VALID * 2);
        expect(drawing.FontMetricsFlags.BOUNDS_INVALID)
          .assertEqual(drawing.FontMetricsFlags.STRIKETHROUGH_POSITION_VALID * 2);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0632 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_ENUM_0633
     * @tc.name testEnumValueTable0633
     * @tc.desc Verify the font metrics flags combine bitwise without overlapping.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumValueTable0633', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0633 begin');
      await runCase('testEnumValueTable0633', async () => {
        expect(drawing.FontMetricsFlags.UNDERLINE_THICKNESS_VALID |
          drawing.FontMetricsFlags.UNDERLINE_POSITION_VALID).assertEqual(3);
        expect(drawing.FontMetricsFlags.STRIKETHROUGH_THICKNESS_VALID |
          drawing.FontMetricsFlags.STRIKETHROUGH_POSITION_VALID).assertEqual(12);
        expect(drawing.FontMetricsFlags.BOUNDS_INVALID &
          drawing.FontMetricsFlags.UNDERLINE_POSITION_VALID).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0633 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_ENUM_0634
     * @tc.name testEnumValueTable0634
     * @tc.desc Verify neighbouring blend modes step by one at three places.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumValueTable0634', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0634 begin');
      await runCase('testEnumValueTable0634', async () => {
        expect(drawing.BlendMode.SRC - drawing.BlendMode.CLEAR).assertEqual(1);
        expect(drawing.BlendMode.DST_OVER - drawing.BlendMode.SRC_OVER).assertEqual(1);
        expect(drawing.BlendMode.LUMINOSITY - drawing.BlendMode.COLOR).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0634 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_ENUM_0635
     * @tc.name testEnumValueTable0635
     * @tc.desc Verify the iterator verbs advance by one between the curve verbs.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumValueTable0635', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0635 begin');
      await runCase('testEnumValueTable0635', async () => {
        expect(drawing.PathIteratorVerb.LINE - drawing.PathIteratorVerb.MOVE).assertEqual(1);
        expect(drawing.PathIteratorVerb.CONIC - drawing.PathIteratorVerb.QUAD).assertEqual(1);
        expect(drawing.PathIteratorVerb.CLOSE - drawing.PathIteratorVerb.CUBIC).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0635 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_ENUM_0636
     * @tc.name testEnumValueTable0636
     * @tc.desc Verify the blend mode ladder keeps a two step and a one step gap.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumValueTable0636', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0636 begin');
      await runCase('testEnumValueTable0636', async () => {
        expect(drawing.BlendMode.DST_ATOP - drawing.BlendMode.SRC_ATOP).assertEqual(1);
        expect(drawing.BlendMode.COLOR_DODGE - drawing.BlendMode.HARD_LIGHT).assertEqual(-2);
        expect(drawing.BlendMode.HUE - drawing.BlendMode.MULTIPLY).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0636 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_ENUM_0637
     * @tc.name testEnumValueTable0637
     * @tc.desc Verify the region op ladder is a gap free run from difference to replace.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumValueTable0637', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0637 begin');
      await runCase('testEnumValueTable0637', async () => {
        expect(drawing.RegionOp.INTERSECT - drawing.RegionOp.DIFFERENCE).assertEqual(1);
        expect(drawing.RegionOp.UNION - drawing.RegionOp.INTERSECT).assertEqual(1);
        expect(drawing.RegionOp.REPLACE - drawing.RegionOp.REVERSE_DIFFERENCE).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0637 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_ENUM_0638
     * @tc.name testEnumValueTable0638
     * @tc.desc Verify the corner positions follow each other clockwise by one.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumValueTable0638', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0638 begin');
      await runCase('testEnumValueTable0638', async () => {
        expect(drawing.CornerPos.TOP_RIGHT_POS - drawing.CornerPos.TOP_LEFT_POS).assertEqual(1);
        expect(drawing.CornerPos.BOTTOM_RIGHT_POS - drawing.CornerPos.TOP_RIGHT_POS).assertEqual(1);
        expect(drawing.CornerPos.BOTTOM_LEFT_POS - drawing.CornerPos.BOTTOM_RIGHT_POS).assertEqual(1);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0638 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_ENUM_0639
     * @tc.name testEnumValueTable0639
     * @tc.desc Verify the scale to fit and the tile mode share the same four step span.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumValueTable0639', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0639 begin');
      await runCase('testEnumValueTable0639', async () => {
        expect(drawing.ScaleToFit.END_SCALE_TO_FIT - drawing.ScaleToFit.FILL_SCALE_TO_FIT)
          .assertEqual(drawing.TileMode.DECAL - drawing.TileMode.CLAMP);
        expect(drawing.ScaleToFit.CENTER_SCALE_TO_FIT - drawing.ScaleToFit.START_SCALE_TO_FIT)
          .assertEqual(drawing.TileMode.MIRROR - drawing.TileMode.REPEAT);
        expect(drawing.ScaleToFit.START_SCALE_TO_FIT - drawing.ScaleToFit.FILL_SCALE_TO_FIT)
          .assertEqual(drawing.TileMode.REPEAT - drawing.TileMode.CLAMP);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0639 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_ENUM_0640
     * @tc.name testEnumValueTable0640
     * @tc.desc Verify the path fill type and the shadow flag share the same four step ladder.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumValueTable0640', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0640 begin');
      await runCase('testEnumValueTable0640', async () => {
        expect(drawing.PathFillType.EVEN_ODD - drawing.PathFillType.WINDING)
          .assertEqual(drawing.ShadowFlag.TRANSPARENT_OCCLUDER - drawing.ShadowFlag.NONE);
        expect(drawing.PathFillType.INVERSE_EVEN_ODD - drawing.PathFillType.INVERSE_WINDING)
          .assertEqual(drawing.ShadowFlag.ALL - drawing.ShadowFlag.GEOMETRIC_ONLY);
        expect(drawing.PathFillType.INVERSE_WINDING - drawing.PathFillType.WINDING)
          .assertEqual(drawing.ShadowFlag.GEOMETRIC_ONLY - drawing.ShadowFlag.NONE);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0640 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_ENUM_0641
     * @tc.name testEnumValueTable0641
     * @tc.desc Verify the text encoding and the font hinting share the same four step ladder.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level4
     */
    it('testEnumValueTable0641', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0641 begin');
      await runCase('testEnumValueTable0641', async () => {
        expect(drawing.TextEncoding.TEXT_ENCODING_UTF16 - drawing.TextEncoding.TEXT_ENCODING_UTF8)
          .assertEqual(drawing.FontHinting.SLIGHT - drawing.FontHinting.NONE);
        expect(drawing.TextEncoding.TEXT_ENCODING_GLYPH_ID - drawing.TextEncoding.TEXT_ENCODING_UTF32)
          .assertEqual(drawing.FontHinting.FULL - drawing.FontHinting.NORMAL);
        expect(drawing.TextEncoding.TEXT_ENCODING_UTF32 - drawing.TextEncoding.TEXT_ENCODING_UTF8)
          .assertEqual(drawing.FontHinting.NORMAL - drawing.FontHinting.NONE);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0641 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_ENUM_0642
     * @tc.name testEnumValueTable0642
     * @tc.desc Verify the three member enumerations start at the same value.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumValueTable0642', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0642 begin');
      await runCase('testEnumValueTable0642', async () => {
        expect(drawing.VertexMode.TRIANGLES_VERTEXMODE).assertEqual(drawing.PointMode.POINTS);
        expect(drawing.PathDashStyle.TRANSLATE).assertEqual(drawing.RectType.DEFAULT);
        expect(drawing.RectType.DEFAULT).assertEqual(0);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0642 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_ENUM_0643
     * @tc.name testEnumValueTable0643
     * @tc.desc Verify the join style and the cap style agree member by member.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumValueTable0643', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0643 begin');
      await runCase('testEnumValueTable0643', async () => {
        expect(drawing.JoinStyle.MITER_JOIN).assertEqual(drawing.CapStyle.FLAT_CAP);
        expect(drawing.JoinStyle.ROUND_JOIN).assertEqual(drawing.CapStyle.SQUARE_CAP);
        expect(drawing.JoinStyle.BEVEL_JOIN).assertEqual(drawing.CapStyle.ROUND_CAP);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0643 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_ENUM_0644
     * @tc.name testEnumValueTable0644
     * @tc.desc Verify the text encoding and the blur type agree on three members.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumValueTable0644', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0644 begin');
      await runCase('testEnumValueTable0644', async () => {
        expect(drawing.TextEncoding.TEXT_ENCODING_UTF8).assertEqual(drawing.BlurType.NORMAL);
        expect(drawing.TextEncoding.TEXT_ENCODING_UTF16).assertEqual(drawing.BlurType.SOLID);
        expect(drawing.TextEncoding.TEXT_ENCODING_GLYPH_ID).assertEqual(drawing.BlurType.INNER);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0644 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_ENUM_0645
     * @tc.name testEnumValueTable0645
     * @tc.desc Verify the shadow flag and the corner position agree member by member.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumValueTable0645', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0645 begin');
      await runCase('testEnumValueTable0645', async () => {
        expect(drawing.ShadowFlag.NONE).assertEqual(drawing.CornerPos.TOP_LEFT_POS);
        expect(drawing.ShadowFlag.TRANSPARENT_OCCLUDER).assertEqual(drawing.CornerPos.TOP_RIGHT_POS);
        expect(drawing.ShadowFlag.GEOMETRIC_ONLY).assertEqual(drawing.CornerPos.BOTTOM_RIGHT_POS);
        expect(drawing.ShadowFlag.ALL).assertEqual(drawing.CornerPos.BOTTOM_LEFT_POS);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0645 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_ENUM_0646
     * @tc.name testEnumValueTable0646
     * @tc.desc Verify the path direction and the source rectangle constraint share one ladder.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testEnumValueTable0646', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0646 begin');
      await runCase('testEnumValueTable0646', async () => {
        expect(drawing.PathDirection.CLOCKWISE).assertEqual(drawing.SrcRectConstraint.STRICT);
        expect(drawing.PathDirection.COUNTER_CLOCKWISE).assertEqual(drawing.SrcRectConstraint.FAST);
        expect(drawing.PathDirection.COUNTER_CLOCKWISE - drawing.PathDirection.CLOCKWISE)
          .assertEqual(drawing.SrcRectConstraint.FAST - drawing.SrcRectConstraint.STRICT);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0646 end');
    });

    /**
     * @tc.number SUB_NdkTsDrawing_ENUM_0647
     * @tc.name testEnumValueTable0647
     * @tc.desc Verify the remaining enumerations also start at zero.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testEnumValueTable0647', 0, async (done: Function) => {
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0647 begin');
      await runCase('testEnumValueTable0647', async () => {
        expect(drawing.FontEdging.ALIAS).assertEqual(0);
        expect(drawing.PathMeasureMatrixFlags.GET_POSITION_MATRIX).assertEqual(0);
        expect(drawing.BlendMode.CLEAR).assertEqual(drawing.PathIteratorVerb.MOVE);
      }, done);
      hilog.info(DOMAIN, DRAWING_TAG, 'testEnumValueTable0647 end');
    });
  });
}
