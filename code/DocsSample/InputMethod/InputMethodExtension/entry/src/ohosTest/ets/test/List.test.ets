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

import inputMethodAsyncEdgeTest from './InputMethodAsyncEdge.test';
import inputMethodBoundaryTest from './InputMethodBoundary.test';
import inputMethodBridgeTest from './InputMethodBridge.test';
import inputMethodChainScenarioTest from './InputMethodChainScenario.test';
import inputMethodConfigEdgeTest from './InputMethodConfigEdge.test';
import inputMethodAppLimitTest from './InputMethodAppLimit.test';
import inputMethodDataTest from './InputMethodData.test';
import inputMethodDeviceTest from './InputMethodDevice.test';
import inputMethodErrorEdgeTest from './InputMethodErrorEdge.test';
import inputMethodFormatMatrixTest from './InputMethodFormatMatrix.test';
import inputMethodKeyboardFlowTest from './InputMethodKeyboardFlow.test';
import inputMethodKeyboardMatrixTest from './InputMethodKeyboardMatrix.test';
import inputMethodListMatrixTest from './InputMethodListMatrix.test';
import inputMethodLogMatrixTest from './InputMethodLogMatrix.test';
import inputMethodNumericEdgeTest from './InputMethodNumericEdge.test';
import inputMethodOutcomeMatrixTest from './InputMethodOutcomeMatrix.test';
import inputMethodSessionDeepTest from './InputMethodSessionDeep.test';
import inputMethodThemeTest from './InputMethodTheme.test';
import inputMethodUiSmokeTest from './InputMethodUiSmoke.test';
import inputMethodUnicodeEdgeTest from './InputMethodUnicodeEdge.test';
import inputMethodUtilTest from './InputMethodUtil.test';
import inputMethodValueMatrixTest from './InputMethodValueMatrix.test';
import inputMethodViewBindingTest from './InputMethodViewBinding.test';

/**
 * 套件注册表：每个文件一个注册函数，按顺序直接调用。
 * 这里必须是「直接调用语句」，不能写成数组 + 遍历表驱动的形式——
 * DevEco 运行测试时会静态扫描本文件，只有写成 xxxTest(); 才认作「该文件已注册」，
 * 否则会报 00502002（在包中未找到任何测试用例）或 00502004（当前文件未在 list 文件中注册任何函数）。
 *
 * 顺序即执行顺序：先纯逻辑，再设备真调用，最后空状态与 UI 冒烟，失败时定位更快。
 *
 * UI 冒烟排最后，因为它会把界面停在各页，排在前面会影响后续用例的起点。
 * Driver.create() 需要等 uitest 守护进程起来，这段等待占的是 JS 主线程，历史上曾因此在同进程串跑时
 * 出现 7 秒级阻塞并踩到 THREAD_BLOCK_6S；修好上面的注册写法后，不加 -s class 跑全部连跑两轮均
 * 411/411 全绿、无 App died，所以默认就整包跑，要排查 UI 用例时再用 -s class InputMethodUiSmokeTest 单跑。
 */
export default function testsuite() {
  inputMethodDataTest();
  inputMethodBoundaryTest();
  inputMethodUnicodeEdgeTest();
  inputMethodNumericEdgeTest();
  inputMethodConfigEdgeTest();
  inputMethodValueMatrixTest();
  inputMethodKeyboardMatrixTest();
  inputMethodListMatrixTest();
  inputMethodOutcomeMatrixTest();
  inputMethodFormatMatrixTest();
  inputMethodKeyboardFlowTest();
  inputMethodErrorEdgeTest();
  inputMethodAsyncEdgeTest();
  inputMethodLogMatrixTest();
  inputMethodSessionDeepTest();
  inputMethodAppLimitTest();
  inputMethodThemeTest();
  inputMethodViewBindingTest();
  inputMethodChainScenarioTest();
  inputMethodBridgeTest();
  inputMethodUtilTest();
  inputMethodDeviceTest();
  inputMethodUiSmokeTest();
}
