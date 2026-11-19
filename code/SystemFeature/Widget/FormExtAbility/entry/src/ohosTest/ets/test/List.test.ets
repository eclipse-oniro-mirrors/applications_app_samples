/*
 * Copyright (c) 2022-2023 Huawei Device Co., Ltd.
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
import abilityTest from './Ability.test';
import formTest from './Form.test';
import formAbilityLifecycleCoreTest from './FormAbilityLifecycleCore.test';
import formAbilityOnAddFormTest from './FormAbilityOnAddForm.test';
import formStorageModelTest from './FormStorageModel.test';
import loggerUtilityCoreTest from './LoggerUtilityCore.test';
import indexUiStateTest from './IndexUiState.test';
import formRecordCtorTest from './FormRecordCtor.test';
import formRecordCtor2Test from './FormRecordCtor2.test';
import getTemperatureTest from './GetTemperature.test';
import getTemperature2Test from './GetTemperature2.test';
import getTemperature3Test from './GetTemperature3.test';
import temperatureTextOfTest from './TemperatureTextOf.test';
import temperatureTextOf2Test from './TemperatureTextOf2.test';
import temperatureTextOf3Test from './TemperatureTextOf3.test';
import padZeroTest from './PadZero.test';
import padZero2Test from './PadZero2.test';
import formatTimeTest from './FormatTime.test';
import formatTime2Test from './FormatTime2.test';
import formatTime3Test from './FormatTime3.test';
import storedRecordJsonOfTest from './StoredRecordJsonOf.test';
import temporaryFlagOfTest from './TemporaryFlagOf.test';
import castToNormalTest from './CastToNormal.test';
import nextUpdateCountOfTest from './NextUpdateCountOf.test';
import nextUpdateCountOf2Test from './NextUpdateCountOf2.test';
import subscriberIdOfTest from './SubscriberIdOf.test';
import templateSqlOfTest from './TemplateSqlOf.test';
import templateSqlOf2Test from './TemplateSqlOf2.test';
import processProxyKeysOfTest from './ProcessProxyKeysOf.test';
import persistentBindingJsonOfTest from './PersistentBindingJsonOf.test';
import persistentBindingJsonOf2Test from './PersistentBindingJsonOf2.test';
import isValidConditionRequestTest from './IsValidConditionRequest.test';
import persistedConditionOfTest from './PersistedConditionOf.test';
import conditionFilePathOfTest from './ConditionFilePathOf.test';
import conditionFilePathOf2Test from './ConditionFilePathOf2.test';
import conditionFilePathOf3Test from './ConditionFilePathOf3.test';
import formStoreModelCtorTest from './FormStoreModelCtor.test';
import formStoreModelAddTest from './FormStoreModelAdd.test';
import formStoreModelAdd2Test from './FormStoreModelAdd2.test';
import formStoreModelAdd3Test from './FormStoreModelAdd3.test';
import formStoreModelAdd4Test from './FormStoreModelAdd4.test';
import formStoreModelUpdateTest from './FormStoreModelUpdate.test';
import formStoreModelUpdate2Test from './FormStoreModelUpdate2.test';
import formStoreModelCastToNormalTest from './FormStoreModelCastToNormal.test';
import formStoreModelRemoveTest from './FormStoreModelRemove.test';
import formStoreModelCountOfTest from './FormStoreModelCountOf.test';
import formStoreModelFlowTest from './FormStoreModelFlow.test';
import formStoreModelFlow2Test from './FormStoreModelFlow2.test';
import formStoreModelFlow3Test from './FormStoreModelFlow3.test';
import formStoreModelFlow4Test from './FormStoreModelFlow4.test';
import formStoreModelFlow5Test from './FormStoreModelFlow5.test';
import formExtLogicConstantsTest from './FormExtLogicConstants.test';

function registerThreadYieldHook(): void {
  // 用例间用 1ms 定时器让出主线程，使 watchdog 检测任务得以调度，避免 THREAD_BLOCK_6S
  beforeEachIt(async (): Promise<void> => {
    await new Promise<void>((resolve: () => void) => {
      setTimeout(() => {
        resolve();
      }, 1);
    });
  });
}

export default function testsuite() {
  registerThreadYieldHook();
  abilityTest();
  formTest();
  formAbilityLifecycleCoreTest();
  formAbilityOnAddFormTest();
  formStorageModelTest();
  loggerUtilityCoreTest();
  indexUiStateTest();
  formRecordCtorTest();
  formRecordCtor2Test();
  getTemperatureTest();
  getTemperature2Test();
  getTemperature3Test();
  temperatureTextOfTest();
  temperatureTextOf2Test();
  temperatureTextOf3Test();
  padZeroTest();
  padZero2Test();
  formatTimeTest();
  formatTime2Test();
  formatTime3Test();
  storedRecordJsonOfTest();
  temporaryFlagOfTest();
  castToNormalTest();
  nextUpdateCountOfTest();
  nextUpdateCountOf2Test();
  subscriberIdOfTest();
  templateSqlOfTest();
  templateSqlOf2Test();
  processProxyKeysOfTest();
  persistentBindingJsonOfTest();
  persistentBindingJsonOf2Test();
  isValidConditionRequestTest();
  persistedConditionOfTest();
  conditionFilePathOfTest();
  conditionFilePathOf2Test();
  conditionFilePathOf3Test();
  formStoreModelCtorTest();
  formStoreModelAddTest();
  formStoreModelAdd2Test();
  formStoreModelAdd3Test();
  formStoreModelAdd4Test();
  formStoreModelUpdateTest();
  formStoreModelUpdate2Test();
  formStoreModelCastToNormalTest();
  formStoreModelRemoveTest();
  formStoreModelCountOfTest();
  formStoreModelFlowTest();
  formStoreModelFlow2Test();
  formStoreModelFlow3Test();
  formStoreModelFlow4Test();
  formStoreModelFlow5Test();
  formExtLogicConstantsTest();
}
