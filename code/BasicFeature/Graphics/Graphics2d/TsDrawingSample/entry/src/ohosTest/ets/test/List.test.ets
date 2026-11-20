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

import abilityTest from './Ability.test';
import drawingColorCoreTest from './DrawingColorCore.test';
import drawingGeometryCoreTest from './DrawingGeometryCore.test';
import drawingParamModelCoreTest from './DrawingParamModelCore.test';
import drawingUiStateTest from './DrawingUiState.test';
import rectBoxCtorTest from './logic/RectBoxCtor.test';
import rectBoxCtor2Test from './logic/RectBoxCtor2.test';
import starPointXTest from './logic/StarPointX.test';
import starPointYTest from './logic/StarPointY.test';
import polygonRadiusOfTest from './logic/PolygonRadiusOf.test';
import polygonAngleOfTest from './logic/PolygonAngleOf.test';
import polygonVertexXTest from './logic/PolygonVertexX.test';
import polygonVertexYTest from './logic/PolygonVertexY.test';
import polygonVertexCountTest from './logic/PolygonVertexCount.test';
import pentagonVertexXTest from './logic/PentagonVertexX.test';
import pentagonVertexYTest from './logic/PentagonVertexY.test';
import panelOffsetOfTest from './logic/PanelOffsetOf.test';
import shapeColumnWidthOfTest from './logic/ShapeColumnWidthOf.test';
import shapeRectOfTest from './logic/ShapeRectOf.test';
import shapeRectOf2Test from './logic/ShapeRectOf2.test';
import roundRectOfTest from './logic/RoundRectOf.test';
import roundRectOf2Test from './logic/RoundRectOf2.test';
import shapeLineLengthOfTest from './logic/ShapeLineLengthOf.test';
import arcRectOfTest from './logic/ArcRectOf.test';
import arcRectOf2Test from './logic/ArcRectOf2.test';
import shapeCircleCenterXOfTest from './logic/ShapeCircleCenterXOf.test';
import shapePointXOfTest from './logic/ShapePointXOf.test';
import clipRectOfTest from './logic/ClipRectOf.test';
import clipRectOf2Test from './logic/ClipRectOf2.test';
import canvasCellOfTest from './logic/CanvasCellOf.test';
import smallTextSizeOfTest from './logic/SmallTextSizeOf.test';
import pathTextSizeOfTest from './logic/PathTextSizeOf.test';
import canvasRowStartYOfTest from './logic/CanvasRowStartYOf.test';
import canvasCircleXOfTest from './logic/CanvasCircleXOf.test';
import rotatePivotXOfTest from './logic/RotatePivotXOf.test';
import rotatePivotYOfTest from './logic/RotatePivotYOf.test';
import rotatedRectLeftOfTest from './logic/RotatedRectLeftOf.test';
import pathColumnWidthOfTest from './logic/PathColumnWidthOf.test';
import titleXOfTest from './logic/TitleXOf.test';
import rectWidthOfTest from './logic/RectWidthOf.test';
import rectHeightOfTest from './logic/RectHeightOf.test';
import shapePanelLayoutCtorTest from './logic/ShapePanelLayoutCtor.test';
import shapePanelLayoutLabelXTest from './logic/ShapePanelLayoutLabelX.test';
import shapePanelLayoutLabelYTest from './logic/ShapePanelLayoutLabelY.test';
import shapePanelLayoutRectWidthTest from './logic/ShapePanelLayoutRectWidth.test';
import shapePanelLayoutRoundRectWidthTest from './logic/ShapePanelLayoutRoundRectWidth.test';
import shapePanelLayoutLineYTest from './logic/ShapePanelLayoutLineY.test';
import shapePanelLayoutFlowTest from './logic/ShapePanelLayoutFlow.test';
import shapePanelLayoutFlow2Test from './logic/ShapePanelLayoutFlow2.test';
import drawingGeometryLogicConstantsTest from './logic/DrawingGeometryLogicConstants.test';

export default function testsuite() {
  abilityTest();
  drawingColorCoreTest();
  drawingGeometryCoreTest();
  drawingParamModelCoreTest();
  drawingUiStateTest();
  rectBoxCtorTest();
  rectBoxCtor2Test();
  starPointXTest();
  starPointYTest();
  polygonRadiusOfTest();
  polygonAngleOfTest();
  polygonVertexXTest();
  polygonVertexYTest();
  polygonVertexCountTest();
  pentagonVertexXTest();
  pentagonVertexYTest();
  panelOffsetOfTest();
  shapeColumnWidthOfTest();
  shapeRectOfTest();
  shapeRectOf2Test();
  roundRectOfTest();
  roundRectOf2Test();
  shapeLineLengthOfTest();
  arcRectOfTest();
  arcRectOf2Test();
  shapeCircleCenterXOfTest();
  shapePointXOfTest();
  clipRectOfTest();
  clipRectOf2Test();
  canvasCellOfTest();
  smallTextSizeOfTest();
  pathTextSizeOfTest();
  canvasRowStartYOfTest();
  canvasCircleXOfTest();
  rotatePivotXOfTest();
  rotatePivotYOfTest();
  rotatedRectLeftOfTest();
  pathColumnWidthOfTest();
  titleXOfTest();
  rectWidthOfTest();
  rectHeightOfTest();
  shapePanelLayoutCtorTest();
  shapePanelLayoutLabelXTest();
  shapePanelLayoutLabelYTest();
  shapePanelLayoutRectWidthTest();
  shapePanelLayoutRoundRectWidthTest();
  shapePanelLayoutLineYTest();
  shapePanelLayoutFlowTest();
  shapePanelLayoutFlow2Test();
  drawingGeometryLogicConstantsTest();
}
