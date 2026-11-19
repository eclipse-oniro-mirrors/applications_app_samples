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
import { beforeEachIt } from '@ohos/hypium';
import funcRotationTest from './FuncRotation.test';
import offsetModelDataTest from './OffsetModelData.test';
import rotateModelDataTest from './RotateModelData.test';
import scaleModelDataTest from './ScaleModelData.test';
import lazyDataSourceTest from './LazyDataSource.test';
import constrainCalcTest from './ConstrainCalc.test';
import previewUiStateTest from './PreviewUiState.test';
import imageViewerConstantsValuesTest from './logic/ImageViewerConstantsValues.test';
import offsetModelCtorTest from './logic/OffsetModelCtor.test';
import offsetModelCtor2Test from './logic/OffsetModelCtor2.test';
import offsetModelCtor3Test from './logic/OffsetModelCtor3.test';
import offsetModelToStringTest from './logic/OffsetModelToString.test';
import offsetModelFlowTest from './logic/OffsetModelFlow.test';
import offsetModelFlow2Test from './logic/OffsetModelFlow2.test';
import offsetModelFlow3Test from './logic/OffsetModelFlow3.test';
import offsetModelFlow4Test from './logic/OffsetModelFlow4.test';
import offsetModelFlow5Test from './logic/OffsetModelFlow5.test';
import offsetModelFlow6Test from './logic/OffsetModelFlow6.test';
import offsetModelFlow7Test from './logic/OffsetModelFlow7.test';
import offsetModelFlow8Test from './logic/OffsetModelFlow8.test';
import offsetModelFlow9Test from './logic/OffsetModelFlow9.test';
import rotateModelCtorTest from './logic/RotateModelCtor.test';
import rotateModelCtor2Test from './logic/RotateModelCtor2.test';
import rotateModelCtor3Test from './logic/RotateModelCtor3.test';
import rotateModelCtor4Test from './logic/RotateModelCtor4.test';
import rotateModelFlowTest from './logic/RotateModelFlow.test';
import scaleModelCtorTest from './logic/ScaleModelCtor.test';
import scaleModelCtor2Test from './logic/ScaleModelCtor2.test';
import scaleModelCtor3Test from './logic/ScaleModelCtor3.test';
import scaleModelResetTest from './logic/ScaleModelReset.test';
import scaleModelToStringTest from './logic/ScaleModelToString.test';
import scaleModelFlowTest from './logic/ScaleModelFlow.test';
import scaleModelFlow2Test from './logic/ScaleModelFlow2.test';
import scaleModelFlow3Test from './logic/ScaleModelFlow3.test';
import scaleModelFlow4Test from './logic/ScaleModelFlow4.test';
import scaleModelFlow5Test from './logic/ScaleModelFlow5.test';
import scaleModelFlow6Test from './logic/ScaleModelFlow6.test';
import scaleModelFlow7Test from './logic/ScaleModelFlow7.test';
import scaleModelFlow8Test from './logic/ScaleModelFlow8.test';
import scaleModelFlow9Test from './logic/ScaleModelFlow9.test';
import scaleModelFlow10Test from './logic/ScaleModelFlow10.test';
import simplestRotationQuarterTest from './logic/SimplestRotationQuarter.test';
import simplestRotationQuarter2Test from './logic/SimplestRotationQuarter2.test';

function yieldToEventLoop(): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(() => {
      resolve();
    }, 1);
  });
}

export default function testsuite() {
  beforeEachIt(yieldToEventLoop);
  funcRotationTest();
  offsetModelDataTest();
  rotateModelDataTest();
  scaleModelDataTest();
  lazyDataSourceTest();
  constrainCalcTest();
  previewUiStateTest();
  imageViewerConstantsValuesTest();
  offsetModelCtorTest();
  offsetModelCtor2Test();
  offsetModelCtor3Test();
  offsetModelToStringTest();
  offsetModelFlowTest();
  offsetModelFlow2Test();
  offsetModelFlow3Test();
  offsetModelFlow4Test();
  offsetModelFlow5Test();
  offsetModelFlow6Test();
  offsetModelFlow7Test();
  offsetModelFlow8Test();
  offsetModelFlow9Test();
  rotateModelCtorTest();
  rotateModelCtor2Test();
  rotateModelCtor3Test();
  rotateModelCtor4Test();
  rotateModelFlowTest();
  scaleModelCtorTest();
  scaleModelCtor2Test();
  scaleModelCtor3Test();
  scaleModelResetTest();
  scaleModelToStringTest();
  scaleModelFlowTest();
  scaleModelFlow2Test();
  scaleModelFlow3Test();
  scaleModelFlow4Test();
  scaleModelFlow5Test();
  scaleModelFlow6Test();
  scaleModelFlow7Test();
  scaleModelFlow8Test();
  scaleModelFlow9Test();
  scaleModelFlow10Test();
  simplestRotationQuarterTest();
  simplestRotationQuarter2Test();
}
