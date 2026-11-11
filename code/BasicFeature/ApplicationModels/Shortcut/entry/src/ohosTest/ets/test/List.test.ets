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

import localizationTests from './Localization.test';
import visibilityBatchTests from './VisibilityBatch.test';
import appNavigationTests from './AppNavigation.test';
import shortcutServiceTests from './ShortcutService.test';
import launchRequestTests from './LaunchRequest.test';
import businessStoreTests from './BusinessStore.test';
import businessCoverageTests from './BusinessCoverage.test';
import shortcutCoverageTests from './ShortcutCoverage.test';
import launchCoverageTests from './LaunchCoverage.test';
import nativeCoverageTests from './NativeCoverage.test';
import noteHistoryTests from './NoteHistory.test';
import businessRuleMatrixTests from './BusinessRuleMatrix.test';
import shortcutRuleCasesTests from './ShortcutRuleCases.test';
import collectionFilterCasesTests from './CollectionFilterCases.test';
import todoDateCasesTests from './TodoDateCases.test';
import diffCasesTests from './DiffCases.test';
import businessDeepCasesTests from './BusinessDeepCases.test';
import routeTodoMatrixCasesTests from './RouteTodoMatrixCases.test';
import filterCollectionDiffCasesTests from './FilterCollectionDiffCases.test';
import entryMatrixCasesTests from './EntryIntentMatrixCases.test';
import noteSaveTrashCasesTests from './NoteSaveTrashCases.test';
import dueRepeatMatrixCasesTests from './DueRepeatMatrixCases.test';
import tagSearchMatrixCasesTests from './TagSearchMatrixCases.test';
import businessGapCasesTests from './BusinessGapCases.test';
import launchEntryCasesTests from './LaunchIntentCases.test';
import searchIndexDeepTests from './SearchIndexDeep.test';
import businessRecoveryB2Tests from './BusinessRecoveryB2.test';
import shortcutBatchWaveOneTests from './ShortcutBatchWaveOne.test';
import shortcutNavigationWaveOneTests from './ShortcutNavigationWaveOne.test';
import shortcutPersistenceWaveOneTests from './ShortcutPersistenceWaveOne.test';
import shortcutRecoveryWaveTwoTests from './ShortcutRecoveryWaveTwo.test';
import shortcutTodoWaveTwoTests from './ShortcutTodoWaveTwo.test';
import shortcutBatchWaveTwoTests from './ShortcutBatchWaveTwo.test';
import shortcutNavigationWaveTwoTests from './ShortcutNavigationWaveTwo.test';
import shortcutResidualSafetyTests from './ShortcutResidualSafety.test';
import recycleLifecycleTests from './RecycleLifecycle.test';
import recycleSchemaTests from './RecycleSchema.test';
import recycleRecoveryTests from './RecycleRecovery.test';
import recycleNativeQaTests from './RecycleNativeQa.test';
import recycleUiQaTests from './RecycleUiQa.test';
import recycleBatchPreviewTests from './RecycleBatchPreview.test';

export default function testsuite(): void {
  visibilityBatchTests();
  appNavigationTests();
  shortcutServiceTests();
  launchRequestTests();
  businessStoreTests();
  businessCoverageTests();
  shortcutCoverageTests();
  launchCoverageTests();
  nativeCoverageTests();
  noteHistoryTests();
  businessRuleMatrixTests();
  shortcutRuleCasesTests();
  collectionFilterCasesTests();
  todoDateCasesTests();
  diffCasesTests();
  businessDeepCasesTests();
  routeTodoMatrixCasesTests();
  filterCollectionDiffCasesTests();
  entryMatrixCasesTests();
  noteSaveTrashCasesTests();
  dueRepeatMatrixCasesTests();
  tagSearchMatrixCasesTests();
  businessGapCasesTests();
  launchEntryCasesTests();
  searchIndexDeepTests();
  businessRecoveryB2Tests();
  shortcutBatchWaveOneTests();
  shortcutNavigationWaveOneTests();
  shortcutPersistenceWaveOneTests();
  shortcutRecoveryWaveTwoTests();
  shortcutTodoWaveTwoTests();
  shortcutBatchWaveTwoTests();
  shortcutNavigationWaveTwoTests();
  shortcutResidualSafetyTests();
  recycleLifecycleTests();
  recycleSchemaTests();
  recycleRecoveryTests();
  recycleNativeQaTests();
  recycleUiQaTests();
  recycleBatchPreviewTests();
  localizationTests();
}

