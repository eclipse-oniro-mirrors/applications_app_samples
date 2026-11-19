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

import ModuleConfigTest from './ModuleConfig.test';
import HarnessSmokeTest from './HarnessSmoke.test';
import AppConfigValidationTest from './AppConfigValidation.test';
import ModuleIdentityValidationTest from './ModuleIdentityValidation.test';
import DeviceTypeValidationTest from './DeviceTypeValidation.test';
import AbilityValidationTest from './AbilityValidation.test';
import SkillValidationTest from './SkillValidation.test';
import UriValidationTest from './UriValidation.test';
import AtomicServiceValidationTest from './AtomicServiceValidation.test';
import CrossModuleValidationTest from './CrossModuleValidation.test';
import NameUtilsValidationTest from './NameUtilsValidation.test';
import SemverUtilsValidationTest from './SemverUtilsValidation.test';
import ResourceReferenceValidationTest from './ResourceReferenceValidation.test';
import FindingReportValidationTest from './FindingReportValidation.test';
import ConfigSerializerValidationTest from './ConfigSerializerValidation.test';
import ConfigIndexValidationTest from './ConfigIndexValidation.test';
import PagePathValidationTest from './PagePathValidation.test';
import ValidationPipelineTest from './ValidationPipeline.test';
import AppConfigMatrixTest from './AppConfigMatrix.test';
import VersionMatrixTest from './VersionMatrix.test';
import ModuleMatrixTest from './ModuleMatrix.test';
import AbilityMatrixTest from './AbilityMatrix.test';
import DeviceMatrixTest from './DeviceMatrix.test';
import ResourceMatrixTest from './ResourceMatrix.test';
import CrossMatrixTest from './CrossMatrix.test';

export default function testsuite() {
  ModuleConfigTest();
  HarnessSmokeTest();
  AppConfigValidationTest();
  ModuleIdentityValidationTest();
  DeviceTypeValidationTest();
  AbilityValidationTest();
  SkillValidationTest();
  UriValidationTest();
  AtomicServiceValidationTest();
  CrossModuleValidationTest();
  NameUtilsValidationTest();
  SemverUtilsValidationTest();
  ResourceReferenceValidationTest();
  FindingReportValidationTest();
  ConfigSerializerValidationTest();
  ConfigIndexValidationTest();
  PagePathValidationTest();
  ValidationPipelineTest();
  AppConfigMatrixTest();
  VersionMatrixTest();
  ModuleMatrixTest();
  AbilityMatrixTest();
  DeviceMatrixTest();
  ResourceMatrixTest();
  CrossMatrixTest();
}
