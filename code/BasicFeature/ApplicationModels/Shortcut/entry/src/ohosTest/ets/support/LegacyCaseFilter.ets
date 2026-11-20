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

import { abilityDelegatorRegistry } from '@kit.TestKit';
import { BUNDLE } from './CaseScope';

/** Exact legacy leaf allowlist from retained @tc.name metadata; never an application-identity alias. */
const LEGACY_CASES: Record<string, string[]> = {
  'ProductionAppNavigation': ['0001', '0002', '0003', '0004', '0005', '0006', '0007', '0008'],
  'BusinessCoverage': ['0001', '0002', '0003', '0004', '0005', '0006', '0007', '0008', '0009', '0010', '0011', '0012', '0013', '0014', '0015', '0016', '0017', '0018', '0019', '0020'],
  'NoteTrashCases': ['0001', '0002', '0003', '0004', '0005', '0006', '0007', '0008', '0009', '0010'],
  'DuePolicyCases': ['0001', '0002', '0003', '0004', '0005', '0006', '0007', '0008', '0009', '0010'],
  'TagIndexCases': ['0001', '0002', '0003', '0004', '0005', '0006', '0007', '0008', '0009', '0010'],
  'BatchCopyCases': ['0001', '0002', '0003', '0004', '0005', '0006', '0007', '0008'],
  'BusinessRecoveryBatchTwo': ['0001', '0002', '0003', '0004', '0005', '0006', '0007', '0008', '0009', '0010', '0011', '0012', '0013', '0014'],
  'EntryRouteMatrix': ['0001', '0002', '0003'],
  'TodoRulesMatrix': ['0001', '0002', '0003', '0004'],
  'SearchIndexMatrix': ['0001', '0002', '0003', '0004'],
  'BusinessStore': ['0001', '0002'],
  'CaseLifecycle': ['0001', '0002', '0003', '0004', '0005', '0006', '0007', '0008', '0009', '0010', '0011', '0012'],
  'CollectionRuleCases': ['0001', '0002', '0003', '0004', '0005', '0006', '0007'],
  'FilterChainCases': ['0001', '0002', '0003', '0004', '0005'],
  'TextDiff': ['0001', '0002', '0003', '0004', '0005'],
  'DueRuleCases': ['0001', '0002', '0003', '0004', '0005', '0006', '0007', '0008'],
  'TodoDueCases': ['0001', '0002', '0003', '0004', '0005', '0006', '0007', '0008'],
  'DueStateCases': ['0001', '0002', '0003', '0004', '0005', '0006', '0007'],
  'DeferCases': ['0001', '0002', '0003', '0004', '0005', '0006', '0007'],
  'PriorityCases': ['0002', '0003'],
  'NextOccurrenceCases': ['0001', '0002', '0003', '0004', '0005', '0006', '0007', '0008', '0009', '0010', '0011', '0012', '0013', '0014', '0015', '0016', '0017', '0018', '0019'],
  'BucketCases': ['0001', '0002', '0003', '0004', '0005', '0006', '0007', '0008', '0009', '0010'],
  'RouteParamCases': ['0001', '0002', '0003', '0004', '0005', '0006', '0007', '0008', '0009', '0010'],
  'RouteEntryCases': ['0001', '0002', '0003', '0004', '0005', '0006', '0007', '0008', '0009', '0010'],
  'ResolveRouteCases': ['0001', '0002', '0003', '0004', '0005', '0006', '0007', '0008', '0009', '0010', '0011', '0012', '0013', '0014', '0015', '0016', '0017'],
  'RouteAuditCases': ['0001', '0002', '0003', '0004'],
  'EntryRuleCases': ['0001', '0002', '0003', '0004', '0005', '0006', '0007', '0008', '0009', '0010', '0011'],
  'ParseUriCases': ['0001', '0002', '0003', '0004', '0005', '0006', '0007'],
  'ResolveEntryCases': ['0001', '0002', '0003', '0004', '0005', '0006', '0007', '0008', '0009', '0010', '0011', '0012', '0013', '0014', '0015', '0016', '0017', '0018', '0019'],
  'EntryAuditCases': ['0001', '0002', '0003', '0004', '0005', '0006'],
  'FilterChainMatrixCases': ['0001', '0002', '0003', '0004', '0005', '0006', '0007', '0008', '0009', '0011', '0012'],
  'CollectionGovernanceCases': ['0001', '0002', '0003', '0005', '0006', '0007', '0008', '0009', '0010'],
  'TextDiffMatrixCases': ['0001', '0002', '0003', '0004', '0005', '0006', '0007', '0008', '0011', '0012'],
  'LaunchCoverage': ['0001', '0002', '0003', '0004', '0005'],
  'LaunchEntryCases': ['0001', '0002', '0003', '0004', '0005', '0006'],
  'LaunchRequest': ['0001'],
  'ShortcutLocalization': ['0001', '0002', '0003'],
  'ShortcutNativeCoverage': ['0001', '0002', '0003', '0004'],
  'NoteEditingAndHistory': ['0001', '0002', '0003', '0004', '0005', '0006', '0007', '0008', '0009', '0010', '0011', '0012', '0013', '0014'],
  'SaveRuleCases': ['0001', '0002', '0003', '0004', '0005', '0006', '0007', '0008'],
  'SaveDecisionCases': ['0001', '0002', '0003', '0004', '0005', '0006', '0007', '0008', '0009', '0010', '0011', '0012', '0013', '0014', '0015', '0016', '0017', '0018', '0019', '0020', '0021', '0022', '0023', '0024', '0025', '0026', '0027', '0028'],
  'TrashEntryCases': ['0001', '0002', '0003', '0004', '0005', '0006', '0007', '0008'],
  'TrashBinCases': ['0001', '0002', '0003', '0004', '0005', '0006', '0007', '0008', '0009', '0010', '0011', '0012', '0013', '0014', '0015', '0016'],
  'TrashLinesCases': ['0001', '0002', '0003', '0004', '0005', '0006', '0007'],
  'ShortcutRecycleBatchPreview': ['0001', '0002', '0003', '0004', '0005', '0006', '0007', '0008', '0009', '0010', '0011', '0012', '0013', '0014', '0015', '0016', '0017'],
  'ShortcutRecycleLifecycle': ['0001', '0002', '0003', '0004', '0005', '0006', '0007', '0008', '0009', '0010', '0011', '0012', '0013', '0014', '0015', '0016', '0017', '0018', '0019', '0020', '0021', '0022', '0023', '0024'],
  'RecycleNativeQa': ['0001', '0002', '0003', '0004', '0005', '0006', '0007', '0008', '0009', '0010', '0011', '0012', '0013', '0014', '0015', '0016', '0017', '0018', '0019', '0020', '0021', '0022', '0023'],
  'ShortcutRecycleRecovery': ['0001', '0002', '0003', '0004', '0005', '0006', '0007', '0008', '0009', '0010', '0011', '0012', '0013', '0014', '0015', '0016'],
  'ShortcutRecycleSchema': ['0001', '0002', '0003', '0004', '0005', '0006', '0007', '0008', '0009', '0010', '0011', '0012'],
  'RecycleUiQa': ['0001', '0002', '0003', '0004', '0005', '0006', '0007', '0008', '0009', '0010', '0011', '0012', '0013', '0014', '0015', '0016', '0017'],
  'EntryRouteMatrixCases': ['0001', '0002', '0003', '0004', '0005', '0006', '0007', '0008', '0009', '0010', '0011', '0012'],
  'TodoRulesMatrixCases': ['0001', '0002', '0003', '0004', '0006', '0007', '0008', '0009', '0010', '0011', '0012', '0013', '0014'],
  'RunnerFilter': ['0001', '0002', '0003', '0004'],
  'SearchIndexDeep': ['0001', '0002', '0003', '0004', '0005', '0006', '0007', '0008', '0009', '0010', '0011', '0012', '0013', '0014', '0015', '0016', '0017', '0018', '0019', '0020'],
  'ShortcutBatchWaveOne': ['0001', '0002', '0003', '0004', '0005', '0006', '0007', '0008', '0009', '0010', '0011', '0012', '0013', '0014', '0015', '0016', '0017', '0018', '0019', '0020'],
  'ShortcutBatchWaveTwo': ['0001', '0002', '0003', '0004', '0005', '0006'],
  'ShortcutCoverage': ['0001', '0002', '0003', '0004', '0005', '0006', '0007', '0008', '0009', '0010', '0011'],
  'ShortcutNavigationWaveOne': ['0001', '0002', '0003', '0004', '0005', '0006', '0007', '0008', '0009', '0010', '0011', '0012'],
  'ShortcutNavigationWaveTwo': ['0001'],
  'ShortcutPersistenceWaveOne': ['0001', '0002', '0003', '0004', '0005', '0006', '0007', '0008'],
  'ShortcutRecoveryWaveTwo': ['0001', '0002', '0003', '0004', '0005'],
  'ShortcutResidualSafety': ['0001', '0002', '0003'],
  'EntryRouteCases': ['0001', '0002', '0003', '0004', '0005', '0006', '0007', '0008', '0009'],
  'TodoTransitionCases': ['0001', '0002', '0003', '0004', '0005', '0006', '0007'],
  'SearchEngineCases': ['0001', '0002', '0003', '0004', '0005', '0006'],
  'ShortcutService': ['0001', '0002', '0003', '0004', '0005', '0006', '0007'],
  'ShortcutTodoWaveTwo': ['0001', '0002', '0003', '0004', '0005'],
  'TagRuleCases': ['0001', '0002', '0003', '0004', '0005', '0006'],
  'NormalizeCases': ['0001', '0002', '0003', '0004', '0005', '0006', '0007', '0008', '0009', '0010', '0011', '0012', '0013', '0014', '0015', '0016', '0017'],
  'TokenizeCases': ['0001', '0002', '0003', '0004', '0005'],
  'SearchCases': ['0001', '0002', '0003', '0004', '0005', '0006', '0007', '0008', '0009', '0010', '0011', '0012', '0013', '0014'],
  'TagIndexCasesB': ['0001', '0002', '0003', '0004', '0005', '0006', '0007', '0008', '0009', '0010'],
  'TodoDateHistory': ['0001', '0002', '0003', '0004', '0005', '0006'],
  'VisibilityBatchProductionService': ['0001', '0002', '0003', '0004', '0005', '0006', '0007', '0008', '0009', '0010', '0011', '0012', '0013', '0014', '0015', '0016'],
};

