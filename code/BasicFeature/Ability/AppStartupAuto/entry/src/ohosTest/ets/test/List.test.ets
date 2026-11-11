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

import startupArchiveCodecTests from './StartupArchiveCodec.test';
import refreshSourceCompatibilityTests from './RefreshSourceCompatibility.test';
import { configureTestText } from '../support/TestTextResources';
import startupArchiveRepositoryTests from './StartupArchiveRepository.test';
import startupArchiveCaptureTests from './StartupArchiveCapture.test';
import startupArchiveServiceIntegrationTests from './StartupArchiveServiceIntegration.test';
import archiveNativeQaTests from './ArchiveNativeQa.test';
import archiveUiQaTests from './ArchiveUiQa.test';
import startupHistoryViewWaveTwoTest from './StartupHistoryViewWaveTwo.test';
import startupNativeCoordinationWaveOneTest from './StartupNativeCoordinationWaveOne.test';
import startupRecoveryB2Test from './StartupRecoveryB2.test';
import autoStartupTest from './AutoStartup.test';
import autoStartupAdditionalTest from './AutoStartupAdditional.test';
import historyArchiveMatrixTest from './HistoryArchiveMatrix.test';
import historyCoverageTest from './HistoryCoverage.test';
import rulesMatrixTest from './RulesMatrix.test';
import diagnosticCoverageTest from './DiagnosticCoverage.test';
import capabilityMatrixCasesTest from './CapabilityMatrixCases.test';
import ruleEngineCasesTest from './RuleEngineCases.test';
import onboardingCasesTest from './OnboardingCases.test';
import reminderTextCasesTest from './ReminderTextCases.test';
import historyInsightMatrixCasesTest from './HistoryInsightMatrixCases.test';
import revisitFlowMatrixCasesTest from './RevisitFlowMatrixCases.test';
import archiveIndexCasesTest from './ArchiveIndexCases.test';
import coordinatorJournalCasesTest from './CoordinatorJournalCases.test';
import retentionPolicyCasesTest from './RetentionPolicyCases.test';
import serviceFlowsTest from './ServiceFlows.test';
import faultArchiveCasesTest from './FaultArchiveCases.test';
import evidenceOnboardingCasesTest from './EvidenceOnboardingCases.test';

export default function testsuite(): void {
  // Pin the existing text assertions to the reviewed Chinese fixture instead of the device language.
  configureTestText();
  refreshSourceCompatibilityTests();
  startupArchiveCodecTests();
  startupArchiveRepositoryTests();
  startupArchiveCaptureTests();
  startupHistoryViewWaveTwoTest();
  startupNativeCoordinationWaveOneTest();
  startupRecoveryB2Test();
  autoStartupTest();
  autoStartupAdditionalTest();
  historyCoverageTest();
  historyArchiveMatrixTest();
  rulesMatrixTest();
  diagnosticCoverageTest();
  capabilityMatrixCasesTest();
  ruleEngineCasesTest();
  onboardingCasesTest();
  reminderTextCasesTest();
  historyInsightMatrixCasesTest();
  revisitFlowMatrixCasesTest();
  archiveIndexCasesTest();
  coordinatorJournalCasesTest();
  retentionPolicyCasesTest();
  serviceFlowsTest();
  faultArchiveCasesTest();
  evidenceOnboardingCasesTest();
  archiveNativeQaTests();
  startupArchiveServiceIntegrationTests();
  archiveUiQaTests();
}
