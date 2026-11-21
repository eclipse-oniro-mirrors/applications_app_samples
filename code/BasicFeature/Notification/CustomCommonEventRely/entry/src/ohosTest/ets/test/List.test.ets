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

import constantsCoreTest from './ConstantsCore.test';
import eventRecordCoreTest from './EventRecordCore.test';
import publisherCoreTest from './PublisherCore.test';
import formServiceCoreTest from './FormServiceCore.test';
import resolveNameVolume01Test from './ResolveNameVolume01.test';
import dataLengthVolume01Test from './DataLengthVolume01.test';
import formatTimeVolume01Test from './FormatTimeVolume01.test';
import recordCapacityVolume01Test from './RecordCapacityVolume01.test';
import parseEventDataVolume01Test from './ParseEventDataVolume01.test';
import bindingDataVolume01Test from './BindingDataVolume01.test';
import publishDataVolume01Test from './PublishDataVolume01.test';
import supportedDataVolume01Test from './SupportedDataVolume01.test';
import tryAddVolume01Test from './TryAddVolume01.test';
import clockVolume01Test from './ClockVolume01.test';
import sourceLabelVolume01Test from './SourceLabelVolume01.test';
import logSinkVolume01Test from './LogSinkVolume01.test';
import homeStateVolume01Test from './HomeStateVolume01.test';
import homeStateVolume02Test from './HomeStateVolume02.test';
import parseMessageVolume01Test from './ParseMessageVolume01.test';
import parseMessageVolume02Test from './ParseMessageVolume02.test';
import publishValidateVolume01Test from './PublishValidateVolume01.test';
import bindingCountVolume01Test from './BindingCountVolume01.test';
import formCounterVolume01Test from './FormCounterVolume01.test';
import formRefreshVolume01Test from './FormRefreshVolume01.test';
import logPageVolume01Test from './LogPageVolume01.test';
import recordPersistVolume01Test from './RecordPersistVolume01.test';
import recordRestoreVolume01Test from './RecordRestoreVolume01.test';
import recordPersistVolume02Test from './RecordPersistVolume02.test';
import recordRestoreVolume02Test from './RecordRestoreVolume02.test';
import recordCapacityVolume02Test from './RecordCapacityVolume02.test';
import formCounterVolume02Test from './FormCounterVolume02.test';
import parseMessageVolume03Test from './ParseMessageVolume03.test';
import publishValidateVolume02Test from './PublishValidateVolume02.test';
import logPageVolume02Test from './LogPageVolume02.test';
import statusLabelVolume01Test from './StatusLabelVolume01.test';
import publishOptionsVolume01Test from './PublishOptionsVolume01.test';
import subscriptionManagerVolume01Test from './SubscriptionManagerVolume01.test';
import formPublisherVolume01Test from './FormPublisherVolume01.test';
import recordReal01Test from './RecordReal01.test';
import publisherReal01Test from './PublisherReal01.test';
import formReal01Test from './FormReal01.test';
import homeModelReal01Test from './HomeModelReal01.test';
import parseReal01Test from './ParseReal01.test';
import formCounterReal01Test from './FormCounterReal01.test';
import recordStoreReal01Test from './RecordStoreReal01.test';
import statusLabelReal01Test from './StatusLabelReal01.test';
import publishOptionsReal01Test from './PublishOptionsReal01.test';
import subscriptionManagerReal01Test from './SubscriptionManagerReal01.test';
import formPublisherReal01Test from './FormPublisherReal01.test';
import homeUiTest from './HomeUi.test';
import homeUiExtTest from './HomeUiExt.test';

export default function testsuite() {
  // Logic layer first, it does not depend on the rendered user interface.
  constantsCoreTest();
  eventRecordCoreTest();
  publisherCoreTest();
  formServiceCoreTest();
  // Suites that expand the input domain of the logic layer.
  resolveNameVolume01Test();
  dataLengthVolume01Test();
  formatTimeVolume01Test();
  recordCapacityVolume01Test();
  parseEventDataVolume01Test();
  bindingDataVolume01Test();
  publishDataVolume01Test();
  supportedDataVolume01Test();
  tryAddVolume01Test();
  clockVolume01Test();
  sourceLabelVolume01Test();
  logSinkVolume01Test();
  homeStateVolume01Test();
  homeStateVolume02Test();
  parseMessageVolume01Test();
  parseMessageVolume02Test();
  publishValidateVolume01Test();
  bindingCountVolume01Test();
  formCounterVolume01Test();
  formRefreshVolume01Test();
  logPageVolume01Test();
  recordPersistVolume01Test();
  recordRestoreVolume01Test();
  recordPersistVolume02Test();
  recordRestoreVolume02Test();
  recordCapacityVolume02Test();
  formCounterVolume02Test();
  parseMessageVolume03Test();
  publishValidateVolume02Test();
  logPageVolume02Test();
  statusLabelVolume01Test();
  publishOptionsVolume01Test();
  subscriptionManagerVolume01Test();
  formPublisherVolume01Test();
  // Companion suites for the multi-step flows of the logic layer.
  recordReal01Test();
  publisherReal01Test();
  formReal01Test();
  homeModelReal01Test();
  parseReal01Test();
  formCounterReal01Test();
  recordStoreReal01Test();
  statusLabelReal01Test();
  publishOptionsReal01Test();
  subscriptionManagerReal01Test();
  formPublisherReal01Test();
  // User interface layer last, it launches the home page of the sample.
  homeUiTest();
  homeUiExtTest();
}