function mapLeaf(leaf: string): string {
  const match: RegExpExecArray | null = /^test(.+)([0-9]{4})$/.exec(leaf);
  if (match === null) { return leaf; }
  const sequences: string[] | undefined = LEGACY_CASES[match[1]];
  if (!Array.isArray(sequences) || !sequences.includes(match[2])) { return leaf; }
  return `${BUNDLE}_${match[1]}_${match[2]}`;
}

/** Only a whole known leaf is mapped. Suite qualifiers, separators and surrounding spaces are retained. */
export function normalizeLegacyCaseSelector(value: string): string {
  return value.split(',').map((selector: string): string => {
    const trim: string = selector.trim();
    const leading: string = selector.substring(0, selector.indexOf(trim));
    const trailing: string = selector.substring(selector.indexOf(trim) + trim.length);
    const parts: string[] = trim.split('#');
    if (parts.length === 1) { return `${leading}${mapLeaf(trim)}${trailing}`; }
    if (parts.length === 2 && parts[0].length > 0 && parts[1].length > 0) {
      return `${leading}${parts[0]}#${mapLeaf(parts[1])}${trailing}`;
    }
    return selector;
  }).join(',');
}

/** Keep timeout, flags, bundle and runner identity untouched. Unknown selectors are not broadened to all tests. */
export function normalizeLegacyFilters(args: abilityDelegatorRegistry.AbilityDelegatorArgs): void {
  const selector: string | undefined = args.parameters['class'];
  if (typeof selector === 'string') { args.parameters['class'] = normalizeLegacyCaseSelector(selector); }
  if (typeof args.testCaseNames === 'string') { args.testCaseNames = normalizeLegacyCaseSelector(args.testCaseNames); }
}
