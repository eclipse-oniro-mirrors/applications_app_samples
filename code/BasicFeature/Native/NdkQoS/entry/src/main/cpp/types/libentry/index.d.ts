/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

export interface QosRunInfo {
  setResult: number;
  queryLevel: number;
  resetResult: number;
  bindResult: number;
  duration: number;
}

export interface QosLevelRange {
  minLevel: number;
  maxLevel: number;
  levelCount: number;
  invalidResult: number;
  invalidDuration: number;
}

export interface LevelSample {
  level: number;
  successCount: number;
  failCount: number;
  avgDuration: number;
  minDuration: number;
  maxDuration: number;
  setResult: number;
  queryLevel: number;
  resetResult: number;
  bindResult: number;
}

export interface BenchmarkReport {
  code: number;
  rounds: number;
  totalRuns: number;
  fastestLevel: number;
  slowestLevel: number;
  samples: LevelSample[];
}

export interface ConcurrentReport {
  code: number;
  level: number;
  threads: number;
  rounds: number;
  successCount: number;
  failCount: number;
  avgDuration: number;
  minDuration: number;
  maxDuration: number;
}

export interface CompareReport {
  code: number;
  levelA: number;
  levelB: number;
  durationA: number;
  durationB: number;
  ratio: number;
  fasterLevel: number;
}

export interface RunSummary {
  runCount: number;
  lastLevel: number;
  minDuration: number;
  maxDuration: number;
  avgDuration: number;
  levelCounts: number[];
}

export interface ResetSummaryReport {
  code: number;
  runCount: number;
}

export interface CpuTopology {
  code: number;
  cpuCount: number;
  selectedCpu: number;
  affinityCount: number;
  affinityCpus: number[];
}

export interface AffinityReport {
  code: number;
  cpu: number;
  bindResult: number;
  affinityCount: number;
  affinityCpus: number[];
}

export interface ResetAffinityReport {
  code: number;
  bindResult: number;
  affinityCount: number;
  affinityCpus: number[];
}

export interface RunRecord {
  index: number;
  level: number;
  duration: number;
  setResult: number;
  queryLevel: number;
  resetResult: number;
  bindResult: number;
}

export interface AppendRecordReport {
  code: number;
  count: number;
  capacity: number;
  dropped: number;
}

export interface RecordQueryReport {
  code: number;
  total: number;
  returned: number;
  records: RunRecord[];
}

export interface ClearRecordReport {
  code: number;
  removed: number;
}

export interface RecordStatsReport {
  code: number;
  total: number;
  successCount: number;
  failureCount: number;
  avgDuration: number;
  minDuration: number;
  maxDuration: number;
  levelCounts: number[];
}

export interface ParsedRecordReport {
  code: number;
  level: number;
  duration: number;
  setResult: number;
  queryLevel: number;
  resetResult: number;
  bindResult: number;
}

export const useHighQos: () => number;

export const useLowQos: () => number;

export const useQos: (level: number) => number;

export const useQosAsync: (level: number) => Promise<number>;

export const getLastQosInfo: () => QosRunInfo;

export const getLevelRange: () => QosLevelRange;

export const runLevelBenchmarkAsync: (rounds: number) => Promise<BenchmarkReport>;

export const runConcurrentAsync: (level: number, threads: number, rounds: number) => Promise<ConcurrentReport>;

export const compareLevels: (levelA: number, levelB: number) => CompareReport;

export const getRunSummary: () => RunSummary;

export const resetRunSummary: () => ResetSummaryReport;

export const getCpuTopology: () => CpuTopology;

export const bindCurrentThread: (cpu: number) => AffinityReport;

export const resetThreadAffinity: () => ResetAffinityReport;

export const appendRunRecord: (dirPath: string, level: number, duration: number, setResult: number,
  queryLevel: number, resetResult: number, bindResult: number) => AppendRecordReport;

export const readRunRecords: (dirPath: string, limit: number) => RecordQueryReport;

export const clearRunRecords: (dirPath: string) => ClearRecordReport;

export const getRecordStats: (dirPath: string) => RecordStatsReport;

export const parseRunRecordLine: (text: string) => ParsedRecordReport;
