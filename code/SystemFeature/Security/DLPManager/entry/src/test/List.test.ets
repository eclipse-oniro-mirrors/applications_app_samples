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

import localUnitTest from './LocalUnit.test';
import textCodecCoreTest from './TextCodecCore.test';
import formatCoreTest from './FormatCore.test';
import uriCoreTest from './UriCore.test';
import fileKindCoreTest from './FileKindCore.test';
import dlpPolicyCoreTest from './DlpPolicyCore.test';
import fileQueryCoreTest from './FileQueryCore.test';
import errorCodeCoreTest from './ErrorCodeCore.test';
import searchModelTest from './SearchModel.test';
import detailModelTest from './DetailModel.test';
import recentModelTest from './RecentModel.test';
import templateModelTest from './TemplateModel.test';
import settingsModelTest from './SettingsModel.test';
import errorCenterModelTest from './ErrorCenterModel.test';
import uriMatrixTest from './UriMatrix.test';
import policyMatrixTest from './PolicyMatrix.test';
import featureFlowTest from './FeatureFlow.test';
import textCodecMatrixTest from './TextCodecMatrix.test';
import formatMatrixTest from './FormatMatrix.test';
import fileKindMatrixTest from './FileKindMatrix.test';
import queryMatrixTest from './QueryMatrix.test';
import recentMatrixTest from './RecentMatrix.test';
import templateMatrixTest from './TemplateMatrix.test';
import settingsMatrixTest from './SettingsMatrix.test';
import errorCenterMatrixTest from './ErrorCenterMatrix.test';
import errorCodeMatrixTest from './ErrorCodeMatrix.test';
import searchMatrixTest from './SearchMatrix.test';
import detailModelMatrixTest from './DetailModelMatrix.test';
import recentFlowMatrixTest from './RecentFlowMatrix.test';
import templateFlowMatrixTest from './TemplateFlowMatrix.test';
import searchFlowMatrixTest from './SearchFlowMatrix.test';
import settingsFlowMatrixTest from './SettingsFlowMatrix.test';
import errorCodeFlowMatrixTest from './ErrorCodeFlowMatrix.test';
import crossModuleMatrixTest from './CrossModuleMatrix.test';
import textCodecMatrix2Test from './TextCodecMatrix2.test';
import fileKindMatrix2Test from './FileKindMatrix2.test';
import queryMatrix2Test from './QueryMatrix2.test';
import policyMatrix2Test from './PolicyMatrix2.test';
import formatMatrix2Test from './FormatMatrix2.test';
import uriMatrix2Test from './UriMatrix2.test';
import detailMatrix2Test from './DetailMatrix2.test';
import templateMatrix2Test from './TemplateMatrix2.test';
import recentMatrix2Test from './RecentMatrix2.test';
import settingsMatrix2Test from './SettingsMatrix2.test';
import errorCenterMatrix2Test from './ErrorCenterMatrix2.test';
import featureJourneyMatrixTest from './FeatureJourneyMatrix.test';
import textCodecMatrix3Test from './TextCodecMatrix3.test';
import fileKindMatrix3Test from './FileKindMatrix3.test';
import queryMatrix3Test from './QueryMatrix3.test';
import policyMatrix3Test from './PolicyMatrix3.test';
import errorCodeMatrix2Test from './ErrorCodeMatrix2.test';

import { applyTestTextResolver } from './TextCatalogFixture';

export default function testsuite() {
  applyTestTextResolver();
  localUnitTest();
  textCodecCoreTest();
  formatCoreTest();
  uriCoreTest();
  fileKindCoreTest();
  dlpPolicyCoreTest();
  fileQueryCoreTest();
  errorCodeCoreTest();
  searchModelTest();
  detailModelTest();
  recentModelTest();
  templateModelTest();
  settingsModelTest();
  errorCenterModelTest();
  uriMatrixTest();
  policyMatrixTest();
  featureFlowTest();
  textCodecMatrixTest();
  formatMatrixTest();
  fileKindMatrixTest();
  queryMatrixTest();
  recentMatrixTest();
  templateMatrixTest();
  settingsMatrixTest();
  errorCenterMatrixTest();
  errorCodeMatrixTest();
  searchMatrixTest();
  detailModelMatrixTest();
  recentFlowMatrixTest();
  templateFlowMatrixTest();
  searchFlowMatrixTest();
  settingsFlowMatrixTest();
  errorCodeFlowMatrixTest();
  crossModuleMatrixTest();
  textCodecMatrix2Test();
  fileKindMatrix2Test();
  queryMatrix2Test();
  policyMatrix2Test();
  formatMatrix2Test();
  uriMatrix2Test();
  detailMatrix2Test();
  templateMatrix2Test();
  recentMatrix2Test();
  settingsMatrix2Test();
  errorCenterMatrix2Test();
  featureJourneyMatrixTest();
  textCodecMatrix3Test();
  fileKindMatrix3Test();
  queryMatrix3Test();
  policyMatrix3Test();
  errorCodeMatrix2Test();
}