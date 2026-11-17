#!/usr/bin/env bash
# Copyright (c) 2026 Huawei Device Co., Ltd.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# 分批执行 UIExtensionSamples 的 ohosTest，避免 2000+ 逻辑用例在主线程连续执行触发 THREAD_BLOCK_6S。
# 前置条件：已用 DevEco 构建并安装 entry_test 测试包（hdc 能连上设备）。
# 用法：bash run_ohos_tests.sh

set -u

BUNDLE=com.samples.uiextension
MODULE=entry_test
RUNNER=OpenHarmonyTestRunner
TIMEOUT=15000

# 每批 class 列表；UI/Ability 用例单独一批，逻辑套件按约 150 条一组
BATCHES=(
  "ActsAbilityTest,UIExtensionSamplesLogicTest,UIExtensionSamplesUiTest"
  "RouteOfTest"
  "TitleResourceOfTest"
  "ListKeyOfTest,IsListedPageTest,ModalWantOfTest"
  "TerminateResultOfTest,ModalMessageOfTest"
  "ModalMessageOf2Test,ModalMessageOf3Test"
  "ReportDrawnMessageOfTest"
  "ReportDrawnMessageOf2Test,ReportDrawnMessageOf3Test,PrivacyModeMessageOfTest"
  "WindowProxyMessageOfTest,WindowProxyMessageOf2Test"
  "StartErrorMessageOfTest"
  "StartErrorMessageOf2Test,StartErrorMessageOf3Test"
  "StartResultLogOfTest"
  "StartResultLogOf2Test,StartResultLogOf3Test"
  "OpenLinkLogOfTest"
  "OpenLinkLogOf2Test,OpenLinkLogOf3Test,AllowsBrowserFallbackTest"
  "SessionCreateLogOfTest"
  "SessionCreateLogOf2Test,SessionCreateLogOf3Test"
  "ContentPageOfTest,UiExtensionPageStateCtorTest,UiExtensionPageStateOpenTest"
  "UiExtensionPageStateRequestModalTest,UiExtensionPageStateRequestModal2Test,UiExtensionPageStateTerminateWithResultTest"
  "UiExtensionPageStateSetPrivacyModeTest,UiExtensionPageStateReportDrawnTest,UiExtensionPageStateReportDrawn2Test"
  "UiExtensionPageStateReportDrawn3Test,UiExtensionPageStateFlowTest,UiExtensionPageStateFlow2Test"
  "UiExtensionPageStateFlow3Test,UiExtensionPageStateFlow4Test,UiExtensionPageStateFlow5Test"
  "UiExtensionPageStateFlow6Test,UiExtensionPageStateFlow7Test,UiExtensionLogicConstantsTest"
)

fail=0
for i in "${!BATCHES[@]}"; do
  classes="${BATCHES[$i]}"
  echo "=== batch $((i + 1))/${#BATCHES[@]}: ${classes}"
  out=$(hdc shell "aa test -b ${BUNDLE} -m ${MODULE} -s unittest ${RUNNER} -s class ${classes} -s timeout ${TIMEOUT}" 2>&1)
  echo "${out}" | grep -E "OHOS_REPORT_RESULT|OHOS_REPORT_CODE" || { echo "!!! no test report for this batch"; fail=1; }
  if ! echo "${out}" | grep -q "OHOS_REPORT_CODE: 0"; then
    fail=1
  fi
  sleep 2
done

if [ "${fail}" -ne 0 ]; then
  echo "=== finished with failures or missing reports"
  exit 1
fi
echo "=== all batches finished"
