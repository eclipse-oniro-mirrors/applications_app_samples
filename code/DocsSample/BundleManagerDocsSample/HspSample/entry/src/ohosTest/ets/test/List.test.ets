/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import hspResourceResolutionTest from './HspResourceResolution.test';
import hspNativeNumericEdgeTest from './HspNativeNumericEdge.test';
import hspArithmeticNumericEdgeTest from './HspArithmeticNumericEdge.test';
import hspUiPageTest from './HspUiPage.test';
import abilityTest from './Ability.test';
import arithmeticMatrixTest from './ArithmeticMatrix.test';
import nativeMethodMatrixTest from './NativeMethodMatrix.test';
import resourceContractTest from './ResourceContract.test';
import libraryApiTest from './LibraryApi.test';
import arithmeticExtraTest from './ArithmeticExtra.test';
import nativeExtraTest from './NativeExtra.test';
import resourceExtraTest from './ResourceExtra.test';
import libraryEdgeTest from './LibraryEdge.test';
import arithmeticExtra2Test from './ArithmeticExtra2.test';
import nativeExtra2Test from './NativeExtra2.test';
import resourceExtra2Test from './ResourceExtra2.test';
import arithmeticExtra3Test from './ArithmeticExtra3.test';
import nativeExtra3Test from './NativeExtra3.test';
import resourceExtra3Test from './ResourceExtra3.test';
import hspNumericResidualTest from './HspNumericResidual.test';
import hspLogResidualTest from './HspLogResidual.test';

export default function testsuite() {
  hspResourceResolutionTest();
  hspNativeNumericEdgeTest();
  hspArithmeticNumericEdgeTest();
  hspUiPageTest();
  abilityTest();
  arithmeticMatrixTest();
  nativeMethodMatrixTest();
  resourceContractTest();
  libraryApiTest();
  arithmeticExtraTest();
  nativeExtraTest();
  resourceExtraTest();
  libraryEdgeTest();
  arithmeticExtra2Test();
  nativeExtra2Test();
  resourceExtra2Test();
  arithmeticExtra3Test();
  nativeExtra3Test();
  resourceExtra3Test();
  hspNumericResidualTest();
  hspLogResidualTest();
}
