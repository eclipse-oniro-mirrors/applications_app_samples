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

import yuvTest from './YUV.test';

import yuvCommonUtilCoreTest from './YUVCommonUtilCore.test';
import yuvConstantsCoreTest from './YUVConstantsCore.test';
import yuvRuntimeTimerCoreTest from './YUVRuntimeTimerCore.test';
import yuvWindowUtilCoreTest from './YUVWindowUtilCore.test';

import yuvCommonUtilEdgeTest from './YUVCommonUtilEdge.test';
import yuvModeContractTest from './YUVModeContract.test';

import yuvCommonUtilExtraTest from './YUVCommonUtilExtra.test';
import yuvPreviewMathTest from './YUVPreviewMath.test';

import yuvCommonUtilExtremeTest from './YUVCommonUtilExtreme.test';
import yuvPreviewContractTest from './YUVPreviewContract.test';

import yuvCommonUtilFinalTest from './YUVCommonUtilFinal.test';
import yuvRuntimeConfigTest from './YUVRuntimeConfig.test';

export default function testsuite(): void {
  yuvTest();
  yuvCommonUtilCoreTest();
  yuvConstantsCoreTest();
  yuvRuntimeTimerCoreTest();
  yuvWindowUtilCoreTest();
  yuvCommonUtilEdgeTest();
  yuvModeContractTest();
  yuvCommonUtilExtraTest();
  yuvPreviewMathTest();
  yuvCommonUtilExtremeTest();
  yuvPreviewContractTest();
  yuvCommonUtilFinalTest();
  yuvRuntimeConfigTest();
}
