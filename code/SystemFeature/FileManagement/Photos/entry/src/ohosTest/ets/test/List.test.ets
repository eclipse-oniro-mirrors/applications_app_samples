/*
 * Copyright (c) 2023 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
import { abilityDelegatorRegistry } from '@kit.TestKit';
import PhotosUiTest from './PhotosUiTest.test'
import PhotosDateUtilTest from './PhotosDateUtil.test'
import PhotosMathUtilsTest from './PhotosMathUtils.test'
import PhotosUserFileDataItemTest from './PhotosUserFileDataItem.test'
import PhotosDateDurationMatrixTest from './PhotosDateDurationMatrix.test'
import PhotosDateFormatMatrixTest from './PhotosDateFormatMatrix.test'
import PhotosDateRangeMatrixTest from './PhotosDateRangeMatrix.test'
import PhotosMathMatrixTest from './PhotosMathMatrix.test'
import PhotosUserFileDataItemMatrixTest from './PhotosUserFileDataItemMatrix.test'
import PhotosDateDurationExtTest from './PhotosDateDurationExt.test'
import PhotosDateFormatExtTest from './PhotosDateFormatExt.test'
import PhotosDateRangeExtTest from './PhotosDateRangeExt.test'
import PhotosMathExtTest from './PhotosMathExt.test'
import PhotosUserFileDataItemExtTest from './PhotosUserFileDataItemExt.test'
import PhotosDateNameExtTest from './PhotosDateNameExt.test'
import PhotosDateLocalizedTest from './PhotosDateLocalized.test'
import PhotosDateFormatMoreTest from './PhotosDateFormatMore.test'
import PhotosMathEdgeTest from './PhotosMathEdge.test'
import PhotosUserFileDataItemStateTest from './PhotosUserFileDataItemState.test'
import PhotosUiSupplementTest from './PhotosUiSupplement.test'
import PhotosDateNameSecondTest from './PhotosDateNameSecond.test'
import PhotosDateLocalizedSecondTest from './PhotosDateLocalizedSecond.test'
import PhotosDateFormatSecondTest from './PhotosDateFormatSecond.test'
import PhotosMathSecondTest from './PhotosMathSecond.test'
import PhotosUserFileDataItemSecondTest from './PhotosUserFileDataItemSecond.test'
import PhotosDateNameBoundaryTest from './PhotosDateNameBoundary.test'
import PhotosDateLocalizedBoundaryTest from './PhotosDateLocalizedBoundary.test'
import PhotosUserFileDataItemHashBoundaryTest from './PhotosUserFileDataItemHashBoundary.test'

function enabled(name: string, filter: string): boolean {
  if (filter === '') {
    return true;
  }
  const names: string[] = filter.split(',');
  for (let i: number = 0; i < names.length; i++) {
    if (names[i].trim() === name) {
      return true;
    }
  }
  return false;
}

export default function testsuite() {
  const args: abilityDelegatorRegistry.AbilityDelegatorArgs = abilityDelegatorRegistry.getArguments();
  const filter: string = args.parameters['class'] !== undefined ? args.parameters['class'] : '';
  if (enabled('PhotosDateUtilTest', filter)) {
    PhotosDateUtilTest();
  }
  if (enabled('PhotosMathUtilsTest', filter)) {
    PhotosMathUtilsTest();
  }
  if (enabled('PhotosUserFileDataItemTest', filter)) {
    PhotosUserFileDataItemTest();
  }
  if (enabled('PhotosDateDurationMatrixTest', filter)) {
    PhotosDateDurationMatrixTest();
  }
  if (enabled('PhotosDateFormatMatrixTest', filter)) {
    PhotosDateFormatMatrixTest();
  }
  if (enabled('PhotosDateRangeMatrixTest', filter)) {
    PhotosDateRangeMatrixTest();
  }
  if (enabled('PhotosMathMatrixTest', filter)) {
    PhotosMathMatrixTest();
  }
  if (enabled('PhotosUserFileDataItemMatrixTest', filter)) {
    PhotosUserFileDataItemMatrixTest();
  }
  if (enabled('PhotosDateDurationExtTest', filter)) {
    PhotosDateDurationExtTest();
  }
  if (enabled('PhotosDateFormatExtTest', filter)) {
    PhotosDateFormatExtTest();
  }
  if (enabled('PhotosDateRangeExtTest', filter)) {
    PhotosDateRangeExtTest();
  }
  if (enabled('PhotosMathExtTest', filter)) {
    PhotosMathExtTest();
  }
  if (enabled('PhotosUserFileDataItemExtTest', filter)) {
    PhotosUserFileDataItemExtTest();
  }
  if (enabled('PhotosDateNameExtTest', filter)) {
    PhotosDateNameExtTest();
  }
  if (enabled('PhotosDateLocalizedTest', filter)) {
    PhotosDateLocalizedTest();
  }
  if (enabled('PhotosDateFormatMoreTest', filter)) {
    PhotosDateFormatMoreTest();
  }
  if (enabled('PhotosMathEdgeTest', filter)) {
    PhotosMathEdgeTest();
  }
  if (enabled('PhotosUserFileDataItemStateTest', filter)) {
    PhotosUserFileDataItemStateTest();
  }
  if (enabled('PhotosDateNameSecondTest', filter)) {
    PhotosDateNameSecondTest();
  }
  if (enabled('PhotosDateLocalizedSecondTest', filter)) {
    PhotosDateLocalizedSecondTest();
  }
  if (enabled('PhotosDateFormatSecondTest', filter)) {
    PhotosDateFormatSecondTest();
  }
  if (enabled('PhotosMathSecondTest', filter)) {
    PhotosMathSecondTest();
  }
  if (enabled('PhotosUserFileDataItemSecondTest', filter)) {
    PhotosUserFileDataItemSecondTest();
  }
  if (enabled('PhotosDateNameBoundaryTest', filter)) {
    PhotosDateNameBoundaryTest();
  }
  if (enabled('PhotosDateLocalizedBoundaryTest', filter)) {
    PhotosDateLocalizedBoundaryTest();
  }
  if (enabled('PhotosUserFileDataItemHashBoundaryTest', filter)) {
    PhotosUserFileDataItemHashBoundaryTest();
  }
  if (enabled('PhotosUiTest', filter)) {
    PhotosUiTest();
  }
  if (enabled('PhotosUiSupplementTest', filter)) {
    PhotosUiSupplementTest();
  }
}